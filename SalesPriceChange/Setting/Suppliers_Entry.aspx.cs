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
    public partial class Suppliers_Entry : System.Web.UI.Page
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

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string id = lblDelID.Text;
                Suppliers_BL sbl = new Suppliers_BL();

                if (sbl.Suppliers_Delete(id))
                {
                    string msg = "仕入先" + lblDelDescription.Text + "を削除しました。";
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
                        gvSuppliers.PageIndex = Convert.ToInt32(txtGoto.Text) - 1;
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

        protected void txtPereference_OnTextChanged(object sender, EventArgs e)
        {
            TextBox txt = sender as TextBox;
            GridViewRow row = txt.Parent.NamingContainer as GridViewRow;
            Label lbl = gvSuppliers.Rows[row.RowIndex].FindControl("lblID") as Label;
            string s = Session["UserID"].ToString();
            string updatedBy = s.Split(',')[0];
            Suppliers_BL sbl = new Suppliers_BL();
            sbl.Suppliers_UpdatePreference(lbl.Text, txt.Text, updatedBy);       
            Search();
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

                string msg = "仕入先" + lbl.Text + "を削除しますか？";
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
                gvSuppliers.PageIndex = 0;
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
                Suppliers_BL sbl = new Suppliers_BL();
                Stage_Entity se = new Stage_Entity();
                dt = sbl.Suppliers_DescriptionSelect(se);

                if (dt.Rows.Count > 0)
                {
                    string search = string.Empty;
                    if (!string.IsNullOrWhiteSpace(txtSiteIDSearch2.Text))
                        search = "Description LIKE '%" + txtSiteIDSearch2.Text + "%'";

                    gvSuppliers.DataSource = dt;
                    dt.DefaultView.RowFilter = search;
                    lblrowCount.Text = dt.DefaultView.Count.ToString();
                    gvSuppliers.DataBind();

                    TextBox txt = gvSuppliers.FooterRow.FindControl("txtFooterPreference") as TextBox;
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
            try
            {
            Suppliers_BL sbl = new Suppliers_BL();
            HtmlAnchor a = sender as HtmlAnchor;
            GridViewRow row = a.NamingContainer as GridViewRow;
            TextBox txt = gvSuppliers.FooterRow.FindControl("txtDescription") as TextBox;
            Label lblID = gvSuppliers.FooterRow.FindControl("lblFooterID") as Label;

            if (string.IsNullOrWhiteSpace(txt.Text))
            {
                ShowMessage("仕入先を入力してください。");
            }
            else if (sbl.Supplier_IsExists(txt.Text, lblID.Text))
            {
                ShowMessage("仕入先 Alerady Exists！");
            }
            else
            {
                Label lbl = gvSuppliers.FooterRow.FindControl("lblSave") as Label;
                string s = Session["UserID"].ToString();
                int i = Convert.ToInt16(s.Split(',')[0]);
                string pre = (gvSuppliers.FooterRow.FindControl("txtFooterPreference") as TextBox).Text;

                if (lbl.Text.Contains("登録"))
                {
                    if (string.IsNullOrWhiteSpace(pre))
                        pre = "0";
                    if (sbl.Suppliers_Insert(pre,txt.Text, i))
                    {
                        string msg = txt.Text + "を登録しました。";
                        ShowMessage(msg);
                        Search();
                    }
                }
                else
                {
                    if (sbl.Suppliers_Update(pre,txt.Text, lblID.Text, i))
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
                Label lblFooterID = gvSuppliers.FooterRow.FindControl("lblFooterID") as Label;
                lblFooterID.Text = lblID.Text;

                TextBox txtPre = row.FindControl("txtPreference") as TextBox;
                TextBox txtFooterPre = gvSuppliers.FooterRow.FindControl("txtFooterPreference") as TextBox;
                txtFooterPre.Attributes.Add("onfocus", "javascript:select();");
                txtFooterPre.Text = txtPre.Text;

                Label lbl = row.FindControl("lblDescription") as Label;

                TextBox txt = gvSuppliers.FooterRow.FindControl("txtDescription") as TextBox;
                txt.Text = lbl.Text;
                txt.Attributes.Add("onfocus", "javascript:select();");
                txt.Focus();

                lbl = gvSuppliers.FooterRow.FindControl("lblSave") as Label;
                lbl.Text = " 更新";

                a = gvSuppliers.FooterRow.FindControl("btnCancel") as HtmlAnchor;
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

            TextBox txt = gvSuppliers.FooterRow.FindControl("txtDescription") as TextBox;
            txt.Text = string.Empty;

            txt = gvSuppliers.FooterRow.FindControl("txtFooterPreference") as TextBox;
            txt.Text = string.Empty;

            a.Visible = false;

            Label lbl = gvSuppliers.FooterRow.FindControl("lblSave") as Label;
            lbl.Text = " 登録";

        }
        //Pageindex
        protected void gvSuppliers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
            gvSuppliers.PageIndex = e.NewPageIndex;
            Search();          
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
    }
}
           