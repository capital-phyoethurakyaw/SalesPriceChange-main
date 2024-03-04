using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SalesPriceChange_DL;
using SalesPriceChange_Common;
using System.Data;
using System.Collections;

namespace SalesPriceChange_BL
{
    public class Stage_BL
    {
        public DataTable Stage_Select(Stage_Entity  ste)
        {
            Stage_DL sdl = new Stage_DL();
            return sdl.Stage_Select(ste);
        }

        public ArrayList Stage_SelectStage(string userID)
        {
            Stage_DL sdl = new Stage_DL();
            DataTable dt = sdl.Stage_SelectStage(userID);
            ArrayList arrlst = new ArrayList();
            foreach (DataRow dr in dt.Rows)
            {
                arrlst.Add(dr["StageID"].ToString());
            }
            return arrlst;
        }
        public DataTable Stage_Edit(string UsersID)
        {
            Stage_DL sdl = new Stage_DL();
            return sdl.Stage_Edit(UsersID);
        }
        public bool  StageID_Save(Stage_Entity ste)
        {
            Stage_DL sdl = new Stage_DL();
            return sdl.StageID_Save(ste);
        }
        public DataTable StageID_Select(String StageID)
        {
            Stage_DL sdl = new Stage_DL();
            return sdl.StageID_Select(StageID);
        }

    }
}

       
    

