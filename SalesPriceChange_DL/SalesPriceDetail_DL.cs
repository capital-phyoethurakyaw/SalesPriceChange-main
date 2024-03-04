using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SalesPriceChange_Common;



namespace SalesPriceChange_DL
{
    public class SalesPriceDetail_DL:BaseDL
    {
        public bool SalePriceDetail_Insert(SalesPriceDetail_Entity se)
        {

            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SalesPriceDetail_Insert", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;

            AddParameter(cmd, "@FormNo", se.FormNo);
            
            AddParameter(cmd,"@ApplyDate", se.ApplyDate);
            AddParameter(cmd,"@ApplyType_ID", se.ApplyType_ID);
            AddParameter(cmd,"@StartDate", se.StartDate);
            AddParameter(cmd,"@EndDate", se.EndDate);
            AddParameter(cmd,"@Suppliers_ID", se.Suppliers_ID);
            AddParameter(cmd,"@Brand_ID", se.Brand_ID);
            AddParameter(cmd,"@Shipping", se.Shipping);
            AddParameter(cmd,"@Attachment", se.Attachment);
            AddParameter(cmd,"@ColorUnit", se.ColorUnit);
            AddParameter(cmd,"@ProductNoUnit", se.ProductNoUnit);
            AddParameter(cmd,"@Selling_Date", se.Selling_Date);
            AddParameter(cmd,"@Selling_Discount1", se.Selling_Discount1);
            AddParameter(cmd,"@Selling_Discount2", se.Selling_Discount2);
            AddParameter(cmd,"@Purchase_Date", se.Purchase_Date);
            AddParameter(cmd,"@Purchase_Discount1", se.Purchase_Discount1);
            AddParameter(cmd,"@Purchase_Discount2", se.Purchase_Discount2);
            AddParameter(cmd,"@SpecialPriceType_ID", se.SpecialPriceType_ID);
            AddParameter(cmd,"@InventoryType_ID", se.InventoryType_ID);
            AddParameter(cmd,"@Hot", se.Hot);
            AddParameter(cmd,"@SaleBanner", se.SaleBanner);
            AddParameter(cmd,"@SaleText", se.SaleText);
            AddParameter(cmd,"@Header", se.Header);
            AddParameter(cmd, "@Side", se.Side);
            AddParameter(cmd,"@Remark", se.Remark);
            AddParameter(cmd, "@Stage1Cmt", se.Stage1Comment);
            AddParameter(cmd, "@Stage1sts", se.Stage1Status);
            AddParameter(cmd, "@CreateUserID", se.CreatedUserID);
            AddParameter(cmd, "@CreatDate", se.CreatedDate);
            AddParameter(cmd, "@StageID", se.StageID);
           

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
                catch(Exception)
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
        public DataTable FormNo_Select(SalesPriceDetail_Entity se)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("FormNo_Select", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@FormNo", se.FormNo);
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
        public DataTable SalePrcieList_Search(SalesPriceDetail_Entity se)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SalePrcieList_Search", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@FormNo", se.FormNo);
            AddParameter(cmd, "@ApplyDate", Convert.ToDateTime(se.ApplyDate));
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

        public DataTable SalePriceDetail_NotiCount(string UserID)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SalesPriceDetail_NotiCount", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", UserID);
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
        public DataTable SalesPriceDetail_NotiList(Users_Entity ue)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SalesPriceDetail_NotiList", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID",ue.ID  );
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
        public DataTable SalePriceList_Select(SalesPriceDetail_Entity se)
        {

            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SalePriceList_Select", sqlcon);
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
        public bool SalesPriceList_Update(SalesPriceDetail_Entity se)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SalesPrice_Update", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection.Open();

            AddParameter(cmd,"@ID", se.ID);
            AddParameter(cmd,"@FormNo", se.FormNo);
            AddParameter(cmd,"@ApplyDate", se.ApplyDate);
            AddParameter(cmd,"@ApplyType_ID", se.ApplyType_ID);
            AddParameter(cmd,"@StartDate", se.StartDate);
            AddParameter(cmd,"@EndDate", se.EndDate);
            AddParameter(cmd,"@Suppliers_ID", se.Suppliers_ID);
            AddParameter(cmd,"@Brand_ID", se.Brand_ID);
            AddParameter(cmd,"@Shipping", se.Shipping);
            AddParameter(cmd,"@Attachment", se.Attachment);
            AddParameter(cmd,"@ColorUnit", se.ColorUnit);
            AddParameter(cmd,"@ProductNoUnit", se.ProductNoUnit);
            AddParameter(cmd,"@Selling_Date", se.Selling_Date);
            AddParameter(cmd,"@Selling_Discount1", se.Selling_Discount1);
            AddParameter(cmd,"@Selling_Discount2", se.Selling_Discount2);
            AddParameter(cmd,"@Purchase_Date", se.Purchase_Date);
            AddParameter(cmd,"@Purchase_Discount1", se.Purchase_Discount1);
            AddParameter(cmd,"@Purchase_Discount2", se.Purchase_Discount2);
            AddParameter(cmd,"@SpecialPriceType_ID", se.SpecialPriceType_ID);
            AddParameter(cmd,"@InventoryType_ID", se.InventoryType_ID);
            AddParameter(cmd,"@Hot", se.Hot);
            AddParameter(cmd,"@SaleBanner", se.SaleBanner);
            AddParameter(cmd,"@SaleText", se.SaleText);
            AddParameter(cmd,"@Header", se.Header);
            AddParameter(cmd,"@Side", se.Side);
            AddParameter(cmd,"@Remark", se.Remark);
            AddParameter(cmd,"@Stage1Cmt", se.Stage1Comment );
            AddParameter(cmd, "@Stage1sts", se.Stage1Status);
            AddParameter(cmd,"@Stage2Cmt", se.Stage2Comment );
            AddParameter(cmd,"@Stage2sts", se.Stage2Status );
            AddParameter(cmd,"@Stage3Cmt", se.Stage3Comment );
            AddParameter(cmd,"@Stage3sts", se.Stage3Status );
            AddParameter(cmd,"@Stage4Cmt", se.Stage4Comment );
            AddParameter(cmd,"@Stage4sts", se.Stage4Status);
            AddParameter(cmd,"@Stage5Cmt", se.Stage5Comment );
            AddParameter(cmd,"@Stage5sts", se.Stage5Status );
            AddParameter(cmd,"@Stage6Cmt", se.Stage6Comment );
            AddParameter(cmd,"@Stage6sts", se.Stage6Status );
            AddParameter(cmd,"@Stage7Cmt", se.Stage7Comment );
            AddParameter(cmd,"@Stage7sts", se.Stage7Status );
            AddParameter(cmd,"@StageID", se.StageID);
            AddParameter(cmd, "@UpdateUserID", se.UpdatedUserID);
            AddParameter(cmd, "@UpdateDate", se.UpdatedDate);
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            return true;
        }
        public bool SalePriceList_Delete(SalesPriceDetail_Entity se)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SalePriceList_Delete", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection.Open();
            cmd.Parameters.AddWithValue("@id", se.ID);
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            return true;
        }
        //Get New FormID
        public DataTable SalePriceDetail_GetFormID()
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SelPriceDetail_GetFormID", sqlcon);
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

        public DataTable SalePrice_Edit(SalesPriceDetail_Entity se)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("SalePriceType_Select", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", se.ID);
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
        public DataTable FormStage_Check(Users_Entity ue)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("FormStage_Check", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", ue.UserID );
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
