using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class ProvinciaModel
    {

        private int id_provincia;
        private string nombre_provincia;

        public int Id_provincia { get => id_provincia; set => id_provincia = value; }
        public string Nombre_provincia { get => nombre_provincia; set => nombre_provincia = value; }
    }
}