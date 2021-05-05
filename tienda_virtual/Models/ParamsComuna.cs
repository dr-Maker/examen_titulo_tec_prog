using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class ParamsComuna
    {
        private int id_region;
        private int id_provincia;
        private int id_comuna;

        public ParamsComuna(int id_region, int id_provincia, int id_comuna)
        {
            this.id_region = 0;
            this.id_provincia = 0;
            this.id_comuna = 0;
        }

        public int Id_region { get => id_region; set => id_region = value; }
        public int Id_provincia { get => id_provincia; set => id_provincia = value; }
        public int Id_comuna { get => id_comuna; set => id_comuna = value; }
    }
}