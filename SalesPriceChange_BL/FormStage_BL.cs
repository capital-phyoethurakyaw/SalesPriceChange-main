using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using SalesPriceChange_DL;

namespace SalesPriceChange_BL
{
    public class FormStage_BL
    {
        public DataTable FormStage_SelectByID(FormStage_Entity fe)
        {
            FormStage_DL fdl = new FormStage_DL();
            return fdl.FormStage_SelectByID(fe);
        }
    }
}
