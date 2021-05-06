using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class BrandModel
    {

        private int id_marca;
        private string brand;

        public BrandModel()
        {
        }

        public BrandModel(int id_marca, string brand)
        {
            this.id_marca = id_marca;
            this.brand = brand;
        }

        public int Id_marca { get => id_marca; set => id_marca = value; }
        public string Brand { get => brand; set => brand = value; }
    }
}