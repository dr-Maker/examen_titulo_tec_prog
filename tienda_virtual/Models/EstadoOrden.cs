using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class EstadoOrden
    {

        private int id_estado;
        private string estado_orden;

        public EstadoOrden()
        {
        }

        public int Id_estado { get => id_estado; set => id_estado = value; }
        public string Estado_orden { get => estado_orden; set => estado_orden = value; }
    }
}