using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class ComunaModel
    {

        private int id_comuna;
        private string nombre_comuna;

        public int Id_comuna { get => id_comuna; set => id_comuna = value; }
        public string Nombre_comuna { get => nombre_comuna; set => nombre_comuna = value; }
    }
}