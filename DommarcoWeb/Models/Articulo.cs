namespace DommarcoWeb.Models
{
    public class Articulo
    {
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
        public decimal PrecioFinal
        {
            get
            {
                return Cantidad * PrecioUnitario;
            }
        }
    }
}