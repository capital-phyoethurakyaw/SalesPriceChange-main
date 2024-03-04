using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SalesPriceChange_BL;
using System.Data;
using SalesPriceChange_Common;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Configuration;
namespace SalesPrice.Supplementary_Control
{
    public partial class Supplementary_Control : System.Web.UI.Page
    {
        Supplementary_Control_BL scbl;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Div13.Disabled = true;
            //Div14.Disabled = true;
            //Div13.Attributes["class"] = Div13.Attributes["class"].Replace("form_date", "");
            //Div13.Attributes.Add("class", "form_date");
            if (!IsPostBack)
            {
                try{
                BindGrid();
                BindCombo();
                }
                catch (Exception ex)
                {
                    error_check ec = new error_check();
                    ec.send_Exce_to_DB(ex);
                }
            }
            searchPanel.Style.Add("display", "none");
            //Div13.Attributes.Add("class", "form_date");
            //Div13.Attributes["class"] = Div13.Attributes["class"].Replace("mone", "form_date");
            //Div15.Style.Add("Visibility", "hidden");
            
        }

        private void GetApplyNo()
        {
            try{
            Supplementary_Control_BL scbl = new Supplementary_Control_BL();
            txtApplyNo.Text = scbl.Supplementary_Control_GetApplyNo();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        private void BindBrand()
        {
            try
            {
            Brand_BL bbl = new Brand_BL();
            DataTable dt = bbl.Brand_SelectAll();
            ddlBrand.DataSource = dt;
            ddlBrand.DataTextField = "Description";
            ddlBrand.DataValueField = "ID";
            ddlBrand.DataBind();
            }

            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        private void BindCombo()
        {
            Suppliers_BL sbl = new Suppliers_BL();
            DataTable dtSupplier = sbl.Suppliers_SelectAll();
            ddlSupplier_Name.DataTextField = "Description";
            ddlSupplier_Name.DataValueField = "ID";
            ddlSupplier_Name.DataSource = dtSupplier;
            ddlSupplier_Name.DataBind();

            ddlSupplier.DataTextField = "Description";
            ddlSupplier.DataValueField = "ID";
            ddlSupplier.DataSource = dtSupplier;
            ddlSupplier.DataBind();
            //ddlSupplier.Items.Insert(0, "---選択---");
            //ddlSupplier.SelectedItem.Value = "0";
            
            Brand_BL bbl = new Brand_BL();
            DataTable dtBrand = bbl.Brand_SelectAll();
            ddlBrand_Name.DataTextField = "Description";
            ddlBrand_Name.DataValueField = "ID";
            ddlBrand_Name.DataSource = dtBrand;
            ddlBrand_Name.DataBind();

            ddlBrand.DataTextField = "Description";
            ddlBrand.DataValueField = "ID";
            ddlBrand.DataSource = dtBrand;
            ddlBrand.DataBind();
            //ddlBrand.Items.Insert(0, "---選択---");
            //ddlBrand.SelectedItem.Value = "0";

            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Description");
            dt.Rows.Add(new object[2] { "0", "現物" });
            dt.Rows.Add(new object[2] { "1", "値引伝票" });

            ddlSCompensation.DataTextField = "Description";
            ddlSCompensation.DataValueField = "ID";
            ddlSCompensation.DataSource = dt;
            ddlSCompensation.DataBind();

            ddlCompensationType.DataTextField = "Description";
            ddlCompensationType.DataValueField = "ID";
            ddlCompensationType.DataSource = dt;
            ddlCompensationType.DataBind();
           
            dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Description");
            dt.Rows.Add(new object[2] { "1", "未" });
            dt.Rows.Add(new object[2] { "0", "完了" });

            ddlSIsFinished.DataTextField = "Description";
            ddlSIsFinished.DataValueField = "ID";
            ddlSIsFinished.DataSource = dt;
            ddlSIsFinished.DataBind();

            ddlisFinished.DataTextField = "Description";
            ddlisFinished.DataValueField = "ID";
            ddlisFinished.DataSource = dt;
            ddlisFinished.DataBind();
        }

        private void BindSupplier()
        {
            try{
            Suppliers_BL sbl = new Suppliers_BL();
            DataTable dt = sbl.Suppliers_SelectAll();
            ddlSupplier.DataSource = dt;
            ddlSupplier.DataTextField = "Description";
            ddlSupplier.DataValueField = "ID";
            ddlSupplier.DataBind();
            }

            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        private void BindGrid()
        {

            //scbl = new Supplementary_Control_BL();
            //DataTable dt = scbl.Supplementary_Control_SelectAll();
            
            //lblrowCount.Text = Convert.ToString(dt.Rows.Count);
            //for (int i = 0; i < dt.Rows.Count; i++)
            //{
            //    try
            //    {
            //        if (string.IsNullOrEmpty(dt.Rows[i]["Amount"].ToString()))
            //        {
            //            dt.Rows[i]["Amount"] = "0";
            //        }
            //    }
            //    catch
            //    {
            //        dt.Rows[i]["Amount"] = "0";
            //    }
            //}
            //    gvSupplementary.DataSource = dt;
            //gvSupplementary.DataBind();
            Search();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
            BindSupplier();
            BindBrand();
            GetApplyNo();
            HtmlAnchor a = sender as HtmlAnchor;
            GridViewRow row = a.NamingContainer as GridViewRow;

            Label lbl = row.FindControl("lblApplyNo") as Label;
            txtApplyNo.Text = lbl.Text;

            lbl = row.FindControl("lblSuppliers_ID") as Label;

            if (!lbl.Text.Equals("0"))
                ddlSupplier.SelectedValue = lbl.Text;
            else ddlSupplier.SelectedIndex = 0;

            lbl = row.FindControl("lblBrandID") as Label;
            if (!lbl.Text.Equals("0"))
                ddlBrand.SelectedValue = lbl.Text;
            else
                ddlBrand.SelectedIndex = 0;

            lbl = row.FindControl("lblContent") as Label;
            txtContent.Text = lbl.Text;
            //txtContent.Text = gvSupplementary.Rows[].["Your Coloumn name"].Value.ToString();

            lbl = row.FindControl("lblAmount") as Label;
            txtAmount.Text = lbl.Text;

            lbl = row.FindControl("lblCompensationTypeID") as Label;
            if (!lbl.Text.Equals("-1"))
                ddlCompensationType.SelectedValue = lbl.Text;
            else
                ddlCompensationType.SelectedIndex = 0;

            lbl = row.FindControl("lblRemark") as Label;
            txtRemark.Text = lbl.Text;

            lbl = row.FindControl("lblProcessDate") as Label;
            txtProcessDate.Text = lbl.Text;

            lbl = row.FindControl("start_date") as Label;
            TextBox1.Text = lbl.Text;

            lbl = row.FindControl("end_date") as Label;
            TextBox2.Text = lbl.Text;

            lbl = row.FindControl("lblIsFinishedID") as Label;
            if (!lbl.Text.Equals("-1"))
                ddlisFinished.SelectedValue = lbl.Text;
            else
                ddlisFinished.SelectedIndex = 0;

            lbl = row.FindControl("lblID") as Label;
            lblID.Text = lbl.Text;

            lblSave.Text = "更新";




            //Response.Redirect(Request.RawUrl.ToString());

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        private Supplementary_Entity GetSearchData()
        {
            Supplementary_Entity se = new Supplementary_Entity();
            se.ApplyNo = txtSApplyNo.Text;
            se.SupplierName = string.IsNullOrWhiteSpace(ddlSupplier_Name.SelectedValue) ? "0" : ddlSupplier_Name.SelectedValue;
            se.BrandName = string.IsNullOrWhiteSpace(ddlBrand_Name.SelectedValue) ? "0" : ddlBrand_Name.SelectedValue;
            se.Content = txtSContent.Text;
            se.SAmount = txtSAmount.Text.Replace(",", string.Empty);
            se.CompensationType = string.IsNullOrWhiteSpace(ddlSCompensation.SelectedValue)?-1:Convert.ToInt32(ddlSCompensation.SelectedValue);
            se.Remark = txtSRemark.Text;
            se.pasdate = txtSDate.Text;
            se.IsFinished = string.IsNullOrWhiteSpace(ddlSIsFinished.SelectedValue) ? -1 : Convert.ToInt32(ddlSIsFinished.SelectedValue);
            se.Start_Date = Start_date.Text;
            se.End_Date = End_date.Text;
            se.updtd_Date = sugo_updated.Text;
            se.updtd_Date_End = sugo_updated_2.Text;
            se.chkBlank = chkBlank.Checked;
            return se;
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
            Search();
            searchPanel.Style.Add("display", "block");
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        private void Search()
        {

            Supplementary_Entity se = GetSearchData();
            Supplementary_Control_BL scbl = new Supplementary_Control_BL();
            DataTable dt = scbl.Supplementary_Control_Search(se);
            lblrowCount.Text = Convert.ToString(dt.Rows.Count);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                try
                {
                    if (string.IsNullOrEmpty(dt.Rows[i]["Amount"].ToString()))
                    {
                        dt.Rows[i]["Amount"] = "0";
                    }
                }
                catch
                {
                    dt.Rows[i]["Amount"] = "0";
                }
            }
            gvSupplementary.DataSource = dt;
            gvSupplementary.DataBind();
            ViewState["export"] = dt;//to save dt for export
           
            int t_ginko = 0;
            try
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    t_ginko = t_ginko + Convert.ToInt32(dt.Rows[i]["Amount"].ToString().Replace(",", string.Empty));
                }
            }
            catch
            {
            }
            lbl_ginko.Text = string.Format("{0:N0}", t_ginko);  
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "ShowPanel()", true);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try{
            Clear();
            BindSupplier();
            BindBrand();
            GetApplyNo();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            searchPanel.Style.Add("diaplay", "block");
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        private Supplementary_Entity GetData()
        {
            scbl = new Supplementary_Control_BL();
            Supplementary_Entity se = new Supplementary_Entity();
            se.ID = lblID.Text;
            se.ApplyNo = txtApplyNo.Text;

            if (ddlSupplier.SelectedItem.Value == "")
            {
                ddlSupplier.SelectedItem.Value = "0";
            }

            se.SupplierID = Convert.ToInt32(ddlSupplier.SelectedItem.Value);
            if (ddlBrand.SelectedItem.Value == "")
            {
                ddlBrand.SelectedItem.Value = "0";
            }

            se.BrandID = Convert.ToInt32(ddlBrand.SelectedItem.Value);
            se.Content = txtContent.Text;
            se.Amount = txtAmount.Text.Replace(",", string.Empty);

            if (ddlCompensationType.SelectedItem.Value == "")
            {
                ddlCompensationType.SelectedItem.Value = "-1";
            }


            se.CompensationType = Convert.ToInt32(ddlCompensationType.SelectedItem.Value);
            se.Remark = txtRemark.Text;
            se.ProcessDate = txtProcessDate.Text;


            if (ddlisFinished.SelectedItem.Value == "")
            {
                ddlisFinished.SelectedItem.Value = "-1";
            }

            se.IsFinished = Convert.ToInt32(ddlisFinished.SelectedItem.Value);
            string s = Session["UserID"].ToString();
            se.UpdatedBy =Convert.ToInt16(s.Split(',')[0]);

            se.start_text1 = TextBox1.Text;
            se.end_text2 = TextBox2.Text;

            return se;
        }
     
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
            if (lblSave.Text.Equals("登録"))
            {
                Supplementary_Entity se = GetData();
                string msg = string.Empty;
                if (scbl.Supplementary_Control_Save(se))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal1('登録できました。');", true);
                    Clear();
                    Search();
                }
                else
                    Search();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2('登録するとき失敗しました。');", true);
              
            }
            else
            {

                Supplementary_Entity se = GetData();
                string msg = string.Empty;
                //string s = Session["UserID"].ToString();
                //int i = Convert.ToInt16(s.Split(',')[0]);
                if (scbl.Supplementary_Control_Update(se))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal1('更新できました。');", true);
                    Clear();

                    BindGrid();
                }
                else
                {
                    BindGrid();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2('更新するとき失敗しました。');", true);
                }
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
            if (!string.IsNullOrWhiteSpace(txtgoto.Text))
            {
                gvSupplementary.PageIndex = Convert.ToInt32(txtgoto.Text) - 1;
                gvSupplementary.PageSize = Convert.ToInt32(ddlPageSize.Text);
                Search();
            }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        protected void gvSupplementary_Indexchanged(object sender, EventArgs e)
        {
            try
            {
            gvSupplementary.PageIndex = 0;
            gvSupplementary.PageSize = Convert.ToInt32(ddlPageSize.Text);
            Search();
            searchPanel.Style.Add("display", "none");
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
           
        protected void gvInstruction_paging(object sender, GridViewPageEventArgs e)
        {
            try
            {
            gvSupplementary.PageIndex = e.NewPageIndex;
            BindGrid();
            Search();
            searchPanel.Style.Add("display", "none");
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        private void Clear()
        {
            txtApplyNo.Text = string.Empty;
            ddlSupplier.SelectedIndex = 0;
            ddlBrand.SelectedIndex = 0;
            txtContent.Text = string.Empty;
            txtAmount.Text = string.Empty;
            ddlCompensationType.SelectedIndex = 0;
            txtRemark.Text = string.Empty;
            ddlisFinished.SelectedIndex = 0;
            lblSave.Text = "登録";
        }

        //mk-----2019-01-29----to export excel


        protected void export_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SupplementaryControlExport.xls");
            Response.ContentType = "application/vnd.ms-excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();

            HtmlTextWriter htw = new HtmlTextWriter(sw);
            DataTable dt = ViewState["export"] as DataTable;
            GridView dvexport = new GridView();

            dt.Columns.Remove("ID");
            //dt.Columns.Remove("Purchase");

            dt.Columns["ApplyNo"].ColumnName = "申請番号";
            dt.Columns["Supplier"].ColumnName = "仕入先";
            dt.Columns["Brand"].ColumnName = "ブランド";
            dt.Columns["Content"].ColumnName = "補填内容";
            dt.Columns["Start_Date"].ColumnName = "開始日";
            dt.Columns["End_Date"].ColumnName = "終了日";
            dt.Columns["Amount"].ColumnName = "金額";
            dt.Columns["Compensation_Type"].ColumnName = "補填種別";
            dt.Columns["Remark"].ColumnName = "備考";
            dt.Columns["Process_Date"].ColumnName = "納品書日";
            dt.Columns["IsFinished"].ColumnName = "補填完了日";
            dt.Columns["Updated_Date"].ColumnName = "すご楽処理日";


            DataView dv5 = new DataView(dt);

            DataTable dtnew = new DataTable();
            dtnew.Columns.Add("申請番号", typeof(String));
            dtnew.Columns.Add("仕入先", typeof(String));
            dtnew.Columns.Add("ブランド", typeof(String));
            dtnew.Columns.Add("補填内容", typeof(String));
            dtnew.Columns.Add("開始日", typeof(String));
            dtnew.Columns.Add("終了日", typeof(String));
            dtnew.Columns.Add("金額", typeof(String));
            dtnew.Columns.Add("補填種別", typeof(String));
            dtnew.Columns.Add("備考", typeof(String));
            dtnew.Columns.Add("納品書日", typeof(String));
            dtnew.Columns.Add("補填完了日", typeof(String));
            dtnew.Columns.Add("すご楽処理日", typeof(string));

            foreach (DataRow dr in dt.Rows)
            {
                dtnew.ImportRow(dr);
            }

            dvexport.DataSource = dtnew;
            dvexport.DataBind();

            dvexport.RenderControl(htw);

            Response.Write(sw.ToString());
            Response.End();
        }

        protected string comma_qoute(int input_value)
        {
            string value = string.Empty;
            try
            {
                value = string.Format("{0:n0}", Convert.ToInt32(input_value));
            }
            catch
            {
                value = input_value.ToString();
            }

            return value;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                HtmlAnchor a = sender as HtmlAnchor;
                GridViewRow row = a.NamingContainer as GridViewRow;
                Label lbl = row.FindControl("lblApplyNo") as Label;
                Label lblID = row.FindControl("lblID") as Label;

                lblDelID.Text = lblID.Text;
                lblDelDescription.Text = lbl.Text;

                string msg = "申請区分" + lbl.Text + "を削除しますか？";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('" + msg + "');", true);
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
                Supplementary_Control_BL scbl = new Supplementary_Control_BL();

                if (scbl.DeleteApplyNoById(Convert.ToInt32(id)))
                {
                    string msg = "申請区分" + lblDelDescription.Text + "を削除しました。";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal1('" + msg + "');", true);
                    Search();
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