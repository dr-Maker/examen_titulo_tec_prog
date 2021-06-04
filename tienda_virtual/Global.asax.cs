using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace tienda_virtual
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();     
            RouteConfig.RegisterRoutes(RouteTable.Routes);


        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["iduser"] = "";
            Session["user"] = "";
            Session["role"] = "";
            Session["token"] = "";
            Session["mensage"] = "";
            Session["tipoMensaje"] = "";

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Session["iduser"] = "";
            Session["user"] = "";
            Session["role"] = "";
            Session["token"] = "";
            Session["mensage"] = "";
            Session["tipoMensaje"] = "";
        }

    }
}
