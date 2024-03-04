using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesPrice
{
    public partial class DatePickerChange : System.Web.UI.UserControl
    {
        public string Stage
        {
            get { return txtStageDate.Text; }
            set { txtStageDate.Text = value; }
        }

        public bool Enable
        {
            set { txtStageDate.Enabled = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}