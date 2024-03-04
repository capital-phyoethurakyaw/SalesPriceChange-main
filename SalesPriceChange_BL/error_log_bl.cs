using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using SalesPriceChange_DL;
using context = System.Web.HttpContext;
using System.Configuration;
using System.Data.SqlClient;

namespace SalesPriceChange_BL
{
   public class error_log_bl
    {
       public bool error_log_insert(Exception expd)
       {
           error_log_dl eldl = new error_log_dl();
           return eldl.error_log_insert(expd);
       }
    
       public DataTable error_select()
       {
           error_log_dl eldl = new error_log_dl();
           return eldl.error_select();
       }
     

        
    }
}
