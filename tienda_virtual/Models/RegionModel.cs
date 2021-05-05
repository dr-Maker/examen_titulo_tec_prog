using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class RegionModel
    {
        private int id_region;
        private string nombre_region;
      


        public RegionModel()
        {
        }

        public int Id_region { get => id_region; set => id_region = value; }
        public string Nombre_region { get => nombre_region; set => nombre_region = value; }
    }
}