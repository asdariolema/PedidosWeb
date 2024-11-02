using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using DAL;

namespace DommarcoWeb
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            string wConnString = DAL.SQL.Decrypt(ConfigurationManager.AppSettings["ConnectionISeries"].ToString(), "mlmweb");
            ////Area de gestion
            //CMUSER agest = new CMUSER();

            //agest.ConnString = wConnString;
            //Application["CMUSER"] = agest.getCMUSER();
            //// Código que se ejecuta al iniciar la aplicación
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}