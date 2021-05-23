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
            cmd.Parameters.Add("@id_pdto", SqlDbType.Int).Value = obj.Id_cart;
            cmd.Parameters.Add("@token", SqlDbType.VarChar, 255).Value = obj.Token;

            return db.Onlyquery(cmd);
        }

        public static bool DeleteProductShoppingCart(ShoppingCartModel obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_delete_produt_to_buy";
            cmd.Parameters.Add("@id_pdto", SqlDbType.Int).Value = obj.Id_cart;

            return db.Onlyquery(cmd);
        }

        public static ShoppingCartModel GetShoppingCart(string token)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_product_to_buy";
            cmd.Parameters.Add("@token", SqlDbType.VarChar,255).Value = token;

            DataTable dt = db.GetQuery(cmd);

            ShoppingCartModel obj = new ShoppingCartModel();
            ProductModel item;
            List<ShoppingCartModel> lista_obj = new List<ShoppingCartModel>();

            foreach (DataRow row in dt.Rows)
            {
                obj.Id_cart = int.Parse(row["id_cesta"].ToString());
                obj.Token = row["token"].ToString();
                obj.Subtotal = int.Parse(row["Sub_total"].ToString());
                obj.Total = int.Parse(row["Total"].ToString());
                List<ProductModel> lista = new List<ProductModel>(); 

                for(int i = 0;   dt.Rows.Count -1>= i ; i++)
                {
                    item = new ProductModel();
                    item.Id_product = int.Parse(dt.Rows[i]["id_producto"].ToString());    
                    item.Category = new CategoryModel();
                    item.Category.Id_category = int.Parse(dt.Rows[i]["id_category"].ToString());
                    item.Name_product = dt.Rows[i]["name_product"].ToString();
                    item.Brand = new BrandModel();
                    item.Brand.Id_marca = int.Parse(dt.Rows[i]["id_brand"].ToString());
                    item.Price = int.Parse(dt.Rows[i]["price"].ToString());
                    item.Pdto_description = dt.Rows[i]["pdto_description"].ToString();
                    item.Price = int.Parse(dt.Rows[i]["precio_lleva"].ToString());
                    item.Cantidad = int.Parse(dt.Rows[i]["cantidad_lleva"].ToString());
                    item.Talla = dt.Rows[i]["size"].ToString();
                    item.Imagen = dt.Rows[i]["imagen"].ToString();
              
                    lista.Add(item);
                }

                obj.Productos = lista;

                lista_obj.Add(obj);

            }

            return obj;
        }




    }
}