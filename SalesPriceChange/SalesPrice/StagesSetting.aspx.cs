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

namespace SalesPrice.SalesPrice
{
    public partial class StagesSetting : System.Web.UI.Page
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

        protected void ddlStage_indexchanged(object sender, EventArgs e)
        {
            DropDownStage();
        }

        private void chkClear()
        {
            chk1.Checked = false;
            chk2.Checked = false;
            chk3.Checked = false;
            chk4.Checked = false;
            chk5.Checked = false;
            chk6.Checked = false;
            chk7.Checked = false;
            chk8.Checked = false;
            chk9.Checked = false;
            chk10.Checked = false;
            chk11.Checked = false;
        }
        //Dropdownstage indexchanged
        protected void DropDownStage()
        {
            Stage_BL sbl = new Stage_BL();
            Stage_Entity ste = new Stage_Entity();
            string StageID = ddlStage.SelectedItem.Value;
            DataTable dt = new DataTable();
            dt = sbl.StageID_Select(StageID);
            chkClear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                CheckStageID(dt.Rows[i]["RowID"].ToString());
            }
        }
        //Control Stage
        private void CheckStageID(string RowID)
        {
            switch (RowID)
            {
                case "1":
                    chk1.Checked = true;
                    break;
                case "2":
                    chk2.Checked = true;
                    break;
                case "3":
                    chk3.Checked = true;
                    break;
                case "4":
                    chk4.Checked = true;
                    break;
                case "5":
                    chk5.Checked = true;
                    break;
                case "6":
                    chk6.Checked = true;
                    break;
                case "7":
                    chk7.Checked = true;
                    break;
                case "8":
                    chk8.Checked = true;
                    break;
                case "9":
                    chk9.Checked = true;
                    break;
                case "10":
                    chk10.Checked = true;
                    break;
                case "11":
                    chk11.Checked = true;
                    break;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Save();
        }
        //Control Save
        protected void Save()
        {
            Stage_BL sbl = new Stage_BL();
            Stage_Entity ste = new Stage_Entity();
            ste.StageID = ddlStage.SelectedItem.Value;

            string setting = string.Empty;
            setting += chk1.Checked ? "1," : string.Empty;
            setting += chk2.Checked ? "2," : string.Empty;
            setting += chk3.Checked ? "3," : string.Empty;
            setting += chk4.Checked ? "4," : string.Empty;
            setting += chk5.Checked ? "5," : string.Empty;
            setting += chk6.Checked ? "6," : string.Empty;
            setting += chk7.Checked ? "7," : string.Empty;
            setting += chk8.Checked ? "8," : string.Empty;
            setting += chk9.Checked ? "9," : string.Empty;
            setting += chk10.Checked ? "10," : string.Empty;
            setting += chk11.Checked ? "11," : string.Empty;

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
            else { Response.Write("<script>alert('Save failed');</script>"); }
        }
    }
}