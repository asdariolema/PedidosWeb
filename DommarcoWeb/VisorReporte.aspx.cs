using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DommarcoWeb
{
    public partial class VisorReporte : System.Web.UI.Page
    {

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    string reportName = Request.QueryString["reporte"]; // El nombre del reporte
                    string reportServerUrl = "http://tu-servidor-de-reportes/ReportServer"; // URL del servidor de reportes
                    Dictionary<string, string> parametros = ObtenerParametros(); // Los parámetros para el reporte

                    if (!string.IsNullOrEmpty(reportName))
                    {
                        ConfigurarReporte(reportName, reportServerUrl, parametros);
                    }
                    else
                    {
                        // Manejo de errores si no se envía un reporte
                        Response.Write("No se ha proporcionado un nombre de reporte.");
                    }
                }
            }

            private Dictionary<string, string> ObtenerParametros()
            {
                // Aquí obtienes los parámetros que llegan por QueryString
                Dictionary<string, string> parametros = new Dictionary<string, string>();

                foreach (string key in Request.QueryString)
                {
                    if (key != "reporte") // Excluimos el parámetro 'reporte'
                    {
                        parametros.Add(key, Request.QueryString[key]);
                    }
                }

                return parametros;
            }

            private void ConfigurarReporte(string reportName, string reportServerUrl, Dictionary<string, string> parametros)
            {
                ReportViewer1.ProcessingMode = ProcessingMode.Remote;
                ReportViewer1.ServerReport.ReportServerUrl = new Uri(reportServerUrl);
                ReportViewer1.ServerReport.ReportPath = $"/TuCarpetaDeReportes/{reportName}";

                // Configurar los parámetros del reporte
                if (parametros != null && parametros.Count > 0)
                {
                    List<ReportParameter> reportParams = new List<ReportParameter>();
                    foreach (var parametro in parametros)
                    {
                        reportParams.Add(new ReportParameter(parametro.Key, parametro.Value));
                    }

                    ReportViewer1.ServerReport.SetParameters(reportParams);
                }

                ReportViewer1.ServerReport.Refresh();
            }
        }
    }
