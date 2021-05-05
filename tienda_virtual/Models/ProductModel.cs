using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class ProductModel
    {

        private int id_product;
        private int category;
        private string name_product;
        private string brand;
        private string size;
        private int stock;
        private int price;
        private int cantidad;
        private string pdto_description;
        private string imagen;


        public int Id_product { get => id_product; set => id_product = value; }
        public int Category { get => category; set => category = value; }
        public string Name_product { get => name_product; set => name_product = value; }
        public string Brand { get => brand; set => brand = value; }
        public string Size { get => size; set => size = value; }
        public int Stock { get => stock; set => stock = value; }
        public int Price { get => price; set => price = value; }
        public string Pdto_description { get => pdto_description; set => pdto_description = value; }
        public string Imagen { get => imagen; set => imagen = value; }
        public int Cantidad { get => cantidad; set => cantidad = value; }
    }
}