using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class ProductBuss
    {
        static Database db = new Database();

        public static List<ProductModel> Products()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_List_product";

            DataTable dt = db.GetQuery(cmd);

            List<ProductModel> lista = new List<ProductModel>();

            ProductModel obj;

            foreach (DataRow row in dt.Rows)
            {
                
                obj = new ProductModel();
                obj.Id_product = int.Parse(row["id_product"].ToString());
                obj.Category = new CategoryModel();
                obj.Category.Id_category = int.Parse(row["id_category"].ToString());
                obj.Category.Category = row["name_category"].ToString();
                obj.Name_product = row["name_product"].ToString();
                obj.Brand = new BrandModel();
                obj.Brand.Id_marca = int.Parse(row["id_brand"].ToString());
                obj.Brand.Brand = row["brand"].ToString();
                obj.Pdto_description = row["pdto_description"].ToString();
                obj.Imagen = row["imagen"].ToString();
                lista.Add(obj);
                
            }

            return lista;
        }

        public static List<ProductModel> ProductsOutStock()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_list_products_out_stock";

            DataTable dt = db.GetQuery(cmd);

            List<ProductModel> lista = new List<ProductModel>();

            ProductModel obj;

            foreach (DataRow row in dt.Rows)
            {

                obj = new ProductModel();
                obj.Id_product = int.Parse(row["id_product"].ToString());
                obj.Category = new CategoryModel();
                obj.Category.Id_category = int.Parse(row["id_category"].ToString());
                obj.Name_product = row["name_product"].ToString();
                obj.Brand = new BrandModel();
                obj.Brand.Id_marca = int.Parse(row["id_brand"].ToString());
                obj.Pdto_description = row["pdto_description"].ToString();
                obj.Imagen = row["imagen"].ToString();
                lista.Add(obj);

            }

            return lista;
        }

        public static List<ProductModel> ProductsByAleatory(int page)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_list_products_aleatory";
            cmd.Parameters.Add("@page", SqlDbType.Int).Value = page;

            DataTable dt = db.GetQuery(cmd);

            List<ProductModel> lista = new List<ProductModel>();

            ProductModel obj;

            foreach (DataRow row in dt.Rows)
            {

                obj = new ProductModel();
                obj.Id_product = int.Parse(row["id_product"].ToString());
                obj.Category = new CategoryModel();
                obj.Category.Id_category = int.Parse(row["id_category"].ToString());
                obj.Category.Category = row["name_category"].ToString();
                obj.Name_product = row["name_product"].ToString();
                obj.Brand = new BrandModel();
                obj.Brand.Id_marca = int.Parse(row["id_brand"].ToString());
                obj.Brand.Brand = row["brand"].ToString();
                obj.Pdto_description = row["pdto_description"].ToString();
                obj.Imagen = row["imagen"].ToString();
                obj.Price = int.Parse(row["price"].ToString());
                lista.Add(obj);

            }

            return lista;
        }

        public static List<ProductModel> ProductsByCategory(int id, int page)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_list_products_by_category";
            cmd.Parameters.Add("@category", SqlDbType.Int).Value = id;
            cmd.Parameters.Add("@page", SqlDbType.Int).Value = page;
            DataTable dt = db.GetQuery(cmd);

            List<ProductModel> lista = new List<ProductModel>();

            ProductModel obj;

            foreach (DataRow row in dt.Rows)
            {

                obj = new ProductModel();
                obj.Id_product = int.Parse(row["id_product"].ToString());
                obj.Category = new CategoryModel();
                obj.Category.Id_category = int.Parse(row["id_category"].ToString());
                obj.Category.Category = row["name_category"].ToString();
                obj.Name_product = row["name_product"].ToString();
                obj.Brand = new BrandModel();
                obj.Brand.Id_marca = int.Parse(row["id_brand"].ToString());
                obj.Brand.Brand = row["brand"].ToString();
                obj.Pdto_description = row["pdto_description"].ToString();
                obj.Imagen = row["imagen"].ToString();
                obj.Price = int.Parse(row["price"].ToString());
                lista.Add(obj);
                
            }

            return lista;
        }

        public static ProductModel GetProductOffPrice(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_get_product";
            cmd.Parameters.Add("@id_product", SqlDbType.Int).Value = id;
            DataTable dt = db.GetQuery(cmd);
            ProductModel obj = new ProductModel();
            if (dt != null && dt.Rows.Count > 0)
            {

                obj.Id_product = int.Parse(dt.Rows[0]["id_product"].ToString());
                obj.Category = new CategoryModel();
                obj.Category.Id_category = int.Parse(dt.Rows[0]["id_category"].ToString());
                obj.Category.Category = dt.Rows[0]["name_category"].ToString();
                obj.Name_product = dt.Rows[0]["name_product"].ToString();
                obj.Brand = new BrandModel();
                obj.Brand.Id_marca = int.Parse(dt.Rows[0]["id_brand"].ToString());
                obj.Brand.Brand = dt.Rows[0]["brand"].ToString();
                obj.Pdto_description = dt.Rows[0]["pdto_description"].ToString();
                obj.Cantidad = int.Parse(dt.Rows[0]["cantidad"].ToString());
                obj.Imagen = dt.Rows[0]["imagen"].ToString();
            }
            return obj;
        }

        public static ProductModel GetProduct(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_get_product";
            cmd.Parameters.Add("@id_product", SqlDbType.Int).Value = id;
            DataTable dt = db.GetQuery(cmd);
            ProductModel obj = new ProductModel();
            if (dt != null && dt.Rows.Count > 0)
            {

                obj.Id_product = int.Parse(dt.Rows[0]["id_product"].ToString());
                obj.Category = new CategoryModel();
                obj.Category.Id_category = int.Parse(dt.Rows[0]["id_category"].ToString());
                obj.Category.Category = dt.Rows[0]["name_category"].ToString();
                obj.Name_product = dt.Rows[0]["name_product"].ToString();
                obj.Brand = new BrandModel();
                obj.Brand.Id_marca = int.Parse(dt.Rows[0]["id_brand"].ToString());
                obj.Brand.Brand = dt.Rows[0]["brand"].ToString();
                obj.Pdto_description = dt.Rows[0]["pdto_description"].ToString();
                obj.Cantidad = int.Parse(dt.Rows[0]["cantidad"].ToString());
                obj.Price = int.Parse(dt.Rows[0]["price"].ToString());
                obj.Imagen = dt.Rows[0]["imagen"].ToString();
            }
            return obj;
        }

        public static bool Insert(ProductModel obj) {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_insert_product";
            cmd.Parameters.Add("@category_id", SqlDbType.Int).Value = obj.Category.Id_category;
            cmd.Parameters.Add("@name", SqlDbType.VarChar, 255).Value = obj.Name_product;
            cmd.Parameters.Add("@brand_id", SqlDbType.Int).Value = obj.Brand.Id_marca;
            cmd.Parameters.Add("@descrption", SqlDbType.VarChar, 255).Value = obj.Pdto_description;
            cmd.Parameters.Add("@imagen", SqlDbType.VarChar, 500).Value =obj.Imagen;
            return db.Onlyquery(cmd);
        }

        public static void UploadFile(String route, HttpPostedFileBase file)
        {
            file.SaveAs(route);
        }

        public static bool Update(ProductModel obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_update_product";
            cmd.Parameters.Add("@id_product", SqlDbType.Int).Value = obj.Id_product;
            cmd.Parameters.Add("@id_Category", SqlDbType.Int).Value = obj.Category.Id_category;
            cmd.Parameters.Add("@name_product", SqlDbType.VarChar, 255).Value = obj.Name_product;
            cmd.Parameters.Add("@id_Brand", SqlDbType.Int).Value = obj.Brand.Id_marca;
            cmd.Parameters.Add("@pdto_description", SqlDbType.VarChar, 255).Value = obj.Pdto_description;
            cmd.Parameters.Add("@imagen", SqlDbType.VarChar, 500).Value = obj.Imagen;
            return db.Onlyquery(cmd);
        }

        public static bool Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_delete_product";
            cmd.Parameters.Add("@id_product", SqlDbType.Int).Value = id;
           
            return db.Onlyquery(cmd);
        }

        public static List<ProductModel> GetProductWhitStocks(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_get_product_whit_stocks";
            cmd.Parameters.Add("@id_producto", SqlDbType.Int).Value = id;
            DataTable dt = db.GetQuery(cmd);
            List<ProductModel> lista = new List<ProductModel>();
            ProductModel obj;

            foreach (DataRow row in dt.Rows)
            {
                obj = new ProductModel();
                obj.Id_product = int.Parse(row["id_product"].ToString());
                obj.Category = new CategoryModel();
                obj.Category.Id_category = int.Parse(row["id_category"].ToString());
                obj.Category.Category = row["name_category"].ToString();
                obj.Name_product = row["name_product"].ToString();
                obj.Brand = new BrandModel();
                obj.Brand.Id_marca = int.Parse(row["id_brand"].ToString());
                obj.Brand.Brand = row["brand"].ToString();
                obj.Talla = new SizeModel();
                obj.Talla.Id_size = int.Parse(row["id_size"].ToString());
                obj.Talla.Size = row["size"].ToString();

                lista.Add(obj);

            }

            return lista;
        }

        public static bool DeleteAllProductCart(string token)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_delete_all_product_cart";
            cmd.Parameters.Add("@token", SqlDbType.VarChar, 255).Value = token;
            return db.Onlyquery(cmd);
        }

        public static bool DeleteOneKindProductCart(string token, int id_product)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_delete_one_kind_product_cart";
            cmd.Parameters.Add("@token", SqlDbType.VarChar, 255).Value = token;
            cmd.Parameters.Add("@id_product", SqlDbType.Int).Value = id_product;
            return db.Onlyquery(cmd);
        }

        public static bool DeleteOneProdutCart(ShoppingCartModel obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_del_product_to_buy";
            cmd.Parameters.Add("@id_pdto", SqlDbType.Int).Value = obj.Id_cart;
            cmd.Parameters.Add("@token", SqlDbType.VarChar, 255).Value = obj.Token;
            return db.Onlyquery(cmd);
        }
    }
}