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
            
            return View();
        }
                
        public ActionResult Products()
        {

            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            List<ProductModel> productos = ProductBuss.Products();
            
            return View(productos);

        }

        public ActionResult Insert()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            return View();
        }

        [HttpPost]
        public ActionResult Insert(FormCollection frm)
        {

            ProductModel obj = new ProductModel();
            obj.Category= int.Parse(frm["category_id"].ToString());
            obj.Name_product = frm["product"].ToString();
            obj.Brand = frm["brand"].ToString();
            obj.Size = frm["size"].ToString();
            obj.Stock = int.Parse(frm["stock"].ToString());
            obj.Price = int.Parse(frm["price"].ToString());
            obj.Pdto_description = frm["desciption"].ToString();
            obj.Imagen = frm["img"].ToString();
            ProductBuss.Insert(obj);

            return RedirectToAction("Products", "Product");
        }
    }
}