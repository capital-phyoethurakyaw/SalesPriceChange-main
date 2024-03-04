using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SalesPriceChange_BL;
using SalesPriceChange_Common;

namespace SalesPrice
{
    public partial class Dashboard : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        Instructions_BL ibl = new Instructions_BL();
        Instructions_Entity ie = new Instructions_Entity();
        protected void Page_Load(object sender, EventArgs e)
        {
      
            if(!IsPostBack)
            {
                InstructionListBind();
         
                //string notitit = this.Master.FindControl("lblNoti").NamingContainer.ClientID
            }
        }
        //protected void Dashboard_PageSetting(object sender, PagePropertiesChangingEventArgs e)
        //{
        //    DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        //    InstructionList.DataBind();
        //}

        private void InstructionListBind()
        {
            ie.UserID = Convert.ToInt32 (Session["UserID"].ToString().Split(',')[0]);
            dt = ibl.Instruction_Info(ie);
            InstructionList.DataSource = dt;
            InstructionList.DataBind();
            
        }
        protected void Instruction_PreRender(object sender, EventArgs e)
        {
            InstructionListBind();
        }
        protected void Instruction_Itemdatabound(object sender,ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Label lbl = e.Item.FindControl("lblID") as Label;
                HyperLink hyperlink = (HyperLink)e.Item.FindControl("lblFormNo");
                hyperlink.NavigateUrl = "~/Instructions/Instructions.aspx?ID=" + lbl.Text;
            } 
        }
    }
}