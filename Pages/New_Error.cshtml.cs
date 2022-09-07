using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using System.Linq;

namespace TC01_DavidBrenes_2022.Pages
{
    public class New_ErrorModel : PageModel
    {
        public string errorMessage = "";
        public string successMessage = "";


        public ErrorInfo_New ErrorInfo_New= new ErrorInfo_New();
        public List<App_ServerInfo> list_App_ServerInfo = new List<App_ServerInfo>();
        public List<ImpactInfo> list_ImpactInfo = new List<ImpactInfo>();
        public List<ProyectoInfo> list_ProyectoInfo = new List<ProyectoInfo>();



        public void OnGet()
        {
            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=Tarea01;Persist Security Info=True;User ID=GeneralAdmin;Password=Admin123";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql = @"SELECT Concat('Aplicacion: ',(SELECT [nombre] from [dbo].[App] where codigo=[cod_App]),'  —  Servidor: ',[numSerie_Servidor],'  —  Role: ',(SELECT rol from [dbo].[Server_Role] where id=[rol_servidor])) as nombre, Concat([cod_App],'-',[numSerie_Servidor]) as valor FROM [dbo].[App_Servidor] order by [cod_App]";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                App_ServerInfo App_Server = new App_ServerInfo();
                                App_Server.nombre = reader.GetString(0);
                                App_Server.valor = reader.GetString(1);

                                list_App_ServerInfo.Add(App_Server);
                            }

                        }
                    }

                    sql = @"SELECT [id],[impacto] FROM [dbo].[Impacto]";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ImpactInfo impacto = new ImpactInfo();
                                impacto.id = reader.GetInt32(0);
                                impacto.impacto = reader.GetString(1);

                                list_ImpactInfo.Add(impacto);
                            }

                        }
                    }

                    sql = @"SELECT [id],[nombre] FROM [dbo].[Proyecto_Correcccion]";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ProyectoInfo proyecto = new ProyectoInfo();
                                proyecto.id = reader.GetString(0);
                                proyecto.name = reader.GetString(1);

                                list_ProyectoInfo.Add(proyecto);
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

        public void OnPostSubmit()
        {
            ErrorInfo_New.detalle = Request.Form["detalle"];
            ErrorInfo_New.fecha_hora= Request.Form["fecha_hora"];
            ErrorInfo_New.id_Impacto= Request.Form["id_Impacto"];
            string str_app_server= Request.Form["numSerie_Servidor"];
            ErrorInfo_New.numSerie_Servidor = str_app_server.Split("-")[1];
            ErrorInfo_New.cod_App= str_app_server.Split("-")[0];
            ErrorInfo_New.id_Proyecto_Correccion= Request.Form["id_Proyecto_Correccion"];

            if (ErrorInfo_New.detalle.Length   == 0 ||
                ErrorInfo_New.fecha_hora.Length   == 0 ||
                ErrorInfo_New.id_Impacto.Length   == 0 ||
                ErrorInfo_New.numSerie_Servidor.Length   == 0 ||
                ErrorInfo_New.cod_App.Length   == 0 ||
                ErrorInfo_New.id_Proyecto_Correccion.Length   == 0
                )
            {
                errorMessage = "Por favor rellene todos los campos antes de crear una nueva aplicación";
            }
            else
            {

                try
                {
                    string connectionString = "Data Source=localhost;Initial Catalog=Tarea01;Persist Security Info=True;User ID=GeneralAdmin;Password=Admin123";
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        String sql = " INSERT INTO [dbo].[Error] ([detalle] ,[fecha_hora] ,[id_Impacto] ,[numSerie_Servidor] ,[cod_App] ,[id_Proyecto_Correccion]) VALUES (@detalle, @fecha_hora, @id_Impacto, @numSerie_Servidor, @cod_App, @id_Proyecto_Correccion) ";

                        using (SqlCommand command = new SqlCommand(sql, connection))
                        {
                            command.Parameters.AddWithValue("@detalle", ErrorInfo_New.detalle);
                            command.Parameters.AddWithValue("@fecha_hora", Convert.ToDateTime(ErrorInfo_New.fecha_hora));
                            command.Parameters.AddWithValue("@id_Impacto", ErrorInfo_New.id_Impacto);
                            command.Parameters.AddWithValue("@numSerie_Servidor", ErrorInfo_New.numSerie_Servidor);
                            command.Parameters.AddWithValue("@cod_App", ErrorInfo_New.cod_App);
                            command.Parameters.AddWithValue("@id_Proyecto_Correccion", ErrorInfo_New.id_Proyecto_Correccion);
                            

                            command.ExecuteNonQuery();
                        }
                    }
                }
                catch (Exception ex)
                {
                    errorMessage = ex.Message;
                    return;
                }

                errorMessage                = "";
                ErrorInfo_New.detalle = "";
                ErrorInfo_New.fecha_hora      = "";
                ErrorInfo_New.id_Impacto       = "";
                ErrorInfo_New.numSerie_Servidor      = "";
                ErrorInfo_New.cod_App       = "";
                ErrorInfo_New.id_Proyecto_Correccion      = "";

                successMessage = "El error fue creado correctamente";
                
            }

            

           
        }
    }

    public class ErrorInfo_New
    {
        public string detalle               ;
        public string fecha_hora            ;
        public string id_Impacto            ;
        public string numSerie_Servidor     ;
        public string cod_App               ;
        public string id_Proyecto_Correccion;

    }

    public class App_ServerInfo
    {
        public string nombre;
        public string valor;

    }

    public class ImpactInfo
    {
        public int id;
        public string impacto;

    }

    public class ProyectoInfo
    {
        public string id;
        public string name;

    }

}
