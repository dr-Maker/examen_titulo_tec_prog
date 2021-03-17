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
            return View();
        }


        public ActionResult Categories()
        {
           
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(FormCollection frm)
        {

            CategoryModel obj = new CategoryModel();
            obj.Category = frm["category"].ToString();
            CategoryBuss.CategoryRegister(obj);
            return RedirectToAction("Categories", "Category");
        }


        public ActionResult Menu()
        {

            return View();
        }


    }
}