using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using tienda_virtual;

namespace tienda_virtual
{
    public class UserController : Controller
    {
        // GET: Usuario
        public ActionResult Index()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            return View();
        }


        public ActionResult Register()
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<RegionModel> listRegion = Tools.Region();
            ViewBag.RegionList = listRegion;
            List<ProvinciaModel> listProvincia = Tools.provincia();
            ViewBag.ProvinciaList = listProvincia;
            List<ComunaModel> listComuna = Tools.Comuna();
            ViewBag.ComunaList = listComuna;
            if (TempData["id_region"] == null) {
                TempData["id_region"] = 0;
            }



            return View();
        }

        [HttpPost]
        public ActionResult Register(FormCollection frm)
        {

            UserModel obj = new UserModel();
            obj.Firstname = frm["first_name"].ToString();
            obj.Secondname = frm["second_name"].ToString();
            obj.Fatherlastname = frm["father_lastname"].ToString();
            obj.Motherlastname = frm["mother_lastname"].ToString();
            obj.Password = frm["pass"].ToString();
            obj.Username = frm["user"].ToString();
            obj.Email = frm["email"].ToString();
            obj.Sex = int.Parse(frm["sexo"].ToString());
            obj.Birthday = DateTime.Parse(frm["datebirth"].ToString());
            obj.Comuna = new ComunaModel();
            obj.Comuna.Nombre_comuna = frm["comuna"].ToString();
            obj.Addres = frm["direccion"].ToString();

            UserBuss.UserRegister(obj);

            if (TempData["id_region"] == null)
            {
                TempData["id_region"] = 0;
            }

            return RedirectToAction("Register", "User");

        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection frm)
        {
            UserModel obj = new UserModel();
            obj.Username = frm["user"].ToString();
            obj.Password = frm["pass"].ToString();
            DataTable dt = UserBuss.Login(obj);

            if (dt != null && dt.Rows.Count>0)
            {
                Session["iduser"] = dt.Rows[0]["id_user"].ToString(); ;
                Session["user"] = dt.Rows[0]["username"].ToString();
                Session["role"] = dt.Rows[0]["rol"].ToString();


            }


            return RedirectToAction("Index", "Product");
        }


        public ActionResult Logout() {

            Session["user"] = "";
            Session["role"] = "";

            return RedirectToAction("Index", "Product");
        }

    }
}