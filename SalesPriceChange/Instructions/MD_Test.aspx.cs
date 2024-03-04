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
using System.Configuration;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Specialized;
using System.Text;
using System.Data.SqlClient;
namespace SalesPrice.Instructions
{
    public partial class MD_Test : System.Web.UI.Page
    {
        MDManagement_BL mbl;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
            //if (!Page.IsPostBack)
            //{
            //    SetInitialRow();
            //}
            searchPanel.Style.Add("display", "none");
            //txtAmount.Attributes.Add("onblur", this.Page.ClientScript.GetPostBackEventReference(this.btnTextBoxEventHandler, ""));
        }


        protected void btnTextBoxEventHandler_Click(object sender, EventArgs e)
        {
            //Place code here for onblur..
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //Search();
            searchPanel.Style.Add("display", "block");
            MD_search();

        }
        private void MD_search()
        {
            MD_Search_Entity mdsearch = getmd_search();
            MDManagement_BL mbl = new MDManagement_BL();
            DataTable dt = new DataTable();
            dt = mbl.md_search(mdsearch);
            gvMDManagement.DataSource = dt;
            gvMDManagement.DataBind();


        }
        private MD_Search_Entity getmd_search()
        {
            MD_Search_Entity mdsearch = new MD_Search_Entity();
            mdsearch.form_ID = form_ID.Text;
            mdsearch.stamp_ID = stamp_ID.Text;
            mdsearch.vendor_ID = vendor_ID.Text;
            return mdsearch;
        }

        private void BindGrid()
        {
            MDManagement_BL mbl = new MDManagement_BL();
            DataTable dt = mbl.MD_Management_SelectAll();

            gvMDManagement.DataSource = dt;
            gvMDManagement.DataBind();
        }
        private DataTable AddRow(DataTable dt, string rowNo, string del1, string pur1, string amt1)
        {
            dt.Rows.Add();
            dt.Rows[dt.Rows.Count - 1]["RowNo"] = rowNo;
            dt.Rows[dt.Rows.Count - 1]["Delivery"] = del1;
            dt.Rows[dt.Rows.Count - 1]["Purchase"] = pur1;
            dt.Rows[dt.Rows.Count - 1]["Amount"] = amt1;

            return dt;

        }
        protected void LinkButton12_Click(object sender, EventArgs e)
        {

            LinkButton lb = (LinkButton)sender;
            GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
            int rowID = gvRow.RowIndex + 1;
            if (ViewState["md_select"] != null)
            {
                DataTable dt = (DataTable)ViewState["md_select"];
                if (dt.Rows.Count > 1)
                {
                    if (gvRow.RowIndex < dt.Rows.Count - 1)
                    {
                        //Remove the Selected Row data
                        dt.Rows.Remove(dt.Rows[rowID]);
                    }
                }
                //Store the current data in ViewState for future reference
                ViewState["CurrentTable"] = dt;
                //Re bind the GridView for the updated data
                gv1.DataSource = dt;
                gv1.DataBind();
            }
            //Set Previous Data on Postbacks
            //SetPreviousData();
        }
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {


            DataTable dtre = new DataTable();
            for (int i = 0; i < gv1.Columns.Count; i++)
            {
                dtre.Columns.Add("column" + i.ToString());
            }
            foreach (GridViewRow row in gv1.Rows)
            {
                DataRow dr1 = dtre.NewRow();
                for (int j = 0; j < gv1.Rows.Count; j++)
                {
                    dr1["column0"] = "";
                    dr1["column1"] = (gv1.Rows[j].FindControl("dpDelivery") as TextBox).Text;

                    //(TextBox)rows.FindControl("grdtext");
                    dr1["column2"] = "";
                    dr1["column3"] = (gv1.Rows[j].FindControl("dpPurchase") as TextBox).Text;
                    dr1["column4"] = "";
                    dr1["column5"] = (gv1.Rows[j].FindControl("txtAmount") as TextBox).Text;
                    dr1["column6"] = "";

                }

                dtre.Rows.Add(dr1);
            }






            DataTable dtCurrentTable = (DataTable)ViewState["md_select"];

            string idplus = dtCurrentTable.Rows[Convert.ToInt32(dtCurrentTable.Rows.Count.ToString()) - 1]["ID"].ToString();
            DataRow dr = null;


            dr = dtCurrentTable.NewRow();
            string n = null;
            dr["ID"] = Convert.ToInt32(n) + Convert.ToInt32(idplus) + 1;
            dr["Delivery"] = string.Empty;
            dr["Purchase"] = string.Empty;
            dr["Amount"] = Convert.ToUInt32(null);
            dtCurrentTable.Rows.Add(dr);
            gv1.DataSource = dtCurrentTable;
            gv1.DataBind();
            ViewState["insertdt"] = dtCurrentTable;
        }
        //for row databound in gridview
        protected void MDGridView_RowDataBound(Object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Label txtFreqMiles = (Label)e.Row.FindControl("label");

                // At this point, you can change the value as normal
                //txtFreqMiles.Text = "";
            }
        }

        //for MD Edit Click 
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            HtmlAnchor a = sender as HtmlAnchor;
            GridViewRow row = a.NamingContainer as GridViewRow;

            Label lbl = row.FindControl("lblFormNo") as Label;
            txtFormNo.Text = lbl.Text;

            lbl = row.FindControl("lblStartDate") as Label;
            txtStartDate.Text = lbl.Text;

            lbl = row.FindControl("lblSupplier") as Label;
            txtSupplier.Text = lbl.Text;

            lbl = row.FindControl("lblBrand") as Label;
            txtBrand.Text = lbl.Text;

            lbl = row.FindControl("lblID") as Label;
            lblID.Text = lbl.Text;
            Session["lbl_Text"] = lblID.Text;

            mbl = new MDManagement_BL();
            //DataTable dt = mbl.MD_Management_SelectByID(lbl.Text);
            DataTable dtg = mbl.MD_selectg(lbl.Text);
            DataTable dt = mbl.MD_select(lbl.Text);
            object sumObject;
            sumObject = dt.Compute("Sum(Amount)", "");

            string taxExc = dtg.Rows[0]["MDTaxExclude"].ToString();
            string taxInc = dtg.Rows[0]["MDTaxInclude"].ToString();
            string process = dtg.Rows[0]["Process"].ToString();
            string remark = dtg.Rows[0]["Remark"].ToString();
            string exppro = dtg.Rows[0]["ExpProcess"].ToString();
            string balTax = dtg.Rows[0]["BalTaxInclude"].ToString();


            string result = sumObject.ToString();
            //if (string.IsNullOrEmpty(result) == true)
            //    {
            //        string res = result+ "0";

            //    }

            Session["resdown"] = result.ToString();

            taxExc = string.IsNullOrWhiteSpace(taxExc) ? "0" : taxExc;
            string resultlast = (Convert.ToInt32(taxExc) - Convert.ToInt32(result)).ToString();

            txtMDTaxExclude.Text = taxExc;
            txtMDTaxInclude.Text = taxInc;
            txtExpProcess.Text = exppro;
            txtRemark.Text = remark;
            txtBalTaxInclude.Text = resultlast;
            ddlProcess.Text = process;

            ViewState["md_select"] = dt;
            gv1.DataSource = dt;
            gv1.DataBind();
            lblSave.Text = "更新";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        private void Search()
        {
            DataTable dt = new DataTable();
            SellingPriceUnit_BL sbl = new SellingPriceUnit_BL();
            Stage_Entity se = new Stage_Entity();
            dt = sbl.Selling_DescriptionSelect(se);

            if (dt.Rows.Count > 0)
            {
                string search = string.Empty;
                if (!string.IsNullOrWhiteSpace(txtBalTaxInclude.Text))
                    search = "Description LIKE '%" + txtBalTaxInclude.Text + "%'";

                gvMDManagement.DataSource = dt;
                dt.DefaultView.RowFilter = search;
                gvMDManagement.DataBind();
            }
        }
        public void txtAmount_textchanged(object sender, EventArgs e)
        {
            GridViewRow currentRow = (GridViewRow)((TextBox)sender).Parent.Parent;
            TextBox txt = (TextBox)currentRow.FindControl("txtAmount");

            Int32 amt = string.IsNullOrWhiteSpace(txt.Text) ? 0 : Convert.ToInt32(txt.Text);
            //document.activeElement
            //GrandTotal();



        }
        //private void GrandTotal()
        //{
        //    float GTotal = 0;
        //    for (int i = 0; i < gv1.Rows.Count; i++)
        //    {
        //        //int total = Convert.ToInt32((gv1.Rows[i].FindControl("txtAmount") as TextBox).Text);
        //        int tt1 = string.IsNullOrWhiteSpace((gv1.Rows[i].FindControl("txtAmount") as TextBox).Text) ? 0 : Convert.ToInt32((gv1.Rows[i].FindControl("txtAmount") as TextBox).Text);

        //        GTotal += tt1;
        //    }
        //    int amt  = Convert.ToInt32 (GTotal.ToString());
        //    txtBalTaxInclude.Text = (Convert.ToInt32(txtMDTaxExclude.Text) - amt).ToString();
        //}
        //public void mdtax_TextChanged(object sender, EventArgs e)
        //{

        //    float GTotal = 0;
        //    for (int i = 0; i < gv1.Rows.Count; i++)
        //    {
        //        //int total = Convert.ToInt32((gv1.Rows[i].FindControl("txtAmount") as TextBox).Text);
        //        int tt1 = string.IsNullOrWhiteSpace((gv1.Rows[i].FindControl("txtAmount") as TextBox).Text) ? 0 : Convert.ToInt32((gv1.Rows[i].FindControl("txtAmount") as TextBox).Text);

        //        GTotal += tt1;
        //    }
        //    string totalresult = GTotal.ToString();

        //    int mdt = string.IsNullOrWhiteSpace(txtMDTaxExclude.Text) ? 0 : Convert.ToInt32(txtMDTaxExclude.Text);
        //    int mdte = (int)Math.Round(1.08 * ((mdt)));
        //    txtMDTaxInclude.Text = mdte.ToString();
        //    if (mdt == 0)
        //        txtMDTaxInclude.Text = string.Empty;
        //    //string nowhere = (Convert.ToInt32(Session["resdown"])).ToString();

        //    txtBalTaxInclude.Text = (mdt - Convert.ToInt32(totalresult)).ToString();


        //}
        protected void gvSellingPriceUnit_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DataTable dt = new DataTable();
            MDManagement_BL abl = new MDManagement_BL();
            Stage_Entity se = new Stage_Entity();
            dt = abl.MD_Management_SelectAll();

            if (dt.Rows.Count > 0)
            {
                string search = string.Empty;
                //if (!string.IsNullOrWhiteSpace(txtSiteIDSearch2.Text))
                //    search = "Description LIKE '%" + txtSiteIDSearch2.Text + "%'";
                gvMDManagement.PageIndex = e.NewPageIndex;
                gvMDManagement.DataSource = dt;
                dt.DefaultView.RowFilter = search;
                gvMDManagement.DataBind();
            }
            //gvSellingPriceUnit.PageIndex = e.NewPageIndex;
            //BindGrid();
        }

        private MDManagement_Entity GetData()
        {
            MDManagement_Entity me = new MDManagement_Entity();
            me.Instructions_ID = Convert.ToInt32(lblID.Text);
            if (!string.IsNullOrWhiteSpace(txtMDTaxExclude.Text))
                me.MDTaxExclude = Convert.ToInt32(txtMDTaxExclude.Text);
            else me.MDTaxExclude = null;

            if (!string.IsNullOrWhiteSpace(txtMDTaxInclude.Text))
                me.MDTaxInclude = Convert.ToInt32(txtMDTaxInclude.Text);
            else me.MDTaxInclude = null;

            me.Process = Convert.ToInt32(ddlProcess.SelectedValue);
            me.Remark = txtRemark.Text;
            me.ExpProcess = txtExpProcess.Text;

            if (!string.IsNullOrWhiteSpace(txtBalTaxInclude.Text))
                me.BalTaxInclude = Convert.ToInt32(txtBalTaxInclude.Text);
            else me.BalTaxInclude = null;

            me.Delivery1 = GetDeliveryFromGrid(1);
            me.Delivery2 = GetDeliveryFromGrid(2);
            me.Delivery3 = GetDeliveryFromGrid(3);
            me.Delivery4 = GetDeliveryFromGrid(4);
            me.Delivery5 = GetDeliveryFromGrid(5);
            me.Delivery6 = GetDeliveryFromGrid(6);
            me.Delivery7 = GetDeliveryFromGrid(7);
            me.Delivery8 = GetDeliveryFromGrid(8);
            me.Delivery9 = GetDeliveryFromGrid(9);
            me.Delivery10 = GetDeliveryFromGrid(10);
            me.Delivery11 = GetDeliveryFromGrid(11);
            me.Delivery12 = GetDeliveryFromGrid(12);
            me.Delivery13 = GetDeliveryFromGrid(13);
            me.Delivery14 = GetDeliveryFromGrid(14);
            me.Delivery15 = GetDeliveryFromGrid(15);
            me.Delivery16 = GetDeliveryFromGrid(16);
            me.Delivery17 = GetDeliveryFromGrid(17);
            me.Delivery18 = GetDeliveryFromGrid(18);
            me.Delivery19 = GetDeliveryFromGrid(19);
            me.Delivery20 = GetDeliveryFromGrid(20);

            me.Purchase1 = GetPurchaseFromGrid(1);
            me.Purchase2 = GetPurchaseFromGrid(2);
            me.Purchase3 = GetPurchaseFromGrid(3);
            me.Purchase4 = GetPurchaseFromGrid(4);
            me.Purchase5 = GetPurchaseFromGrid(5);
            me.Purchase6 = GetPurchaseFromGrid(6);
            me.Purchase7 = GetPurchaseFromGrid(7);
            me.Purchase8 = GetPurchaseFromGrid(8);
            me.Purchase9 = GetPurchaseFromGrid(9);
            me.Purchase10 = GetPurchaseFromGrid(10);
            me.Purchase11 = GetPurchaseFromGrid(11);
            me.Purchase12 = GetPurchaseFromGrid(12);
            me.Purchase13 = GetPurchaseFromGrid(13);
            me.Purchase14 = GetPurchaseFromGrid(14);
            me.Purchase15 = GetPurchaseFromGrid(15);
            me.Purchase16 = GetPurchaseFromGrid(16);
            me.Purchase17 = GetPurchaseFromGrid(17);
            me.Purchase18 = GetPurchaseFromGrid(18);
            me.Purchase19 = GetPurchaseFromGrid(19);
            me.Purchase20 = GetPurchaseFromGrid(20);

            me.Amount1 = GetAmountFromGrid(1);
            me.Amount2 = GetAmountFromGrid(2);
            me.Amount3 = GetAmountFromGrid(3);
            me.Amount4 = GetAmountFromGrid(4);
            me.Amount5 = GetAmountFromGrid(5);
            me.Amount6 = GetAmountFromGrid(6);
            me.Amount7 = GetAmountFromGrid(7);
            me.Amount8 = GetAmountFromGrid(8);
            me.Amount9 = GetAmountFromGrid(9);
            me.Amount10 = GetAmountFromGrid(10);
            me.Amount11 = GetAmountFromGrid(11);
            me.Amount12 = GetAmountFromGrid(12);
            me.Amount13 = GetAmountFromGrid(13);
            me.Amount14 = GetAmountFromGrid(14);
            me.Amount15 = GetAmountFromGrid(15);
            me.Amount16 = GetAmountFromGrid(16);
            me.Amount17 = GetAmountFromGrid(17);
            me.Amount18 = GetAmountFromGrid(18);
            me.Amount19 = GetAmountFromGrid(19);
            me.Amount20 = GetAmountFromGrid(20);

            return me;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            MDManagement_BL mdbl = new MDManagement_BL();
            int MD_ID_Delect = Convert.ToInt32(Session["lbl_Text"]);
            if (mdbl.MD_Delete(MD_ID_Delect))
            {


                for (int i = 0; i < gv1.Rows.Count; i++)
                {
                    //int mdt = string.IsNullOrWhiteSpace(txtMDTaxExclude.Text) ? 0 : Convert.ToInt32(txtMDTaxExclude.Text);
                    TextBox txtdp = gv1.Rows[i].FindControl("dpDelivery") as TextBox;
                    TextBox txtpu = gv1.Rows[i].FindControl("dpPurchase") as TextBox;
                    TextBox txtam = gv1.Rows[i].FindControl("txtAmount") as TextBox;
                    string dptxt = txtdp.Text;
                    string purtxt = txtpu.Text;
                    int amoutxt = Convert.ToInt32((string.IsNullOrWhiteSpace(txtam.Text) ? 0 : Convert.ToInt32(txtam.Text)).ToString());
                    int MD_Instruction_ID = Convert.ToInt32(Session["lbl_Text"]);

                    MDManagement_BL mbl = new MDManagement_BL();
                    //DataTable dt = mbl.MD_Management_SelectByID(lbl.Text);
                    if (mbl.MD_insert(MD_Instruction_ID, dptxt, purtxt, amoutxt))
                    {
                        //to do somethings


                    }
                    else
                    {
                        //to write somethings
                    }

                }
                string MDTax_Ex = (txtMDTaxExclude.Text.Replace(",", ""));
                string MDTax_In = (txtMDTaxInclude.Text.Replace(",", ""));
                string ddlPro = ddlProcess.SelectedItem.Value;
                string rem = txtRemark.Text;
                string expprocess = txtExpProcess.Text;
                string baltaxin = (txtBalTaxInclude.Text.Replace(",", ""));
                string up_ID = (Session["lbl_Text"]).ToString();

                MDManagement_BL mbln = new MDManagement_BL();
                if (mbln.MDUp_Update(up_ID, MDTax_Ex, MDTax_In, ddlPro, rem, expprocess, baltaxin))
                {
                    //do something
                }
            }
        }

        private string GetDeliveryFromGrid(int index)
        {
            DatePicker dp = gv1.Rows[index - 1].FindControl("dpDelivery") as DatePicker;
            return dp.Date;
        }

        private string GetPurchaseFromGrid(int index)
        {
            DatePicker dp = gv1.Rows[index - 1].FindControl("dpPurchase") as DatePicker;
            return dp.Date;
        }

        private int? GetAmountFromGrid(int index)
        {
            TextBox txt = gv1.Rows[index - 1].FindControl("txtAmount") as TextBox;
            if (!string.IsNullOrWhiteSpace(txt.Text))
                return Convert.ToInt32(txt.Text);
            else return null;
        }
    }
}