<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteForm.aspx.cs" Inherits="DommarcoWeb.ReporteForm" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Visor de Reportes</title>
    <style>
        /* CSS para asegurar tamaño completo */
        html, body, form {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }
        #ReportViewer1 {
            width: 100% !important;
            height: 100% !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="height: 100%; width: 100%;">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div style="height: 100%; width: 100%;">
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" ProcessingMode="Remote" AsyncRendering="false" Width="100%" Height="100%">
            </rsweb:ReportViewer>
        </div>
    </form>
</body>
</html>
