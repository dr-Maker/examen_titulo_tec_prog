using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class ShoppingCartBuss
    {
        static Database db = new Database();

        public static bool AddShoppingCart(ShoppingCartModel obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_add_product_to_buy";
            cmd.Parameters.Add("@id_pdto", SqlDbType.Int).Value = obj.Id_product;

            return db.Onlyquery(cmd);
        }

        public static bool DeleteProductShoppingCart(ShoppingCartModel obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_delete_produt_to_buy";
            cmd.Parameters.Add("@id_pdto", SqlDbType.Int).Value = obj.Id_product;

            return db.Onlyquery(cmd);
        }

        public static ShoppingCartModel GetShoppingCart()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_product_to_buy";
            
            DataTable dt = db.GetQuery(cmd);

            ShoppingCartModel obj = new ShoppingCartModel();
            ProductModel producto;
            List<ProductModel> lista = new List<ProductModel>();
            List<ShoppingCartModel> lista_obj = new List<ShoppingCartModel>();
            foreach (DataRow row in dt.Rows)
            {
                
                obj.Id_cart = int.Parse(row["id_cesta"].ToString());
                obj.Cantidad = int.Parse(row["cantidad"].ToString());

                producto = new ProductModel();
                producto.Id_product = int.Parse(row["id_product"].ToString());
                producto.Category = int.Parse(row["id_category"].ToString());
                producto.Name_product = row["name_product"].ToString();
                producto.Brand = row["brand"].ToString();
                producto.Size = row["size"].ToString();
                producto.Stock = int.Parse(row["stock"].ToString());
                producto.Price = int.Parse(row["price"].ToString());
                producto.Cantidad = int.Parse(row["cantidad"].ToString());
                producto.Pdto_description = row["pdto_description"].ToString();
                producto.Imagen = row["imagen"].ToString();
                producto.Id_product = int.Parse(row["id_product"].ToString());
                lista.Add(producto);
                obj.Productos = lista;

            }
            return obj;
        }



    }
}