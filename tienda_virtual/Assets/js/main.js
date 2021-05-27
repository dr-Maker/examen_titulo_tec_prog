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
        addCarrito(valor)
    })

    $("#btn_add_carrito").on("click", function (e) {
        e.preventDefault();
        var valor = $("#tallas option:selected").val()
        console.log("hizo click y el valor es ..." + valor);
        window.location.href = '/ShoppingCart/AddShoppingCart/' + valor;
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

    $('#RegionSelect').change(function () {
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

    $('.optionComuna').click(function () {
        var id = $("#optionProvincia").val();
        console.log(id);
        fetch("/User/Comuna/?id="+id)
            .then(function (result) {
                if (result.ok)
                    return result.json();
            })
            .then(function (comunas) {
                $(".optionComuna").children().remove();
                comunas.forEach(function (option) {
                    $('.optionComuna').append("<option value='" + option.Id_comuna + "' >" + option.Nombre_comuna + "</option>");
                })
                
            });
    })

    var sum = 0;
    $(".cesta tr").each(function() {
        var total = parseInt($(this).find(".total_producto").html());
        sum += total;
        $("#total_cesta").html("<p>" +sum+"</p>");   
    })
    

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