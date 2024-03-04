using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SalesPriceChange_BL;
using SalesPriceChange_Common;

namespace SalesPrice
{
    public partial class Dashboard1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDashboard();
        }
        public void BindDashboard()
        {
            Instructions_BL ibl = new Instructions_BL();
            DataTable dt = ibl.Dashboard_Info();
            lblrowCount.Text = Convert.ToString(dt.Rows.Count);
            gvDashboard.DataSource = dt;
            gvDashboard.DataBind();
        }
        protected void gvDashboard_paging(object sender, GridViewPageEventArgs e)
        {
            gvDashboard.PageIndex = e.NewPageIndex;
            BindDashboard();
        }
        protected void gvDashboard_Indexchanged(object sender, EventArgs e)
        {
            gvDashboard.PageIndex = 0;
            gvDashboard.PageSize = Convert.ToInt32(ddlPageSize.Text);
            BindDashboard();
        }
        protected void btnGoto_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtGoto.Text))
            {
                gvDashboard.PageIndex = Convert.ToInt32(txtGoto.Text) - 1;
                gvDashboard.PageSize = Convert.ToInt32(ddlPageSize.Text);
                BindDashboard();
            }
        }

    }
}