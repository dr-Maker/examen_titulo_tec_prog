using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class ShoppingCartModel
    {

        private int id_cart;
        private string token;
        private int cantidad;
        private int precio;
        private int subtotal;
        private int total;

        private List<ProductModel> productos;
        private UserModel usuario;

        public ShoppingCartModel()
        {
        }

        public int Id_cart { get => id_cart; set => id_cart = value; }
        public List<ProductModel> Productos { get => productos; set => productos = value; }
        public UserModel Usuario { get => usuario; set => usuario = value; }
        public string Token { get => token; set => token = value; }
        public int Cantidad { get => cantidad; set => cantidad = value; }
        public int Subtotal { get => subtotal; set => subtotal = value; }
        public int Precio { get => precio; set => precio = value; }
        public int Total { get => total; set => total = value; }

      

    }

}