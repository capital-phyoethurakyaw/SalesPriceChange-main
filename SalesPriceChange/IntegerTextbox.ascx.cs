using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesPrice
{
    public partial class IntegerTextbox : System.Web.UI.UserControl
    {
        public String Text
        {
            get { return txtcost.Text; }
            set { txtcost.Text = value; }
        }

        public void txtcost_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtcost.Text))
            {
                int amt = Convert.ToInt32(txtcost.Text.Replace(",", string.Empty));
                txtcost.Text = amt.ToString("#,##0");
            }
        }
        public string instyle
        {
            set
            {
                txtcost.Attributes.Remove("style");
                txtcost.Attributes.Add("style", value);
            }
        }
        public string divstyle
        {
            set
            {
                txtint.Attributes.Remove("style");
                txtint.Attributes.Add("style", value);
            }
        }

        public bool Enabled
        {
            //get { return txtDate.Enabled = true; }
            set { txtcost.Enabled = value; }
        }

    }
}