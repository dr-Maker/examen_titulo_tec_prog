using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace tienda_virtual
{
    public class ProductController : Controller
    {
        // GET: Producto
        public ActionResult Index()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<ProductModel> productos = ProductBuss.Products();
            return View(productos);
        }
                
        public ActionResult Products()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<ProductModel> productos = ProductBuss.Products();
            return View(productos);
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
            return View(producto);
        }

        public ActionResult FormProducts(int id)
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            ProductModel producto = ProductBuss.GetProduct(id);
            ViewBag.Producto = producto;

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
            obj.Price= int.Parse(frm["price"].ToString()); 
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

        public ActionResult FormStock(int id)
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            StockModel stock = StockBuss.getStock(id);
            ViewBag.Stock = stock;


            return View();
        }





    }

}