using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using SalesPriceChange_DL;

namespace SalesPriceChange_BL
{
   public class CostUnit_BL
    {
       CostUnit_DL cudl = new CostUnit_DL();
        public DataTable CostUnit_Select()
        {
            return cudl.CostUnit_Select();
        }
        public bool CostUnit_IsExists(string description, string id)
        {
            return cudl.CostUnit_IsExists(description, id);
        }
        public DataTable Cost_DescriptionSelect(Stage_Entity se)
        {
            CostUnit_DL cdl = new CostUnit_DL();
            return cdl.GetDataFromCost_Unit(se);
        }

        public bool CostUnit_Insert(string description,string pre,int Updated_By)
        {
            return cudl.CostUnit_Insert(description,pre,Updated_By);
        }

        public void CostUnit_UpdatePreference(string id, string pre, string UpdatedBy)
        {
            cudl.CostUnit_UpdatePreference(id, pre, UpdatedBy);
        }

        public bool CostUnit_Update(string pre,string description, string id,int Updated_By)
        {
            return cudl.CostUnit_Update(pre,description, id,Updated_By);
        }

        public bool CostUnit_Delete(string id)
        {
            return cudl.CostUnit_Delete(id);
        }


    }
}

