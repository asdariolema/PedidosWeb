<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PedidosConsultas.aspx.cs" Inherits="DommarcoWeb.PedidosConsultas" MasterPageFile="~/Site.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Búsqueda de Pedidos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Ajuste del ancho de contenido al contenedor principal -->
    <div class="panel">
        <asp:TextBox ID="txtTipoDocumento" runat="server" CssClass="text-left text-blue-bold" style="width:150px;" />
        
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
                    <asp:BoundField DataField="idpedido" HeaderText="Nro." />
                    <asp:BoundField DataField="FechaAlta" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="idCliente" HeaderText="Cod. Cliente" />
                    <asp:BoundField DataField="NombreCliente" HeaderText="Razón Social" />
                    <asp:BoundField DataField="DireccionEntrega" HeaderText="Dirección" />
                    <asp:BoundField DataField="Estado1" HeaderText="Estado" />
                    <asp:ButtonField Text="Abrir" CommandName="Abrir" ButtonType="Button" />
                    <asp:ButtonField Text="Imprimir" CommandName="Imprimir" ButtonType="Button" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <!-- Modal para el reporte de pedido -->
   <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen" role="document">
       <%-- <div class="modal-content">--%>
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Pedido</h5>
                <button type="button" class="close" onclick="closeModal()" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body p-0">
                <iframe id="reportFrame" style="width: 100%; height: 100vh; border: none;"></iframe>
            </div>
       <%-- </div>--%>
    </div>
</div>

<script>
    function openModal(reportUrl) {
        $('#reportFrame').attr('src', reportUrl);
        $('#myModal').modal('show');
    }

    function closeModal() {
        $('#myModal').modal('hide');
        $('#reportFrame').attr('src', '');
    }
</script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
