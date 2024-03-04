using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SalesPriceChange_Common;

namespace SalesPriceChange_DL
{
    public class Instruction_DL:BaseDL 
    {
        //
        public bool update_theme(string theme, string U_ID)
        {
            try
            {
                Connection con = new Connection();
                SqlConnection sqlcon = con.GetConnection();
                SqlCommand cmd = new SqlCommand("theme_Update", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection.Open();
                AddParameter(cmd, "@u_id", Convert.ToInt32(U_ID));
                AddParameter(cmd, "@theme_id", Convert.ToInt32(theme));
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool change_delete(string id_send)
        {
            try
            {
                Connection con = new Connection();
                SqlConnection sqlcon = con.GetConnection();
                SqlCommand cmd = new SqlCommand("Change_Delete_Status", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection.Open();
                AddParameter(cmd, "@ID", Convert.ToInt32(id_send));
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                return true;
          
            }
            catch
            {
                return false;
            }
        }
        public bool Instructions_Upload(string id, string fname, string fpath, string formno)
        {

       //     string[] strarr = formno.Split('-');
       //formno=    strarr[0] + "-" + (Convert.ToInt32(strarr[1]) - 1).ToString("D5");
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Upload_Insert", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@UserID", Convert.ToInt32(id));
            AddParameter(cmd, "@fname", fname);
            AddParameter(cmd, "@fpath", fpath);
            AddParameter(cmd, "@formno", formno);
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
                catch (Exception)
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
        public bool Instructions_Insert(Instructions_Entity ie)
        {

            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Instructions_Insert", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;

            AddParameter(cmd, "@FormType", ie.FormType);
            AddParameter(cmd, "@FormNo", ie.FormNo);
            AddParameter(cmd, "@Form", ie.Form);
            AddParameter(cmd, "@ApplyDate", ie.ApplyDate);
            AddParameter(cmd, "@ApplyType_ID", ie.ApplyType_ID);
            //AddParameter(cmd, "@Category_ID", ie.Category_ID);
            AddParameter(cmd, "@StartDate", ie.StartDate);
            AddParameter(cmd, "@EndDate", ie.EndDate);
            AddParameter(cmd, "@Suppliers_ID", ie.Suppliers_ID);
            AddParameter(cmd, "@Brand_ID", ie.Brand_ID);
            AddParameter(cmd, "@Category", ie.Category);
            AddParameter(cmd, "@TargetItem ", ie.TargetItem );
            AddParameter(cmd, "@MDunit ", ie.MD_Unit );
            AddParameter(cmd, "@MDmanagement  ", ie.MD_Management );
            AddParameter(cmd, "@ContactToyonaka  ", ie.ContactToyonaka );
            AddParameter(cmd, "@SellingPrice", ie.Selling_Price);
            AddParameter(cmd, "@SellingPriceUnitID", ie.SellingPrice_Unit );
            AddParameter(cmd, "@Cost", ie.Cost);
            AddParameter(cmd, "@CostUnitID", ie.CostUnit);
            AddParameter(cmd, "@SpecialPriceType_ID", ie.SpecialPriceType_ID);
            AddParameter(cmd, "@InventoryType_ID", ie.InventoryType_ID);
            AddParameter(cmd, "@PriceChange_Remark", ie.PriceChange_Remark );
            AddParameter(cmd, "@Purchasing_Remark", ie.Purchasing_Remark );
            AddParameter(cmd, "@Item_Memo", ie.ItemMemo );
            AddParameter(cmd, "@Boss_Memo", ie.BossMemo );
            AddParameter(cmd, "@Item_Up", ie.ItemUp );
            AddParameter(cmd, "@SiteBanner", ie.SiteBanner );
            AddParameter(cmd, "@Hot", ie.Hot);
            AddParameter(cmd, "@SaleBanner", ie.SaleBanner);
            AddParameter(cmd, "@SaleText", ie.SaleText);
            AddParameter(cmd, "@Header", ie.Header);
            AddParameter(cmd, "@Side", ie.Side);
            AddParameter(cmd, "@Site_Remark", ie.SiteRemark );
            AddParameter(cmd, "@Stage1Sts", ie.Stage1Status);
            AddParameter(cmd, "@Stage1Date", ie.Stage1Date);
            AddParameter(cmd, "@Stage1User", ie.Stage1User);
            //AddParameter(cmd, "@StageID", ie.StageID);
            AddParameter(cmd, "@CurrentStage",ie.CurrentStage);

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
                catch (Exception)
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
        public DataTable Instruction_SelectAll()
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Instruction_SelectAll", sqlcon);
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
        public DataTable Instruction_Info(Instructions_Entity ie)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Instruction_Info", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@UserID", ie.UserID);
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
        public DataTable Dashboard_UserInfo(string  id)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Dashboard_InfoUser", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@UserID", id);
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

        public DataTable Dashboard_Info()
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Dashboard_Info", sqlcon);
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
        public DataTable Instructions_GetFormID()
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Instructions_GetFormID", sqlcon);
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
      
        public DataTable InstructionsFormNo_Select(Instructions_Entity ie)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("InstructionsFormNo_Select", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@FormNo", ie.FormNo.Replace("S", string.Empty));
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
        public DataTable Instruction_GetApplyNo()
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Instruction_GetApplyNo", sqlcon);
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
        public DataTable Instruction_NotiList(Users_Entity ue)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Instruction_NotiList", sqlcon);
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
        public bool Instruction_Update(Instructions_Entity ie)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Instruction_Update", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection.Open();
            try
            {
                AddParameter(cmd, "@ID", ie.ID);
                AddParameter(cmd, "@FormNo", ie.FormNo);
                AddParameter(cmd, "@ApplyDate", ie.ApplyDate);
                AddParameter(cmd, "@ApplyType_ID", ie.ApplyType_ID);
                //AddParameter(cmd, "@Category_ID", ie.Category_ID);
                AddParameter(cmd, "@StartDate", ie.StartDate);
                AddParameter(cmd, "@EndDate", ie.EndDate);
                AddParameter(cmd, "@Suppliers_ID", ie.Suppliers_ID);
                AddParameter(cmd, "@Brand_ID", ie.Brand_ID);
                AddParameter(cmd, "@Category", ie.Category);
                AddParameter(cmd, "@TargetItem ", ie.TargetItem);
                AddParameter(cmd, "@MDunit ", ie.MD_Unit);
                AddParameter(cmd, "@MDmanagement  ", ie.MD_Management);
                AddParameter(cmd, "@ContactToyonaka  ", ie.ContactToyonaka);
                AddParameter(cmd, "@SellingPrice", ie.Selling_Price);
                AddParameter(cmd, "@SellingPriceUnitID", ie.SellingPrice_Unit);
                AddParameter(cmd, "@Cost", ie.Cost);
                AddParameter(cmd, "@CostUnitID", ie.CostUnit);
                AddParameter(cmd, "@SpecialPriceType_ID", ie.SpecialPriceType_ID);
                AddParameter(cmd, "@InventoryType_ID", ie.InventoryType_ID);
                AddParameter(cmd, "@PriceChange_Remark", ie.PriceChange_Remark);
                AddParameter(cmd, "@Purchasing_Remark", ie.Purchasing_Remark);
                AddParameter(cmd, "@Item_Memo", ie.ItemMemo);
                AddParameter(cmd, "@Boss_Memo", ie.BossMemo);
                AddParameter(cmd, "@Item_Up", ie.ItemUp);
                AddParameter(cmd, "@SiteBanner", ie.SiteBanner);
                AddParameter(cmd, "@Hot", ie.Hot);
                AddParameter(cmd, "@SaleBanner", ie.SaleBanner);
                AddParameter(cmd, "@SaleText", ie.SaleText);
                AddParameter(cmd, "@Header", ie.Header);
                AddParameter(cmd, "@Side", ie.Side);
                AddParameter(cmd, "@Site_Remark", ie.SiteRemark);
                AddParameter(cmd, "@Stage1Sts", ie.Stage1Status);
                AddParameter(cmd, "@Stage1Date", ie.Stage1Date);
                AddParameter(cmd, "@Stage1User", ie.Stage1User);
                AddParameter(cmd, "@Stage2Sts", ie.Stage2Status);
                AddParameter(cmd, "@Stage2Date", ie.Stage2Date);
                AddParameter(cmd, "@Stage2User", ie.Stage2User);
                AddParameter(cmd, "@Stage3Sts", ie.Stage3Status);
                AddParameter(cmd, "@Stage3Date", ie.Stage3Date);
                AddParameter(cmd, "@Stage3User", ie.Stage3User);
                AddParameter(cmd, "@Stage3TargetUser", ie.Stage3TargetUser);
                AddParameter(cmd, "@Stage4Sts", ie.Stage4Status);
                AddParameter(cmd, "@Stage4Date", ie.Stage4Date);
                AddParameter(cmd, "@Stage4User", ie.Stage4User);
                AddParameter(cmd, "@Stage5Sts", ie.Stage5Status);
                AddParameter(cmd, "@Stage5Date", ie.Stage5Date);
                AddParameter(cmd, "@Stage5User", ie.Stage5User);
                AddParameter(cmd, "@Stage5TargetUser", ie.Stage5TargetUser);
                AddParameter(cmd, "@Stage6Sts", ie.Stage6Status);
                AddParameter(cmd, "@Stage6Date", ie.Stage6Date);
                AddParameter(cmd, "@Stage6User", ie.Stage6User);
                AddParameter(cmd, "@Stage7Sts", ie.Stage7Status);
                AddParameter(cmd, "@Stage7Date", ie.Stage7Date);
                AddParameter(cmd, "@Stage7User", ie.Stage7User);
                AddParameter(cmd, "@Stage8Sts", ie.Stage8Status);
                AddParameter(cmd, "@Stage8Date", ie.Stage8Date);
                AddParameter(cmd, "@Stage8User", ie.Stage8User);
                //AddParameter(cmd, "@StageID", ie.StageID);
                AddParameter(cmd, "@IsFinished", ie.IsFinished);
                AddParameter(cmd, "@CurrentStage", ie.CurrentStage);
                AddParameter(cmd, "@NotiUserID", ie.NotiUserID);

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                cmd.Connection.Close();
            }
        }
        public DataTable Instruction_Edit(Instructions_Entity ie)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Instruction_Select", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@ID", ie.ID);
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

        public DataTable Instruction_Search(Instructions_Entity ie)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Instruction_Search", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@Form", ie.Form);
            //AddParameter(cmd, "@FormType", ie.FormType);
            //AddParameter(cmd, "@FormNo", ie.FormNo);
            AddParameter(cmd, "@StartDate", ie.StartDate);
            AddParameter(cmd, "@EndDate", ie.EndDate);
            AddParameter(cmd, "@Suppliername", ie.Suppliername);
            AddParameter(cmd, "@BrandName", ie.BrandName);
            AddParameter(cmd, "@Category", ie.Categ);
            AddParameter(cmd, "@ApplyType", ie.ApplyType);
            AddParameter(cmd, "@MD_Management", ie.MD_Management);
            AddParameter(cmd, "@IsFinished", ie.IsFinished);

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
      
        public DataTable Instruction_Access(Instructions_Entity ie)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Instruction_Access", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            //AddParameter(cmd, "@FormID", ie.FormID);
            AddParameter(cmd, "@UserID", ie.UserID);
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
        public DataTable Instruction_Copy(Instructions_Entity ie)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("Copy_Control", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            AddParameter(cmd, "@FormNo", ie.FormNo);
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
        public DataTable Instruction_Email(string crt)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("User_SendEmail", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            //AddParameter(cmd, "@FormNo", ie.FormNo);
            AddParameter(cmd, "@Current_Stage", crt);
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
        public DataTable Instruction_retrieve(string crt)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("User_SendEmail_retrieve", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            //AddParameter(cmd, "@FormNo", ie.FormNo);
            AddParameter(cmd, "@Current_ID", crt.Replace("S","").Replace("H",""));
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
        public DataTable retrieve_file(string fno)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("select_uploadfile", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            //AddParameter(cmd, "@FormNo", ie.FormNo);
            AddParameter(cmd, "@formno", fno);
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
        public bool delete_Ufile(string fn)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("remove_upload", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection.Open();
            AddParameter(cmd, "@form_no", fn);
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            return true;
        }

    }
}
