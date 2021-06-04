using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tienda_virtual
{
    public class UserModel
    {

        private int iduser;
        private string firstname;
        private string secondname;
        private string fatherlastname;
        private string motherlastname;
        private string username;
        private string token;
        private DateTime birthday;
        private int sex;
        private string email;
        private string telefono;
        private RegionModel region;
        private ComunaModel comuna;
        private string addres;
        private string password;
        private DateTime dateregister;
        private string role;

        public UserModel()
        {
        }

        public int Iduser { get => iduser; set => iduser = value; }
        public string Firstname { get => firstname; set => firstname = value; }
        public string Secondname { get => secondname; set => secondname = value; }
        public string Fatherlastname { get => fatherlastname; set => fatherlastname = value; }
        public string Motherlastname { get => motherlastname; set => motherlastname = value; }
        public string Username { get => username; set => username = value; }
        public DateTime Birthday { get => birthday; set => birthday = value; }
        public string Email { get => email; set => email = value; }
        public string Addres { get => addres; set => addres = value; }
        public string Password { get => password; set => password = value; }
        public DateTime Dateregister { get => dateregister; set => dateregister = value; }
        public string Role { get => role; set => role = value; }
        public int Sex { get => sex; set => sex = value; }
        public RegionModel Region { get => region; set => region = value; }
        public ComunaModel Comuna { get => comuna; set => comuna = value; }
        public string Token { get => token; set => token = value; }
        public string Telefono { get => telefono; set => telefono = value; }
    }
}