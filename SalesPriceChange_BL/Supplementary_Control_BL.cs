using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_DL;
using SalesPriceChange_Common;

namespace SalesPriceChange_BL
{
    public class Supplementary_Control_BL
    {
        Supplementary_Control_DL scdl = new Supplementary_Control_DL();
        public DataTable Supplementary_Control_SelectAll()
        {
            return scdl.Supplementary_Control_SelectAll();
        }

        public string Supplementary_Control_GetApplyNo()
        {
            Supplementary_Control_DL scdl = new Supplementary_Control_DL();
            DataTable dt = scdl.Supplementary_Control_GetApplyNo();
            string result = string.Empty;
            if (dt.Rows.Count > 0)
            {
                string temp = dt.Rows[0]["ApplyNo"].ToString();
                if (string.IsNullOrWhiteSpace(temp))
                    return ("H"+DateTime.Now.Year.ToString() + "-00001");
                else
                {
                    string[] strarr = temp.Split('-');
                    return (strarr[0] + "-" + (Convert.ToInt32(strarr[1]) + 1).ToString("D5"));
                }
            }
            else
                return ("H"+DateTime.Now.Year.ToString() + "-00001");
        }

        public bool Supplementary_Control_Save(Supplementary_Entity se)
        {
            return scdl.Supplementary_Control_Save(se);
        }

        public bool Supplementary_Control_Update(Supplementary_Entity se)
        {
            return scdl.Supplementary_Control_Update(se);
        }

        public DataTable Supplementary_Control_Search(Supplementary_Entity se)
        {
            return scdl.Supplementary_Control_Search(se);
        }

        public bool DeleteApplyNoById(int id)
        {
            return scdl.DeleteApplyNoById(id);
        }
    }
}
