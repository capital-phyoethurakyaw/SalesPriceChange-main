﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesPriceChange
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void notiLinkButton_Click(Object sender, EventArgs e)
        {
            notification_Wrapper.Visible = !notification_Wrapper.Visible ;
        }
    }
}
