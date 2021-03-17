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
            return View();
        }


        public ActionResult Register()
        {
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
            UserBuss.UserRegister(obj);



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