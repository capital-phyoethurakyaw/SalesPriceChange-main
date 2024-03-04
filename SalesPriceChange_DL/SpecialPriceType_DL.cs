using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SalesPriceChange_Common;

namespace SalesPriceChange_DL
{
    public class SpecialPriceType_DL:BaseDL 
    {
        public DataTable SpecialPriceType_SelectAll()
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SpecialPriceType_SelectAll", sqlcon);
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
        public DataTable GetDataFromSpecial_Price(Stage_Entity se)
        {
            DataTable dt = new DataTable();
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SpecialPrice_DescriptionSearch", sqlcon);
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
        public bool SpecialPriceType_IsExists(string description, string id)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SpecialPriceType_IsExists", sqlcon);
            AddParameter(cmd, "@Description", description);
            if (string.IsNullOrWhiteSpace(id))
                id = "0";
            AddParameter(cmd, "@ID",id);
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

        public bool SpecialPriceType_Insert(string description,int pre,int Updated_By)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SpecialPriceType_Insert", sqlcon);
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

        public bool SpecialPriceType_Update(int pre,string description, string id,int Updated_By)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SpecialPriceType_Update", sqlcon);
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

        public bool SpecialPriceType_Delete(string id)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SpecialPriceType_Delete", sqlcon);
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
        public void Special_UpdatePreference(string id, string pre, string UpdatedBy)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Special_UpdatePreference", sqlcon);
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

    }
}
