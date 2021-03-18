using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class HelperModel
    {

        private List<CategoryModel> category;
        private List<ProductModel> products;

        public List<CategoryModel> Category { get => category; set => category = value; }
        public List<ProductModel> Products { get => products; set => products = value; }
    }
}