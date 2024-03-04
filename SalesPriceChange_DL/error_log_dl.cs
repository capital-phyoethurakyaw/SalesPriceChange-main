using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SalesPriceChange_Common;
using System.Data;
using System.Data.SqlClient;
using context = System.Web.HttpContext;
using System.Configuration;


namespace SalesPriceChange_DL
{
         public class error_log_dl:BaseDL
    {
             public bool error_log_insert(Exception expd)
             {
                 string dffsf = string.Empty;
                 try
                 {
                     dffsf = System.Web.HttpContext.Current.Session["usererror"].ToString();
                 }
                 catch
                 {
                     dffsf = "Temp_User";
                 }
                 Connection con = new Connection();
                 SqlConnection sqlcon = con.GetConnection();
                 SqlCommand cmd = new SqlCommand("Error_Log_Check", sqlcon);
                 cmd.CommandType = CommandType.StoredProcedure;
                 AddParameter(cmd, "@UserName", dffsf);
                 AddParameter(cmd, "@Exception_Message", expd.Message.ToString());
                 AddParameter(cmd, "@Exception_Type", expd.GetType().Name.ToString());
                 AddParameter(cmd, "@Exception_Source", expd.StackTrace.ToString());
                 AddParameter(cmd, "@Occurred_line_No", expd.StackTrace.Split(' ').Last());
                 AddParameter(cmd,"@Error_URL",context.Current.Request.Url.ToString());
              
                 

                 sqlcon.Open();
                 using (SqlTransaction tran = sqlcon.BeginTransaction())
                 {
                     try
                     {
                         cmd.Transaction = tran;
                         cmd.ExecuteNonQuery();

                         tran.Commit();
                         return true;
                     }
                     catch
                     {
                         tran.Rollback();
                         return false;
                     }
                     finally
                     {
                         cmd.Connection.Close();
                     }
                 }
             }
             public DataTable error_select()
             {
                 Connection con = new Connection();
                 SqlConnection sqlcon = con.GetConnection();
                 SqlCommand cmd = new SqlCommand("select_Error_Type", sqlcon);
                 cmd.CommandType = CommandType.StoredProcedure;
                 SqlDataAdapter da = new SqlDataAdapter(cmd);
                 DataTable dt = new DataTable();
                 try
                 {
                     cmd.Connection.Open();
                     da.Fill(dt);
                     return dt;
                 }
                 catch
                 { return new DataTable(); }
                 finally
                 {
                     cmd.Connection.Close();
                 }
             }
    }
}
