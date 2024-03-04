using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SalesPriceChange_Common;
using System.Data;
using SalesPriceChange_BL;
using AjaxControlToolkit;

namespace SalesPriceChange.SalesPrice
{
    public partial class Stage_Setting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCombobox();
                DropDownStage();
            }
        }
        private void BindCombobox()
        {
            Stage_BL sbl = new Stage_BL();
            Stage_Entity ste = new Stage_Entity();
            ddlStage.DataTextField = "Description";
            ddlStage.DataValueField = "StageID";
            ddlStage.DataSource = sbl.Stage_Select(ste);
            ddlStage.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void Save()
        {
            Stage_BL sbl = new Stage_BL();
            Stage_Entity ste = new Stage_Entity();
            ste.StageID = ddlStage.SelectedItem.Value ;
          
            string setting = string.Empty;
            setting += chb1.Checked ? "1," : string.Empty;
            setting += chb2.Checked ? "2," : string.Empty;
            setting += chb3.Checked ? "3," : string.Empty;
            setting += chb4.Checked ? "4," : string.Empty;
            setting += chb5.Checked ? "5," : string.Empty;
            setting += chb6.Checked ? "6," : string.Empty;
            setting += chb7.Checked ? "7," : string.Empty;
            setting += chb8.Checked ? "8," : string.Empty;
            setting += chb9.Checked ? "9," : string.Empty;
            setting += chb10.Checked? "10," : string.Empty;
            setting += chb11.Checked? "11," : string .Empty;

            if (!String.IsNullOrEmpty(setting))
            {
                setting = setting.Remove(setting.Length - 1);
            }
           
            ste.RowID = setting;
         
            if (sbl.StageID_Save(ste))
            {
                Response.Write("<script>alert('Save Successfully');</script>");
                //Refresh();
            }
            else { Response.Write("<script>alert('Save failed');</script>");}
        }
        //private void Refresh()
        //{
        //    ddlStage.SelectedIndex  = 0;
        //    chb1.Checked = false;
        //    chb2.Checked = false;
        //    chb3.Checked = false;
        //    chb4.Checked = false;
        //    chb5.Checked = false;
        //    chb6.Checked = false;
        //    chb7.Checked = false;
        //    chb8.Checked = false;
        //    chb9.Checked = false;
        //    chb10.Checked = false;
        //    chb11.Checked = false;
        //}
        private  void chbClear()
        {
            chb1.Checked = false;
            chb2.Checked = false;
            chb3.Checked = false;
            chb4.Checked = false;
            chb5.Checked = false;
            chb6.Checked = false;
            chb7.Checked = false;
            chb8.Checked = false;
            chb9.Checked = false;
            chb10.Checked = false;
            chb11.Checked = false;
        }

        protected void ddlStage_indexchanged(object sender, EventArgs e)
        {
            DropDownStage();
        }
        protected void DropDownStage()
        {
            Stage_BL sbl = new Stage_BL();
            Stage_Entity ste = new Stage_Entity();
            string StageID = ddlStage.SelectedItem.Value;
            DataTable dt = new DataTable();
            dt = sbl.StageID_Select(StageID);
            chbClear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                CheckStageID(dt.Rows[i]["RowID"].ToString());
            }
        }

        private void CheckStageID(string RowID)
        {
            switch (RowID)
            {
                case "1":
                    chb1.Checked = true;
                    break;
                case "2":
                    chb2.Checked = true;
                    
                    break;
                case "3":
                    chb3.Checked = true;
                    break;
                case "4":
                    chb4.Checked = true;
                    break;
                case "5":
                    chb5.Checked = true;
                    break;
                case "6":
                    chb6.Checked = true;
                    break;
                case "7":
                    chb7.Checked = true;
                    break;
                case "8":
                    chb8.Checked = true;
                    break;
                case "9":
                    chb9.Checked = true;
                    break;
                case "10":
                    chb10.Checked = true;
                    break;
                case "11":
                    chb11.Checked = true;
                    break;

            }
        }
    }
}