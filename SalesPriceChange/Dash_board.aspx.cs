using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SalesPriceChange_BL;
using SalesPriceChange_Common;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Web.Routing;
using System.Xml;
using System.Windows.Input;

namespace SalesPrice
{
    public partial class Dash_board : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
            if (!IsPostBack)
            {
                try
                {
                    BindDashboard_User();
                    mobile_table();
                }
                catch (Exception ex)
                {
                    error_check ec = new error_check();
                    ec.send_Exce_to_DB(ex);
                }
                mobile_table();
            }
            mobile_table();
        }

        public void BindDashboard()
        {
            Instructions_BL ibl = new Instructions_BL();
            DataTable dt = ibl.Dashboard_Info();
            lblrowCount.Text = Convert.ToString(dt.Rows.Count);
            gvDashboard.DataSource = dt;
            gvDashboard.DataBind();
            mobile_table();
         
        }
        protected void rdbonly_checkchange(object sender, EventArgs e)
        {
            rdoOnlyMe.Attributes.Remove("class");
            rdoOnlyMe.Attributes.Add("class", "btn btn-primary active");
            rdoAll.Attributes.Remove("class");
            rdoAll.Attributes.Add("class", "btn btn-primary notActive");
            BindDashboard_User();
        }
        protected void rdbAll_checkchange(object sender, EventArgs e)
        {
            rdoAll.Attributes.Remove("class");
            rdoAll.Attributes.Add("class", "btn btn-primary  active");
            rdoOnlyMe.Attributes.Remove("class");
            rdoOnlyMe.Attributes.Add("class", "btn btn-primary notActive");
            BindDashboard();
        }
      
        public void BindDashboard_User()
        {
            Instructions_BL ibl = new Instructions_BL();
            string[] str = Session["UserID"].ToString().Split(',');
            string id = str[0];
            DataTable dt = ibl.Dashboard_UserInfo(id);
            lblrowCount.Text = Convert.ToString(dt.Rows.Count);
            gvDashboard.DataSource = dt;
            gvDashboard.DataBind();

        }
        protected void gvDashboard_paging(object sender, GridViewPageEventArgs e)
        {
            try{
            gvDashboard.PageIndex = e.NewPageIndex;
            BindDashboard();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        protected void gvDashboard_Indexchanged(object sender, EventArgs e)
        {
            try
            {
                gvDashboard.PageIndex = 0;
                gvDashboard.PageSize = Convert.ToInt32(ddlPageSize.Text);
                BindDashboard();
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
                if (!string.IsNullOrWhiteSpace(txtGoto.Text))
                {
                    gvDashboard.PageIndex = Convert.ToInt32(txtGoto.Text) - 1;
                    gvDashboard.PageSize = Convert.ToInt32(ddlPageSize.Text);
                    BindDashboard();
                }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        protected void dblink_Click(object sender, EventArgs e)
        {
            try
            {
                HtmlAnchor anc = sender as HtmlAnchor;
                GridViewRow Grow = (GridViewRow)anc.NamingContainer;
                string ID = ((Label)Grow.FindControl("lblID")).Text;
                Response.Redirect("~/Instructions/Instructions.aspx?ID=" + ID);
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }

        }
        protected void mobile_table()
        {
            try
            {
                //gvDashboard.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

                ////Attribute to hide column in Phone.
                //gvDashboard.HeaderRow.Cells[1].Attributes["data-hide"] = "phone";
                //gvDashboard.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
                //gvDashboard.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
                //gvDashboard.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
                //gvDashboard.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";
                //gvDashboard.HeaderRow.Cells[6].Attributes["data-hide"] = "phone";
                //gvDashboard.HeaderRow.Cells[7].Attributes["data-hide"] = "phone";
                ////gvDashboard.HeaderRow.Cells[].Attributes["data-hide"] = "phone";
                ////Adds THEAD and TBODY to GridView.
                //gvDashboard.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            catch
            {
            }
        }

    }
}