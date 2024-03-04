using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesPrice
{
    public partial class wucCalendar : System.Web.UI.UserControl
    {
        public string Txtdate
        {
            get
            {
                return txtApplyDate.Text;
            }
            set
            {
                this.txtApplyDate.Text = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}