using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class TipoTallaModel
    {
        private int id_tipo;
        private string tipo_talla;

        public TipoTallaModel()
        {
        }

        public int Id_tipo { get => id_tipo; set => id_tipo = value; }
        public string Tipo_talla { get => tipo_talla; set => tipo_talla = value; }
    }
}