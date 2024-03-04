using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SalesPriceChange_Common;
using System.Data;
using System.Data.SqlClient;


namespace SalesPriceChange_DL
{
   public class Apply_TypeDL:BaseDL 
    {
        public DataTable ApplyType_Select( )
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Apply_Type_Drag_Select", sqlcon);
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

        public void ApplyType_UpdatePreference(string id, string pre, string UpdatedBy)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("ApplyType_UpdatePreference", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@Preference", pre);
            AddParameter(cmd, "@ID", id);
            AddParameter(cmd, "@Updated_By", UpdatedBy);
            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
            }
            catch
            { }
            finally
            {
                cmd.Connection.Close();
            }
        }

        public bool ApplyType_IsExists(string description, string id)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("ApplyType_IsExists", sqlcon);
            AddParameter(cmd, "@Description", description);
            if (string.IsNullOrWhiteSpace(id))
                id = "0";
            AddParameter(cmd, "@ID", id);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                cmd.Connection.Open();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                    return true;
                else
                    return false;
            }
            catch
            { return true; }
            finally
            {
                cmd.Connection.Close();
            }
        }

        public bool ApplyType_Insert(string description,string pre,int Updated_By)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("ApplyType_Insert", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@Preference", pre);
            AddParameter(cmd, "@Description", description);
            AddParameter(cmd, "@Updated_By", Updated_By);
            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            { return false; }
            finally
            {
                cmd.Connection.Close();
            }
        }

        public bool ApplyType_Update(string  pre,string description, string id,int Updated_By)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("ApplyType_Update", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@Preference", pre);
            AddParameter(cmd, "@Description", description);
            AddParameter(cmd, "@ID", id);
            AddParameter(cmd, "@Updated_By", Updated_By);
            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            { return false; }
            finally
            {
                cmd.Connection.Close();
            }
        }
        
        public DataTable GetDataFromApply_Type(Stage_Entity se)
        {
            DataTable dt = new DataTable();
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Apply_DescriptionSearch", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            AddParameter(cmd, "@Description", se.Description);
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
        
        public bool ApplyType_Delete(string id)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("ApplyType_Delete", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@ID", id);
            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            { return false; }
            finally
            {
                cmd.Connection.Close();
            }
        }
       
    }
}

