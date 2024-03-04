using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SalesPriceChange_Common;
using System.Data;
using System.Data.SqlClient;

namespace SalesPriceChange_DL
{
    public class Stage_DL:BaseDL 
    {
        public DataTable Stage_Select(Stage_Entity  ste)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Stage_Select", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@StageID", ste.StageID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                cmd.Connection.Open();
                da.Fill(dt);
                return dt;
            }
            catch (Exception)
            { return new DataTable(); }
            finally
            {
                cmd.Connection.Close();
            }
        }
        public DataTable Stage_Edit(string UsersID)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Stage_Edit", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@UsersID", UsersID);
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
        public DataTable  Stage_SelectStage(string userID)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Stage_SelectStage", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@UserID", userID);
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
        public bool  StageID_Save(Stage_Entity  ste)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("StageID_Insert", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd,"@StageID", ste.StageID);
            AddParameter(cmd,"@RowID", ste.RowID );
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            return true;
        }
        public DataTable StageID_Select(String StageID)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("StageID_Select", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StageID", StageID);

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
