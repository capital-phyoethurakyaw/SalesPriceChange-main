using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using SalesPriceChange_Common;
using AjaxControlToolkit;
using System.Globalization;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using context = System.Web.HttpContext;
using System.Configuration;
using SalesPriceChange_BL;

namespace SalesPrice
{
    public class error_check 
    {
        public void send_Exce_to_DB(Exception exdb)
        {
       
            error_log_bl erbl = new error_log_bl();
            if (erbl.error_log_insert(exdb))
            {
                //put the Alert Message or success message
            }

        }
    }
}