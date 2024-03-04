using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using SalesPriceChange_Common;
using System.Web.UI.WebControls;

namespace SalesPrice.Users
{
    public partial class DecryptPassword : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDecrypt_Click(object sender, EventArgs e)
        {
            try
            {
                Crypto crypto = new Crypto();
                txtresult.Text = crypto.Decrypt(txtPass.Text, txtdekey.Text);
            }
            catch
            {
                lblwaring.Visible = true;
            }
        }
       
    }
}