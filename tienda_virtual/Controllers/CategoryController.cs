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

            ViewBag.TipoMensaje = Session["tipoMensaje"];
            ViewBag.mensaje = Session["mensage"];

            return View();

        }

        public ActionResult FormCategory(int id, string accion)
        {
            ViewBag.action = accion;
            ViewBag.idCategory = id;
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
            string msg = string.Empty;
            string tipoResponse = string.Empty;

            if (CategoryBuss.CategoryRegister(obj))
            {
                msg = "Categoria creada Exitosamente";
                tipoResponse = "success";
            }
            else
            {
                msg = "Error en creación Intente nuevamente";
                tipoResponse = "error";
            }

            Session["mensage"] = msg;
            Session["tipoMensaje"] = tipoResponse;

            return RedirectToAction("Categories");
        }

        [HttpPost]
        public ActionResult Editar(FormCollection frm)
        {
            CategoryModel obj = new CategoryModel();
            obj.Id_category = int.Parse(frm["id_category"].ToString());
            obj.Category = frm["category"].ToString();
            string msg = string.Empty;
            string tipoResponse = string.Empty;

            if (CategoryBuss.EditCategory(obj))
            {
                msg = "Categoria Editada Exitosamente";
                tipoResponse = "success";
            }
            else
            {
                msg = "Error Intente nuevamente";
                tipoResponse = "error";
            }

            Session["mensage"] = msg;
            Session["tipoMensaje"] = tipoResponse;

            return RedirectToAction("Categories");
        }

        [HttpPost]
        public ActionResult Eliminar(FormCollection frm)
        {
            
            int idCategory = int.Parse(frm["id_category"].ToString());

            string msg = string.Empty;
            string tipoResponse = string.Empty;
            if (CategoryBuss.DeletedCategory(idCategory))
            {
                msg = "Categoria Eliminada Exitosamente";
                tipoResponse = "success";
            }
            else
            {
                msg = "Error Intente nuevamente";
                tipoResponse = "error";
            }
            Session["mensage"] = msg;
            Session["tipoMensaje"] = tipoResponse;

            return RedirectToAction( "Categories");
        }

        public ActionResult Menu()
        {  
            return View();
        }
    }
}