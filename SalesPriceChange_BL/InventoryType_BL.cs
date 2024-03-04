using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using SalesPriceChange_DL;


namespace SalesPriceChange_BL
{
    public class InventoryType_BL
    {
        InventoryType_DL itdl = new InventoryType_DL();

        public void inventory_UpdatePreference(string id, string pre, string UpdatedBy)
        {
            itdl.inventory_UpdatePreference(id, pre, UpdatedBy);
        }

     
        public DataTable InventoryType_SelectAll()
        {
          
            return itdl.InventoryType_SelectAll();
        }
        public DataTable InventoryType_Select()
        {

            return itdl.InventoryType_Select();
        }
        public bool InventoryType_IsExists(string description, string id)
        {
            return itdl.InventoryType_IsExists(description, id);
        }
        public DataTable Inventory_DescriptionSelect(Stage_Entity se)
        {
            InventoryType_DL idl = new InventoryType_DL();
            return idl.GetDataFromInventory_Type(se);
        }

        public bool InventoryType_Insert(string description,int pre,int Updated_By)
        {
            return itdl.InventoryType_Insert(description,pre,Updated_By);
        }

        public bool InventoryType_Update(int pre,string description, string id,int Updated_By)
        {
            return itdl.InventoryType_Update(pre,description, id,Updated_By);
        }

        public bool InventoryType_Delete(string id)
        {
            return itdl.InventoryType_Delete(id);
        }


    }
}