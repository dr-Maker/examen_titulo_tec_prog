﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class CategoryBuss
    {
        static Database db = new Database();

        public static bool CategoryRegister(CategoryModel obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_insert_category";
            cmd.Parameters.Add("@category", SqlDbType.VarChar, 255).Value = obj.Category;
            
            return db.Onlyquery(cmd);
        }


        public static List<CategoryModel> Categories()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_list_category";

            DataTable dt = db.GetQuery(cmd);
            List<CategoryModel> lista = new List<CategoryModel>();

            CategoryModel obj; 

            foreach (DataRow row in dt.Rows)
            {
                obj = new CategoryModel();
                obj.Id_category = int.Parse(row["id_category"].ToString());
                obj.Category = row["name_category"].ToString();
                lista.Add(obj);
            }

            return lista;
        }

    }
}