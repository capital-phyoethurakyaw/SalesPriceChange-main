using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using SalesPriceChange_BL;
using SalesPriceChange_Common;
using AjaxControlToolkit;
using System.Web.UI.HtmlControls;

namespace SalesPrice.SalesPrice
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvSalePriceList.PageSize = Convert.ToInt32(ddlPageSize.Text);
                BindGrid();
            }
        }

        [WebMethod(EnableSession = true)]
        public static string GetRequestCount()
        {
            if (HttpContext.Current.Session["UserID"] != null)
            {
                string[] str = HttpContext.Current.Session["UserID"].ToString().Split(',');
                SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
                DataTable dt = sbl.SalePriceDetail_NotiCount(str[0]);
                if (dt != null && dt.Rows.Count > 0)
                {
                    string Id = string.Empty;
                    string formNo = string.Empty;

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Id += dt.Rows[i]["ID"].ToString() + ",";
                        formNo += dt.Rows[i]["FormNo"].ToString() + ",";
                    }

                    return dt.Rows.Count + "$" + Id + "$" + formNo;
                    //int count = dt.Rows[0]["ID"].ToString().Count(f => f == ',');
                    //return (count + 1) + "$" + dt.Rows[0]["ID"].ToString();
                }
            }
            return string.Empty;
        }

        public void BindGrid()
        {
            DataTable dt = new DataTable();
            SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
            SalesPriceDetail_Entity se = new SalesPriceDetail_Entity();

            dt = sbl.SalePriceList_Select(se);
            lblrowCount.Text = dt.Rows.Count.ToString();
            gvSalePriceList.DataSource = dt;
            gvSalePriceList.DataBind();
        }
        //Edit
        protected void btnEdit1_Click(object sender, EventArgs e)
        {
            HtmlAnchor anc = sender as HtmlAnchor;
            GridViewRow Grow = (GridViewRow)anc.NamingContainer;
            string ID = ((Label)Grow.FindControl("lblID")).Text;
            Response.Redirect("SalesPriceChange.aspx?ID=" + ID);
        }

        public void Search()
        {
            DataTable dtb = new DataTable();
            SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
            SalesPriceDetail_Entity se = new SalesPriceDetail_Entity();
            se.FormNo = txtFormID.Text;
            se.ApplyDate = wucCalendar.Txtdate;
            dtb = sbl.SalePrcieList_Search(se);
            lblrowCount.Text = dtb.Rows.Count.ToString();
            gvSalePriceList.DataSource = dtb;
            gvSalePriceList.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Search();
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            HtmlAnchor anc = sender as HtmlAnchor;
            GridViewRow Grow = (GridViewRow)anc.NamingContainer;
            SalesPriceDetail_Entity se = new SalesPriceDetail_Entity();
            SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
            se.ID = ((Label)Grow.FindControl("lblID")).Text;
            sbl.SalePriceList_Delete(se);
            //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Delete Successfully')", true);
            //BindGrid();
            Search();
        }
        protected void btnaddform_Click(object sender, EventArgs e)
        {
            Response.Redirect("SalesPriceChange.aspx");
        }


        protected void btnGoto_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtGoto.Text))
            {
                gvSalePriceList.PageIndex = Convert.ToInt32(txtGoto.Text) - 1;
                gvSalePriceList.PageSize = Convert.ToInt32(ddlPageSize.Text);
                Search();
            }
        }

        protected void gvSalePriceList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSalePriceList.PageIndex = e.NewPageIndex;
            gvSalePriceList.PageSize = Convert.ToInt32(ddlPageSize.Text);
            Search();
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvSalePriceList.PageIndex = 0;
            gvSalePriceList.PageSize = Convert.ToInt32(ddlPageSize.Text);
            Search();
        }
    }
}