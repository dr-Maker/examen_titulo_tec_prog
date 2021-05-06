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

        public static List<CategoryModel> categoria()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from categoria ";

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

        public static List<BrandModel> marcas()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * from marca";

            DataTable dt = db.GetQuery(cmd);
            List<BrandModel> lista = new List<BrandModel>();
            BrandModel obj;
            foreach (DataRow row in dt.Rows)
            {
                obj = new BrandModel();
                obj.Id_marca = int.Parse(row["id_marca"].ToString());
                obj.Brand = row["brand"].ToString();
                lista.Add(obj);
            }
            return lista;
        }

        public static List<SizeModel> talla()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * from sizesProduct";

            DataTable dt = db.GetQuery(cmd);
            List<SizeModel> lista = new List<SizeModel>();
            SizeModel obj;
            foreach (DataRow row in dt.Rows)
            {
                obj = new SizeModel();
                obj.Id_size = int.Parse(row["id_size"].ToString());
                obj.Size = row["size"].ToString();
                lista.Add(obj);
            }
            return lista;
        }
    }
}