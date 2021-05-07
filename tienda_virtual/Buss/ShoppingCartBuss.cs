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

        public static ShoppingCartModel GetShoppingCart()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_product_to_buy";
            cmd.Parameters.Add("@token", SqlDbType.VarChar,255).Value = "user001";

            DataTable dt = db.GetQuery(cmd);

            ShoppingCartModel obj = new ShoppingCartModel();
            List<ProductModel> lista = new List<ProductModel>();
            //ProductModel item = new ProductModel();
            List<ShoppingCartModel> lista_obj = new List<ShoppingCartModel>();

            foreach (DataRow row in dt.Rows)
            {


                obj.Id_cart = int.Parse(row["id_cesta"].ToString());
                obj.Token = row["token"].ToString();
                obj.Cantidad = int.Parse(row["cantidad"].ToString());
                obj.Subtotal = int.Parse(row["Sub_total"].ToString());

                obj.Productos = lista;


                foreach (var item in lista)
                {
                    
                    item.Id_product = int.Parse(row["producto_id"].ToString());    
                    item.Category = new CategoryModel();
                    item.Category.Id_category = int.Parse(row["id_category"].ToString());
                    item.Pdto_description = row["name_product"].ToString();
                    item.Brand = new BrandModel();
                    item.Brand.Id_marca = int.Parse(row["id_brand"].ToString());
                    item.Price = int.Parse(row["price"].ToString());
                    item.Pdto_description = row["pdto_description"].ToString();
                    item.Imagen = row["imagen"].ToString();

                    lista.Add(item);
                }

                lista_obj.Add(obj);

            }
            return obj;
        }



    }
}