using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SalesPriceChange_DL;
using SalesPriceChange_Common;
using System.Data;
using System.Collections;

namespace SalesPriceChange_BL
{
    public class menu_BL
    {
        public DataTable menu_select(menu_Entity me)
        {
            menu_DL mdl = new menu_DL();
            return mdl.menu_Select(me);
        }
        public DataTable menu_child(menu_Entity me)
        {
            menu_DL mdl = new menu_DL();
            return mdl.menu_child(me);
        }
        public bool Menu_Save(menu_Entity me)
        {
            menu_DL mdl = new menu_DL();
            return mdl.Menu_Save(me);
        }
        public DataTable Menu_Select(String UserID)
        {
            menu_DL mdl = new menu_DL();
            return mdl.Menu_Select (UserID);
        }
        public DataTable menu_hidden(menu_Entity me1)
        {
            menu_DL mdl = new menu_DL();
            return mdl.menu_hidden(me1);
        }
    }
}
