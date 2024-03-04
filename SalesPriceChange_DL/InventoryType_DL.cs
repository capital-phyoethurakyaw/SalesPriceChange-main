using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using System.Data.SqlClient;

namespace SalesPriceChange_DL
{
    public class InventoryType_DL:BaseDL
    {
        public DataTable InventoryType_SelectAll()
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("InventoryType_SelectAll", sqlcon);
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
        public DataTable GetDataFromInventory_Type(Stage_Entity se)
        {
            DataTable dt = new DataTable();
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlDataAdapter sda = new SqlDataAdapter("Inventory_DescriptionSearch", sqlcon);

            if (string.IsNullOrWhiteSpace(se.Description))
                sda.SelectCommand.Parameters.AddWithValue("@Description", DBNull.Value);
            else sda.SelectCommand.Parameters.AddWithValue("@Description", se.Description);


            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Connection.Open();
            sda.Fill(dt);

            sda.SelectCommand.Connection.Close();
            return dt;
        }
        public DataTable InventoryType_Select()
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("InventoryType_SelectAll", sqlcon);
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

        public bool InventoryType_IsExists(string description, string id)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("InventoryType_IsExists", sqlcon);
            cmd.Parameters.AddWithValue("@Description", description);
            if (string.IsNullOrWhiteSpace(id))
                id = "0";
            cmd.Parameters.AddWithValue("@ID", id);
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

        public bool InventoryType_Insert(string description,int pre,int Updated_By)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("InventoryType_Insert", sqlcon);
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

        public bool InventoryType_Update(int pre,string description, string id,int Updated_By)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("InventoryType_Update", sqlcon);
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

        public bool InventoryType_Delete(string id)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("InventoryType_Delete", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", id);
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
        public void inventory_UpdatePreference(string id, string pre, string UpdatedBy)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Inventory_UpdatePreference", sqlcon);
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
