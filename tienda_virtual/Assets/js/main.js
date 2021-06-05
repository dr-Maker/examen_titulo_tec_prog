$(document).ready(function () {

    // Formulario Registro 
    $(".btn_add_product").click(function () {
        console.log("hizo click mas");
        old = parseInt($(".count_buy").attr('value'));
        actually = old - 1;
        console.log(actually);
        $(".count_buy").val(actually);
    })

    $(".btn_rest_product").click(function () {
        console.log("hizo click menos");
        var value = parseInt($(".count_buy").attr('value'));

        console.log("esta aca : " + value);
        value += 1;
        console.log(value);
        $(".count_buy").val(value);
    })

    $("#tallas").change(function () {
        var valor = $("#tallas option:selected").val()
        //addCarrito(valor)
    })

    $("#btn_add_carrito").on("click", function (e) {
        e.preventDefault();
        var valor = $("#tallas option:selected").val()
        if (valor == null || valor <= 0 || valor == "seleccione su talla")
        {
            $(".cont-error-talla").children().remove();
            $(".cont-error-talla").append('<p class="msg-error">Debe seleccionar su talla para continuar</p>');
        } else
        {
             window.location.href = '/ShoppingCart/AddShoppingCart/' + valor;
        }
     
       
    })

    $('#ProductSelect').change(function () {
        $("input[type=checkbox]").prop("checked", false);
        $("input[type=checkbox]").attr("disabled", false);

       
        verifyAndCheak();
    });

    $('#TipoTalla').change(function () {
        getTallaSelect();
    })

    $('#RegionSelect').change(function () {
        var id = $('#RegionSelect').val();
        fetch("/User/Provincias/?id=" + id)
            .then(function (result) {
                if (result.ok)
                    return result.json();
            })
            .then(function (provincias) {
                $(".optionProvincia").children().remove();
                provincias.forEach(function (element) {
                    $('.optionProvincia').append("<option value='" + element.Id_provincia + "'>" + element.Nombre_provincia + "</option>");
                })
            });
    })

    $('.optionProvincia').change(function () {
        var id = $("#optionProvincia").val();
        console.log(id);
        fetch("/User/Comuna/?id=" + id)
            .then(function (result) {
                if (result.ok)
                    return result.json();
            })
            .then(function (comunas) {
                $(".optionComuna").children().remove();
                comunas.forEach(function (option) {
                    $('.optionComuna').append("<option value='" + option.Id_comuna + "'>" + option.Nombre_comuna + "</option>");
                })

            });
    })

    var sum = 0;
    $(".cesta tr").each(function() {
        var total = parseInt($(this).find(".total_producto").html());
        sum += total;
        
        $("#total_cesta").html("<p>" + numberWithCommas(sum) +"</p>");   
    })

    $(".correct_address").change(function (e) {
        e.preventDefault();
        var valor = $(".correct_address input:checked").val();
        console.log(valor);
        if (valor == 1)
        {
            $(".container_new_address").removeClass("diplayNone");
        }
        else
        {
            $(".container_new_address").addClass("diplayNone");
                      
        }
        
    });

    $(".ChangeState").change(function () {

        var estado = $(this).val();
        var idcesta = $(this).parent().parent().find(".idcesta").html();
        console.log(estado);
        console.log(idcesta);

        window.location.href = '/ShoppingCart/Update/?estado=' + estado + '&cesta=' + idcesta;
    });

    $("#quiteModal").click(function () {
        $(".modal").remove();
    });

    $("#select-category").change(function () {
        var category = $(this).val();
        var brand = $("#select-brand").val();
        if (category == "none" || brand == "none" ) {
            $("#btn-insert-product").attr("disabled", true);
            $("#btn-editar-producto").attr("disabled", true);
            $("#btn-insert-product").addClass("btn_disable");
            $("#btn-editar-producto").addClass("btn_disable");

        } else
        {
            $("#btn-insert-product").attr("disabled", false);
            $("#btn-editar-producto").attr("disabled", false);

            $("#btn-insert-product").removeClass("btn_disable");
            $("#btn-editar-producto").removeClass("btn_disable");
        }
    });

    $("#select-brand").change(function () {
        var brand = $(this).val();
        var category = $("#select-category").val();
        if (brand == "none"  || category =="none") {
            $("#btn-insert-product").attr("disabled", true);
            $("#btn-editar-producto").attr("disabled", true);
            $("#btn-insert-product").addClass("btn_disable");
            $("#btn-editar-producto").addClass("btn_disable");
            //desabilitar envio 
        } else {
            $("#btn-insert-product").attr("disabled", false);
            $("#btn-editar-producto").attr("disabled", false);

            //habilitar envío
            $("#btn-insert-product").removeClass("btn_disable");
            $("#btn-editar-producto").removeClass("btn_disable");
        }
    });

    $("#ProductSelect").change(function () {
        var producto = $("#ProductSelect").val();
        var tipoTalla = $("#TipoTalla").val();

        if (producto == "none" || tipoTalla == 0)
        {
            $("#btn_add_talla_product").attr("disabled", true);
            $("#btn_add_talla_product").addClass("btn_disable");
        }
        else
        {
            $("#btn_add_talla_product").attr("disabled", false);
            $("#btn_add_talla_product").removeClass("btn_disable");
        }

    });

    $("#TipoTalla").change(function () {
        var producto = $("#ProductSelect").val();
        var tipoTalla = $("#TipoTalla").val();

        if (producto == "none" || tipoTalla == 0)
        {
            $("#btn_add_talla_product").attr("disabled", true);
            $("#btn_add_talla_product").addClass("btn_disable");
        }
        else
        {
            $("#btn_add_talla_product").attr("disabled", false);
            $("#btn_add_talla_product").removeClass("btn_disable");
        }
    });
   
});

function goPage(page) {
    window.location.href = '/Product/Index/' + page;
};

function goPageCategory(categoria, page) {
    window.location.href = '/Product/ProductsByCategory/' + categoria +'?pag=' +page;
};

function getProducSelect()
{
    var products = [];
    var id = $('#ProductSelect').val();
    fetch("/Product/ProductWhitStocks/?id=" + id)
        .then(function (result) {
            if (result.ok)
                return result.json();
        })
        .then(function (productos) {
            productos.forEach(function (element) {
                $("input[type=checkbox]").each(function () {
                    var input = $(this).val();
                    console.log(input);
                    console.log(element.Talla.Id_size);
                    
                    if ($(".tallaCheckBox").length) {
                        if (input == element.Talla.Id_size) { 
                            $(this).prop("checked", true);
                            $(this).attr("disabled", true);
                            console.log("checked");
                        }
                    }    
                    
                });
              
            })
        });
};

function getTallaSelect()
{
    var Sizest = [];
    var id = $('#TipoTalla').val();
    fetch("/Product/Tallas/?id=" + id)
        .then(function (result) {
            if (result.ok)
                return result.json();
        })
        .then(function (tallas) {
            tallas.forEach(function (element) {
                Sizest.push({ "id": element.Id_size, "size": element.Size });
            })
            $(".containerChekbox").children().remove();
            Sizest.forEach(function (element) {
                $(".containerChekbox").append("<input type='checkbox' value='" + element.id + "' name='talla'/>")
                    .append("<label  class='tallaCheckBox' >" + element.size + "</label>").append("<br/>");
                
            });
            verifyAndCheak();
    });   
};

function verifyAndCheak() {
    if ($(".tallaCheckBox").length)
    {
        getProducSelect();
    }
    else
    {
        console.log("No existe el dato");
    }
    
};

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

