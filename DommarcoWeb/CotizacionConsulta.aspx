<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CotizacionConsulta.aspx.cs" Inherits="DommarcoWeb.CotizacionConsulta" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Búsqueda de Pedidos</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
     <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .title {
            font-size: 24px;
            color: #007bff; /* Color azul */
            font-weight: bold;
            text-align: center;
        }
        body {
            background-color: #f4f6f9;
            font-family: 'Roboto', 'Arial', sans-serif;
            background: url('images/fondo.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .navbar {
            background-color: #004080;
            padding: 10px 15px;
            color: white;
        }
        .navbar h2 {
            margin: 0;
            color: white;
        }
        .container {
            margin-top: 50px;
        }
        /* Estilos 3D para el panel */
        .panel {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2), 0 6px 20px rgba(0, 0, 0, 0.19); /* Sombra más profunda */
            border: 1px solid #ddd; /* Bordes ligeramente grises para mayor definición */
            position: relative;
        }

        .panel::before {
            content: '';
            position: absolute;
            top: 10px;
            left: 10px;
            right: 10px;
            bottom: 10px;
            border-radius: 8px;
            border: 1px solid rgba(0, 0, 0, 0.1); /* Sombra interna para crear profundidad */
            z-index: -1;
        }

        .panel:hover {
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3), 0 10px 30px rgba(0, 0, 0, 0.22); /* Sombra más pronunciada al pasar el mouse */
            transform: translateY(-5px); /* Levantar el contenedor un poco al hacer hover */
            transition: all 0.3s ease; /* Transición suave para el hover */
        }

        h2 {
            color: #004080;
            font-weight: bold;
        }
        .form-group label {
            font-weight: bold;
            color: #333;
        }
        .form-control {
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .btn-primary {
            background-color: #004080;
            border-color: #003366;
        }
        .btn-primary:hover {
            background-color: #003366;
            border-color: #00264d;
        }
        .table-custom {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .table-striped > tbody > tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }
        .logo {
            width: 150px;
            height: auto;
            position: absolute;
            top: 10px;
            right: 20px;
        }
        .form-inline {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .form-inline .form-group {
            margin-right: 10px;
            margin-bottom: 10px;
        }
        .form-row {
            margin-bottom: 15px;
        }
                .text-blue-bold {
    color: #007bff; /* Color azul */
    font-weight: bold; /* Negrita */
}
        .modal-header {
            background-color: #007bff;
            color: #fff;
        }
        .btn {
            margin-top: 5px;
        }
            .scrollable-gridview {
        max-height: 400px; /* Ajusta esta altura según tus necesidades */
        overflow-y: auto; /* Esto permite la barra de desplazamiento vertical cuando es necesario */
        overflow-x: hidden; /* Oculta la barra de desplazamiento horizontal */
        margin-top: 20px; /* Espaciado superior opcional para la visualización */
        border: 1px solid #ccc; /* Opcional: Agrega un borde al contenedor de la grilla */
        box-shadow: 0 2px 5px rgba(0,0,0,0.3); /* Sombra para mejorar la apariencia */
    }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            <div class="panel">
               
            <asp:TextBox ID="txtTipoDocumento" runat="server"     class="text-left text-blue-bold" style="width:150px;" />

                <div class="form-row">
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="TextBox1">Fecha Desde:</label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="TextBox2">Fecha Hasta:</label>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtCodigoCliente">Cód. Cliente:</label>
                            <asp:TextBox ID="txtCodigoCliente" runat="server" CssClass="form-control" MaxLength="10" size="10"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="txtRazonSocial">Razón Social:</label>
                            <asp:TextBox ID="txtRazonSocial" runat="server" CssClass="form-control" MaxLength="160" size="100"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnBuscarRazonSocial" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscarRazonSocial_Click" />
                    </div>
                </div>

                <div class="scrollable-gridview">
                <asp:GridView ID="gvResultados" runat="server" CssClass="table table-bordered table-striped table-custom" AutoGenerateColumns="False" OnRowCommand="gvResultados_RowCommand" OnRowDataBound="gvResultados_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="idcotiz" HeaderText="Nro." />
                        <asp:BoundField DataField="FechaAlta" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="idCliente" HeaderText="Cod. Cliente" />
                        <asp:BoundField DataField="NombreCliente" HeaderText="Razón Social" />
                        <asp:BoundField DataField="DireccionEntrega" HeaderText="Dirección" />
                        <asp:BoundField DataField="Estado1" HeaderText="Estado" />
                        <asp:ButtonField Text="Ver" CommandName="Ver" ButtonType="Button" />
                        <asp:ButtonField Text="Editar" CommandName="Editar" ButtonType="Button" />
                    </Columns>
                </asp:GridView>
                      </div>
            </div>
        </div>

    
        <div>
            <asp:Button ID="btnAbrirReporte" runat="server" Text="Abrir Reporte" OnClick="btnAbrirReporte_Click" />
        </div>
    </form>
   

    <!-- Referencias a librerías JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
