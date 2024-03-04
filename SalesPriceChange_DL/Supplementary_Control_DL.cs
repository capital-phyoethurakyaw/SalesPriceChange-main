
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SalesPriceChange_Common;

namespace SalesPriceChange_DL
{
    public class Supplementary_Control_DL : BaseDL
    {
        public DataTable Supplementary_Control_SelectAll()
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Supplementary_Control_SelectAll", sqlcon);
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

        public DataTable Supplementary_Control_Search(Supplementary_Entity se)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Supplementary_Control_Search", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@ApplyNo", se.ApplyNo);
            AddParameter(cmd, "@Suppliers", se.SupplierName);
            AddParameter(cmd, "@Brand", se.BrandName);
            AddParameter(cmd, "@Content", se.Content);
            AddParameter(cmd, "@Amount", se.SAmount);
            AddParameter(cmd, "@Compensation_Type", se.CompensationType);
            AddParameter(cmd, "@Remark", se.Remark);
            AddParameter(cmd, "@Process_Date", se.pasdate);
            AddParameter(cmd, "@IsFinished", se.IsFinished);
            AddParameter(cmd, "@Start_Date", se.Start_Date);
            AddParameter(cmd, "@End_Date", se.End_Date);
            AddParameter(cmd, "@updated_Date", se.updtd_Date.Replace("/", "-"));
            //for end date
            AddParameter(cmd, "@updated_Date_End", se.updtd_Date_End.Replace("/", "-"));
            //check value for 納品書日空白表示:
            AddParameter(cmd, "@chkBlank", se.chkBlank);

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

        public bool Supplementary_Control_Save(Supplementary_Entity se)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Supplementary_Control_Insert", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@ApplyNo", se.ApplyNo);
            AddParameter(cmd, "@Suppliers_ID", se.SupplierID);
            AddParameter(cmd, "@Brand_ID", se.BrandID);
            AddParameter(cmd, "@Content", se.Content);
            AddParameter(cmd, "@Amount", se.Amount);
            AddParameter(cmd, "@Compensation_Type", se.CompensationType);
            AddParameter(cmd, "@Remark", se.Remark);
            AddParameter(cmd, "@Process_Date", se.ProcessDate);
            AddParameter(cmd, "@IsFinished", se.IsFinished);
            AddParameter(cmd, "@Updated_By", se.UpdatedBy);
            AddParameter(cmd, "@start_text1", se.start_text1);
            AddParameter(cmd, "@end_text2", se.end_text2);
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

        public bool Supplementary_Control_Update(Supplementary_Entity se)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Supplementary_Control_Update", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@ID", se.ID);
            AddParameter(cmd, "@Suppliers_ID", se.SupplierID);
            AddParameter(cmd, "@Brand_ID", se.BrandID);
            AddParameter(cmd, "@Content", se.Content);
            AddParameter(cmd, "@Amount", se.Amount);
            AddParameter(cmd, "@Compensation_Type", se.CompensationType);
            AddParameter(cmd, "@Remark", se.Remark);
            AddParameter(cmd, "@Process_Date", se.ProcessDate);
            AddParameter(cmd, "@IsFinished", se.IsFinished);
            AddParameter(cmd, "@Updated_By", se.UpdatedBy);
            AddParameter(cmd, "@start_Date", se.start_text1);
            AddParameter(cmd, "@end_date", se.end_text2);

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

        public DataTable Supplementary_Control_GetApplyNo()
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Supplementary_Control_GetApplyNo", sqlcon);
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

        public bool DeleteApplyNoById(int id)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SP_DeleteApplyNo_ById", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@ID", id);
            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                cmd.Connection.Close();
            }
        }
    }
}
