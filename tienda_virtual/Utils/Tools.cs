using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public static class Tools
    {

        static Database db = new Database();

        public static List<RegionModel> Region()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from region Where id_region = 7";
            /*
            cmd.Parameters.Add("@in_region", SqlDbType.Int).Value=0;
            cmd.Parameters.Add("@in_provincia", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@in_comuna", SqlDbType.Int).Value = 0;
            */
            DataTable dt = db.GetQuery(cmd);
            List<RegionModel> lista = new List<RegionModel>();
            RegionModel obj;
            foreach (DataRow row in dt.Rows)
            {
                obj = new RegionModel();
                obj.Id_region = int.Parse(row["id_region"].ToString());
                obj.Nombre_region = row["nombre_region"].ToString();
                lista.Add(obj);
            }
            return lista;
        }

        public static List<ProvinciaModel> provincia()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from provincia Where id_region = 7 ";
            /*
            cmd.Parameters.Add("@in_region", SqlDbType.Int).Value=0;
            cmd.Parameters.Add("@in_provincia", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@in_comuna", SqlDbType.Int).Value = 0;
            */
            DataTable dt = db.GetQuery(cmd);
            List<ProvinciaModel> lista = new List<ProvinciaModel>();
            ProvinciaModel obj;
            foreach (DataRow row in dt.Rows)
            {
                obj = new ProvinciaModel();
                obj.Id_provincia = int.Parse(row["id_provincia"].ToString());
                obj.Nombre_provincia = row["nombre_provincia"].ToString();
                lista.Add(obj);
            }
            return lista;
        }



        public static List<ComunaModel> Comuna()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from comuna where id_provincia = 23";
            /*
            cmd.Parameters.Add("@in_region", SqlDbType.Int).Value=0;
            cmd.Parameters.Add("@in_provincia", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@in_comuna", SqlDbType.Int).Value = 0;
            */
            DataTable dt = db.GetQuery(cmd);
            List<ComunaModel> lista = new List<ComunaModel>();
            ComunaModel obj;
            foreach (DataRow row in dt.Rows)
            {
                obj = new ComunaModel();
                obj.Id_comuna = int.Parse(row["id_comuna"].ToString());
                obj.Nombre_comuna = row["nombre_comuna"].ToString();
                lista.Add(obj);
            }
            return lista;
        }
    }
}