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
    public partial class Checking_Log : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
     
        public void binderrorgrid()
        {
            error_log_bl ibl = new error_log_bl();
            DataTable dt = ibl.error_select();
            lblerrcount.Text = dt.Rows.Count.ToString();
            error_gv.DataSource = dt;
            error_gv.DataBind();
        }

        protected void error_btn_Click(object sender, EventArgs e)
        {
            //close_error_gv.Attributes.Add("visible", "true");
            binderrorgrid();
        }
        protected void close_Click(object sender, EventArgs e)
        {
            error_log_bl ibl = new error_log_bl();
            DataTable dt = ibl.error_select();
            lblerrcount.Text = dt.Rows.Count.ToString();
           
            error_gv.DataSource = dt;
            error_gv.DataBind();
        }
        protected void error_gv_Indexchanged(object sender, EventArgs e)
        {
           
                error_gv.PageIndex = 0;
                error_gv.PageSize = Convert.ToInt32(ddlPageSize.Text);
                binderrorgrid();
            
         
        }
        protected void btnGoto_Click(object sender, EventArgs e)
        {
           
                if (!string.IsNullOrWhiteSpace(txtGoto.Text))
                {
                    error_gv.PageIndex = Convert.ToInt32(txtGoto.Text) - 1;
                    error_gv.PageSize = Convert.ToInt32(ddlPageSize.Text);
                    binderrorgrid();
                }
          
        }
        protected void errorgv_paging(object sender, GridViewPageEventArgs e)
        {
                error_gv.PageIndex = e.NewPageIndex;
                binderrorgrid();
        }
    
    }
}