using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SalesPriceChange_Common
{
    public class Supplementary_Entity
    {
        public string ID { get; set; }
        public string ApplyNo { get; set; }
        public string SupplierName { get; set; }
        public int SupplierID { get; set; }
        public int BrandID { get; set; }
        public string BrandName { get; set; }
        public string Content { get; set; }
        public string  Amount { get; set;}
        public string  SAmount { get; set; }
        public int CompensationType { get; set; }
        public string Remark { get; set; }
        public string ProcessDate { get; set; }
        public int IsFinished { get; set; }
        public int UpdatedBy { get; set; }
        public string pasdate { get;set;}
        public string Start_Date { get; set; }
        public string End_Date { get; set; }
        public string start_text1 { get;set;}
        public string end_text2 { get; set; }

        public string updtd_Date { get; set; }
        public string updtd_Date_End { get; set; }

        public Boolean chkBlank { get; set; } //checkbox for 納品書日空白表示:
    }
}
