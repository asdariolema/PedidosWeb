<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PedidosConsultas.aspx.cs" Inherits="DommarcoWeb.PedidosConsultas" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Búsqueda de Pedidos</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .panel {
            background-color: #f5f5f5;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            position: relative;
        }
        .table-custom {
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 5px;
        }
        .form-inline {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
        }
        .form-inline .form-group {
            margin-right: 5px;
        }
        .form-row {
            margin-bottom: 10px;
        }
        .btn {
            margin-top: 0;
        }
        .logo {
            width: 150px;
            height: auto;
            position: absolute;
            top: 20px;
            right: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="panel">
                <img src="images/logo-dommarco.png" alt="Dommarco S.R.L Logo" class="logo" />
                <h2 class="text-center">Consulta de Pedidos</h2>
                <div class="form-row">
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="txtFechaDesde">Fecha Desde:</label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtFechaHasta">Fecha Hasta:</label>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="txtCodigoCliente">Cód. Cliente:</label>
                            <asp:TextBox ID="txtCodigoCliente" runat="server" CssClass="form-control" MaxLength="10" size="10"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtRazonSocial">Razón Social:</label>
                            <asp:TextBox ID="txtRazonSocial" runat="server" CssClass="form-control" MaxLength="160" size="100"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnBuscarRazonSocial" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscarRazonSocial_Click" />
                    </div>
                </div>
                <asp:GridView ID="gvResultados" runat="server" CssClass="table table-bordered table-striped table-custom" AutoGenerateColumns="False" OnRowCommand="gvResultados_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="FechaAlta" HeaderText="Fecha" />
                        <asp:BoundField DataField="ordencompra" HeaderText="Nro Compra" />
                        <asp:BoundField DataField="idCliente" HeaderText="ID Cliente" />
                        <asp:BoundField DataField="NombreCliente" HeaderText="Nombre de Cliente" />
                        <asp:BoundField DataField="DireccionEntrega" HeaderText="Dirección" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                        <asp:ButtonField Text="Ver" CommandName="Ver" ButtonType="Button" />
                        <asp:ButtonField Text="Editar" CommandName="Editar" ButtonType="Button" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
