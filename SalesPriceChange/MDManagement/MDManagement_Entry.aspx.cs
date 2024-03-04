using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SalesPrice.MDManagement
{
    public partial class MDManagement_Entry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Test");
            dt.Rows.Add();

            gv1.DataSource = dt;
            gv1.DataBind();
        }
    }
}