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
namespace SalesPrice.Setting
{
    public partial class Category_Entry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    BindGrid();
                }
                catch (Exception ex)
                {
                    error_check ec = new error_check();
                    ec.send_Exce_to_DB(ex);
                }
            }
        }
        private void BindGrid()
        {
            try
            {
                Category_BL applyBl = new Category_BL();
                //DataTable dt = applyBl.ApplyType_Select();
                DataTable dt = applyBl.Category_Select();
                if (dt.Rows.Count <= 0)
                {
                    DataRow dr = dt.NewRow();
                    dr["Description"] = string.Empty;
                    dt.Rows.Add(dr);
                }

                lblrowCount.Text = Convert.ToString(dt.Rows.Count);
                gvApplyType.DataSource = dt;
                gvApplyType.DataBind();
                Search();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
      

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string id = lblDelID.Text;
                Category_BL sbl = new Category_BL();

                if (sbl.Category_Delete(id))
                {
                    string msg = "申請区分" + lblDelDescription.Text + "を削除しました。";
                    ShowMessage(msg);
                    BindGrid();
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

                string msg = "申請区分" + lbl.Text + "を削除しますか？";
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
                gvApplyType.PageIndex = 0;
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
                Category_BL abl = new Category_BL();
                Stage_Entity se = new Stage_Entity();
                dt = abl.Category_DescriptionSelect(se);

                if (dt.Rows.Count > 0)
                {
                    string search = string.Empty;
                    if (!string.IsNullOrWhiteSpace(txtSiteIDSearch2.Text))
                        search = "Description LIKE '%" + txtSiteIDSearch2.Text + "%'";

                    gvApplyType.DataSource = dt;
                    dt.DefaultView.RowFilter = search;
                    lblrowCount.Text = dt.DefaultView.Count.ToString();
                    gvApplyType.DataBind();

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
            txtSiteIDSearch2.Text = string.Empty;

        }

        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        Apply_TypeBL sbl = new Apply_TypeBL();
        //        HtmlAnchor a = sender as HtmlAnchor;
        //        GridViewRow row = a.NamingContainer as GridViewRow;
        //        TextBox txt = gvApplyType.FooterRow.FindControl("txtDescription") as TextBox;
        //        Label lblID = gvApplyType.FooterRow.FindControl("lblFooterID") as Label;

        //        if (string.IsNullOrWhiteSpace(txt.Text))
        //        {
        //            ShowMessage("仕入先を入力してください。");
        //        }
        //        else if (sbl.ApplyType_IsExists(txt.Text, lblID.Text))
        //        {
        //            ShowMessage("申請区分 is Alerady Exists！");
        //        }
        //        else
        //        {
        //            Label lbl = gvApplyType.FooterRow.FindControl("lblSave") as Label;

        //            if (lbl.Text.Contains("登録"))
        //            {
        //                string s = Session["UserID"].ToString();
        //                int i = Convert.ToInt16(s.Split(',')[0]);
        //                if (sbl.ApplyType_Insert(txt.Text, i))
        //                {
        //                    string msg = txt.Text + "を登録しました。";
        //                    ShowMessage(msg);
        //                    BindGrid();
        //                }
        //            }
        //            else
        //            {
        //                string s = Session["UserID"].ToString();
        //                int i = Convert.ToInt16(s.Split(',')[0]);
        //                if (sbl.ApplyType_Update(txt.Text, lblID.Text, i))
        //                {
        //                    string msg = txt.Text + "に更新しました。";
        //                    ShowMessage(msg);
        //                    BindGrid();
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        error_check ec = new error_check();
        //        ec.send_Exce_to_DB(ex);
        //    }
        //}
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Category_BL sbl = new Category_BL();
                HtmlAnchor a = sender as HtmlAnchor;
                GridViewRow row = a.NamingContainer as GridViewRow;
                TextBox txt = gvApplyType.FooterRow.FindControl("txtDescription") as TextBox;
                Label lblID = gvApplyType.FooterRow.FindControl("lblFooterID") as Label;

                if (string.IsNullOrWhiteSpace(txt.Text))
                {
                    ShowMessage("仕入先を入力してください。");
                }
                else if (sbl.Category_IsExists(txt.Text, lblID.Text))
                {
                    ShowMessage("申請区分 is Alerady Exists！");
                }
                else
                {
                    Label lbl = gvApplyType.FooterRow.FindControl("lblSave") as Label;

                    if (lbl.Text.Contains("登録"))
                    {
                        string s = Session["UserID"].ToString();
                        int i = Convert.ToInt16(s.Split(',')[0]);
                        if (sbl.Category_Insert(txt.Text, i))
                        {
                            string msg = txt.Text + "を登録しました。";
                            ShowMessage(msg);
                            BindGrid();
                        }
                    }
                    else
                    {
                        string s = Session["UserID"].ToString();
                        int i = Convert.ToInt16(s.Split(',')[0]);
                        if (sbl.Category_Update(txt.Text, lblID.Text, i))
                        {
                            string msg = txt.Text + "に更新しました。";
                            ShowMessage(msg);
                            BindGrid();
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
                Label lblFooterID = gvApplyType.FooterRow.FindControl("lblFooterID") as Label;

                lblFooterID.Text = lblID.Text;

                Label lbl = row.FindControl("lblDescription") as Label;

                TextBox txt = gvApplyType.FooterRow.FindControl("txtDescription") as TextBox;
                txt.Text = lbl.Text;
                txt.Attributes.Add("onfocus", "javascript:select();");
                txt.Focus();

                lbl = gvApplyType.FooterRow.FindControl("lblSave") as Label;
                lbl.Text = " 更新";

                a = gvApplyType.FooterRow.FindControl("btnCancel") as HtmlAnchor;
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
            HtmlAnchor a = sender as HtmlAnchor;

            TextBox txt = gvApplyType.FooterRow.FindControl("txtDescription") as TextBox;
            txt.Text = string.Empty;

            a.Visible = false;

            Label lbl = gvApplyType.FooterRow.FindControl("lblSave") as Label;
            lbl.Text = " 登録";

            Suppliers_BL sbl = new Suppliers_BL();
        }
        protected void gvApplyType_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                Search();
                gvApplyType.PageIndex = e.NewPageIndex;
                gvApplyType.DataBind();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        protected void btnGoto_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtGoto.Text != "0")
                {
                    if (!string.IsNullOrWhiteSpace(txtGoto.Text))
                    {
                        gvApplyType.PageIndex = Convert.ToInt32(txtGoto.Text) - 1;
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
    }
}