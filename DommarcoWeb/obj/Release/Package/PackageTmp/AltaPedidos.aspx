<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaPedidos.aspx.cs" Inherits="DommarcoWeb.AltaPedidos" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Alta de Pedidos</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Roboto', 'Arial', sans-serif;
            background: url('images/fondo.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            max-width: 1200px; /* Ensanchar un 20% */
        }

        .header-logo {
            width: 96px; /* Ensanchar un 20% */
            height: auto;
            margin-top: -10px;
            float: right;
        }

        .panel-custom {
            margin-top: 10px;
            padding: 10px;  /* Ajuste de padding para caber en una sola línea */
            border-radius: 8px;
            background-color: #f8f9fa;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        .form-group {
            margin-bottom: 5px; /* Reducir margen inferior */
        }

        .form-horizontal .form-control {
            width: 100%;
            padding: 6px; /* Reducir padding de los controles */
        }

        .form-inline .form-control {
            width: auto; /* Controla el ancho para que se ajuste al contenido */
            display: inline-block;
        }

        h4.text-center {
            color: #007bff;
            font-weight: bold;
            margin-bottom: 10px; /* Reducir margen inferior */
        }

        .btn-primary, .btn-default, .btn-success {
            padding: 5px 10px;
            font-size: 0.9em;
        }

        .modal-header {
            background-color: #007bff;
            color: #fff;
        }

        .modal-header .close {
            color: #fff;
        }

        .table-hover > tbody > tr:hover {
            background-color: #e9ecef;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <img src="images/logo-dommarco.png" alt="Dommarco S.R.L Logo" class="header-logo" />
            <h4 class="text-center">Alta de Pedidos</h4>

            <!-- Campo oculto para almacenar el ID del cliente seleccionado -->
            <asp:HiddenField ID="hfSelectedClientID" runat="server" />

            <!-- Detalles del cliente (Panel en una sola línea) -->
            <asp:UpdatePanel ID="UpdatePanelCliente" runat="server">
                <ContentTemplate>
                    <div class="panel panel-custom">
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="txtCodCliente" class="control-label">Código:</label>
                                <asp:TextBox ID="txtCodCliente" runat="server" CssClass="form-control" MaxLength="10" AutoPostBack="true" OnTextChanged="txtCodCliente_TextChanged" onkeypress="return validateNumericInput(event)" style="width: 80px;" />
                            </div>
                            <div class="form-group">
                                <label for="txtRazonSocial" class="control-label">Razón Social:</label>
                                <asp:TextBox ID="txtRazonSocial" runat="server" CssClass="form-control" MaxLength="200" style="width: 180px;" />
                            </div>
                            <div class="form-group">
                                <label for="txtDireccion" class="control-label">Dirección:</label>
                                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" MaxLength="200" style="width: 180px;" />
                            </div>
                            <div class="form-group">
                                <label for="txtCUIT" class="control-label">CUIT:</label>
                                <asp:TextBox ID="txtCUIT" runat="server" CssClass="form-control" style="width: 120px;" />
                            </div>
                            <div class="form-group">
                                <label for="ddlEstado" class="control-label">Estado:</label>
                                <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control" style="width: 150px;" />
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btnBuscarCliente" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscarCliente_Click" UseSubmitBehavior="false" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <!-- Modal para búsqueda de clientes -->
            <div class="modal fade" id="clientesModal" tabindex="-1" role="dialog" aria-labelledby="clienteModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="clienteModalLabel">Buscar Cliente</h4>
                        </div>
                        <div class="modal-body">
                            <input type="text" id="txtBuscarRazonSocial" runat="server" class="form-control" placeholder="Razón Social" />
                            <asp:Button ID="btnFiltrarClientes" runat="server" Text="Filtrar" CssClass="btn btn-default btn-block" OnClick="btnFiltrarClientes_Click" OnClientClick="return validateSearchInput();" style="margin-top: 10px;" />
                            <asp:GridView ID="gvClientes" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" OnRowCommand="gvClientes_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="nu_cli_codigo" HeaderText="Código Cliente" />
                                    <asp:BoundField DataField="DS_CLI_RAZON_SOCIAL" HeaderText="Razón Social" />
                                    <asp:BoundField DataField="ds_cli_direccion" HeaderText="Dirección" />
                                    <asp:BoundField DataField="ds_cli_cuit" HeaderText="CUIT" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btnSeleccionar" runat="server" CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>' Text="Seleccionar" CssClass="btn btn-primary btn-sm" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Formulario para agregar artículos -->
            <div class="panel panel-custom">
                <asp:UpdatePanel ID="UpdatePanelArticulos" runat="server">
                    <ContentTemplate>
                        <div class="form-horizontal">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="descripcion" class="control-label">Descripción</label>
                                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" MaxLength="200" />
                                </div>
                                <div class="col-md-4">
                                    <label for="detalle" class="control-label">Detalle</label>
                                    <asp:TextBox ID="txtdetalle" runat="server" CssClass="form-control" MaxLength="200" />
                                </div>
                                <div class="col-md-2">
                                    <label for="cantidad" class="control-label">Cantidad</label>
                                    <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" MaxLength="10" onkeypress="return validateDecimalInput(event)" />
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary btn-block" OnClick="btnAgregar_Click" />
                                </div>
                            </div>

                            <div class="form-group row">
                               
                         <div class="col-md-4 form-inline">
                                    <label for="precio_unitario" class="control-label">Precio Unitario</label>
                                    <asp:TextBox ID="txtPrecioUnitario" runat="server" CssClass="form-control" MaxLength="10" onkeydown="calculateTotalOnEnter(event)" />
                                </div>

                                <div class="col-md-4 form-inline">
                                    <label for="ddlunidad" class="control-label">Unidad</label>
                                  <asp:DropDownList ID="ddlunidad" runat="server" CssClass="form-control" style="width: 100px;" />
                                </div>
                             <div class="col-md-4 form-inline">
                                    <label for="precio_total" class="control-label">Precio Total</label>
                                    <asp:TextBox ID="txtPrecioTotal" runat="server" CssClass="form-control" MaxLength="10" ReadOnly="True" />
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <!-- Grilla de artículos -->
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvArticulos" runat="server" CssClass="table table-hover table-bordered" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvArticulos_PageIndexChanging" OnRowCommand="gvArticulos_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                            <asp:BoundField DataField="Detalle" HeaderText="Detalle" />
                            <asp:BoundField DataField="Unidad" HeaderText="Unidad" />
                            <asp:BoundField DataField="Tasa" HeaderText="Tasa" />
                            <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio Unitario" />
                            <asp:BoundField DataField="PrecioTotal" HeaderText="Precio Total" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnBorrar" runat="server" Text="Borrar" CssClass="btn btn-danger btn-sm" CommandName="DeleteRow" CommandArgument='<%# Container.DataItemIndex %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>

            <!-- Footer GridView y botón Aceptar -->
            <asp:UpdatePanel ID="UpdatePanelSumas" runat="server">
                <ContentTemplate>
                    <div class="footer-sumas">
                        <asp:GridView ID="gvSumas" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" ShowHeader="True" GridLines="None" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true" style="border-radius: 10px; overflow: hidden;">
                            <Columns>
                                <asp:BoundField HeaderText="CANTIDADES" DataField="CantidadTotal" ItemStyle-BackColor="#e9ecef" ItemStyle-ForeColor="#212529" ItemStyle-Font-Size="12px" />
                                <asp:BoundField HeaderText="SUBTOTAL" DataField="Subtotal" ItemStyle-BackColor="#e9ecef" ItemStyle-ForeColor="#212529" ItemStyle-Font-Size="12px" />
                                <asp:BoundField HeaderText="IMPUESTOS" DataField="Impuestos" ItemStyle-BackColor="#e9ecef" ItemStyle-ForeColor="#212529" ItemStyle-Font-Size="12px" />
                                <asp:BoundField HeaderText="TOTAL" DataField="Total" ItemStyle-BackColor="#e9ecef" ItemStyle-ForeColor="#212529" ItemStyle-Font-Size="12px" />
                            </Columns>
                        </asp:GridView>
                        <!-- Botón Aceptar debajo de la grilla de sumas -->
                        <div class="text-right" style="margin-top: 15px;">
                            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-success" OnClick="btnAceptar_Click" style="width: 150px;" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
