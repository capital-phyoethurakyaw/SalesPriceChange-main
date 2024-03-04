using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using System.Data.SqlClient;

namespace SalesPriceChange_DL
{
    public class Users_DL:BaseDL 
    {

        public DataTable entry_hide_filter(Users_Entity ue, string d)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Entry_Hide", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@UserID", ue.ID);
            AddParameter(cmd, "@MenuID", Convert.ToInt32(d));
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

        public DataTable Users_Select(Users_Entity ue)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Users_Select", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@ID", ue.ID);
            AddParameter(cmd, "@UserID", ue.UserID);
            AddParameter(cmd, "@Password", ue.Password);
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


        public DataTable UserList_Search(Users_Entity ue,Stage_Entity se)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("UserList_Search", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@UserID", ue.UserID);
            AddParameter(cmd, "@StageID", se.StageID);
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
        public DataTable UsersDescription_Select(Users_Entity ue)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("UserDescription_Select", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@UserID", ue.ID);
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
        

        public bool Users_Insert(Users_Entity ue,Stage_Entity  ste,int Updated_By)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Users_Insert", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@UserID", ue.UserID);
            AddParameter(cmd, "@Password", ue.Password);
            AddParameter(cmd, "@Email", ue.Email="capitalk333@gmail.com");
            AddParameter(cmd, "@StageIDs", ste.StageIDs);
            AddParameter(cmd, "@Updated_By",Updated_By);
            
            sqlcon.Open();
            using (SqlTransaction tran = sqlcon.BeginTransaction())
            {
                try
                {
                    cmd.Transaction = tran;
                    cmd.ExecuteNonQuery();

                    tran.Commit();
                    return false;
                }
                catch
                {
                    tran.Rollback();
                    return true;
                }
                finally
                {
                    cmd.Connection.Close();
                }
            }
        }
        public bool Users_Update(Users_Entity ue,Stage_Entity  ste,int Updated_By)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("User_Update", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@id", ue.ID);
            AddParameter(cmd, "@UserID", ue.UserID);
            AddParameter(cmd, "@Password", ue.Password);
            AddParameter(cmd, "@Email", ue.Email = "capitalk333@gmail.com");
            AddParameter(cmd, "@StageIDs", ste.StageIDs);
            AddParameter(cmd, "@Updated_By", Updated_By); ;
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
        public  bool  User_Delete(Users_Entity ue,Stage_Entity  ste)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("User_Delete", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection.Open();
            AddParameter(cmd, "@id", ue.ID);
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            return true;
        }

        public bool User_Delete(string  id)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("UserList_Delete", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection.Open();
            AddParameter(cmd, "@ID",id);
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            return true;
        }
        public DataTable Users_SelectByStage()
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Users_SelectByStage", sqlcon);
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
        public DataTable User_SelectByStage6()
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("User_Selectbystage6", sqlcon);
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

        public bool check_online(string uid)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("online_status_insertflag", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@userID", uid);
            AddParameter(cmd, "@status", "1");

            sqlcon.Open();
            using (SqlTransaction tran = sqlcon.BeginTransaction())
            {
                try
                {
                    cmd.Transaction = tran;
                    cmd.ExecuteNonQuery();

                    tran.Commit();
                    return true ;
                }
                catch
                {
                    tran.Rollback();
                    return true;
                }
                finally
                {
                    //return true;
                    cmd.Connection.Close();
                }
            }
        }

        public bool change_offline(string did)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("change_offline", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@status", 0);
            AddParameter(cmd, "@UserID", did);
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
      
    }
}
