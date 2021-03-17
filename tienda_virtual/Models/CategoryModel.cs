using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class CategoryModel
    {

        private int id_category;
        private string category;

        public CategoryModel()
        {
        }

        public CategoryModel(int Id_category, string Categoria)
        {
            this.id_category = Id_category;
            this.category = Categoria;
        }

        public int Id_category { get => id_category; set => id_category = value; }
        public string Category { get => category; set => category = value; }
    }
}