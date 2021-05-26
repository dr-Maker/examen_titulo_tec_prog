using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class PaginacionModel
    {
        private int cantidad_pag;
        private int cantidad_por_hoja;

        public PaginacionModel()
        {
            this.cantidad_por_hoja = 6;
        }

        public int Cantidad_pag { get => cantidad_pag; set => cantidad_pag = value; }
        public int Cantidad_por_hoja { get => cantidad_por_hoja; set => cantidad_por_hoja = value; }
    }
}