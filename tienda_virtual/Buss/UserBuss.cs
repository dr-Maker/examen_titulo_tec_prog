using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace tienda_virtual
{
    public class UserBuss
    {

        static Database db = new Database();
       

        public static bool UserRegister(UserModel obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_insert_user";
            cmd.Parameters.Add("@first_name" ,SqlDbType.VarChar, 255).Value = obj.Firstname;
            cmd.Parameters.Add("@second_name", SqlDbType.VarChar, 255).Value = obj.Secondname ;
            cmd.Parameters.Add("@father_lastname", SqlDbType.VarChar, 255).Value = obj.Fatherlastname;
            cmd.Parameters.Add("@mother_lastname", SqlDbType.VarChar, 255).Value = obj.Motherlastname;
            cmd.Parameters.Add("@pass", SqlDbType.VarChar, 255).Value = obj.Password;
            cmd.Parameters.Add("@user", SqlDbType.VarChar, 255).Value = obj.Username;
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 255).Value = obj.Email;
            cmd.Parameters.Add("@birthdate", SqlDbType.DateTime).Value = obj.Birthday;
            cmd.Parameters.Add("@sex", SqlDbType.Int).Value = obj.Sex;
            cmd.Parameters.Add("@comuna", SqlDbType.Int).Value = obj.Comuna;
            cmd.Parameters.Add("@direccion", SqlDbType.VarChar, 255).Value = obj.Addres;

            return db.Onlyquery(cmd);
        }


        public static DataTable Login(UserModel obj)
        {
            
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_validate_user";
            cmd.Parameters.Add("@username", SqlDbType.VarChar, 255).Value = obj.Username;
            cmd.Parameters.Add("@pass", SqlDbType.VarChar, 255).Value = obj.Password;
            return db.GetQuery(cmd);
            
        }
    }
}
