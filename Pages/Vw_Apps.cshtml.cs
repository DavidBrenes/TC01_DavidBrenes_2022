using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;

namespace TC01_DavidBrenes_2022.Pages
{
    public class Vw_Apps : PageModel
    {
        public List<AppInfo> list_AppInfo=new List<AppInfo>();
        public void OnGet()
        {
            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=Tarea01;Persist Security Info=True;User ID=GeneralAdmin;Password=Admin123";
                using (SqlConnection connection= new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql = @"SELECT codigo, nombre, num_Patente, descripcion, CONVERT(VARCHAR(8), fecha_Prod,1) as fecha_Prod, CONVERT(VARCHAR(8), fecha_exp_lic,1) as fecha_exp_lic, (SELECT [tipo] from [dbo].[App_Type] where id=id_type) as tipo, codigo_departamento FROM App";
                    using (SqlCommand command = new SqlCommand(sql,connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                AppInfo app = new AppInfo();
                                app.codigo             =reader.GetString(0);
                                app.nombre             =reader.GetString(1);
                                app.num_Patente        =reader.GetString(2);
                                app.descripcion        =reader.GetString(3);
                                app.fecha_Prod         =reader.GetString(4);
                                app.fecha_exp_lic      =reader.GetString(5);
                                app.tipo               =reader.GetString(6);
                                app.codigo_departamento=reader.GetString(7);

                                list_AppInfo.Add(app);
                            }
                            
                        }
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }

    public class AppInfo
    {
        public string codigo;
        public string nombre;
        public string num_Patente;
        public string descripcion;
        public string fecha_Prod;
        public string fecha_exp_lic;
        public string    tipo;
        public string codigo_departamento;

    }
}
