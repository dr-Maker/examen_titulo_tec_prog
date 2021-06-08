using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

using System.Web.Mvc;

namespace tienda_virtual
{
    public class ProductController : Controller
    {
        // GET: Producto
        public ActionResult Index(int id)
        {

            ViewBag.actual = id;
            PaginacionModel paginador = Tools.paginacionInicio();
            ViewBag.countProduct = paginador;

            if (Session["token"] != "")
            {
                Session["token"] = Session["token"].ToString();
            }
            else
            {
                System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
                string date = DateTime.Now.ToString("yyyy-MM-ddhh:mm:ss");
                byte[] data = System.Text.Encoding.ASCII.GetBytes(date);
                data = md5.ComputeHash(data);
                Session["token"] = date + System.Text.Encoding.ASCII.GetString(data);
            }

            id = id - 1;
            if (id>0)
            {
                id = id * paginador.Cantidad_por_hoja;
            }
 

            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<ProductModel> productos = ProductBuss.ProductsByAleatory(id);
            return View(productos);
        }
                
        public ActionResult Products()
        {
            if (Session["role"].ToString() != "admin")
            {
                return RedirectToAction("Index", "Product", new { id = 1 });
            }
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<ProductModel> productos = ProductBuss.Products();
            ViewBag.ProductList = productos;

            ViewBag.TipoMensaje = Session["tipoMensaje"];
            ViewBag.mensaje = Session["mensage"];

            return View();
        }

        public ActionResult ProductsByCategory(int id, int pag)
        {

            ViewBag.actual = pag;
            PaginacionModel paginador = Tools.paginacionAleatory(id);
            ViewBag.countProduct = paginador;


            pag = pag - 1;
            if (pag > 0)
            {
                pag = pag * paginador.Cantidad_por_hoja;
            }

            List<CategoryModel> list = CategoryBuss.Categories();
            CategoryModel categoriaGet = CategoryBuss.getCategory(id);
            List<ProductModel> productos = ProductBuss.ProductsByCategory(id, pag);
            if(list.Count==0 || productos.Count == 0)
            {

                return RedirectToAction("Index", "Product", new { id=1});
            }

            ViewBag.CategoryList = list;
            ViewBag.category = id;
            ViewBag.Categoria = categoriaGet;
            
            return View(productos);
        }  

        public ActionResult Product(int id) {


            List<CategoryModel> list = CategoryBuss.Categories();
            ProductModel producto = ProductBuss.GetProduct(id);
            List<StockModel> ListStock = StockBuss.get_list_size(id);
            ViewBag.CategoryList = list;           
            ViewBag.ListStock = ListStock;
            if (producto == null || ListStock.Count == 0)
            {

                return RedirectToAction("Index", "Product", new { id = 1 });
            }

            return View(producto);
        }

        public ActionResult FormProducts(int id, string accion)
        {
            if (Session["role"].ToString() != "admin")
            {
                return RedirectToAction("Index", "Product", new { id = 1 });
            }
            ViewBag.action = accion;
            ViewBag.idProduct = id;

            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            ProductModel producto = ProductBuss.GetProductOffPrice(id);
            ViewBag.Producto = producto;

            List<BrandModel> listMarcas = Tools.marcas();
            ViewBag.MarcasList = listMarcas;

            return View();
        }

        public ActionResult Insert()
        {
            if (Session["role"].ToString() != "admin")
            {
                return RedirectToAction("Index", "Product", new { id = 1 });
            }
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<BrandModel> Brandlist = Tools.marcas();
            ViewBag.BrandList = Brandlist;
            return View();
        }

        [HttpPost]
        public ActionResult Insert(FormCollection frm, HttpPostedFileBase file)
        {
            ProductModel obj = new ProductModel();
            obj.Category = new CategoryModel();
            obj.Category.Id_category = int.Parse(frm["category_id"].ToString());
            obj.Name_product = frm["product"].ToString();
            obj.Brand = new BrandModel();
            obj.Brand.Id_marca = int.Parse(frm["brand"].ToString());
            obj.Pdto_description = frm["desciption"].ToString();

            string msgImg = "";
            if (file != null)
            {
               
                var extencion = Path.GetExtension(file.FileName);

                if (extencion.ToLower() == ".jpeg" || extencion.ToLower() == ".jpg" || extencion.ToLower() == ".png")
                {
                    string name_file = (DateTime.Now.ToString("yyyyMMddHHmmss") + "-" + file.FileName).ToLower();
                    String route = Server.MapPath("~/Assets/uploads/");
                    route += name_file;
                    ProductBuss.UploadFile(route, file);
                    obj.Imagen = name_file;
                    msgImg = "Imagen Agregada";
                }
                else
                {
                    msgImg = "Imagen Formato no Corresponde";
                }
                           
            }
            else
            {
                obj.Imagen = "not_photo.jpg";
                msgImg = "Sin Imagen";
            }

            string msg = string.Empty;
            string tipoResponse = string.Empty;
            if (ProductBuss.Insert(obj))
            {
                msg = "Producto creado Exitosamente " + msgImg;
                tipoResponse = "success";
            }
            else
            {
                msg = "Error Intente nuevamente";
                tipoResponse = "error";
            }

            Session["mensage"] = msg;
            Session["tipoMensaje"] = tipoResponse;

            return RedirectToAction("Products", "Product");
        }

        public ActionResult Stock()
        {
            if (Session["role"].ToString() != "admin")
            {
                return RedirectToAction("Index", "Product", new { id = 1 });
            }

            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;
            List<StockModel> Stocklist = StockBuss.listaStock();
            ViewBag.StockList = Stocklist;

            ViewBag.TipoMensaje = Session["tipoMensaje"];
            ViewBag.mensaje = Session["mensage"];

            return View();
        }

        public ActionResult AddStock()
        {
            if (Session["role"].ToString() != "admin")
            {
                return RedirectToAction("Index", "Product", new { id = 1 });
            }
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            List<TipoTallaModel> listTipoTalla = Tools.TipoTalla();
            ViewBag.TipoTallaList = listTipoTalla;

            List<SizeModel> listTalla = Tools.talla(1);
            ViewBag.TallaList = listTalla;

            List<ProductModel> ProductList = ProductBuss.ProductsOutStock();
            ViewBag.ProductList = ProductList;

            return View();
        }

        [HttpPost]
        public ActionResult AddStock(FormCollection frm)
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;


            string msg = string.Empty;
            string tipoResponse = string.Empty;


            if (frm["talla"].ToString() != null || frm["talla"].ToString() != string.Empty)
            {

                string talla = frm["talla"].ToString();

                string[] nroTalla = talla.Split(',');
                
                foreach (var addStock in nroTalla)
                {
                    StockModel obj = new StockModel();
                    obj.Producto = new ProductModel();
                    obj.Producto.Id_product = int.Parse(frm["ProductSelect"].ToString());
                    obj.Size = new SizeModel();
                    obj.Size.Id_size = int.Parse(addStock);

                    if (StockBuss.InsertStock(obj))
                    {
                        msg = "Agregado a Productos en Stock Exitosamente";
                        tipoResponse = "success";
                    }
                    else
                    {
                        msg = "Error Intente nuevamente";
                        tipoResponse = "error";
                    }
                }
            }
            else
            {
                msg = "Error Talla no Seleccionada";
                tipoResponse = "error";
            }



            Session["mensage"] = msg;
            Session["tipoMensaje"] = tipoResponse;

            return RedirectToAction("Stock", "Product");
        }


        public ActionResult FormStock(int id)
        {
            if (Session["role"].ToString() != "admin")
            {
                return RedirectToAction("Index", "Product", new { id = 1 });
            }
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            ViewBag.Stockid = id;

            StockModel stock = StockBuss.getStock(id);
            ViewBag.Stock = stock;

            return View();
        }

        [HttpPost]
        public ActionResult FormStock(FormCollection frm)
        {
            List<CategoryModel> list = CategoryBuss.Categories();
            ViewBag.CategoryList = list;

            StockModel obj = new StockModel();
            obj.Id_stock = int.Parse(frm["id_stock"].ToString());
            obj.Producto = new ProductModel();
            obj.Producto.Price = int.Parse(frm["precio"].ToString());
            obj.Producto.Cantidad = int.Parse(frm["stock"].ToString());
            string msg = string.Empty;
            string tipoResponse = string.Empty;

            if (StockBuss.UpdatetStock(obj))
            {
                msg = "Agregado Stock y precio Exitosamente";
                tipoResponse = "success";
            }
            else
            {
                msg = "Error Intente nuevamente";
                tipoResponse = "error";
            }

            Session["mensage"] = msg;
            Session["tipoMensaje"] = tipoResponse;

            return RedirectToAction("Stock", "Product");
        }

        [HttpPost]
        public ActionResult Editar(FormCollection frm, HttpPostedFileBase file)
        {
            ProductModel obj = new ProductModel();
            obj.Id_product = int.Parse(frm["idProduct"].ToString());
            obj.Category = new CategoryModel();
            obj.Category.Id_category = int.Parse(frm["category_id"].ToString());
            obj.Name_product = frm["nameproduct"].ToString();
            obj.Brand = new BrandModel(); 
            obj.Brand.Id_marca = int.Parse(frm["idbrand"].ToString());
            obj.Pdto_description =  frm["desciption"].ToString();

            if (file != null )
            {
                string name_file = (DateTime.Now.ToString("yyyyMMddHHmmss") + "-" + file.FileName).ToLower();
                String route = Server.MapPath("~/Assets/uploads/");
                route += name_file;
                ProductBuss.UploadFile(route, file);
                obj.Imagen = name_file;
            }
            else
            {
                obj.Imagen = frm["img_old"].ToString();
            }
            string msg = string.Empty;
            string tipoResponse = string.Empty;

            if (ProductBuss.Update(obj))
            {
                msg = "Producto Editado Exitosamente";
                tipoResponse = "success";
            }
            else
            {
                msg = "Error Intente nuevamente";
                tipoResponse = "error";
            }

            Session["mensage"] = msg;
            Session["tipoMensaje"] = tipoResponse;

            return RedirectToAction("Products", "Product");
        }

        [HttpPost]
        public ActionResult Eliminar(FormCollection frm)
        {
            string msg = string.Empty;
            string tipoResponse = string.Empty;

            int idProduct = int.Parse(frm["idProduct"].ToString());

            if (ProductBuss.Eliminar(idProduct))
            {
                msg = "Producto Eliminado Exitosamente";
                tipoResponse = "success";
            }
            else
            {
                msg = "Error puede que el producto no se pueda eliminar, Intente nuevamente y/o revise sus vinculos";
                tipoResponse = "error";
            }

            Session["mensage"] = msg;
            Session["tipoMensaje"] = tipoResponse;

            return RedirectToAction("Products", "Product"); 
        }

        [HttpGet]
        public JsonResult ProductWhitStocks(int id)
        {
            List<ProductModel> Listproduct = ProductBuss.GetProductWhitStocks(id);
            return Json(Listproduct, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Tallas(int id) 
        {
            List<SizeModel> ListTalla = Tools.talla(id);
            return Json(ListTalla, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Provincia(int id)
        {
            List<ProductModel> ListProducts = ProductBuss.GetProductWhitStocks(id);
            return Json(ListProducts, JsonRequestBehavior.AllowGet);
        }

    }

}