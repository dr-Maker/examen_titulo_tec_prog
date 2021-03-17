using System;
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


        public static List<CategoryModel>Categories()
        {
            List<CategoryModel> category = new List<CategoryModel>();


            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_list_category";
            //db.GetQuery(cmd);
            category.Add(new CategoryModel(1,"categoria zapatilla"));
            category.Add(new CategoryModel(2, "categoria poleron"));
            return category;
        }

    }
}