using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SalesPriceChange_DL;
using SalesPriceChange_Common;
using System.Data;

namespace SalesPriceChange_BL
{
    public class Brand_BL
    {
        Brand_DL bdl = new Brand_DL();
        public DataTable Brand_SelectAll()
        {
            
            return bdl.Brand_SelectAll();
        }
        public bool Brand_IsExists(string description, string id)
        {
            return bdl.Brand_IsExists(description, id);
        }

        public void Brand_UpdatePreference(string id, string pre,string UpdatedBy)
        {
            bdl.Brand_UpdatePreference(id, pre, UpdatedBy);
        }

        public DataTable Brand_DescriptionSelect(Stage_Entity se)
        {
            Brand_DL bdl = new Brand_DL();
            return bdl.GetDataFromBrand(se);
        }

        public bool Brand_Insert(string description,int pre,int Updated_By)
        {
            return bdl.Brand_Insert(description,pre,Updated_By);
        }

        public bool Brand_Update(int pre,string description, string id,int Updated_By)
        {
            return bdl.Brand_Update(pre,description, id,Updated_By);
        }

        public bool Brand_Delete(string id)
        {
            return bdl.Brand_Delete(id);
        }

        public bool Brand_InsertXML(string xml)
        {
            //DunningListDL.StartTransaction();

            if (!bdl.Brand_InsertXML(xml))
            {
                return false;
            }

            //DunningListDL.CommitTransaction();
            return true;
        }
        public DataTable PreferenceMax_Select()
        {

            return bdl.PreferenceMax_Select();
        }
    }
}
