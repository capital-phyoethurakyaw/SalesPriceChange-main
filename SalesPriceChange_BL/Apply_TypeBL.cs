using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using SalesPriceChange_DL;

namespace SalesPriceChange_BL
{
    public class Apply_TypeBL
    {
        Apply_TypeDL apdl = new Apply_TypeDL();
        public DataTable ApplyType_Select()
        {          
            return apdl.ApplyType_Select();
        }

        public bool ApplyType_IsExists(string description, string id)
        {
            return apdl.ApplyType_IsExists(description, id);
        }

        public DataTable Apply_DescriptionSelect(Stage_Entity se)
        {
            Apply_TypeDL adl = new Apply_TypeDL();
            return adl.GetDataFromApply_Type(se);
        }

        public bool ApplyType_Insert(string description,string pre,int Updated_By)
        {
            return apdl.ApplyType_Insert(description,pre,Updated_By);
        }

        public void ApplyType_UpdatePreference(string id, string pre, string UpdatedBy)
        {
            apdl.ApplyType_UpdatePreference(id, pre, UpdatedBy);
        }

        public bool ApplyType_Update(string pre,string description, string id,int Updated_By)
        {
            return apdl.ApplyType_Update(pre,description, id,Updated_By);
        }

        public bool ApplyType_Delete(string id)
        {
            return apdl.ApplyType_Delete(id);
        }

    }
}
