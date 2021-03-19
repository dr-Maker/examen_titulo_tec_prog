﻿using System;
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
            cmd.CommandText = "sp_list_products_aleatory";

            DataTable dt = db.GetQuery(cmd);

            List<ProductModel> lista = new List<ProductModel>();

            ProductModel obj;

            foreach (DataRow row in dt.Rows)
            {
                obj = new ProductModel();
                obj.Id_product = int.Parse(row["id_product"].ToString());
                obj.Category = int.Parse(row["id_category"].ToString());
                obj.Name_product = row["name_product"].ToString();
                obj.Brand = row["brand"].ToString();
                obj.Size = row["size"].ToString();
                obj.Stock = int.Parse(row["stock"].ToString());
                obj.Price = int.Parse(row["price"].ToString());
                obj.Pdto_description = row["pdto_description"].ToString();
                obj.Imagen = row["imagen"].ToString();
                lista.Add(obj);
            }

            return lista;
        }

        public static List<ProductModel> ProductsByCategory(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_list_products_by_category";
            cmd.Parameters.Add("@category", SqlDbType.Int).Value = id;
            DataTable dt = db.GetQuery(cmd);

            List<ProductModel> lista = new List<ProductModel>();

            ProductModel obj;

            foreach (DataRow row in dt.Rows)
            {
                obj = new ProductModel();
                obj.Id_product = int.Parse(row["id_product"].ToString());
                obj.Category = int.Parse(row["id_category"].ToString());
                obj.Name_product = row["name_product"].ToString();
                obj.Brand = row["brand"].ToString();
                obj.Size = row["size"].ToString();
                obj.Stock = int.Parse(row["stock"].ToString());
                obj.Price = int.Parse(row["price"].ToString());
                obj.Pdto_description = row["pdto_description"].ToString();
                obj.Imagen = row["imagen"].ToString();
                lista.Add(obj);
            }

            return lista;
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
                obj.Category = int.Parse(dt.Rows[0]["id_category"].ToString());
                obj.Name_product = dt.Rows[0]["name_product"].ToString();
                obj.Brand = dt.Rows[0]["brand"].ToString();
                obj.Size = dt.Rows[0]["size"].ToString();
                obj.Stock = int.Parse(dt.Rows[0]["stock"].ToString());
                obj.Price = int.Parse(dt.Rows[0]["price"].ToString());
                obj.Pdto_description = dt.Rows[0]["pdto_description"].ToString();
                obj.Imagen = dt.Rows[0]["imagen"].ToString();
            }

            return obj;
        }

        public static bool Insert(ProductModel obj) {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_insert_product";
            cmd.Parameters.Add("@category_id", SqlDbType.Int).Value = obj.Category;
            cmd.Parameters.Add("@name", SqlDbType.VarChar, 255).Value = obj.Name_product;
            cmd.Parameters.Add("@brand", SqlDbType.VarChar, 255).Value = obj.Brand;
            cmd.Parameters.Add("@size", SqlDbType.VarChar, 255).Value = obj.Size;
            cmd.Parameters.Add("@stock", SqlDbType.Int).Value = obj.Stock;
            cmd.Parameters.Add("@price", SqlDbType.Int).Value = obj.Price;
            cmd.Parameters.Add("@imagen", SqlDbType.VarChar, 500).Value = obj.Imagen;
            return db.Onlyquery(cmd);
        }

        public static void UploadFile(String route, HttpPostedFileBase file)
        {
            file.SaveAs(route);
        }
    }
}