using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class SizeModel
    {
        private int id_size;
        private string size;

        public SizeModel()
        {
        }

        public int Id_size { get => id_size; set => id_size = value; }
        public string Size { get => size; set => size = value; }
    }
}