using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;

namespace TC01_DavidBrenes_2022.Pages
{
    public class New_ServerModel : PageModel
    {
        public string errorMessage = "";
        public string successMessage = "";
        public ServerInfo ServerInfo= new ServerInfo();
        
       

        public void OnGet()
        {
        }

        public void OnPostSubmit()
        {
            ServerInfo.numSerie         = Request.Form["numSerie"];
            ServerInfo.marca            = Request.Form["marca"];
            ServerInfo.modelo           = Request.Form["modelo"];
            ServerInfo.memoria          = Request.Form["memoria"];
            ServerInfo.fechaCompra      = Request.Form["fechaCompra"];
            ServerInfo.procesamiento    = Request.Form["procesamiento"];
            ServerInfo.almacenamiento   = Request.Form["almacenamiento"];

            if (ServerInfo.numSerie.Length==0 ||
                ServerInfo.marca.Length == 0 ||
                ServerInfo.modelo.Length == 0 ||
                ServerInfo.memoria.Length == 0 ||
                ServerInfo.fechaCompra.Length == 0 ||
                ServerInfo.procesamiento.Length == 0 ||
                ServerInfo.almacenamiento.Length == 0
                )
            {
                errorMessage = "Por favor rellene todos los campos antes de crear un Nuevo Servidor";
            }
            else
            {

                try
                {
                    string connectionString = "Data Source=localhost;Initial Catalog=Tarea01;Persist Security Info=True;User ID=GeneralAdmin;Password=Admin123";
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        String sql = " INSERT INTO [dbo].[Servidor] ([numSerie] ,[marca] ,[modelo] ,[memoria] ,[fechaCompra] ,[procesamiento] ,[almacenamiento]) VALUES (@numSerie, @marca, @modelo, @memoria, @fechaCompra, @procesamiento, @almacenamiento); ";

                        using (SqlCommand command = new SqlCommand(sql, connection))
                        {
                            command.Parameters.AddWithValue("@numSerie", ServerInfo.numSerie);
                            command.Parameters.AddWithValue("@marca", ServerInfo.marca);
                            command.Parameters.AddWithValue("@modelo", ServerInfo.modelo);
                            command.Parameters.AddWithValue("@memoria", ServerInfo.memoria);
                            command.Parameters.AddWithValue("@fechaCompra", Convert.ToDateTime(ServerInfo.fechaCompra) );
                            command.Parameters.AddWithValue("@procesamiento", ServerInfo.procesamiento);
                            command.Parameters.AddWithValue("@almacenamiento", ServerInfo.almacenamiento);


                            command.ExecuteNonQuery();
                        }
                    }
                }
                catch (Exception ex)
                {
                    errorMessage = ex.Message;
                    return;
                }

                errorMessage = "";
                ServerInfo.numSerie = "";
                ServerInfo.marca = "";
                ServerInfo.modelo = "";
                ServerInfo.memoria = "";
                ServerInfo.fechaCompra = "";
                ServerInfo.procesamiento = "";
                ServerInfo.almacenamiento = "";

                successMessage = "El Servidor fue creado correctamente";
                
            }

            

           
        }
    }

    public class ServerInfo
    {
        public string numSerie      ;
        public string marca         ;
        public string modelo        ;
        public string memoria       ;
        public string fechaCompra   ;
        public string procesamiento ;
        public string almacenamiento;


    }
}
