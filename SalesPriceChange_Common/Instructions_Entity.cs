using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SalesPriceChange_Common
{
    public class Instructions_Entity
    {
        public string ID { get; set; }
        public string FormType { get; set; }
        public string FormNo { get; set; }
        public string Form { get; set; }
        public string ApplyDate { get; set; }   
        public int ApplyType_ID { get; set; }
        
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public int Suppliers_ID { get; set; }
        public int Brand_ID { get; set; }
        public int Category_ID { get; set; }
        public string Category { get; set; }
        public int TargetItem { get; set; }
        public int MD_Unit { get; set; }
        public int MD_Management { get; set; }
        public int ContactToyonaka { get; set; }
        public int SpecialPriceType_ID { get; set; }
        public int InventoryType_ID { get; set; }
        public string  Selling_Price { get; set; }
        public int SellingPrice_Unit { get; set; }
        public Decimal  Cost { get; set; }
        public int CostUnit { get; set; }
        public string PriceChange_Remark { get; set; }
        public string Purchasing_Remark { get; set; }
        public string BossMemo { get; set; }
        public string ItemMemo { get; set; }
        public int ItemUp { get; set; }
        public int SiteBanner { get; set; }
        public Boolean Hot { get; set; }
        public Boolean SaleBanner { get; set; }
        public Boolean SaleText { get; set; }
        public Boolean Header { get; set; }
        public Boolean Side { get; set; }
        public string  SiteRemark { get; set; }
        public int Stage1Status { get; set; }
        public string  Stage1Date { get; set; }
        public string Stage1User { get; set; }
        public int Stage2Status { get; set; }
        public string Stage2Date { get; set; }
        public string Stage2User { get; set; }
        public int Stage3Status { get; set; }
        public string Stage3Date { get; set; }
        public string Stage3User { get; set; }
        public int Stage3TargetUser { get; set; }
        public int Stage4Status { get; set; }
        public string Stage4Date { get; set; }
        public string Stage4User { get; set; }
        public int Stage5Status { get; set; }
        public string Stage5Date { get; set; }
        public string Stage5User { get; set; }
        public int Stage5TargetUser { get; set; }
        public int Stage6Status { get; set; }
        public string Stage6Date { get; set; }
        public string Stage6User { get; set; }
        public int Stage7Status { get; set; }
        public string Stage7Date { get; set; }
        public string Stage7User { get; set; }
        public int Stage8Status { get; set; }
        public string Stage8Date { get; set; }
        public string Stage8User { get; set; }
        public string StageID { get; set; }
        public int IsFinished { get; set; }
        public string BrandName { get; set; }
        public string ApplyType { get; set; }
        public string Categ { get; set; }
        public string Suppliername { get; set; }
        public int CurrentStage { get; set; }
        public int NotiUserID { get; set; }
        public int FormID { get; set; }
        public int UserID { get; set; }
    }
}
