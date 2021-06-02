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
            string token = Session["token"].ToString();

            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            ShoppingCartModel obj = ShoppingCartBuss.GetShoppingCart(token);
            ViewBag.Shopping = obj;
            ViewBag.ProductList = obj.Productos;
            return View();
        }

        public ActionResult AddShoppingCart(int id)
        {

            string token = Session["token"].ToString();

            ShoppingCartModel obj = new ShoppingCartModel();
            obj.Id_cart = id;
            obj.Token = token;
            ShoppingCartBuss.AddShoppingCart(obj);
            //return RedirectToAction("Product","Product", new { id = id });
            return RedirectToAction("Index", "ShoppingCart");
        }

        public ActionResult DeleteProductShoppingCart(int id)
        {
            ShoppingCartModel obj = new ShoppingCartModel();
            obj.Id_cart = id;
            ShoppingCartBuss.DeleteProductShoppingCart(obj);
            return RedirectToAction("Index", "ShoppingCart");
        }

        public ActionResult DoShopping()
        {
            //validar que el cliente haya realizado el log para continuar
            UserModel usuario = new UserModel();
            usuario.Iduser = int.Parse(Session["iduser"].ToString());
            usuario.Token = Session["token"].ToString();
            OrderBuss.UpdateOrder(usuario);
            OrderBuss.MakeOrder(usuario);
            //recibir los datos del formulario por post

            return RedirectToAction("Order", "ShoppingCart");
        }

        public ActionResult Order()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            string token = Session["token"].ToString();
            ShoppingCartModel Orden = OrderBuss.GetOrder(token);
            ViewBag.Orden = Orden;

            List<RegionModel> region = Tools.Region();
            ViewBag.Region = region;

            return View();
        }

        public ActionResult Orders()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            string user = Session["user"].ToString();

            List<ShoppingCartModel> ListOrdenes = OrderBuss.GetOrders(user);
            ViewBag.ListOrdenes = ListOrdenes;

            List<ProductModel> ListProduct = new List<ProductModel>();

            foreach (var orden in ListOrdenes)
            {
                ListProduct = orden.Productos;
            }

            ViewBag.ListProduct = ListProduct;

            return View();
        }

        public ActionResult MakeChange()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            List<ShoppingCartModel> ListOrdenes = OrderBuss.GetOrdersPending();
            ViewBag.OrdersList = ListOrdenes;

            List<EstadoOrdenModel> ListEstado = Tools.EstadoOrden();
            ViewBag.EstadoList = ListEstado;


            return View();
        }

        public ActionResult DeleteAllCart() {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            string session = Session["token"].ToString();
            ProductBuss.DeleteAllProductCart(session);
            return RedirectToAction("Index", "ShoppingCart");

        }

        public ActionResult DeleteOneKindProductCart(int id)
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            string session = Session["token"].ToString();

            ProductBuss.DeleteOneKindProductCart(session, id);
            return RedirectToAction("Index", "ShoppingCart");

        }

        public ActionResult RestProduct(int id)
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            string token = Session["token"].ToString();

            ShoppingCartModel obj = new ShoppingCartModel();
            obj.Id_cart = id;
            obj.Token = token;
            ProductBuss.DeleteOneProdutCart(obj);

            return RedirectToAction("Index", "ShoppingCart");
        }

        public ActionResult Update(int estado, int cesta)
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            ShoppingCartBuss.UpdateStateSend(cesta, estado);
            return RedirectToAction("MakeChange", "ShoppingCart");
        }

        [HttpPost]
        public ActionResult Pagar(FormCollection frm)
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            
            // Hacer el update de la direccion 

            int eleccionDireccionEnvio = int.Parse(frm["new_address"].ToString());

            UserModel usuario = new UserModel();

            usuario.Iduser = int.Parse(frm["idusuario"].ToString());

            if (eleccionDireccionEnvio == 1)
            {
                //necesito recibir el id de usuario
               
                usuario.Region = new RegionModel();
                usuario.Region.Id_region = int.Parse(frm["RegionSelect"].ToString());
                usuario.Comuna = new ComunaModel();
                usuario.Comuna.Id_comuna = int.Parse(frm["comuna"].ToString());
                usuario.Addres = frm["direccion"].ToString();

                ShoppingCartBuss.UpdateAddressOrder(usuario);

            }

            // hacer el update del tipo de pago y el pago

            int idcesta = int.Parse(frm["idcesta"].ToString());
            int typepay = int.Parse(frm["type_tc"].ToString());
            int pay = 2;


            OrderBuss.PayMethod(idcesta, typepay, pay);

            return RedirectToAction("Orders", "ShoppingCart");
        }
    }
}