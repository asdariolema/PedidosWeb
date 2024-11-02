using System;
using System.Collections.Generic;
using Microsoft.Reporting.WebForms;
using static System.Net.WebRequestMethods;

namespace DommarcoWeb
{
    public partial class ReporteForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string reportName = Request.QueryString["ReportName"];
                string reportPath = $"http://desktop-471cl18/Reports/report/"; // Ajusta la ruta del servidor de reportes
                             

                // Obtenemos los parámetros enviados por el formulario de origen
                var reportParams = GetReportParameters();

                if (!string.IsNullOrEmpty(reportName))
                {
                    ConfigureReportViewer(reportPath, reportParams, reportName);
                }
            }
        }

        private void ConfigureReportViewer(string reportPath, List<ReportParameter> parameters,string reportName)
        {
            ReportViewer1.ProcessingMode = ProcessingMode.Remote;

            // URL del servidor ReportServer
            ReportViewer1.ServerReport.ReportServerUrl = new Uri("http://desktop-471cl18/ReportServer");

            // La ruta del reporte debe ser relativa y comenzar con "/"
            // Ejemplo: si tu reporte se llama "ReportePedidos" y está en la carpeta "pedidos"
            ReportViewer1.ServerReport.ReportPath = reportPath; // reportPath debe ser algo como "/pedidos/ReportePedidos"


            ReportViewer1.ServerReport.ReportPath = "/" +  reportName;// "/pedidos";

            if (parameters != null && parameters.Count > 0)
            {
                ReportViewer1.ServerReport.SetParameters(parameters);
            }

            ReportViewer1.ServerReport.Refresh();
        }



        private List<ReportParameter> GetReportParameters()
        {
            List<ReportParameter> parameters = new List<ReportParameter>();
            foreach (string key in Request.QueryString.AllKeys)
            {
                if (key != "ReportName")
                {
                    string paramValue = Request.QueryString[key];
                    parameters.Add(new ReportParameter(key, paramValue));
                }
            }
            return parameters;
        }
    }
}
