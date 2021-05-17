$(document).ready(function () {

    // Formulario Registro 

    $(".btn_add_product").click(function () {
        console.log("hizo click mas");
        old = parseInt($(".count_buy").attr('value'));
        actually = old - 1;
        console.log(actually);
        $(".count_buy").val(actually);
    }),

    $(".btn_rest_product").click(function () {
        console.log("hizo click menos");
        var value = parseInt($(".count_buy").attr('value'));  

        console.log("esta aca : " + value);
        value += 1;      
        console.log(value);
        $(".count_buy").val(value);
     });

    $("#tallas").change(function () {
        var valor = $("#tallas option:selected").val()
        addCarrito(valor)
    })

    $("#btn_add_carrito").on("click", function (e) {
        e.preventDefault();
        var valor = $("#tallas option:selected").val()
        console.log("hizo click y el valor es ..." + valor);
        window.location.href = '/ShoppingCart/AddShoppingCart/' + valor;
    });
 
});

function goChange() {
    //console.log("esta aca");
    //$(".form").submit();
    
};


function addCarrito() {
   
}