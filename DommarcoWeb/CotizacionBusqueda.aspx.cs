using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DAL;




        public partial class CotizacionBusqueda : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
        {
            //string filtro = ddlFiltro.SelectedValue;
            //string valor = txtValor.Text.Trim();

            BuscarPedidos(string.Empty , string.Empty );
            // BuscarPedidos( txtValor.Text , txtValor.Text);
        }

    private void BuscarPedidos(string filtro, string valor)
    {

            DAL.Pedidos pedido = new DAL.Pedidos();
        //DataTable dt = pedido.GETpedidosCotizaciones(string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty,
        //string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty,
        //string.Empty, string.Empty, string.Empty, string.Empty, string.Empty,
        //string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty);

        pedido.impresalegal = "1";
        pedido.impresa = "1";
        pedido.pedidoConCambios = "1";
        pedido.retiraPedido = "1";


        DataTable dt = pedido.GETpedidos();


            //gvResultados.DataSource = dt;
            //gvResultados.DataBind();

        }
    }

