<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CotizacionBusqueda.aspx.cs" Inherits="CotizacionBusqueda" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Búsqueda de Pedidos</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-inline .form-group {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Búsqueda de Pedidos</h2>
            <div class="form-inline">
                <div class="form-group">
                    <label for="ddlFiltro">Filtro:</label>
                    <asp:DropDownList ID="ddlFiltro" runat="server" CssClass="form-control">
                        <asp:ListItem Value="fecha">Fecha</asp:ListItem>
                        <asp:ListItem Value="nrocotizacion">Nro Cotización</asp:ListItem>
                        <asp:ListItem Value="codigodecliente">Código de Cliente</asp:ListItem>
                        <asp:ListItem Value="nombredecliente">Nombre de Cliente</asp:ListItem>
                        <asp:ListItem Value="numerodepedido">Número de Pedido</asp:ListItem>
                        <asp:ListItem Value="estado">Estado</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtValor">Valor:</label>
                    <asp:TextBox ID="txtValor" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
            </div>
            <asp:GridView ID="gvResultados" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="true"></asp:GridView>
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>
