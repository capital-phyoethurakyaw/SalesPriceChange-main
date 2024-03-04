
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_DL;
using SalesPriceChange_Common;

namespace SalesPriceChange_BL
{
    public class MDManagement_BL
    {
        MDManagement_DL scdl = new MDManagement_DL();

        //new (Khin Sandar Thein)
        public bool MD_del_in_up(DataTable dt)
        {
             
            return scdl.MD_del_in_up(dt);
        }
        //

        public bool MDLined_Delete(string id)
        {
            return scdl.MDLined_Delete(id);
        } 
        public DataTable MD_Management_SelectAll()
        {
            return scdl.MD_Management_SelectAll();
        }
        public DataTable md_search(MD_Search_Entity mdsearch)
        {
            return scdl.MD_Search(mdsearch);
        }
        public DataTable MD_Management_SelectByID(string Instructions_ID)
        {
            return scdl.MD_Management_SelectByID(Instructions_ID);
        }
        public DataTable MD_select(string ins_ID)
        {
            return scdl.MD_select(ins_ID);
        }
        public DataTable MD_selectg(string ins_ID)
        {
            return scdl.MD_selectg(ins_ID);
        }

        public bool MDManagement_Update(MDManagement_Entity me)
        {
            return scdl.MDManagement_Update(me);
        }
        public bool MD_insert(int md, string dp, string pc, int am)
        {
            return scdl.MD_Insert(md, dp, pc, am);
        }

        public bool MD_Delete(int md)
        {
            return scdl.MD_Delete(md);
        }
        public bool MDUp_Update(string up_ID, string MDTax_Ex,string MDTax_In, string ddlPro, string rem, string expprocess, string baltaxin,string app_date)
        {
            return scdl.MDUp_Update(up_ID, MDTax_Ex, MDTax_In, ddlPro, rem, expprocess, baltaxin, app_date);
        }

    }
}
