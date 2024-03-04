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
    public partial class SpecialPrice_Type_Entry : System.Web.UI.Page
    {
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
        private void BindGrid()
        {
            //SpecialPriceType_BL sptBL = new SpecialPriceType_BL();
            //DataTable dt = sptBL.SpecialPriceType_SelectAll();
            //if (dt.Rows.Count <= 0)
            //{
            //    DataRow dr = dt.NewRow();
            //    dr["Description"] = string.Empty;
            //    dt.Rows.Add(dr);
            //}
            //lblrowCount.Text = Convert.ToString(dt.Rows.Count);
            //gvSpecialPriceType.DataSource = dt;
            //gvSpecialPriceType.DataBind();
            //Search();
        }
        protected void txtPereference_OnTextChanged(object sender, EventArgs e)
        {
            TextBox txt = sender as TextBox;
            GridViewRow row = txt.Parent.NamingContainer as GridViewRow;
            Label lbl = gvSpecialPriceType.Rows[row.RowIndex].FindControl("lblID") as Label;
            string s = Session["UserID"].ToString();
            string updatedBy = s.Split(',')[0];
            SpecialPriceType_BL bbl = new SpecialPriceType_BL();
            bbl.Special_UpdatePreference(lbl.Text, txt.Text, updatedBy);
            Search();
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            try
            {
            string id = lblDelID.Text;
            SpecialPriceType_BL sptBL = new SpecialPriceType_BL();

            if (sptBL.SpecialPriceType_Delete(id))
            {
                string msg = "特記フラグ" + lblDelDescription.Text + "を削除しました。";
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
        protected void btnGoto_Click(object sender, EventArgs e)
        {
            try
            {
            if (txtGoto.Text != "0")
            {
                if (!string.IsNullOrWhiteSpace(txtGoto.Text))
                {
                    gvSpecialPriceType.PageIndex = Convert.ToInt32(txtGoto.Text) - 1;
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

            string msg = "特記フラグ" + lbl.Text + "を削除しますか？";
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
            gvSpecialPriceType.PageIndex = 0;
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
            SpecialPriceType_BL sbl = new SpecialPriceType_BL();
            Stage_Entity se = new Stage_Entity();
            dt = sbl.Special_DescriptionSelect(se);

            if (dt.Rows.Count > 0)
            {
                string search = string.Empty;
                if (!string.IsNullOrWhiteSpace(txtSiteIDSearch2.Text))
                    search = "Description LIKE '%" + txtSiteIDSearch2.Text + "%'";

                gvSpecialPriceType.DataSource = dt;
                dt.DefaultView.RowFilter = search;
                lblrowCount.Text = dt.DefaultView.Count.ToString();
                gvSpecialPriceType.DataBind();


                TextBox txt = gvSpecialPriceType.FooterRow.FindControl("txtFooterPreference") as TextBox;
                txt.Text = (Convert.ToInt32(dt.Rows[dt.Rows.Count - 1]["Preference"]) + 1).ToString(); ;
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


        protected void btnSave_Click(object sender, EventArgs e)
        {
            try{
            SpecialPriceType_BL sptBL = new SpecialPriceType_BL();
            HtmlAnchor a = sender as HtmlAnchor;
            GridViewRow row = a.NamingContainer as GridViewRow;
            TextBox txt = gvSpecialPriceType.FooterRow.FindControl("txtDescription") as TextBox;
            Label lblID = gvSpecialPriceType.FooterRow.FindControl("lblFooterID") as Label;


            if (string.IsNullOrWhiteSpace(txt.Text))
            {
                ShowMessage("仕入先を入力してください。");
            }
            else if (sptBL.SpecialPriceType_IsExists(txt.Text, lblID.Text))
            {
                ShowMessage("特記フラグ is Alerady Exists！");
            }
            else
            {
                Label lbl = gvSpecialPriceType.FooterRow.FindControl("lblSave") as Label;

                string s = Session["UserID"].ToString();
                int i = Convert.ToInt16(s.Split(',')[0]);
                string pre = (gvSpecialPriceType.FooterRow.FindControl("txtFooterPreference") as TextBox).Text;
                if (string.IsNullOrWhiteSpace(pre))
                    pre = "0";


                if (lbl.Text.Contains("登録"))
                {
                    //string s = Session["UserID"].ToString();
                    //int i = Convert.ToInt16(s.Split(',')[0]);
                    if (sptBL.SpecialPriceType_Insert(txt.Text, Convert.ToInt32(pre), i))
                    {
                        string msg = txt.Text + "を登録しました。";
                        ShowMessage(msg);
                        Search();
                    }
                }
                else
                {
                    //string s = Session["UserID"].ToString();
                    //int i = Convert.ToInt16(s.Split(',')[0]);
                    if (sptBL.SpecialPriceType_Update(Convert.ToInt32(pre), txt.Text, lblID.Text, i))
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
            Label lblFooterID = gvSpecialPriceType.FooterRow.FindControl("lblFooterID") as Label;

            lblFooterID.Text = lblID.Text;

            TextBox txtPre = row.FindControl("txtPreference") as TextBox;
            TextBox txtFooterPre = gvSpecialPriceType.FooterRow.FindControl("txtFooterPreference") as TextBox;
            txtFooterPre.Attributes.Add("onfocus", "javascript:select();");
            txtFooterPre.Text = txtPre.Text;

            Label lbl = row.FindControl("lblDescription") as Label;

            TextBox txt = gvSpecialPriceType.FooterRow.FindControl("txtDescription") as TextBox;
            txt.Text = lbl.Text;
            txt.Attributes.Add("onfocus", "javascript:select();");
            txt.Focus();

            lbl = gvSpecialPriceType.FooterRow.FindControl("lblSave") as Label;
            lbl.Text = " 更新";

            a = gvSpecialPriceType.FooterRow.FindControl("btnCancel") as HtmlAnchor;
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

            TextBox txt = gvSpecialPriceType.FooterRow.FindControl("txtDescription") as TextBox;
            txt.Text = string.Empty;

            txt = gvSpecialPriceType.FooterRow.FindControl("txtFooterPreference") as TextBox;
            txt.Text = string.Empty;

            a.Visible = false;

            Label lbl = gvSpecialPriceType.FooterRow.FindControl("lblSave") as Label;
            lbl.Text = " 登録";

            SpecialPriceType_BL sptBL = new SpecialPriceType_BL();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        //Pageindex
        protected void gvSpecialPriceType_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
       
            gvSpecialPriceType.PageIndex = e.NewPageIndex;
            Search();
            //gvSpecialPriceType.DataBind();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
    }
}
            