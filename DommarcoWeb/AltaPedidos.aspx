﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaPedidos.aspx.cs" Inherits="DommarcoWeb.AltaPedidos" MasterPageFile="~/Site.master" %>




<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Alta de Pedidos
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
    function validarCampos() {
        var cantidad = document.getElementById('<%= txtCantidad.ClientID %>').value;
        var precioUnitario = document.getElementById('<%= txtPrecioUnitario.ClientID %>').value;
        var descripcion = document.getElementById('<%= txtDescripcion.ClientID %>').value;

        if (!cantidad || !precioUnitario || !descripcion) {
            alert("Por favor, complete todos los campos obligatorios: Cantidad, Precio Unitario y Descripción.");
            return false;
        }
        return true;
    }
  



   
    function validarConfirmarPedido() {
        // Obtén los valores de los campos de Código de Cliente y Nombre del Cliente
        var codigoCliente = document.getElementById('<%= txtCodCliente.ClientID %>').value;
        var nombreCliente = document.getElementById('<%= txtRazonSocial.ClientID %>').value;

        // Obtén la grilla de artículos
        var grillaArticulos = document.getElementById('<%= gvArticulos.ClientID %>');

        // Verifica si el Código de Cliente o Nombre del Cliente están vacíos
        if (!codigoCliente || !nombreCliente) {
            alert("Por favor, complete los campos obligatorios: Código de Cliente y Nombre del Cliente.");
            return false;
        }

        // Verifica si la grilla de artículos tiene al menos una fila de datos (excluyendo el encabezado)
        if (grillaArticulos.rows.length <= 1) {
            alert("Debe agregar al menos un artículo en la grilla de artículos.");
            return false;
        }















        return true; // Si pasa todas las validaciones, permite la confirmación del pedido
    }
    </script>



















    <div class="container" style="width: 100%; max-width: inherit; padding: 20px;">
   
        <!-- Contenedor para la fecha y logo -->
      <div class="form-inline header-container justify-content-between">
    <!-- Campo Tipo Documento alineado a la izquierda -->
    <asp:TextBox ID="txtTipoDocumento" runat="server" CssClass="text-left text-blue-bold" style="width:250px;" />

    <!-- Contenedor para los campos de fecha alineado a la derecha -->
    <div class="date-container" style="display: flex; align-items: center;">
        <label for="txtFechaPedido" class="mr-2">Fecha:</label>
        <asp:TextBox ID="txtFechaPedido" runat="server" CssClass="form-control" placeholder="Seleccione una fecha" style="width: 110px;" />
    </div>
</div>

        <!-- Campo oculto para almacenar el ID del cliente seleccionado -->
        <asp:HiddenField ID="hfSelectedClientID" runat="server" />

 

        <asp:UpdatePanel ID="UpdatePanelCliente" runat="server">
    <ContentTemplate>
        <div class="panel panel-custom">
<div class="form-inline">
    <div class="form-group" style="margin-right: 15px;">
        <label for="txtCodCliente" class="control-label">Código</label>
        <asp:TextBox ID="txtCodCliente" runat="server" CssClass="form-control" MaxLength="10" AutoPostBack="true" OnTextChanged="txtCodCliente_TextChanged" onkeypress="return validateNumericInput(event)" style="width: 80px;" />
    </div>
    <div class="form-group" style="margin-right: 15px;">
        <label for="txtRazonSocial" class="control-label">Razón Social</label>
           <asp:TextBox ID="txtRazonSocial" runat="server" CssClass="form-control" MaxLength="200" style="width: 220px; font-weight: bold; color: blue;" />
    </div>
    <div class="form-group" style="margin-right: 15px;">
        <label for="txtDireccion" class="control-label">Dirección</label>
        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" MaxLength="200" style="width: 220px; font-weight: bold; color: blue;" />
    </div>
    <div class="form-group" style="margin-right: 15px;">
        <label for="txtCUIT" class="control-label">CUIT</label>
        <asp:TextBox ID="txtCUIT" runat="server" CssClass="form-control" style="width: 130px;" />
    </div>
    <div class="form-group" style="margin-right: 15px;">
        <label for="ddlEstado" class="control-label">Estado</label>
        <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control" style="width: 150px;" />
    </div>
    <!-- Contenedor para alinear el botón a la derecha -->
    <div class="form-group ml-auto">
        <asp:Button ID="btnBuscarCliente" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscarCliente_Click" UseSubmitBehavior="false" style="width: 70px; height: 35px;" />
    </div>
</div>


        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<div class="modal fade" id="clientesModal" tabindex="-1" role="dialog" aria-labelledby="clienteModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="clienteModalLabel">Buscar Cliente</h4>
            </div>
            <asp:UpdatePanel ID="UpdatePanelClientes" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-body">
                        <asp:TextBox ID="txtBuscarRazonSocial" runat="server" CssClass="form-control" Placeholder="Razón Social" />
                        
                        <!-- Cambiado el texto y el estilo del botón -->
                        <asp:Button ID="btnFiltrarClientes" runat="server" Text="Buscar Cliente" CssClass="btn btn-primary btn-block mt-2" 
                                    OnClick="btnFiltrarClientes_Click" UseSubmitBehavior="false" />
                        
                        <asp:GridView ID="gvClientes" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" 
                                      OnRowCommand="gvClientes_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="nu_cli_codigo" HeaderText="Código Cliente" />
                                <asp:BoundField DataField="DS_CLI_RAZON_SOCIAL" HeaderText="Razón Social" />
                                <asp:BoundField DataField="ds_cli_direccion" HeaderText="Dirección" />
                                <asp:BoundField DataField="ds_cli_cuit" HeaderText="CUIT" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnSeleccionar" runat="server" CommandName="Select" 
                                                    CommandArgument='<%# Container.DataItemIndex %>' Text="Seleccionar" 
                                                    CssClass="btn btn-primary btn-sm" UseSubmitBehavior="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnFiltrarClientes" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
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
                            <div class="col-md-4" style="display: flex; align-items: flex-end; justify-content: space-between;">
                                <div>
                                    <label for="cantidad" class="control-label">Cantidad</label>
                                    <asp:TextBox ID="txtCantidad" runat="server" AutoPostBack="True" OnTextChanged="txtCantidad_Changed" CssClass="form-control" />
                                </div>
                                <div>
                                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" OnClientClick="return validarCampos();" style="width: 70px; height: 35px;" />
                                </div>
                            </div>
                        </div>
           

                        <div class="form-group row justify-content-between">
    <!-- Campo Precio Unitario -->
    <div class="col-md-4 form-inline">
        <label for="precio_unitario" class="control-label">Precio Unitario  :</label>
        <asp:TextBox ID="txtPrecioUnitario" runat="server" AutoPostBack="True" CssClass="form-control" MaxLength="10"  OnTextChanged="txtpreciounitario_Changed" />
    </div>

    <!-- Campo Unidad -->
    <div class="col-md-4 form-inline">
        <label for="ddlunidad" class="control-label">Unidad  :</label>
        <asp:DropDownList ID="ddlunidad" runat="server" CssClass="form-control" style="width: 100px;" />
    </div>

    <!-- Campo Precio Total alineado a la derecha -->
    <div class="col-md-4 form-inline justify-content-end">
        <label for="precio_total" class="control-label">Precio Total  :</label>
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
        <div class="scrollable-gridview">
            <asp:GridView ID="gvArticulos" runat="server" CssClass="table table-hover table-bordered" AutoGenerateColumns="False" AllowPaging="True" PageSize="4" OnPageIndexChanging="gvArticulos_PageIndexChanging" OnRowCommand="gvArticulos_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción">
                        <ItemStyle Width="400px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Detalle" HeaderText="Detalle">
                        <ItemStyle Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Unidad" HeaderText="Unidad" />
                    <%-- <asp:BoundField DataField="Tasa" HeaderText="Tasa" /> --%>
                    <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio Unitario">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" CssClass="text-right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PrecioTotal" HeaderText="Precio Total">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" CssClass="text-right" />
                    </asp:BoundField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <!-- Botón "Borrar" alineado a la derecha -->
                            <div style="text-align: right;">
                                <asp:Button ID="btnBorrar" runat="server" Text="Borrar" CssClass="btn btn-danger btn-sm" CommandName="DeleteRow" CommandArgument='<%# Container.DataItemIndex %>' />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>




        <!-- Footer GridView y botón Aceptar -->
<asp:UpdatePanel ID="UpdatePanelSumas" runat="server">
    <ContentTemplate>
        <div class="footer-sumas">
            <asp:GridView ID="gvSumas" runat="server" CssClass="table table-bordered table-striped text-right" AutoGenerateColumns="False" ShowHeader="True" GridLines="None">
                <Columns>
                    <asp:BoundField HeaderText="CANTIDADES" DataField="CantidadTotal" ItemStyle-HorizontalAlign="Right" />
                    <asp:BoundField HeaderText="SUBTOTAL" DataField="Subtotal" ItemStyle-HorizontalAlign="Right" />
                    <asp:BoundField HeaderText="TOTAL" DataField="Total" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle CssClass="total-column" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <div class="text-right" style="margin-top: 15px;">
               <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" style="width: 150px;" OnClientClick="return validarConfirmarPedido();" />

            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>


        <style>
    .total-column {
        font-weight: bold;
        color: blue;
    }
</style>


    </div>
</asp:Content>
