using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;

namespace TC01_DavidBrenes_2022.Pages
{
    public class New_AppModel : PageModel
    {
        public string errorMessage = "";
        public string successMessage = "";
        public AppInfo_New AppInfo_New= new AppInfo_New();
        public List<TypeInfo> list_TypeInfo = new List<TypeInfo>();
        public List<DepartmentInfo_Picklist> list_DepartmentInfo = new List<DepartmentInfo_Picklist>();


        public void OnGet()
        {
            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=Tarea01;Persist Security Info=True;User ID=GeneralAdmin;Password=Admin123";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql = @"SELECT id, tipo FROM App_Type";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                TypeInfo type = new TypeInfo();
                                type.id = reader.GetInt32(0);
                                type.tipo = reader.GetString(1);

                                list_TypeInfo.Add(type);
                            }

                        }
                    }


                    sql = @"SELECT codigo, nombre FROM Departamento";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                DepartmentInfo_Picklist department = new DepartmentInfo_Picklist();
                                department.codigo = reader.GetString(0);
                                department.nombre = reader.GetString(1);

                                list_DepartmentInfo.Add(department);
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
            AppInfo_New.codigo = Request.Form["codigo"];
            AppInfo_New.nombre   = Request.Form["nombre"];
            AppInfo_New.num_Patente   = Request.Form["num_Patente"];
            AppInfo_New.descripcion   = Request.Form["descripcion"];
            AppInfo_New.fecha_Prod   = Request.Form["fecha_Prod"];
            AppInfo_New.fecha_exp_lic   = Request.Form["fecha_exp_lic"];
            AppInfo_New.id_type   = Request.Form["id_type"];
            AppInfo_New.codigo_departamento   = Request.Form["codigo_departamento"];

            if (AppInfo_New.codigo             .Length   == 0 ||
                AppInfo_New.nombre             .Length   == 0 ||
                AppInfo_New.num_Patente        .Length   == 0 ||
                AppInfo_New.descripcion        .Length   == 0 ||
                AppInfo_New.fecha_Prod         .Length   == 0 ||
                AppInfo_New.fecha_exp_lic      .Length   == 0 ||
                AppInfo_New.id_type            .Length   == 0 ||
                AppInfo_New.codigo_departamento.Length   == 0)
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

                        String sql = " INSERT INTO [dbo].[App] ([codigo] ,[nombre] ,[num_Patente] ,[descripcion] ,[fecha_Prod] ,[fecha_exp_lic] ,[id_type] ,[codigo_departamento]) VALUES (@codigo, @nombre, @num_Patente, @descripcion, @fecha_Prod, @fecha_exp_lic, @id_type, @codigo_departamento ); ";

                        using (SqlCommand command = new SqlCommand(sql, connection))
                        {
                            command.Parameters.AddWithValue("@codigo", AppInfo_New.codigo);
                            command.Parameters.AddWithValue("@nombre", AppInfo_New.nombre);
                            command.Parameters.AddWithValue("@num_Patente", AppInfo_New.num_Patente);
                            command.Parameters.AddWithValue("@descripcion", AppInfo_New.descripcion);
                            command.Parameters.AddWithValue("@fecha_Prod", Convert.ToDateTime(AppInfo_New.fecha_Prod));
                            command.Parameters.AddWithValue("@fecha_exp_lic", Convert.ToDateTime(AppInfo_New.fecha_exp_lic));
                            command.Parameters.AddWithValue("@id_type", AppInfo_New.id_type);
                            command.Parameters.AddWithValue("@codigo_departamento", AppInfo_New.codigo_departamento);
                            


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
                AppInfo_New.codigo               = "";
                AppInfo_New.nombre              = "";
                AppInfo_New.num_Patente          = "";
                AppInfo_New.descripcion         = "";
                AppInfo_New.fecha_Prod           = "";
                AppInfo_New.fecha_exp_lic       = "";

                successMessage = "La Aplicación fue creada correctamente";
                
            }

            

           
        }
    }

    public class AppInfo_New
    {
        public string codigo;
        public string nombre;
        public string num_Patente;
        public string descripcion;
        public string fecha_Prod;
        public string fecha_exp_lic;
        public string id_type;
        public string codigo_departamento;

    }

    public class TypeInfo
    {
        public int id;
        public string tipo;

    }
    public class DepartmentInfo_Picklist
    {
        public string codigo;
        public string nombre;

    }
}
