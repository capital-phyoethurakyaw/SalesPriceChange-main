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
using System.Text.RegularExpressions;

namespace SalesPrice.Instructions
{
    public partial class Instruction_List : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {                  
                    BindCombo();
                    Search();
                    sort();
                }
                catch (Exception ex)
                {
                    error_check ec = new error_check();
                    ec.send_Exce_to_DB(ex);
                }
            }
            searchPanel.Style.Add("display", "none");
          
        }
   protected void BindData()

    {      

        //ds.ReadXml(Server.MapPath("EmployeeDetails.xml"));
        Instructions_Entity ie = GetSearchData();
        Instructions_BL ibl = new Instructions_BL();
        DataTable dt = ibl.Instruction_Search(ie);
        //lblrowCount.Text = Convert.ToString(dt.Rows.Count);
        ds.Tables.Add(dt);
        //if (ds != null && ds.HasChanges())

        {

            gvInstruction.DataSource = ds;

            gvInstruction.DataBind();
        }

    }
    public SortDirection dir

    {

        get

        {

            if (ViewState["dirState"] == null)

            {

                ViewState["dirState"] = SortDirection.Ascending;

            }

            return (SortDirection)ViewState["dirState"];
        } 

        set

        {

            ViewState["dirState"] = value;

        }
    }



    protected void gvInstruction_Sorting(object sender, GridViewSortEventArgs e)
    {

        BindData();

        DataTable dt = new DataTable();

        dt = ds.Tables[0];

        {

            string SortDir = string.Empty;

            if (dir == SortDirection.Ascending)
            {

                dir = SortDirection.Descending;

                SortDir = "Desc";

            }

            else
            {

                dir = SortDirection.Ascending;

                SortDir = "Asc";

            }

            DataView sortedView = new DataView(dt);
            DataTable dt1 = new DataTable();
            sortedView.Sort = e.SortExpression + " " + SortDir;
            dt1 = sortedView.ToTable() ;
            ViewState["post_load"] = dt1;
            gvInstruction.DataSource = dt1;

            gvInstruction.DataBind();

        }
    }
    private void sort()
    {

        if (ViewState["post_load"] != null)
        {
            DataTable sortedView = (ViewState["post_load"]) as DataTable;
            if (sortedView != null)
            {
                if (sortedView.Rows.Count > 0)
                {
                    gvInstruction.DataSource = sortedView;

                    gvInstruction.DataBind();
                }
            }
        }
      

    }
    private void BindGrid()
    {
        Instructions_BL ibl = new Instructions_BL();
        DataTable dt = ibl.Instruction_SelectAll();
        lblrowCount.Text = Convert.ToString(dt.Rows.Count);
        gvInstruction.DataSource = dt;
        gvInstruction.DataBind();
    }
        private void BindCombo()
        {

            //Category_BL ctbl = new Category_BL();
            //ddlCtegry_Search.DataTextField = "Description";
            //ddlCtegry_Search.DataValueField = "ID";
            //ddlCtegry_Search.DataSource = ctbl.Category_Select();
            //ddlCtegry_Search.DataBind();
            //ddlCtegry_Search.Items.Insert(0, "-----選択-----");
            //ddlCtegry_Search.SelectedItem.Value = "0";

            Apply_TypeBL apbl = new Apply_TypeBL();
            ddlApplyType.DataTextField = "Description";
            ddlApplyType.DataValueField = "ID";
            ddlApplyType.DataSource = apbl.ApplyType_Select();
            ddlApplyType.DataBind();
            //ddlApplyType.Items.Insert(0, "-----選択-----");
            //ddlApplyType.SelectedItem.Value = "0";           

            Suppliers_BL sbl = new Suppliers_BL();
            ddlSupplier.DataTextField = "Description";
            ddlSupplier.DataValueField = "ID";
            ddlSupplier.DataSource = sbl.Suppliers_SelectAll();
            ddlSupplier.DataBind();
            //ddlSupplier.Items.Insert(0, "-----選択-----");
            //ddlSupplier.SelectedItem.Value = "0";
          
            //SpecialPriceType_BL spbl = new SpecialPriceType_BL();
            //ddlSalePriceType.DataTextField = "Description";
            //ddlSalePriceType.DataValueField = "ID";
            //ddlSalePriceType.DataSource = spbl.SpecialPriceType_SelectAll();
            //ddlSalePriceType.DataBind();

            //InventoryType_BL itbl = new InventoryType_BL();
            //ddlInventoryType.DataTextField = "Description";
            //ddlInventoryType.DataValueField = "ID";
            //ddlInventoryType.DataSource = itbl.InventoryType_SelectAll();
            //ddlInventoryType.DataBind();

            Brand_BL bbl = new Brand_BL();
            ddlBrand.DataTextField = "Description";
            ddlBrand.DataValueField = "ID";
            ddlBrand.DataSource = bbl.Brand_SelectAll();
            ddlBrand.DataBind();
            //ddlBrand1.Items.Insert(0, "-----選択-----");
            //ddlBrand1.SelectedItem.Value = "0";

            DataTable dtMD = new DataTable();
            dtMD.Columns.Add("ID");
            dtMD.Columns.Add("Description");
            dtMD.Rows.Add(new object[2] { "0", "要" });
            dtMD.Rows.Add(new object[2] { "1", "不要" });       

            ddlManagement.DataTextField = "Description";
            ddlManagement.DataValueField = "ID";
            ddlManagement.DataSource = dtMD;
            ddlManagement.DataBind();

            dtMD.Rows.Clear();
            dtMD.Rows.Add(new object[2] { "1", "完了" });
            dtMD.Rows.Add(new object[2] { "0", "未" });
            
            ddlSIsFinished.DataTextField = "Description";
            ddlSIsFinished.DataValueField = "ID";
            ddlSIsFinished.DataSource = dtMD;
            ddlSIsFinished.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try{
            GetApplyNo();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        private void GetApplyNo()
        {
            try{

            Instructions_BL ibl = new Instructions_BL();
            txtFormNo.Text = ibl.Instruction_GetApplyNo();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        protected void btnEdit1_Click(object sender, EventArgs e)
        {
            try{
            HtmlAnchor anc = sender as HtmlAnchor;
            GridViewRow Grow = (GridViewRow)anc.NamingContainer;
            string ID = ((Label)Grow.FindControl("lblID")).Text;
            Response.Redirect("Instructions.aspx?ID=" + ID);
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        private Instructions_Entity GetSearchData()
        {
            Instructions_Entity ie = new Instructions_Entity();
            //ie.FormType = Regex.Replace(txtFormNo.Text, @"[\d-]", string.Empty);
            //ie.FormNo = Regex.Replace(txtFormNo.Text, "[^0-9.]", string.Empty);
            ie.Form = txtFormNo.Text;
            ie.StartDate = txtStartDate.Text;
            ie.EndDate = txtEndDate.Text;
            ie.BrandName = string.IsNullOrWhiteSpace(ddlBrand.SelectedValue) ? "0" : ddlBrand.SelectedValue;
            ie.ApplyType = string.IsNullOrWhiteSpace(ddlApplyType.SelectedValue) ? "0" : ddlApplyType.SelectedValue;
            ie.Categ = txtCategory.Text;
            ie.Suppliername = string.IsNullOrWhiteSpace(ddlSupplier.SelectedValue) ? "0" : ddlSupplier.SelectedValue;
            ie.MD_Management = string.IsNullOrWhiteSpace(ddlManagement.SelectedValue) ? -1 : Convert.ToInt32(ddlManagement.SelectedValue);
            ie.IsFinished = string.IsNullOrWhiteSpace(ddlSIsFinished.SelectedValue) ? -1 : Convert.ToInt32(ddlSIsFinished.SelectedValue);
            // ie.IsFinished = chkIsFinished.Checked;
            return ie;
        }
      
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try{
            gvInstruction.PageIndex = 0;
            Search();
            sort();
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
            try
            {
            Instructions_Entity ie = GetSearchData();
            Instructions_BL ibl = new Instructions_BL();
            DataTable dt = ibl.Instruction_Search(ie);
            lblrowCount.Text = Convert.ToString(dt.Rows.Count);
            gvInstruction.DataSource = dt;
            gvInstruction.DataBind();
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
                gvInstruction.PageIndex = e.NewPageIndex;
                Search();
                sort();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        protected void gvInstruction_Indexchanged(object sender, EventArgs e)
        {
            try{
            gvInstruction.PageIndex = 0;
            gvInstruction.PageSize = Convert.ToInt32(ddlPageSize.Text);
            Search();
            sort();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Instructions/Instructions.aspx");
        }

        protected void ddf_Click(object sender, EventArgs e)
        {
          Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Instruction_List.xls");
            Response.ContentType = "application/vnd.ms-excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gvInstruction.RenderControl(htw);
            //another code adding
            //frm.RenderControl(htw);//(if Wrong Do it Uncomment)
            Response.Write(sw.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            return;
        }

        protected void btnGoto_Click(object sender, EventArgs e)
        {
            if (txtGoto.Text != "0")
            {
                if (!string.IsNullOrWhiteSpace(txtGoto.Text))
                {
                    try{
                    gvInstruction.PageIndex = Convert.ToInt32(txtGoto.Text) - 1;
                    gvInstruction.PageSize = Convert.ToInt32(ddlPageSize.Text);
                    Search();
                    txtGoto.Text = string.Empty;
                    }
                    catch (Exception ex)
                    {
                        error_check ec = new error_check();
                        ec.send_Exce_to_DB(ex);
                    }
                }
            }
        }
    }
}