using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;

namespace TC01_DavidBrenes_2022.Pages
{
    public class New_DepartmentModel : PageModel
    {
        public string errorMessage = "";
        public string successMessage = "";
        public DepartmentInfo DepartmentInfo= new DepartmentInfo();
        
       

        public void OnGet()
        {
        }

        public void OnPostSubmit()
        {
            DepartmentInfo.codigo =            Request.Form["codigo"];
            DepartmentInfo.nombre            = Request.Form["nombre"];
            DepartmentInfo.id_empleado_dirige= Request.Form["id_empleado_dirige"];

            if (DepartmentInfo.codigo.Length==0 || DepartmentInfo.nombre.Length == 0 || DepartmentInfo.id_empleado_dirige.Length == 0)
            {
                errorMessage = "Por favor rellene todos los campos antes de crear un nuevo departamento";
            }
            else
            {

                try
                {
                    string connectionString = "Data Source=localhost;Initial Catalog=Tarea01;Persist Security Info=True;User ID=GeneralAdmin;Password=Admin123";
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        String sql = " INSERT INTO Departamento " +
                                     " ( codigo , nombre , id_empleado_dirige ) VALUES ( @codigo , @nombre , @id_empleado_dirige) ; ";
                        using (SqlCommand command = new SqlCommand(sql, connection))
                        {
                            command.Parameters.AddWithValue("@codigo", DepartmentInfo.codigo);
                            command.Parameters.AddWithValue("@nombre", DepartmentInfo.nombre);
                            command.Parameters.AddWithValue("@id_empleado_dirige", DepartmentInfo.id_empleado_dirige);
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
                DepartmentInfo.codigo = "";
                DepartmentInfo.nombre = "";
                DepartmentInfo.id_empleado_dirige = "";

                successMessage = "El Departamento fue creado correctamente";
                
            }

            

           
        }
    }

    public class DepartmentInfo
    {
        public string codigo;
        public string nombre;
        public string id_empleado_dirige;


    }
}
