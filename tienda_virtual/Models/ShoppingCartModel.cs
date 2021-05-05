using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class ShoppingCartModel
    {

        private int id_cart;
        private int id_product;
        private string token;
        private int cantidad;
        private List<ProductModel> productos;
        private UserModel usuario;

        public int Id_cart { get => id_cart; set => id_cart = value; }
        public List<ProductModel> Productos { get => productos; set => productos = value; }
        public UserModel Usuario { get => usuario; set => usuario = value; }
        public int Id_product { get => id_product; set => id_product = value; }
        public string Token { get => token; set => token = value; }
        public int Cantidad { get => cantidad; set => cantidad = value; }
    }
}