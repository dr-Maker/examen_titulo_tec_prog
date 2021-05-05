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

   
});

function goChange() {
    //console.log("esta aca");
    //$(".form").submit();
    
};
