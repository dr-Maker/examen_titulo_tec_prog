using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class Database
    {

        string conx = ConfigurationManager.AppSettings["conx_up"];

        public DataTable GetQuery(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            try
            {
                cmd.Connection = new SqlConnection(conx);
                sda.Fill(dt);
            }
            catch (SqlException exe)
            {
                dt = null;
            }

            return dt;
        }

        public bool Onlyquery(SqlCommand cmd)
        {
            bool std = true;

            try
            {
                cmd.Connection = new SqlConnection(conx);
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
            }
            catch (SqlException exe)
            {
                std = false;
            }

            return std;
        }
    }
}