using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;

namespace TC01_DavidBrenes_2022.Pages
{
    public class Vw_Projects : PageModel
    {
        public List<ProjectInfo> list_ProjectInfo = new List<ProjectInfo>();
        public void OnGet()
        {
            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=Tarea01;Persist Security Info=True;User ID=GeneralAdmin;Password=Admin123";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql = @"SELECT id,nombre,CONVERT(VARCHAR(20),f_inicio , 100) as fecha_inicio,CONVERT(VARCHAR(20),f_final , 100) as fecha_final,esfuerzo_esp,esfuerzo_real,descripcion FROM dbo.Proyecto_Correcccion ";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ProjectInfo Project = new ProjectInfo();



                                Project.id = reader.GetString(0);
                                Project.nombre = reader.GetString(1);
                                Project.fecha_inicio = reader.GetString(2);
                                Project.fecha_final = reader.GetString(3);
                                Project.esfuerzo_esp = reader.GetInt32(4);
                                Project.esfuerzo_real = reader.GetInt32(5);
                                Project.descripcion = reader.GetString(6);



                                list_ProjectInfo.Add(Project);
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

    public class ProjectInfo
    {
        public string id;
        public string nombre      ;
        public string fecha_inicio;
        public string fecha_final ;
        public Int32 esfuerzo_esp;
        public Int32 esfuerzo_real;
        public string descripcion ;
    }
}














