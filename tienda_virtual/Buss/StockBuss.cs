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

                obj.Id_stock = int.Parse(row["id_stock_price"].ToString());

                obj.Producto = new ProductModel();
                obj.Producto.Id_product = int.Parse(row["id_product"].ToString());
                obj.Producto.Name_product = row["name_product"].ToString();

                obj.Producto.Brand = new BrandModel();
                obj.Producto.Brand.Id_marca = int.Parse(row["id_brand"].ToString());
                obj.Producto.Brand.Brand = row["brand"].ToString();

                obj.Size = new SizeModel();
                obj.Size.Id_size = int.Parse(row["id_size"].ToString());
                obj.Size.Size = row["size"].ToString();


                obj.Stock = int.Parse(row["stock"].ToString());
                lista.Add(obj);
            }

            return lista;
        }


    }
}