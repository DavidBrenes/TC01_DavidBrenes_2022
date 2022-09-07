using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;

namespace TC01_DavidBrenes_2022.Pages
{
    public class Vw_Errors : PageModel
    {
        public List<ErrorInfo> list_ErrorInfo = new List<ErrorInfo>();
        public void OnGet()
        {
            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=Tarea01;Persist Security Info=True;User ID=GeneralAdmin;Password=Admin123";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql = @"SELECT id, detalle, CONVERT(VARCHAR(10), fecha_hora, 7) as fecha,  CONVERT(VARCHAR(12), fecha_hora, 114)  as hora, (SELECT TOP(1) impacto FROM Impacto where id=id_Impacto) as Impacto, numSerie_Servidor, cod_App,(SELECT TOP(1) nombre FROM App where codigo=cod_App) as App_Nombre,id_Proyecto_Correccion ,(SELECT TOP(1) nombre FROM Proyecto_Correcccion where id=id_Proyecto_Correccion) as Proyecto_Nombre FROM dbo.Error ";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ErrorInfo Error = new ErrorInfo();



                                Error.id = reader.GetInt64(0);
                                Error.detalle = reader.GetString(1);
                                Error.fecha = reader.GetString(2);
                                Error.hora = reader.GetString(3);
                                Error.Impacto = reader.GetString(4);
                                Error.numSerie_Servidor = reader.GetString(5);
                                Error.cod_App = reader.GetString(6);
                                Error.App_Nombre = reader.GetString(7);
                                Error.id_Proyecto_Correccion = reader.GetString(8);
                                Error.Proyecto_Nombre = reader.GetString(9);



                                list_ErrorInfo.Add(Error);
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

    public class ErrorInfo
    {
        public Int64 id;
        public string detalle;
        public string fecha;
        public string hora;
        public string Impacto;
        public string numSerie_Servidor;
        public string cod_App;
        public string App_Nombre;
        public string id_Proyecto_Correccion;
        public string Proyecto_Nombre;
    }
}
