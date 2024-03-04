using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesPrice
{
    public partial class DatePicker : System.Web.UI.UserControl
    {
        public string Date
        {
            get { return txtDate.Text; }
            set { txtDate.Text = value; }
        }

        public string Style
        {
            set { 
                    txtDate.Attributes.Remove("style"); 
                    txtDate.Attributes.Add("style", value); 
                }
        }

        public string outter
        {
            set
            {
                outdiv.Attributes.Remove("style");
                outdiv.Attributes.Add("style", value);
            }
        }
        public bool Enabled
        {
            //get { return txtDate.Enabled = true; }
            set { txtDate.Enabled = value; }
        }
        public string inndiv
        {
            set
            {
                indiv.Attributes.Remove("style");
                indiv.Attributes.Add("style", value);
                
            }
        }
        public String DivStyle
        {
            set
            {
                div1.Attributes.Remove("style");
                div1.Attributes.Add("style", value);
            }
        }

        public int Width
        {
            get { return Convert.ToInt32(txtDate.Width); }
            set { txtDate.Width = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
             
        }
    }
}