using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SalesPriceChange_DL;
using SalesPriceChange_Common;
using System.Data;

namespace SalesPriceChange_BL
{
    public class SellingPriceUnit_BL
    {
        SellingPriceUnit_DL spuDL = new SellingPriceUnit_DL();
        public DataTable SellingPriceUnit_SelectAll()
        {  
            return spuDL.SellingPriceUnit_SelectAll();
        }
        public bool SellingPriceUnit_IsExists(string description, string id)
        {
            return spuDL.SellingPriceUnit_IsExists(description, id);
        }
        public DataTable Selling_DescriptionSelect(Stage_Entity se)
        {
            SellingPriceUnit_DL sdl = new SellingPriceUnit_DL();
            return sdl.GetDataFromSellingPrice(se);
        }
        public void Selling_UpdatePreference(string id, string pre, string UpdatedBy)
        {
            spuDL.Selling_UpdatePreference(id, pre, UpdatedBy);
        }

        public bool SellingPriceUnit_Insert(string description,int pre,int Updated_By)
        {
            return spuDL.SellingPriceUnit_Insert(description,pre,Updated_By);
        }

        public bool SellingPriceUnit_Update(int pre,string description, string id,int Updated_By)
        {
            return spuDL.SellingPriceUnit_Update(pre,description, id,Updated_By);
        }

        public bool SellingPriceUnit_Delete(string id)
        {
            return spuDL.SellingPriceUnit_Delete(id);
        }
    }
}
