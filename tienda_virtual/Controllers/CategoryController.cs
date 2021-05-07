using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using tienda_virtual;

namespace tienda_virtual
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult Index()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            return View();
           
        }


        public ActionResult Categories()
        {

            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            return View();

        }


        public ActionResult FormCategory(int id)
        {

            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            CategoryModel category = CategoryBuss.getCategory(id);
            ViewBag.Category = category;

            return View();
        }



        public ActionResult Register()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            return View();
        }

        [HttpPost]
        public ActionResult Register(FormCollection frm)
        {
            
            CategoryModel obj = new CategoryModel();
            obj.Category = frm["category"].ToString();
            CategoryBuss.CategoryRegister(obj);
            return RedirectToAction("Categories");
        }


        public ActionResult Menu()
        {  
            return View();
        }


    }
}