using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using System.Data.SqlClient;


namespace SalesPriceChange_DL
{
    public class StageSetting_DL:BaseDL 
    {
        public DataTable Stage_SelectRow(StageSetting_Entity sse)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("StageID_SelectByRow", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@UserID", sse.UserID);
            AddParameter(cmd, "@FormID", sse.FormID);
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
        public DataTable StageID_Select(Stage_Entity se)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("StageID_Select", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
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
    }
}
