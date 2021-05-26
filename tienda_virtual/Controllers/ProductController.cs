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
        public ActionResult Index(int id)
        {
            ViewBag.actual = id;
            PaginacionModel paginador = Tools.paginacionInicio();
            ViewBag.countProduct = paginador;

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

            id = id - 1;
            if (id>0)
            {
                id = id * paginador.Cantidad_por_hoja;
            }
 

            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<ProductModel> productos = ProductBuss.ProductsByAleatory(id);
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

        public ActionResult ProductsByCategory(int id, int pag)
        {
            ViewBag.category = id;
            ViewBag.actual = pag;
            PaginacionModel paginador = Tools.paginacionAleatory(id);
            ViewBag.countProduct = paginador;


            pag = pag - 1;
            if (pag > 0)
            {
                pag = pag * paginador.Cantidad_por_hoja;
            }

            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<ProductModel> productos = ProductBuss.ProductsByCategory(id, pag);
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
            obj.Producto.Id_product = int.Parse(frm["ProductSelect"].ToString());
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
        public ActionResult Editar(FormCollection frm, HttpPostedFileBase file)
        {
            ProductModel obj = new ProductModel();
            obj.Id_product = int.Parse(frm["idProduct"].ToString());
            obj.Category = new CategoryModel();
            obj.Category.Id_category = int.Parse(frm["category_id"].ToString());
            obj.Name_product = frm["nameproduct"].ToString();
            obj.Brand = new BrandModel(); 
            obj.Brand.Id_marca = int.Parse(frm["idbrand"].ToString());
            obj.Pdto_description =  frm["desciption"].ToString();

            if (file != null )
            {
                string name_file = (DateTime.Now.ToString("yyyyMMddHHmmss") + "-" + file.FileName).ToLower();
                String route = Server.MapPath("~/Assets/uploads/");
                route += name_file;
                ProductBuss.UploadFile(route, file);
                obj.Imagen = name_file;
            }
            else
            {
                obj.Imagen = frm["img_old"].ToString();
            }

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

        [HttpGet]
        public JsonResult Tallas(int id) 
        {
            List<SizeModel> ListTalla = Tools.talla(id);
            return Json(ListTalla, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Provincia(int id)
        {
            List<ProductModel> ListProducts = ProductBuss.GetProductWhitStocks(id);
            return Json(ListProducts, JsonRequestBehavior.AllowGet);
        }

    }

}