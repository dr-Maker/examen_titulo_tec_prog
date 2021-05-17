using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class StockBuss
    {
        static Database db = new Database();

        public static List<StockModel> listaStock()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_list_stock";

            DataTable dt = db.GetQuery(cmd);

            List<StockModel> lista = new List<StockModel>();

            StockModel obj;

            foreach (DataRow row in dt.Rows)
            {

                obj = new StockModel();

                obj.Id_stock = int.Parse(row["id_pdto_stock"].ToString());

                obj.Producto = new ProductModel();
                obj.Producto.Id_product = int.Parse(row["id_product"].ToString());
                obj.Producto.Name_product = row["name_product"].ToString();

                obj.Producto.Brand = new BrandModel();
                obj.Producto.Brand.Id_marca = int.Parse(row["id_brand"].ToString());
                obj.Producto.Brand.Brand = row["brand"].ToString();

                obj.Size = new SizeModel();
                obj.Size.Id_size = int.Parse(row["id_size"].ToString());
                obj.Size.Size = row["size"].ToString();

                obj.Price = int.Parse(row["price"].ToString());
                obj.Stock = int.Parse(row["cantidad"].ToString());


                lista.Add(obj);
            }

            return lista;
        }

        public static StockModel getStock(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_get_stock" ;
            cmd.Parameters.Add("@id_stock", SqlDbType.Int).Value = id;

            DataTable dt = db.GetQuery(cmd);

            StockModel obj = new StockModel();


           if (dt != null && dt.Rows.Count > 0)
            {
                
                obj.Id_stock= int.Parse(dt.Rows[0]["id_pdto_stock"].ToString());

                obj.Producto = new ProductModel();
                obj.Producto.Id_product= int.Parse(dt.Rows[0]["id_product"].ToString());

                // Categoria
                obj.Producto.Category = new CategoryModel();
                obj.Producto.Category.Id_category = int.Parse(dt.Rows[0]["id_category"].ToString());

                obj.Producto.Name_product = dt.Rows[0]["name_product"].ToString();
                //brand
                obj.Producto.Brand = new BrandModel();
                obj.Producto.Brand.Id_marca = int.Parse(dt.Rows[0]["id_brand"].ToString());
                obj.Producto.Brand.Brand = dt.Rows[0]["brand"].ToString();


                obj.Producto.Price = int.Parse(dt.Rows[0]["price"].ToString());

                obj.Producto.Pdto_description = dt.Rows[0]["pdto_description"].ToString();

                obj.Producto.Imagen = dt.Rows[0]["imagen"].ToString();

             

                obj.Size = new SizeModel();
                obj.Size.Id_size = int.Parse(dt.Rows[0]["id_size"].ToString());
                obj.Size.Size = dt.Rows[0]["size"].ToString();

            }

            return obj;
        }

        public static List<StockModel> get_list_size(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_get_list_size";
            cmd.Parameters.Add("@id_product", SqlDbType.Int).Value = id;

            DataTable dt = db.GetQuery(cmd);

            List<StockModel> lista = new List<StockModel>();

            StockModel obj;

            foreach (DataRow row in dt.Rows)
            {

                obj = new StockModel();

                obj.Id_stock = int.Parse(row["id_pdto_stock"].ToString());

                obj.Producto = new ProductModel();
                obj.Producto.Id_product = int.Parse(row["id_product"].ToString());
                obj.Producto.Name_product = row["name_product"].ToString();

                obj.Producto.Brand = new BrandModel();
                obj.Producto.Brand.Id_marca = int.Parse(row["id_brand"].ToString());
                obj.Producto.Brand.Brand = row["brand"].ToString();

                obj.Size = new SizeModel();
                obj.Size.Id_size = int.Parse(row["id_size"].ToString());
                obj.Size.Size = row["size"].ToString();

                obj.Price = int.Parse(row["price"].ToString());
                obj.Stock = int.Parse(row["cantidad"].ToString());


                lista.Add(obj);
            }

            return lista;
        }


    }
}