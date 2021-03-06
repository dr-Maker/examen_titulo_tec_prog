using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class OrderBuss
    {
        static Database db = new Database();

        public static ShoppingCartModel GetOrder(string token)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_get_order";
            cmd.Parameters.Add("@token", SqlDbType.VarChar, 255).Value = token;

            DataTable dt = db.GetQuery(cmd);

            ShoppingCartModel obj = new ShoppingCartModel();
            ProductModel item;
            List<ShoppingCartModel> lista_obj = new List<ShoppingCartModel>();

            foreach (DataRow row in dt.Rows)
            {

                obj.Id_cart = int.Parse(row["id_cesta"].ToString());
                obj.Usuario = new UserModel();
                obj.Usuario.Iduser = int.Parse(row["id_persona"].ToString());
                obj.Usuario.Firstname = row["Nombre"].ToString();
                obj.Usuario.Fatherlastname = row["Apellido"].ToString();
                obj.Usuario.Email = row["email"].ToString();
                obj.Usuario.Telefono = row["telefono"].ToString();
                obj.Total = int.Parse(row["Total"].ToString());

                obj.Usuario.Region = new RegionModel();
                obj.Usuario.Region.Nombre_region = row["nombre_region"].ToString();

                obj.Usuario.Comuna = new ComunaModel();
                obj.Usuario.Comuna.Id_comuna = int.Parse(row["id_comuna"].ToString());
                obj.Usuario.Comuna.Nombre_comuna = row["nombre_comuna"].ToString();

                obj.Usuario.Addres = row["direccion_envío"].ToString();


                List<ProductModel> lista = new List<ProductModel>();

                for (int i = 0; dt.Rows.Count - 1 >= i; i++)
                {
                    item = new ProductModel();
                    item.Id_product = int.Parse(dt.Rows[i]["id_producto"].ToString());
                    item.Category = new CategoryModel();
                    item.Category.Category = dt.Rows[i]["categoria"].ToString();
                    item.Name_product = dt.Rows[i]["nombre_producto"].ToString();
                    item.Brand = new BrandModel();
                    item.Brand.Brand = dt.Rows[i]["marca"].ToString();
                    item.Price = int.Parse(dt.Rows[i]["precio"].ToString());
                    item.Pdto_description = dt.Rows[i]["descripcion"].ToString();
                    item.Imagen = dt.Rows[i]["imagen"].ToString();
                    item.Cantidad = int.Parse(dt.Rows[i]["cantidad"].ToString());
                    item.Talla = new SizeModel();
                    item.Talla.Size = dt.Rows[i]["talla"].ToString();
                    item.SubTotal = int.Parse(dt.Rows[i]["subTotal"].ToString());


                    lista.Add(item);
                }

                obj.Productos = lista;

                lista_obj.Add(obj);

            }

            return obj;
        }

        public static List<ShoppingCartModel> GetOrders(string username)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_list_order";
            cmd.Parameters.Add("@user", SqlDbType.VarChar, 255).Value = username;

            DataTable dt = db.GetQuery(cmd);

            ShoppingCartModel obj = new ShoppingCartModel();
            ProductModel item;
            List<ShoppingCartModel> lista_obj = new List<ShoppingCartModel>();
            List<ProductModel> lista; 

            foreach (DataRow row in dt.Rows)
            {

                obj = new ShoppingCartModel();
                obj.Usuario = new UserModel();
              
                obj.Id_cart = int.Parse(row["id_cesta"].ToString());
                obj.Usuario.Username = row["username"].ToString();
                obj.Cest_count = int.Parse(row["cesta_count"].ToString());

                obj.Usuario.Comuna = new ComunaModel();
                obj.Usuario.Comuna.Nombre_comuna = row["nombre_comuna"].ToString();
                obj.Usuario.Addres = row["direccion"].ToString();
                obj.FechaPedido = DateTime.Parse(row["fecha_pedido"].ToString());

                //obj.Subtotal = int.Parse(row["subTotal"].ToString());
                //obj.Usuario.Firstname = row["Nombre"].ToString();
                //obj.Usuario.Fatherlastname = row["Apellido"].ToString();
                //obj.Usuario.Email = row["email"].ToString();


                //obj.FechaPedido = DateTime.Parse(row["fecha_pedido"].ToString());
                obj.EstadoPago = row["estado_pago"].ToString();
                obj.EstadoPedido = new EstadoOrdenModel();
                obj.EstadoPedido.Estado_orden = row["estado_pedido"].ToString();
                
                lista = new List<ProductModel>();                

                    item = new ProductModel();
                    item.Id_product = int.Parse(row["id_producto"].ToString());
                
                    item.Category = new CategoryModel();
                    //item.Category.Category = row["categoria"].ToString();
                    item.Name_product = row["nombre_producto"].ToString();
                    item.Brand = new BrandModel();
                    item.Brand.Brand = row["marca"].ToString();
                    item.Price = int.Parse(row["precio"].ToString());
                    item.Pdto_description = row["descripcion"].ToString();
                    item.Cantidad = int.Parse(row["cantidad"].ToString());
                    item.Imagen = row["imagen"].ToString();
                    item.Talla = new SizeModel();
                    item.Talla.Size= row["talla"].ToString();
                    item.SubTotal= int.Parse(row["subTotal"].ToString());
                    obj.Total = int.Parse(row["Total"].ToString());
                
                lista.Add(item);
                    
                obj.Productos = lista;
                lista_obj.Add(obj);
            }

            return lista_obj;
        }

        public static bool UpdateOrder(UserModel obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_update_user_order";
            cmd.Parameters.Add("@id_usuario", SqlDbType.Int).Value = obj.Iduser;
            cmd.Parameters.Add("@token", SqlDbType.VarChar, 255).Value = obj.Token;

            return db.Onlyquery(cmd);
        }

        public static bool MakeOrder(UserModel obj)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_make_order";
            cmd.Parameters.Add("@id_usuario", SqlDbType.Int).Value = obj.Iduser;
            cmd.Parameters.Add("@token", SqlDbType.VarChar, 255).Value = obj.Token;

            return db.Onlyquery(cmd);
        }

        public static List<ShoppingCartModel> GetOrdersPending()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_list_orders_pending";

            DataTable dt = db.GetQuery(cmd);

            ShoppingCartModel obj = new ShoppingCartModel();
            ProductModel item;
            List<ShoppingCartModel> lista_obj = new List<ShoppingCartModel>();
            List<ProductModel> lista;

            foreach (DataRow row in dt.Rows)
            {

                obj = new ShoppingCartModel();
                obj.Usuario = new UserModel();

                obj.Id_cart = int.Parse(row["id_cesta"].ToString());
                obj.Usuario.Username = row["username"].ToString();
                obj.Cest_count = int.Parse(row["cesta_count"].ToString());

                obj.Usuario.Comuna = new ComunaModel();
                obj.Usuario.Comuna.Nombre_comuna = row["nombre_comuna"].ToString();
                obj.Usuario.Addres = row["direccion"].ToString();
                obj.FechaPedido = DateTime.Parse(row["fecha_pedido"].ToString());

                //obj.Subtotal = int.Parse(row["subTotal"].ToString());
                //obj.Usuario.Firstname = row["Nombre"].ToString();
                //obj.Usuario.Fatherlastname = row["Apellido"].ToString();
                //obj.Usuario.Email = row["email"].ToString();


                //obj.FechaPedido = DateTime.Parse(row["fecha_pedido"].ToString());
                obj.EstadoPago = row["estado_pago"].ToString();
                obj.EstadoPedido = new EstadoOrdenModel();
                obj.EstadoPedido.Id_estado = int.Parse(row["id_envio"].ToString());
                obj.EstadoPedido.Estado_orden = row["estado_pedido"].ToString();

                lista = new List<ProductModel>();

                item = new ProductModel();
                item.Id_product = int.Parse(row["id_producto"].ToString());

                item.Category = new CategoryModel();
                //item.Category.Category = row["categoria"].ToString();
                item.Name_product = row["nombre_producto"].ToString();
                item.Brand = new BrandModel();
                item.Brand.Brand = row["marca"].ToString();
                item.Price = int.Parse(row["precio"].ToString());
                item.Pdto_description = row["descripcion"].ToString();
                item.Cantidad = int.Parse(row["cantidad"].ToString());
                item.Imagen = row["imagen"].ToString();
                item.Talla = new SizeModel();
                item.Talla.Size = row["talla"].ToString();
                item.SubTotal = int.Parse(row["subTotal"].ToString());
                obj.Total = int.Parse(row["Total"].ToString());

                lista.Add(item);

                obj.Productos = lista;
                lista_obj.Add(obj);
            }

            return lista_obj;
        }

        public static bool PayMethod(int idcesta, int typepay, int pay)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_payment_method";
            cmd.Parameters.Add("@cesta", SqlDbType.Int).Value = idcesta;
            cmd.Parameters.Add("@id_tipo_medio_pago", SqlDbType.Int).Value = typepay;
            cmd.Parameters.Add("@id_estado_pago", SqlDbType.Int).Value = pay;

            return db.Onlyquery(cmd);
        }
    }
}