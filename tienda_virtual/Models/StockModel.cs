using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class StockModel
    {
        private int id_stock;
        private ProductModel producto;
        private int stock;
        private SizeModel size;

        public StockModel()
        {
        }

        public int Id_stock { get => id_stock; set => id_stock = value; }
        public ProductModel Producto { get => producto; set => producto = value; }
        public int Stock { get => stock; set => stock = value; }
        public SizeModel Size { get => size; set => size = value; }
       
    }
}