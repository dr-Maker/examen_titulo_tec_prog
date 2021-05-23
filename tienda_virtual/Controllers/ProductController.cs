using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

using System.Web.Mvc;

namespace tienda_virtual
{
    public class ProductController : Controller
    {
        // GET: Producto
        public ActionResult Index()
        {
            if (Session["token"] != "")
            {
                Session["token"] = Session["token"].ToString();
            }
            else
            {
                System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
                string date = DateTime.Now.ToString();
                byte[] data = System.Text.Encoding.ASCII.GetBytes(date);
                data = md5.ComputeHash(data);
                Session["token"] = date + System.Text.Encoding.ASCII.GetString(data);
            }
   


            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<ProductModel> productos = ProductBuss.ProductsByAleatory();
            return View(productos);
        }
                
        public ActionResult Products()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<ProductModel> productos = ProductBuss.Products();
            ViewBag.ProductList = productos; 
            return View();
        }

        public ActionResult ProductsByCategory(int id)
        {

            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<ProductModel> productos = ProductBuss.ProductsByCategory(id);
            return View(productos);
        }  

        public ActionResult Product(int id) {


            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            ProductModel producto = ProductBuss.GetProduct(id);
            List<StockModel> ListStock = StockBuss.get_list_size(id);
            ViewBag.ListStock = ListStock;
            return View(producto);
        }

        public ActionResult FormProducts(int id, string accion)
        {
            ViewBag.action = accion;
            ViewBag.idProduct = id;

            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            ProductModel producto = ProductBuss.GetProduct(id);
            ViewBag.Producto = producto;

            List<BrandModel> listMarcas = Tools.marcas();
            ViewBag.MarcasList = listMarcas;

            return View();
        }

        public ActionResult Insert()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<BrandModel> Brandlist = Tools.marcas();
            ViewBag.BrandList = Brandlist;
            return View();
        }

        [HttpPost]
        public ActionResult Insert(FormCollection frm, HttpPostedFileBase file)
        {
            ProductModel obj = new ProductModel();
            obj.Category = new CategoryModel();
            obj.Category.Id_category = int.Parse(frm["category_id"].ToString());
            obj.Name_product = frm["product"].ToString();
            obj.Brand = new BrandModel();
            obj.Brand.Id_marca = int.Parse(frm["brand"].ToString());
            obj.Pdto_description = frm["desciption"].ToString();
            if (file != null)
            {
                string name_file = (DateTime.Now.ToString("yyyyMMddHHmmss") + "-" + file.FileName).ToLower();
                String route = Server.MapPath("~/Assets/uploads/");
                route += name_file;
                ProductBuss.UploadFile(route, file);
                obj.Imagen = name_file;
            }
            else
            {
                obj.Imagen = "not_photo.jpg";
            }            
            ProductBuss.Insert(obj);       
            return RedirectToAction("Products", "Product");
        }


        public ActionResult Stock()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<StockModel> Stocklist = StockBuss.listaStock();
            ViewBag.StockList = Stocklist;
            return View();
        }


        public ActionResult AddStock()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            List<TipoTallaModel> listTipoTalla = Tools.TipoTalla();
            ViewBag.TipoTallaList = listTipoTalla;

            List<SizeModel> listTalla = Tools.talla(1);
            ViewBag.TallaList = listTalla;

            List<ProductModel> ProductList = ProductBuss.ProductsOutStock();
            ViewBag.ProductList = ProductList;

            return View();
        }

        [HttpPost]
        public ActionResult AddStock(FormCollection frm)
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            StockModel obj = new StockModel();
            obj.Producto = new ProductModel();
            obj.Producto.Id_product = int.Parse(frm["product_id"].ToString());
            obj.Size = new SizeModel();
            obj.Size.Id_size = int.Parse(frm["talla"].ToString());
            StockBuss.InsertStock(obj);
            return RedirectToAction("Stock", "Product");
        }

        public ActionResult FormStock(int id)
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            ViewBag.Stockid = id;

            StockModel stock = StockBuss.getStock(id);
            ViewBag.Stock = stock;

            return View();
        }

        [HttpPost]
        public ActionResult FormStock(FormCollection frm)
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            StockModel obj = new StockModel();
            obj.Id_stock = int.Parse(frm["id_stock"].ToString());
            obj.Producto = new ProductModel();
            obj.Producto.Price = int.Parse(frm["precio"].ToString());
            obj.Producto.Cantidad = int.Parse(frm["stock"].ToString());
            StockBuss.UpdatetStock(obj);    
            return RedirectToAction("Stock", "Product");
        }

        [HttpPost]
        public ActionResult Editar(FormCollection frm)
        {
            ProductModel obj = new ProductModel();
            obj.Id_product = int.Parse(frm["idProduct"].ToString());
            obj.Category = new CategoryModel();
            obj.Category.Id_category = int.Parse(frm["category_id"].ToString());
            obj.Name_product = frm["nameproduct"].ToString();
            obj.Brand = new BrandModel(); 
            obj.Brand.Id_marca = int.Parse(frm["idbrand"].ToString());
            obj.Pdto_description =  frm["desciption"].ToString();
            ProductBuss.Update(obj);
            return RedirectToAction("Products", "Product");
        }

        [HttpPost]
        public ActionResult Eliminar(FormCollection frm)
        {

            int idProduct = int.Parse(frm["idProduct"].ToString());
            ProductBuss.Eliminar(idProduct);
            return RedirectToAction("Products", "Product"); 
        }

    }

}