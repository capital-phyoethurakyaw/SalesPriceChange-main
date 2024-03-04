using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using SalesPriceChange_DL;

namespace SalesPriceChange_BL
{
    public class SpecialPriceType_BL
    {
        SpecialPriceType_DL spdl = new SpecialPriceType_DL();
        public DataTable SpecialPriceType_SelectAll()
        { 
            return spdl.SpecialPriceType_SelectAll();
        }
        public bool SpecialPriceType_IsExists(string description, string id)
        {
            return spdl.SpecialPriceType_IsExists(description, id);
        }
        public DataTable Special_DescriptionSelect(Stage_Entity se)
        {
            SpecialPriceType_DL sdl = new SpecialPriceType_DL();
            return sdl.GetDataFromSpecial_Price(se);
        }

        public bool SpecialPriceType_Insert(string description,int pre,int Updated_By)
        {
            return spdl.SpecialPriceType_Insert(description,pre,Updated_By);
        }

        public bool SpecialPriceType_Update(int pre,string description, string id,int Updated_By)
        {
            return spdl.SpecialPriceType_Update(pre,description, id,Updated_By);
        }

        public bool SpecialPriceType_Delete(string id)
        {
            return spdl.SpecialPriceType_Delete(id);
        }
        public void Special_UpdatePreference(string id, string pre, string UpdatedBy)
        {
            spdl.Special_UpdatePreference(id, pre, UpdatedBy);
        }
    }
}
    
