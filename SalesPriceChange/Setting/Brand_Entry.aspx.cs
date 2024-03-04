using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SalesPriceChange_BL;
using System.Data;
using System.Web.UI.HtmlControls;
using SalesPriceChange_Common;
using System.Web.Services;
using System.IO;
using System.Data.OleDb;

namespace SalesPrice.Setting
{
    public partial class Brand_Entry : System.Web.UI.Page
    {
        string path = string.Empty;
        string xml = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {           
            if (!IsPostBack)
            {
                try
                {
                    Search();
                }
                catch (Exception ex)
                {
                    error_check ec = new error_check();
                    ec.send_Exce_to_DB(ex);
                }
            }
        }

        protected void txtPereference_OnTextChanged(object sender, EventArgs e)
        {
            TextBox txt = sender as TextBox;
            GridViewRow row = txt.Parent.NamingContainer as GridViewRow;
            Label lbl = gvBrand.Rows[row.RowIndex].FindControl("lblID") as Label;
            string s = Session["UserID"].ToString();
            string updatedBy = s.Split(',')[0];
            Brand_BL bbl = new Brand_BL();
            bbl.Brand_UpdatePreference(lbl.Text, txt.Text, updatedBy);              
            Search();
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            try
            {
            string id = lblDelID.Text;
            Brand_BL brandBL = new Brand_BL();

            if (brandBL.Brand_Delete(id))
            {
                string msg = "ブランド" + lblDelDescription.Text + "を削除しました。";
                ShowMessage(msg);
                Search();
            }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                HtmlAnchor a = sender as HtmlAnchor;
                GridViewRow row = a.NamingContainer as GridViewRow;
                Label lbl = row.FindControl("lblDescription") as Label;
                Label lblID = row.FindControl("lblID") as Label;

                lblDelID.Text = lblID.Text;
                lblDelDescription.Text = lbl.Text;

                string msg = "ブランド" + lbl.Text + "を削除しますか？";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal1('" + msg + "');", true);
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                gvBrand.PageIndex = 0;
                Search();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        private void Search()
        {
            try
            {
                DataTable dt = new DataTable();
                Brand_BL bbl = new Brand_BL();
                Stage_Entity se = new Stage_Entity();
                dt = bbl.Brand_DescriptionSelect(se);

                if (dt.Rows.Count > 0)
                {
                    string search = string.Empty;
                    if (!string.IsNullOrWhiteSpace(txtSiteIDSearch2.Text))
                        search = "Description LIKE '%" + txtSiteIDSearch2.Text + "%'";

                    gvBrand.DataSource = dt;
                    dt.DefaultView.RowFilter = search;
                    lblrowCount.Text = dt.DefaultView.Count.ToString();
                    gvBrand.DataBind();

                    TextBox txt = gvBrand.FooterRow.FindControl("txtFooterPreference") as TextBox;
                    txt.Text = (Convert.ToInt32(dt.Rows[dt.Rows.Count - 1]["Preference"]) + 1).ToString(); 
                }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        public void Clear()
        {
            txtSiteIDSearch2.Text = "";
        }
       
        protected void btnGoto_Click(object sender, EventArgs e)
        {
            try
            {
            if (txtGoto.Text != "0")
            {
                if (!string.IsNullOrWhiteSpace(txtGoto.Text))
                {
                    gvBrand.PageIndex = Convert.ToInt32(txtGoto.Text) - 1;
                    txtGoto.Text = string.Empty;
                    Search();
                }
            }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
            Brand_BL brandBL = new Brand_BL();
            HtmlAnchor a = sender as HtmlAnchor;
            GridViewRow row = a.NamingContainer as GridViewRow;
            TextBox txt = gvBrand.FooterRow.FindControl("txtDescription") as TextBox;
            Label lblID = gvBrand.FooterRow.FindControl("lblFooterID") as Label;


            if (string.IsNullOrWhiteSpace(txt.Text))
            {
                ShowMessage("仕入先を入力してください。");
            }
            else if (brandBL.Brand_IsExists(txt.Text, lblID.Text))
            {
                ShowMessage("ブランド is Alerady Exists！");
            }
            else
            {
                Label lbl = gvBrand.FooterRow.FindControl("lblSave") as Label;
                string s = Session["UserID"].ToString();
                int i = Convert.ToInt16(s.Split(',')[0]);
                string pre = (gvBrand.FooterRow.FindControl("txtFooterPreference") as TextBox).Text;
                if (string.IsNullOrWhiteSpace(pre))
                    pre = "0";

                if (lbl.Text.Contains("登録"))
                {                   
                    if (brandBL.Brand_Insert(txt.Text,Convert.ToInt32(pre), i))
                    {
                        string msg = txt.Text + "を登録しました。";
                        ShowMessage(msg);
                        Search();
                    }
                }
                else
                {
                    if (brandBL.Brand_Update(Convert.ToInt32(pre),txt.Text, lblID.Text, i))
                    {
                        string msg = txt.Text + "に更新しました。";
                        ShowMessage(msg);
                        Search();
                    }
                }
            }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        private void ShowMessage(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('" + msg + "');", true);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
            HtmlAnchor a = sender as HtmlAnchor;
            GridViewRow row = a.NamingContainer as GridViewRow;

            Label lblID = row.FindControl("lblID") as Label;
            Label lblFooterID = gvBrand.FooterRow.FindControl("lblFooterID") as Label;

            lblFooterID.Text = lblID.Text;

            TextBox txtPre = row.FindControl("txtPreference") as TextBox;
            TextBox txtFooterPre = gvBrand.FooterRow.FindControl("txtFooterPreference") as TextBox;
            txtFooterPre.Attributes.Add("onfocus", "javascript:select();");
            txtFooterPre.Text = txtPre.Text;

            Label lbl = row.FindControl("lblDescription") as Label;

            TextBox txt = gvBrand.FooterRow.FindControl("txtDescription") as TextBox;
            txt.Text = lbl.Text;
            txt.Attributes.Add("onfocus", "javascript:select();");
            txt.Focus();

            lbl = gvBrand.FooterRow.FindControl("lblSave") as Label;
            lbl.Text = " 更新";

            a = gvBrand.FooterRow.FindControl("btnCancel") as HtmlAnchor;
            a.Visible = true;
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                HtmlAnchor a = sender as HtmlAnchor;
                TextBox txt = gvBrand.FooterRow.FindControl("txtDescription") as TextBox;
                txt.Text = string.Empty;

                txt = gvBrand.FooterRow.FindControl("txtFooterPreference") as TextBox;
                txt.Text = string.Empty;

                a.Visible = false;

                Label lbl = gvBrand.FooterRow.FindControl("lblSave") as Label;
                lbl.Text = " 登録";

                Brand_BL brandBL = new Brand_BL();
                }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        //Pageindex
        protected void gvBrand_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvBrand.PageIndex = e.NewPageIndex;
                Search();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        private void ExcelToDataTable()
        {
            DataTable dt = new DataTable();
            DataTable dt_import = new DataTable();
            Brand_BL bbl = new Brand_BL();
            dt = ConvertExcelToDataTable();
            int Pre = 0;
            DataTable preference = new DataTable();
            preference = bbl.PreferenceMax_Select();
            if (preference.Rows.Count > 0)
            {
                Pre = Convert.ToInt32(preference.Rows[0]["Preference"]);
            }
            else
            {
                Pre = 0;
            }
            dt_import.Columns.Add("Preference");
            dt_import.Columns.Add("IsDeleted");
            dt_import.Columns.Add("BrandName");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt_import.Rows.Add();
                Pre = Pre + 1;
                dt_import.Rows[i]["BrandName"] = dt.Rows[i]["Brand Name"];
                dt_import.Rows[i]["Preference"] = Pre;
                dt_import.Rows[i]["IsDeleted"] = 0;

            }
            xml = DataTableToXml(dt_import);
            if (!bbl.Brand_InsertXML(xml))
            {
                string message = "Import Fail! Try Again!";
                ShowMessage(message);
            }
            else
            {
                Search();
                string message = "Import Successfully!";
                ShowMessage(message);
            }
        }

        public DataTable ConvertExcelToDataTable()
        {

            DataTable result = null;

            string sheetName = "Sheet1$";
            using (OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source= " + Server.MapPath(Path.Combine("~/Import/", fileupload1.Value)) + ";Extended Properties='Excel 12.0;HDR=YES;IMEX=1;';"))
            {
                con.Open();
                OleDbCommand cmd = new OleDbCommand();
                OleDbDataAdapter oleda = new OleDbDataAdapter();
                DataSet ds = new DataSet();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Select * from [" + sheetName + "]";
                oleda = new OleDbDataAdapter(cmd);
                oleda.Fill(ds, "exceldata");
                result = ds.Tables["exceldata"];

                con.Close();
                return result;
            }
        }

        protected String DataTableToXml(DataTable dt)
        {
            dt.TableName = "test";
            System.IO.StringWriter writer = new System.IO.StringWriter();
            dt.WriteXml(writer, XmlWriteMode.WriteSchema, false);
            string result = writer.ToString();
            return result;
        }

        protected void btnImport_ServerClick(object sender, EventArgs e)//For 取込み Button
        {
            if (!string.IsNullOrWhiteSpace(fileupload1.Value))
            {
                fileupload1.PostedFile.SaveAs(Server.MapPath(Path.Combine("~/Import/", fileupload1.Value)));
                ExcelToDataTable();
            }
        }
    }
}