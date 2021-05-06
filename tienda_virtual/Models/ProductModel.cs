using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class ProductModel
    {

        private int id_product;
        private CategoryModel category;
        private string name_product;
        private BrandModel brand;
        private int price;
        private string pdto_description;
        private DateTime arrabal_date;
        private string imagen;

        public ProductModel()
        {
        }

        public int Id_product { get => id_product; set => id_product = value; }
        public CategoryModel Category { get => category; set => category = value; }
        public string Name_product { get => name_product; set => name_product = value; }
        public BrandModel Brand { get => brand; set => brand = value; }
        public int Price { get => price; set => price = value; }
        public string Pdto_description { get => pdto_description; set => pdto_description = value; }
        public DateTime Arrabal_date { get => arrabal_date; set => arrabal_date = value; }
        public string Imagen { get => imagen; set => imagen = value; }
        
    }
}