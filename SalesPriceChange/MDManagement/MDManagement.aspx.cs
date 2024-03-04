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
using System.Web.Services;
using System.IO;
namespace SalesPrice.MDManagement
{
    public partial class MDManagement : System.Web.UI.Page
    {
        bool Isswitch_first = false;   // none zero

        bool Isswitch_second = false;  // none zero

     

        MDManagement_BL mbl;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                try
                {
                    BindGrid();
                    BindCombo();
                }
                catch (Exception ex)
                {
                    error_check ec = new error_check();
                    ec.send_Exce_to_DB(ex);
                }
               
            }
          
            //searchPanel.Style.Add("display", "none");
           
        }

        protected void Maintain_Panel() //Maintain Searching Panel While going to Paging
        {
            try
            {
                if (panel.Value == "0")
                {
                    //if (searchPanel.Attributes["style"].ToString().Contains("display:none;"))
                    //{
                        searchPanel.Style.Add("display", "none");
                    //}

                   
                }
                else
                {
                    searchPanel.Style.Add("display", "block");
                }
            }
            catch
            {
                //if (searchPanel.Attributes["style"].ToString().Contains("display:none;"))
                //{
                //if (panel.Value == "0")
                //{
                //    searchPanel.Style.Add("display", "none");
                //}

                ////}

                //else
                //{
                //    searchPanel.Style.Add("display", "block");
                //}

            }
        }

        [WebMethod]

        public   string  MyMethod(string name)
        {

            now(name);
            //return "Hello " + name;
            return "";
        }

        void now(string name)
        {
            if (name == "" || name == "block")
            {
                //Panel pn = new Panel();

                searchPanel.Style.Remove("display");
                searchPanel.Style.Add("display", "none");
            }
            else
            {
                searchPanel.Style.Remove("display");
                searchPanel.Style.Add("display", "block");
            }
        }

        protected void sdsds(Object sender, EventArgs e)
        { }

        protected void btnGoto_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtGoto.Text))
            {
                try
                {
                    gvMDManagement.PageIndex = Convert.ToInt32(txtGoto.Text) - 1;
                    gvMDManagement.PageSize = Convert.ToInt32(ddlPageSize.Text);
                    MD_search();
                    txtGoto.Text = string.Empty;
                }
                catch (Exception ex)
                {
                    error_check ec = new error_check();
                    ec.send_Exce_to_DB(ex);
                }
            }
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                gvMDManagement.PageIndex = 0;
                gvMDManagement.PageSize = Convert.ToInt32(ddlPageSize.Text);
                MD_search();
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
                gvMDManagement.PageIndex = 0;
                MD_search();
                searchPanel.Style.Add("display", "block");
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }

        }

     

        private MD_Search_Entity getmd_search()
        {     
            MD_Search_Entity mdsearch = new MD_Search_Entity();
            mdsearch.form_ID = form_ID.Text;
            mdsearch.stamp_ID = string.IsNullOrWhiteSpace(ddlBrand.SelectedValue)?0:Convert.ToInt32(ddlBrand.SelectedValue);
            mdsearch.vendor_ID = string.IsNullOrWhiteSpace(ddlSupplier.SelectedValue) ? 0 : Convert.ToInt32(ddlSupplier.SelectedValue);
            mdsearch.process_ddl = ddlsearch_process.SelectedIndex<=0?1:Convert.ToInt32(ddlsearch_process.SelectedValue);
            mdsearch.del_start1 = del_start.Text;
            mdsearch.del_end1 = del_end.Text;
            mdsearch.tax_accounting = txtAccounting.Text;
            //mdsearch.pur_start1 = pur_start.Text;
            //mdsearch.pur_end1 = pur_end.Text;
            mdsearch.Approv_Start = Appro_Start.Text;
            mdsearch.Approv_End = Appro_End.Text;
            mdsearch.pur_start1 = "";
            mdsearch.pur_end1 = "";

            mdsearch.Date_S1 = date_St.Text;
            mdsearch.Date_E1 = date_En.Text;
            return mdsearch;          
        }

        private void BindGrid()
        {
            MDManagement_BL mbl = new MDManagement_BL();
            DataTable dt = mbl.MD_Management_SelectAll();
            
            if (dt.Rows.Count > 0)
            {
                try{
                    int dosum;
                    int dosum_next;
                    dosum = Convert.ToInt32((dt.Compute("Sum(MDTaxExclude)", "")).ToString());
                    lblTotal_Results.Text = string.Format("{0:N0}", dosum);

                    dosum_next = Convert.ToInt32((dt.Compute("Sum(Expprocess)", "")).ToString());
                    lblTotal_Results_next.Text = string.Format("{0:N0}", dosum_next);

                lblrowCount.Text = dt.Rows.Count.ToString();
                //gvMDManagement.DataSource = dt;
                //gvMDManagement.DataBind();
                gvMDManagement.Font.Size = 10;
                MD_search();
                }
                catch (Exception ex)
                {
                    MD_search();
                    error_check ec = new error_check();
                    ec.send_Exce_to_DB(ex);
                }
            }
            else 
            {
                try
                {
                    lblrowCount.Text = "0";
                    gvMDManagement.DataSource = dt;
                    gvMDManagement.DataBind();
                    gvMDManagement.Font.Size = 10;        
                }
                catch (Exception ex)
                {
                    error_check ec = new error_check();
                    ec.send_Exce_to_DB(ex);
                }
            }
            //ViewState["export"] = dt;
        }

        private void BindCombo()
        {
            Suppliers_BL sbl = new Suppliers_BL();
            ddlSupplier.DataTextField = "Description";
            ddlSupplier.DataValueField = "ID";
            ddlSupplier.DataSource = sbl.Suppliers_SelectAll();
            ddlSupplier.DataBind();
           
            Brand_BL bbl = new Brand_BL();
            ddlBrand.DataTextField = "Description";
            ddlBrand.DataValueField = "ID";
            ddlBrand.DataSource = bbl.Brand_SelectAll();
            ddlBrand.DataBind();

            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Description");
            dt.Rows.Add(new object[2] { "2", "値引伝票" });
            dt.Rows.Add(new object[2] { "3", "現物補填" });

            ddlsearch_process.DataTextField = "Description";
            ddlsearch_process.DataValueField = "ID";
            ddlsearch_process.DataSource = dt;
            ddlsearch_process.DataBind();

            ddlProcess.DataTextField = "Description";
            ddlProcess.DataValueField = "ID";
            ddlProcess.DataSource = dt;
            ddlProcess.DataBind();

            DataTable dt_tax = new DataTable();
            dt_tax.Columns.Add("ID");
            dt_tax.Columns.Add("Values");

            dt_tax.Rows.Add(new object[2] { "0.1", "10%" });
            dt_tax.Rows.Add(new object[2] { "0.08", "8%" });

            ddlTex_Rate.DataTextField = "Values";
            ddlTex_Rate.DataValueField = "ID";
     
            ddlTex_Rate.DataSource = dt_tax;
            ddlTex_Rate.DataBind();
            
            
            
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

        protected void remove_Click(object sender, EventArgs e)
        {
            try
            {
                if (gv1.Rows.Count > 1)
                {

                    LinkButton lb = (LinkButton)sender;
                    GridViewRow gvRow = (GridViewRow)lb.NamingContainer;

                    DataTable dt = ViewState["md_select"] as DataTable;
                    dt.Rows.Clear();
                    dt.AcceptChanges();
                    int j = 0;
                    for (int i = 0; i < gv1.Rows.Count; i++)
                    {
                        if (i != gvRow.RowIndex)
                        {
                            TextBox txt = gv1.Rows[i].FindControl("dpDelivery") as TextBox;
                            dt.Rows.Add();

                            //txt = (0 + i).ToString();
                            //dt.Rows[j]["ID"] = (1 + j).ToString();

                            dt.Rows[j]["Delivery"] = txt.Text;

                            txt = gv1.Rows[i].FindControl("dpPurchase") as TextBox;
                            dt.Rows[j]["Purchase"] = txt.Text;

                            txt = gv1.Rows[i].FindControl("txtAmount") as TextBox;

                            if ((txt.Text.ToString()).Contains(","))
                            {
                                txt.Text = txt.Text.Replace(",", "");
                            }
                            dt.Rows[j]["Amount"] = string.IsNullOrWhiteSpace(txt.Text) ? "0" : txt.Text;
                            j++;
                        }
                    }
        
                    ViewState["md_select"] = dt;

                    gv1.DataSource = dt;
                    gv1.DataBind();
                }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            try{
            DataTable dt = ViewState["md_select"] as DataTable;
            dt.Rows.Clear();
            dt.AcceptChanges();
            for(int i =0;i<gv1.Rows.Count;i++)
            {
                TextBox txt = gv1.Rows[i].FindControl("dpDelivery") as TextBox;
                dt.Rows.Add();

                //txt = (0 + i).ToString();
                //dt.Rows[i]["ID"] = (1 + i).ToString();
              
                dt.Rows[i]["Delivery"] = txt.Text;

                txt = gv1.Rows[i].FindControl("dpPurchase") as TextBox;
                dt.Rows[i]["Purchase"] = txt.Text;

                txt = gv1.Rows[i].FindControl("txtAmount") as TextBox;
                if ((txt.Text.ToString()).Contains(","))
                {txt.Text= txt.Text.Replace(",",""); 
                }
                dt.Rows[i]["Amount"] = string.IsNullOrWhiteSpace(txt.Text.ToString())?"0":txt.Text;

            }
           //int rowcount = gv1.Rows.Count + 1;

            dt.Rows.Add();

            //dt.Rows[gv1.Rows.Count]["ID"] = rowcount.ToString();
            ViewState["md_select"] = dt;

            gv1.DataSource = dt;
            gv1.DataBind();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        //for MD Edit Click 
        protected void btnEdit_Click(object sender, EventArgs e)
        {   
            try{
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


            //dt.Columns.Add("ID", typeof(System.Int32));
            //dt.AcceptChanges();

            if (dt.Rows.Count == 0  || dt.Rows.Count < 0)
                {
                    dt.Rows.Add();
                }
          
            object sumObject;
            sumObject = (dt.Compute("Sum(Amount)", ""));
           
            string taxExc = dtg.Rows[0]["MDTaxExclude"].ToString();
            string taxInc = dtg.Rows[0]["MDTaxInclude"].ToString();
            string process = dtg.Rows[0]["Process"].ToString();
            string remark = dtg.Rows[0]["Remark"].ToString();
            string exppro = dtg.Rows[0]["ExpProcess"].ToString();
            string balTax = dtg.Rows[0]["BalTaxInclude"].ToString();
                
            string app_Datee = dtg.Rows[0]["Approval_Date"].ToString();
            //string result = string.Empty;
            //result = string.IsNullOrWhiteSpace(sumObject.ToString()) ? "0" : sumObject; 
            string result = sumObject.ToString();
            Session["resdown"] = result.ToString();

            taxExc = string.IsNullOrWhiteSpace(taxExc) ? "0" : taxExc;
            string resultlast = (Convert.ToInt32(taxExc) - Convert.ToInt32(string.IsNullOrEmpty(result) ? "0" : result)).ToString();
            
            txtMDTaxExclude.Text = taxExc;
          
            txtMDTaxInclude.Text = taxInc;

           
            var taxconvert8 = Math.Floor(Convert.ToDouble(taxExc) * 1.10).ToString();



            //string taxnearly8 = taxconvert8.Remove(taxconvert8.Length - 1, 1);
            string taxnearly8 = taxconvert8;
            //if (taxnearly8 == taxInc.Remove(taxInc.Length - 1, 1))
            if (taxnearly8 == taxInc)
            {

                foreach (ListItem listItem in ddlTex_Rate.Items)
                {
                    listItem.Selected = listItem.Value.Contains("0.1");
                }



            }
            else
            {
                foreach (ListItem listItem in ddlTex_Rate.Items)
                {
                    listItem.Selected = listItem.Value.Contains("0.08");
                }

            }
          

            ddlTex_Rate_Copy.Text = taxExc;//Khin Sandar
            txtExpProcess.Text = exppro;
            txtRemark.Text = remark;
            txtBalTaxInclude.Text = resultlast;
            if (process == "1")
            {
                process = "2";
            }
            if (!process.Equals("0"))
                ddlProcess.SelectedValue = process;
            else
                ddlProcess.SelectedIndex = -1;

            if (String.IsNullOrWhiteSpace(app_Datee))
            {
                txtAppro_Date.Text = string.Empty;
            }
            else
            {
                //DateTime date = DateTime.ParseExact(app_Datee, "M/d/yyyy h:m:s tt", System.Globalization.CultureInfo.InvariantCulture);
                //string formattedDate = date.ToString("yyyy/MM/dd");
                //txtAppro_Date.Text = formattedDate;
                txtAppro_Date.Text = app_Datee.Split(' ').First().ToString();
            }

            ViewState["md_select"] = dt;
            gv1.DataSource = dt;
            gv1.DataBind();
            lblSave.Text = "更新";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            HtmlAnchor a = sender as HtmlAnchor;
            GridViewRow row = a.NamingContainer as GridViewRow;
            Label lbl = row.FindControl("lblformno") as Label;
            Label lblID = row.FindControl("lblID") as Label;

            lblDelID.Text = lblID.Text;
            lblDelDescription.Text = lbl.Text;

            string msg =  lbl.Text + "を削除しますか？";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal1('" + msg + "');", true);
        }


        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string id = lblDelID.Text;

                //CostUnit_BL cbl = new CostUnit_BL();


                MDManagement_BL mbl = new MDManagement_BL();
                if (mbl.MDLined_Delete(id))
                {
                    string msg = lblDelDescription.Text + "を削除しました。";
                    ShowMessage(msg);
                    MD_search();
                }
            }
            catch (Exception ex)
            {
             
            }
        }
        private void ShowMessage(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal6('" + msg + "');", true);
        }


        private void Search()
        {
            try{
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
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        protected void gvSellingPriceUnit_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //Maintain_Panel();
            try
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
                MD_search();
            }
            //gvSellingPriceUnit.PageIndex = e.NewPageIndex;
            //BindGrid();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
            Maintain_Panel();

            //Maintain_Panel();
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

            me.Delivery1  = GetDeliveryFromGrid(1);
            me.Delivery2  = GetDeliveryFromGrid(2);
            me.Delivery3  = GetDeliveryFromGrid(3);
            me.Delivery4  = GetDeliveryFromGrid(4);
            me.Delivery5  = GetDeliveryFromGrid(5);
            me.Delivery6  = GetDeliveryFromGrid(6);
            me.Delivery7  = GetDeliveryFromGrid(7);
            me.Delivery8  = GetDeliveryFromGrid(8);
            me.Delivery9  = GetDeliveryFromGrid(9);
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
     
        public void btnUpdate_Click(object sender, EventArgs e)
        {
            #region old version
            //try
            //{
            //    //txtMDTaxInclude.Attributes.Add("ReadOnly", "false");
            //    string MDTax_In = (txtMDTaxInclude.Text).Contains(",") ? (txtMDTaxInclude.Text).Replace(",", "") : txtMDTaxInclude.Text;
            //    //txtMDTaxInclude.Attributes.Add("ReadOnly", "true");
            //    //Response.Redirect("~/MDManagement/MDManagement.aspx", false);
            //    MDManagement_BL mdbl = new MDManagement_BL();
            //    int MD_ID_Delect = Convert.ToInt32(Session["lbl_Text"]);
            //    if (mdbl.MD_Delete(MD_ID_Delect))
            //    {

            //        string MDTax_Ex = (txtMDTaxExclude.Text);
            //        string ddlPro = string.IsNullOrWhiteSpace(ddlProcess.SelectedItem.Value) ? "0" : ddlProcess.SelectedItem.Value;
            //        string rem = txtRemark.Text;
            //        string expprocess = txtExpProcess.Text;
            //        string baltaxin = (txtBalTaxInclude.Text.Replace(",", ""));
            //        string up_ID = (Session["lbl_Text"]).ToString();
            //        string app_Date = txtAppro_Date.Text.ToString();
            //        for (int i = 0; i < gv1.Rows.Count; i++)
            //        {
            //            //int mdt = string.IsNullOrWhiteSpace(txtMDTaxExclude.Text) ? 0 : Convert.ToInt32(txtMDTaxExclude.Text);
            //            TextBox txtdp = gv1.Rows[i].FindControl("dpDelivery") as TextBox;
            //            TextBox txtpu = gv1.Rows[i].FindControl("dpPurchase") as TextBox;
            //            TextBox txtam = gv1.Rows[i].FindControl("txtAmount") as TextBox;
            //            string dptxt = txtdp.Text;
            //            string purtxt = txtpu.Text;

            //            if (txtam.Text.ToString().Contains(","))
            //            {
            //                txtam.Text = txtam.Text.Replace(",", "");
            //            }
            //            int amoutxt = Convert.ToInt32((string.IsNullOrWhiteSpace(txtam.Text) ? 0 : Convert.ToInt32(txtam.Text)).ToString());

            //            int MD_Instruction_ID = Convert.ToInt32(Session["lbl_Text"]);

            //            MDManagement_BL mbl = new MDManagement_BL();
            //            //DataTable dt = mbl.MD_Management_SelectByID(lbl.Text);
            //            if (mbl.MD_insert(MD_Instruction_ID, dptxt, purtxt, amoutxt))
            //            {
            //                //to do somethings
            //                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2('Saved Successfully!');", true);
            //                //Response.Redirect("~/MDManagement/MDManagement.aspx", false);
            //            }

            //        }


            //        MDManagement_BL mbln = new MDManagement_BL();
            //        if (mbln.MDUp_Update(up_ID, MDTax_Ex, MDTax_In, ddlPro, rem, expprocess, baltaxin, app_Date))
            //        {
            //            //do something

            //        }

            //    }


            //    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal1('Saved Successfully!');", true);



            //    //Response.Write("<script>alert('Saved Successively');</script>");


            //    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal1('Saved Successfully!');", true);
            //    //System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Hello, an Alert')</SCRIPT>");
            //    BindGrid();
            //}
            #endregion

            #region new (Khin_Sandar_Thein)

            try
            {
                MDManagement_BL mdbl = new MDManagement_BL();
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Delivery");
                dt.Columns.Add("Purchase");
                dt.Columns.Add("Amount");
                dt.Columns.Add("MDTE");
                dt.Columns.Add("MDTI");
                dt.Columns.Add("process");
                dt.Columns.Add("Remark");
                dt.Columns.Add("Expp");
                dt.Columns.Add("BTI");
                dt.Columns.Add("app_Date");



                string MDTax_In = (txtMDTaxInclude.Text).Contains(",") ? (txtMDTaxInclude.Text).Replace(",", "") : txtMDTaxInclude.Text;
                int MD_ID_Delect = Convert.ToInt32(Session["lbl_Text"]);
                string MDTax_Ex = (txtMDTaxExclude.Text); string ddlPro = string.IsNullOrWhiteSpace(ddlProcess.SelectedItem.Value) ? "0" : ddlProcess.SelectedItem.Value;
                string rem = txtRemark.Text; string expprocess = txtExpProcess.Text;
                string baltaxin = (txtBalTaxInclude.Text.Replace(",", ""));
                string up_ID = (Session["lbl_Text"]).ToString();
                string app_Date = String.IsNullOrWhiteSpace(txtAppro_Date.Text)?null: txtAppro_Date.Text;


                int Total_TxtAmt = 0;
                int Final_BalanceTax = 0;
              

                for (int i = 0; i < gv1.Rows.Count; i++)
                {
                    TextBox txtdp = gv1.Rows[i].FindControl("dpDelivery") as TextBox;
                    TextBox txtpu = gv1.Rows[i].FindControl("dpPurchase") as TextBox;
                    TextBox txtam = gv1.Rows[i].FindControl("txtAmount") as TextBox;
                    string dptxt = String.IsNullOrWhiteSpace(txtdp.Text)?null:txtdp.Text;
                    string purtxt = String.IsNullOrWhiteSpace(txtpu.Text)?null:txtpu.Text;


                    if (txtam.Text.ToString().Contains(","))
                    {
                        txtam.Text = txtam.Text.Replace(",", "");
                    }

                    int amoutxt = Convert.ToInt32((string.IsNullOrWhiteSpace(txtam.Text) ? 0 : Convert.ToInt32(txtam.Text)).ToString());

                    DataRow rowi = dt.NewRow();
                    rowi["ID"] = MD_ID_Delect;
                    rowi["Delivery"] = dptxt;
                    rowi["Purchase"] = purtxt;
                    rowi["Amount"] = amoutxt;
                    rowi["MDTE"] = MDTax_Ex;
                    rowi["MDTI"] = MDTax_In;
                    rowi["process"] = ddlPro;
                    rowi["Remark"] = rem;
                    rowi["Expp"] = expprocess;
                    rowi["BTI"] = baltaxin;
                    rowi["app_Date"] = app_Date;
                    dt.Rows.Add(rowi);

                    Total_TxtAmt += amoutxt;

                }

               

                if (mdbl.MD_del_in_up(dt))
                {
                }

               

                BindGrid();

                ///to note updated data and time at log file
                Final_BalanceTax = String.IsNullOrWhiteSpace(MDTax_Ex) ? 0 : Convert.ToInt32(MDTax_Ex) - Total_TxtAmt;
                ConsoleWriteLine_Tofile(MD_ID_Delect, MDTax_Ex, MDTax_In, Final_BalanceTax);



            }

            #endregion 

          


            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        protected void export_Clickc(object sender, EventArgs e)
        {







            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=MD_managementExport.xls");
            Response.ContentType = "application/vnd.ms-excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();
           
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            DataTable dt = ViewState["export"] as DataTable;
            GridView dvexport = new GridView();
            //dvexport = (GridView)this.FindControl("gvMDManagement");

            dt.Columns.Remove("ID");
            dt.Columns.Remove("Purchase");


            dt.Columns["FormNo"].ColumnName = "申請番号";
            dt.Columns["StartDate"].ColumnName = "開始日";
            dt.Columns["Supplier"].ColumnName = "仕入先";
            dt.Columns["Brand"].ColumnName = "ブランド";
            dt.Columns["MDTaxExclude"].ColumnName = "MD金額(税抜)";
            dt.Columns["MDTaxInclude"].ColumnName = "MD金額(税込)";
            dt.Columns["Process"].ColumnName = "処理内容";
            dt.Columns["Remarks"].ColumnName = "備考";
            dt.Columns["Expprocess"].ColumnName = "経理処理";
            dt.Columns["BaltaxInclude"].ColumnName = "残額(税抜)";

            dt.Columns["Delivery"].ColumnName = "納品書日付";

            dt.Columns["Approval_Date"].ColumnName = "すご楽承認日";

            dt.Columns["Amount"].ColumnName = "金額（税抜)";


            DataView dv5 = new DataView(dt);
            DataTable dt5 = dv5.ToTable(false, "すご楽承認日");
            dt.Columns.Remove("すご楽承認日");
            //dt.Columns["Amount"].ColumnName = "すご楽承認日";

            DataColumn Col = dt.Columns.Add("すご楽承認日");
            Col.SetOrdinal(2);
            for (int i = 0; i < dt5.Rows.Count; i++)
            {
                dt.Rows[i]["すご楽承認日"] = dt5.Rows[i]["すご楽承認日"].ToString();
                //dtm.AcceptChanges();
            }



            DataTable dtnew = new DataTable();
            dtnew.Columns.Add("申請番号", typeof(String));
            dtnew.Columns.Add("開始日", typeof(String));
            dtnew.Columns.Add("すご楽承認日", typeof(String));
            dtnew.Columns.Add("仕入先", typeof(String));
            dtnew.Columns.Add("ブランド", typeof(String));
            dtnew.Columns.Add("MD金額(税抜)", typeof(String));
            dtnew.Columns.Add("MD金額(税込)", typeof(String));
            dtnew.Columns.Add("処理内容", typeof(String));
            dtnew.Columns.Add("備考", typeof(String));
            dtnew.Columns.Add("経理処理", typeof(String));//Going to remove Column
            //dtnew.Columns.Add("指定日残額", typeof(String));//added column
            dtnew.Columns.Add("残額(税抜)", typeof(String));//Column to replace
            dtnew.Columns.Add("replace",typeof(string));
            dtnew.Columns.Add("納品書日付", typeof(String));
            dtnew.Columns.Add("金額（税抜)", typeof(String));
            
            //dt.Columns["Amount"].ColumnName = "金額（税抜)";


            //DataView dv6 = new DataView(dt);
            //DataTable dt6 = new DataTable();
            //dt6.Columns.Add("開始日", typeof(String));
            //for (int i = 0; i < dt.Rows.Count; i++)
            //{
            //    dt6.Rows.Add();
            //}
            //dt6 = dv6.ToTable(false, "開始日");


            foreach (DataColumn dc in dtnew.Columns)
            {
                if (dc.DataType == typeof(System.Int32))
                {
                    dc.DataType = typeof(string);
                }
            }

            foreach (DataRow dr in dt.Rows)
            {
                dtnew.ImportRow(dr);
            }

            //for (int i = 0; i < dt6.Rows.Count; i++)
            //{
            //    dt.Rows[i]["開始日"] = dt6.Rows[i]["開始日"].ToString();
            //    //dtm.AcceptChanges();
            //}

            for (int i = 0; i < dtnew.Rows.Count; i++)
            {

                for (int j = 0; j < dtnew.Columns.Count; j++)
                {
                    if (dtnew.Columns[j].ColumnName == "MD金額(税抜)" || dtnew.Columns[j].ColumnName == "MD金額(税込)" || dtnew.Columns[j].ColumnName == "経理処理" || dtnew.Columns[j].ColumnName == "残額(税抜)" || dtnew.Columns[j].ColumnName == "金額（税抜)")
                    {
                        if (dtnew.Rows[i][j].ToString() == "" || dtnew.Rows[i][j].ToString() == null)
                        {

                            dtnew.Rows[i][j] = "";

                        }
                        else
                        {
                            dtnew.Rows[i][j] = comma_qoute(Convert.ToInt32(dtnew.Rows[i][j])).ToString();
                        }
                    }

                }
            }

            dtnew.Columns.Remove("経理処理");
            dtnew.Columns["残額(税抜)"].ColumnName = "指定日残額";
            dtnew.Columns["replace"].ColumnName = "残額(税抜)";
            dtnew.Columns.Remove("納品書日付");
            dtnew.Columns["金額（税抜)"].ColumnName="Minus";
            dtnew.Columns.Add("納品書日付", typeof(String));
            dtnew.Columns.Add("金額（税抜)", typeof(String));

            DataTable dt9 = dv5.ToTable(false, "My_date");
            DataTable dt10 = dv5.ToTable(false,"M_Amount");

            for (int i = 0; i < dt9.Rows.Count; i++)
            {
                dtnew.Rows[i]["納品書日付"] = dt9.Rows[i]["My_date"].ToString();
                dtnew.Rows[i]["金額（税抜)"] = dt10.Rows[i]["M_Amount"].ToString();
                //dtm.AcceptChanges();
            }

            for (int i = 0; i < dtnew.Rows.Count; i++)
            {
                dtnew.Rows[i]["指定日残額"] = comma_qoute(Convert.ToInt32(dtnew.Rows[i]["MD金額(税抜)"].ToString().Replace(",", string.Empty)) - (Convert.ToInt32((dtnew.Rows[i]["minus"].ToString().Replace(",", string.Empty))))).ToString();
                dtnew.Rows[i]["残額(税抜)"] = comma_qoute(Convert.ToInt32(dtnew.Rows[i]["MD金額(税抜)"].ToString().Replace(",", string.Empty)) - (Convert.ToInt32((dtnew.Rows[i]["金額（税抜)"].ToString().Replace(",", string.Empty))))).ToString();
            }
            dtnew.Columns.Remove("minus");
            dvexport.DataSource = dtnew;
            dvexport.DataBind();
         
            //gvMDManagement.DataSource = dt;
            //gvMDManagement.DataBind();
            //gvMDManagement.RenderControl(htw);
            dvexport.RenderControl(htw);
            //another code adding

            //frm.RenderControl(htw);//(if Wrong Do it Uncomment)
            Response.Write(sw.ToString());
            Response.End();
        }

        protected string comma_qoute(int input_value)
        {
             string value =string.Empty;
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


        static void ConsoleWriteLine_Tofile(int MD_ID, string MD_Ex, string MD_In, int Final_BalanceTax)
        {
            string ConsoleWriteLinePath = ConfigurationManager.AppSettings["ConsoleWriteLinePath"].ToString();
            StreamWriter sw = new StreamWriter(ConsoleWriteLinePath + "MDManagement_Updated_ConsoleWriteLine" + MD_ID + ".txt", true, System.Text.Encoding.GetEncoding("Shift_Jis"));
            sw.AutoFlush = true;
            Console.SetOut(sw);
            String date = DateTime.Now.ToString();
            Console.WriteLine("MD_ID:" + MD_ID + " " + date);
            Console.WriteLine("MD Tax Exclude is :"+MD_Ex);
            Console.WriteLine("MD Tax Include is:"+ MD_In);
            Console.WriteLine("FinalBalanceTax is :" + Final_BalanceTax);
            sw.Close();
            sw.Dispose();
        }

  
        //public static void SetColumnsOrder( DataTable table, params String[] columnNames)
        //{
        //int columnIndex = 0;
        //foreach(var columnName in columnNames)
        //{
        //    table.Columns[columnName].SetOrdinal(columnIndex);
        //    columnIndex++;
        //}
        // }

        public override void VerifyRenderingInServerForm(Control control)
        {
            return;
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

        protected void gv1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try{
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lble = e.Row.FindControl("col_text_1") as Label;
                lble.Text += Convert.ToInt32(1 + (e.Row.RowIndex));
                
                //Label lblr = e.Row.FindControl("col_text_2") as Label;
                //lblr.Text += (1 + e.Row.RowIndex) +"仕入処理日";

                //Label lblt = e.Row.FindControl("col_text_3") as Label;
                //lblt.Text += (1 + e.Row.RowIndex )+"金額(税抜)";

            }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        protected void hhh(object sender,   EventArgs e)
        {
            if (getval.Value == "1")
            {
            }
            string sValue = ((HiddenField)gvMDManagement.HeaderRow.FindControl("hdn_later")).Value;


        }

        private void MD_search()
        {
            #region get switch field

            //if (getval.Text == "1")
            //{
            //    //ScriptManager.RegisterStartupScript(this,this.GetType(),"Your Comment","myFunc();", true);}
            //   // HtmlGenericControl theDiv = new HtmlGenericControl("server");

            //   // HtmlControl control = (HtmlControl)Page.FindControl("server");
            //   //string d= control.Style.Value;
            //   // string strValue = Page.Request.Form["server"].ToString();
            //   // string p = theDiv.Attributes.CssStyle.Value;
            //}
            //else
            //{
            //    //ScriptManager.(this,this.GetType(),"Your Comment","myFunc();", true);}
            //    //HtmlControl control = (HtmlControl)Page.FindControl("server");
            //    //string d = control.Style.Value;
            //    ////string strValue = Page.Request.Form["server"].ToString();
            //    //HtmlGenericControl theDiv = new HtmlGenericControl("server");
            //    //string p = theDiv.Attributes.CssStyle.Value;


            //}
            #endregion


            if (getval.Value == "1")
            {
                Isswitch_first = true;
            }
            else
            {
                Isswitch_first = false;
            }
            if (getvala.Value.ToString() == "all")
            {
                Isswitch_second = true;

            }
            else
            {
                Isswitch_second = false;
            }
           
            try
            {

                MD_Search_Entity mdsearch = getmd_search();
                MDManagement_BL mbl = new MDManagement_BL();
                DataTable dt = new DataTable();
                dt = mbl.md_search(mdsearch);

                int int_check;



                if (Isswitch_first) //i.e. is none zero value ?
                {
                    try{
                    dt = dt.Select(" (MDTaxExclude -  Amount) <> 0 ", "Row ASC").CopyToDataTable();  //for First none zero flag
                    }
                    catch
                    {
                        dt = null;
                    }
                }

               

                if (!Isswitch_second)  // i.e is all value ?
                {
                    try
                    {
                        dt = dt.Select(" (MDTaxExclude -  M_Amount) <> 0 ", "Row ASC").CopyToDataTable();  //for second none zero flag
                    }
                    catch
                    {
                        dt = null;
                    }
                }
                try
                {
                    int_check = Convert.ToInt32((dt.Compute("Sum(MDTaxExclude)", "")).ToString()) - Convert.ToInt32((dt.Compute("Sum(Amount)", "")).ToString());
                    nonezero_first.Text = string.Format("{0:N0}", int_check);

                    int_check = Convert.ToInt32((dt.Compute("Sum(MDTaxExclude)", "")).ToString()) - Convert.ToInt32((dt.Compute("Sum(M_Amount)", "")).ToString());
                    all_second.Text = string.Format("{0:N0}", int_check);
                }
                catch
                {
                }

                if ( dt == null)
                {
              
                    gvMDManagement.DataSource = dt;
                    if (gvMDManagement.DataSource == null)
                    {
                        lblTotal_Results.Text = "0";
                        lblrowCount.Text = "0";
                         all_second.Text="0";
                         nonezero_first.Text = "0"; 
                        gvMDManagement.DataSource = new string[] { };
                    }
                    gvMDManagement.DataBind();
                    ViewState["export"] = dt;
                }
                else
                {

                    lblrowCount.Text = dt.Rows.Count.ToString();
                    int dosum;
                    dosum = Convert.ToInt32((dt.Compute("Sum(MDTaxExclude)", "")).ToString());
                    lblTotal_Results.Text = string.Format("{0:N0}", dosum);

                    int dosum_next;
                    try
                    {
                        dosum_next = Convert.ToInt32((dt.Compute("Sum(Expprocess)", "")).ToString());
                    }
                    catch
                    {
                        dosum_next = 0;
                    }
                    lblTotal_Results_next.Text = string.Format("{0:N0}", dosum_next);


                    gvMDManagement.DataSource = dt;
                    gvMDManagement.DataBind();
                    ViewState["export"] = dt;
                }

                //if (Isswitch_first)
                //{
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Your Comment", "myFunc(1);", true);    //for flag on toggle switch
                //}
                //else
                //{
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Your Comment", "myFunc(0);", true);    //for flag on toggle switch
                //}
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }


        }

        private void MD_search(EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this,this.GetType(),"Your Comment","myFunc();", true);
            if (getval.Value == "1")
            {
            }
            else
            {
            }
            try
            {
                MD_Search_Entity mdsearch = getmd_search();
                MDManagement_BL mbl = new MDManagement_BL();
                DataTable dt = new DataTable();
                dt = mbl.md_search(mdsearch);
                lblrowCount.Text = dt.Rows.Count.ToString();
                gvMDManagement.DataSource = dt;
                gvMDManagement.DataBind();

                int dosum;
                dosum = Convert.ToInt32((dt.Compute("Sum(MDTaxExclude)", "")).ToString());
                lblTotal_Results.Text = string.Format("{0:N0}", dosum);

                int dosum_next;
                dosum_next = Convert.ToInt32((dt.Compute("Sum(Expprocess)", "")).ToString());
                lblTotal_Results_next.Text = string.Format("{0:N0}", dosum_next);

                ViewState["export"] = dt;

                //string sValue = ((HiddenField)gvMDManagement.HeaderRow.FindControl("hdn_later")).Value;


            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }


        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {

                //for former check box
                if (getval.Value == "1")
                {

                    if (e.Row.RowType == DataControlRowType.Header)
                    {
                        //((HtmlInputCheckBox)FindControl("current_later")).Checked = true;
                        ((HtmlInputCheckBox)e.Row.FindControl("current_later")).Checked = true;
                    }

                }
                else
                {
                    if (e.Row.RowType == DataControlRowType.Header)
                    {
                        ((HtmlInputCheckBox)e.Row.FindControl("current_later")).Checked = false;
                    }

                }


                // for laster Checked box
                if (getvala.Value.ToString() == "all")
                {

                    if (e.Row.RowType == DataControlRowType.Header)
                    {
                        //((HtmlInputCheckBox)FindControl("current_later")).Checked = true;
                        ((HtmlInputCheckBox)e.Row.FindControl("current_latera")).Checked = false;
                    }

                }
                else
                {
                    if (e.Row.RowType == DataControlRowType.Header)
                    {
                        ((HtmlInputCheckBox)e.Row.FindControl("current_latera")).Checked = true;
                    }

                }
                if (e.Row.RowType == DataControlRowType.DataRow)
                {



                    if ((e.Row.FindControl("process_content") as Label).Text == "2")
                    {
                        (e.Row.FindControl("process_content") as Label).Text = "値引伝票";
                    }
                    else if ((e.Row.FindControl("process_content") as Label).Text == "3")
                    {
                        (e.Row.FindControl("process_content") as Label).Text = "現物補填";
                    }
                    else
                    {
                        (e.Row.FindControl("process_content") as Label).Text = string.Empty;
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