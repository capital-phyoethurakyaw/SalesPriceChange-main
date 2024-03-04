using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using SalesPriceChange_DL;

namespace SalesPriceChange_BL
{
    public class SalesPriceDetail_BL
    {
        public bool   Save(SalesPriceDetail_Entity se)
        {
            SalesPriceDetail_DL sdl = new SalesPriceDetail_DL();
            return sdl.SalePriceDetail_Insert(se);
        }
        //duplicate formid
        public bool checkFormNo(SalesPriceDetail_Entity se)
        {
            SalesPriceDetail_DL sdl = new SalesPriceDetail_DL();
            DataTable dt = sdl.FormNo_Select(se);
            if (dt.Rows.Count > 0)
                return true;
            return false;
        }

        public DataTable SalePrice_Edit(SalesPriceDetail_Entity se)
        {
            SalesPriceDetail_DL spdl = new SalesPriceDetail_DL();
            return spdl.SalePrice_Edit(se);
        }
        public bool SalePriceList_Update(SalesPriceDetail_Entity se)
        {
            SalesPriceDetail_DL sdl = new SalesPriceDetail_DL();
            return sdl.SalesPriceList_Update(se);
        }
        public bool SalePriceList_Delete(SalesPriceDetail_Entity se)
        {
            SalesPriceDetail_DL sdl = new SalesPriceDetail_DL();
            return sdl.SalePriceList_Delete(se);
        }
        public DataTable SalePrcieList_Search(SalesPriceDetail_Entity se)
        {
            SalesPriceDetail_DL sdl = new SalesPriceDetail_DL();
            return sdl.SalePrcieList_Search(se);
        }
        //Show noti by gridview
        public DataTable  SalePriceDetail_NotiList(Users_Entity ue)
        { 
            SalesPriceDetail_DL sdl = new SalesPriceDetail_DL();
            DataTable dt = sdl.SalesPriceDetail_NotiList(ue );
            return dt;
        }
        //Show noti count
        public DataTable SalePriceDetail_NotiCount(string UserID)
        {
            SalesPriceDetail_DL sdl = new SalesPriceDetail_DL();
            return sdl.SalePriceDetail_NotiCount(UserID);
            //DataTable dt = sdl.SalePriceDetail_NotiCount(UserID);
            //if (dt.Rows.Count > 0)
            //{
            //    return dt.Rows[0]["NotiCount"].ToString();
            //}
            //else
            //    return string.Empty;
        }

        public DataTable SalePriceList_Select(SalesPriceDetail_Entity se)
        {
            SalesPriceDetail_DL spdl = new SalesPriceDetail_DL();
            return spdl.SalePriceList_Select(se);
        }
       //New FormID after save
        public string SalePriceDetail_GetFormID()
        {
            SalesPriceDetail_DL spdl = new SalesPriceDetail_DL();
            DataTable dt = spdl.SalePriceDetail_GetFormID();
            string result = string.Empty;
            if (dt.Rows.Count > 0)
            {
                string temp = dt.Rows[0]["FormNo"].ToString();
                if (string.IsNullOrWhiteSpace(temp))
                    return (DateTime.Now.Year.ToString() + "-00001");
                else
                {
                    string[] strarr = temp.Split('-');
                    return (strarr[0] + "-" + (Convert.ToInt32(strarr[1]) + 1).ToString("D5"));
                }
            }
            else
                return (DateTime.Now.Year.ToString() + "-00001");
        }
        public DataTable FormStage_Check(Users_Entity ue)
        {
            SalesPriceDetail_DL spdl = new SalesPriceDetail_DL();
            return spdl.FormStage_Check(ue);
        }
    }
}
