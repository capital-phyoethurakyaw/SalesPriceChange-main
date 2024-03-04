using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SalesPriceChange_Common
{
   public  class SalesPriceDetail_Entity
    {
        public string ID { get; set; }
        public string FormNo { get; set; }
        public string ApplyDate { get; set; }
        public int ApplyType_ID { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public int Suppliers_ID { get; set; }
        public int Brand_ID { get; set; }
        public string Selling_Date { get; set; }
        public int Selling_Discount1 { get; set; }
        public int Selling_Discount2 { get; set; }
        public string Purchase_Date { get; set; }
        public int Purchase_Discount1 { get; set; }
        public int Purchase_Discount2 { get; set; }
        public int SpecialPriceType_ID { get; set; }
        public int InventoryType_ID { get; set; }
        public Boolean Attachment { get; set; }
        public Boolean ProductNoUnit { get; set; }
        public Boolean ColorUnit { get; set; }
        public Boolean Hot { get; set; }
        public Boolean SaleBanner { get; set; }
        public Boolean SaleText { get; set; }
        public Boolean Header { get; set; }
        public Boolean Side { get; set; }
        public string Remark { get; set; }
        public string StageID { get; set; }
        public string CurrentStage { get; set; }
        public string Shipping { get; set; }
        public string Stage1Comment { get; set; }
        public int Stage1Status { get; set; }
        public string Stage2Comment { get; set; }
        public int Stage2Status { get; set; }
        public string Stage3Comment { get; set; }
        public int Stage3Status { get; set; }
        public string Stage4Comment { get; set; }
        public int Stage4Status { get; set; }
        public string Stage5Comment { get; set; }
        public int Stage5Status { get; set; }
        public string Stage6Comment { get; set; }
        public int Stage6Status { get; set; }
        public string Stage7Comment{ get; set; }
        public int Stage7Status { get; set; }
        public string  CreatedUserID { get; set; }
        public string CreatedDate { get; set; }
        public string  UpdatedUserID { get; set; }
        public string UpdatedDate { get; set; }
    }
}
