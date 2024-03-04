using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using SalesPriceChange_DL;

namespace SalesPriceChange_BL
{
    public class Suppliers_BL
    {
        Suppliers_DL sdl = new Suppliers_DL();
        public DataTable Suppliers_SelectAll()
        {
            return sdl.Suppliers_SelectAll();
        }

        public bool Supplier_IsExists(string description,string id)
        {
            return sdl.Supplier_IsExists(description, id);
        }
        public DataTable Suppliers_DescriptionSelect(Stage_Entity se)
        {
            Suppliers_DL sdl = new Suppliers_DL();
            return sdl.GetDataFromSuppliers(se);
        }

        public bool Suppliers_Insert(string pre,string description,int Updated_By)
        {
            return sdl.Suppliers_Insert(pre,description,Updated_By);
        }

        public void Suppliers_UpdatePreference(string id, string pre, string UpdatedBy)
        {
            sdl.Suppliers_UpdatePreference(id, pre, UpdatedBy);
        }

        public bool Suppliers_Update(string pre,string description,string id,int Updated_By)
        {
            return sdl.Suppliers_Update(pre,description, id,Updated_By);
        }

        public bool Suppliers_Delete(string id)
        {
            return sdl.Suppliers_Delete(id);
        }
    }
}
