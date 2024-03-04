using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SalesPriceChange_Common;
using System.Data;
using System.Data.SqlClient;

namespace SalesPriceChange_DL
{
    public class menu_DL
    {
        //Hiding Menus 
        public DataTable menu_hidden(menu_Entity ue1)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("menu_hidden", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;

            if (string.IsNullOrWhiteSpace(ue1.UserID))
                cmd.Parameters.AddWithValue("@UserID", DBNull.Value);
            else cmd.Parameters.AddWithValue("@UserID", ue1.UserID); 


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
        //retrieving data from database
        public DataTable menu_Select(menu_Entity me)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Parentmenu_Select", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;

            if (string.IsNullOrWhiteSpace(me.MenuID))
                cmd.Parameters.AddWithValue("@MenuID", DBNull.Value);
            else cmd.Parameters.AddWithValue("@MenuID", me.MenuID);


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
        //retrieving data from database
        public DataTable menu_child(menu_Entity me)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Childmenu_Select", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;

            if (string.IsNullOrWhiteSpace(me.ParentID))
                cmd.Parameters.AddWithValue("@ParentID", DBNull.Value);
            else cmd.Parameters.AddWithValue("@ParentID", me.ParentID);


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
        //saving data to database 
        public bool Menu_Save(menu_Entity me)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Menu_Save", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", me.UserID );
            cmd.Parameters.AddWithValue("@MenuID",me.MenuID );
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            return true;
        }
        //retrieving data from database
        public DataTable Menu_Select(String UserID)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Menu_Select", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID",UserID  );

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
