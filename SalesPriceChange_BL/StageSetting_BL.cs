using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using SalesPriceChange_DL;

namespace SalesPriceChange_BL
{
    public class StageSetting_BL
    {
        public DataTable Stage_SelectRow(StageSetting_Entity sse)
        {
            StageSetting_DL sdl = new StageSetting_DL();
            return sdl.Stage_SelectRow(sse);
        }

        public DataTable StageID_Select(Stage_Entity se)
        {
            StageSetting_DL sdl = new StageSetting_DL();
            return sdl.StageID_Select(se);
        }
    }


}
