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

namespace SalesPriceChange.SalesPrice
{
    public partial class SalesPrice_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                refresh1();
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
                    if (String.IsNullOrEmpty(dt.Rows[0]["ID"].ToString()))
                    {
                        return string.Empty;
                    }
                    else
                    {
                        int count = dt.Rows[0]["ID"].ToString().Count(f => f == ',');
                        return (count + 1) + "$" + dt.Rows[0]["ID"].ToString();
                    }
                }
            }
            return string.Empty;
        }

        public void refresh1()
        {
            DataTable dt = new DataTable();
            SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
            SalesPriceDetail_Entity se = new SalesPriceDetail_Entity();

            dt = sbl.SalePriceList_Select(se);
            lblrowCount.Text = Convert.ToString(dt.Rows.Count);

            if (dt.Rows.Count > 0)
            {
                gvSalePriceList.DataSource = dt;
                gvSalePriceList.DataBind();
            }
        }
        protected void btnEdit1_Click(object sender, EventArgs e)
        {
            Button btntrans = (Button)sender;
            GridViewRow Grow = (GridViewRow)btntrans.NamingContainer;
            string ID = ((Label)Grow.FindControl("ID")).Text;
            Response.Redirect("SalesPriceChange.aspx?ID=" + ID);
        }


        protected void gvSalePriceList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSalePriceList.PageIndex = e.NewPageIndex;
            refresh1();
            Searchform();
        }
        protected void PageSize_Changed(object sender, EventArgs e)
        {
            gvSalePriceList.PageSize = Convert.ToInt32(ddlPageSize.Text);
            refresh1();
            Searchform();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Searchform();
        }
        public void Searchform()
        {
            DataTable dtb = new DataTable();
            SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
            SalesPriceDetail_Entity se = new SalesPriceDetail_Entity();
            se.FormNo = txtFormID.Text;
            se.ApplyDate = txtApplyDate11.Text;
            dtb = sbl.SalePrcieList_Search(se);
            if (dtb.Rows.Count > 0)
            {
                gvSalePriceList.DataSource = dtb;
                gvSalePriceList.DataBind();
            }
        }
    }
}