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

        public static CategoryModel getCategory(int id)
        {
            SqlCommand cmd = new SqlCommand();
            //cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM categoria Where id_category = " + id;

            DataTable dt = db.GetQuery(cmd);

            CategoryModel obj = new CategoryModel();

            foreach (DataRow row in dt.Rows)
            {

                if(dt != null && dt.Rows.Count>0)
                obj.Id_category = int.Parse(dt.Rows[0]["id_category"].ToString());
                obj.Category = dt.Rows[0]["name_category"].ToString();
                
            }

            return obj;
        }

        public static bool EditCategory(CategoryModel obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_edit_category";
            cmd.Parameters.Add("@id_category", SqlDbType.Int).Value = obj.Id_category;
            cmd.Parameters.Add("@category", SqlDbType.VarChar, 255).Value = obj.Category;

            return db.Onlyquery(cmd);

        }

        public static bool DeletedCategory(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_deleted_category";
            cmd.Parameters.Add("@id_category", SqlDbType.Int).Value = id;
  

            return db.Onlyquery(cmd);

        }

    }
}