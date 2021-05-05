using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace tienda_virtual
{
    public class ShoppingCartController : Controller
    {
        // GET: ShoppingCart
        public ActionResult Index()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            ShoppingCartModel obj = ShoppingCartBuss.GetShoppingCart();
            return View(obj);
        }

        public ActionResult AddShoppingCart(int id)
        {

            ShoppingCartModel obj = new ShoppingCartModel();
            obj.Id_product = id;
            ShoppingCartBuss.AddShoppingCart(obj);
            //return RedirectToAction("Product","Product", new { id = id });
            return RedirectToAction("Index", "ShoppingCart");
        }

        public ActionResult DeleteProductShoppingCart(int id)
        {
            ShoppingCartModel obj = new ShoppingCartModel();
            obj.Id_product = id;
            ShoppingCartBuss.DeleteProductShoppingCart(obj);
            return RedirectToAction("Index", "ShoppingCart");
        }



        public ActionResult DoShopping()
        {
            //validar que el cliente haya realizado el log para continuar

            //recibir los datos del formulario por post

            return RedirectToAction("Order", "ShoppingCart");
        }


        public ActionResult Order()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            return View();
        }

        public ActionResult Orders()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            return View();
        }

    }
}