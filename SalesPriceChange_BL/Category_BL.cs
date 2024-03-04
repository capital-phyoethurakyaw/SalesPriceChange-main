using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using SalesPriceChange_DL;

namespace SalesPriceChange_BL
{
  public  class Category_BL
    {
      Category_DL ctdl = new Category_DL();
      public DataTable Category_Select()
      {


          return ctdl.Category_Select();
      }
      public bool Category_IsExists(string description, string id)
      {
          return ctdl.Category_IsExists(description, id);
      }
      public DataTable Category_DescriptionSelect(Stage_Entity se)
      {
          Category_DL adl = new Category_DL();
          return ctdl.GetDataFromCategory_Type(se);
      }

      public bool Category_Insert(string description, int Updated_By)
      {
          return ctdl.Category_Insert(description, Updated_By);
      }

      public bool Category_Update(string description, string id, int Updated_By)
      {
          return ctdl.Category_Update(description, id, Updated_By);
      }

      public bool Category_Delete(string id)
      {
          return ctdl.Category_Delete(id);
      }
       

    }
}
