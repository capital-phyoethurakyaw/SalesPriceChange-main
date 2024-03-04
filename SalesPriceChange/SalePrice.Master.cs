using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.Services;
using SalesPriceChange_BL;
using SalesPriceChange_Common;
using System.Web.Security;

namespace SalesPriceChange
{
    public partial class SalePrice : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                string[] str = Session["UserID"].ToString().Split(',');
                lblUserID.Text = str[1];
                lblID.Text = str[0];
                Users_Entity ue = new Users_Entity();
                SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
                DataTable dt = new DataTable();
                ue.ID = str[0];//system ID of User table
                dt = sbl.SalePriceDetail_NotiList(ue);
                if (dt.Rows.Count > 0)
                {
                    gvTestNoti.DataSource = dt;
                    gvTestNoti.DataBind();
                }
                hiddenmenu(str[0]);
            }
            else
            {
                Response.Redirect("~/Login/Login.aspx");
            }
        }
        private void hiddenmenu(string id)
        {
            menu_Entity me1 = new menu_Entity();
            menu_BL sbl1 = new menu_BL();
            DataTable dt1 = new DataTable();
            me1.UserID = id;
            dt1 = sbl1.menu_hidden(me1);
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                hidemenu(dt1.Rows[i]["MenuID"].ToString());
            }
        }
        private void hidemenu(string MenuID)
        {
            switch (MenuID)
            {              
                case "1":
                    menu1.Style.Add("display", "block");
                    break;
                case "2":
                    menu2.Style.Add("display", "block");
                    break;
                case "3":
                    menu3.Style.Add("display", "block");
                    break;
                case "4":
                    menu4.Style.Add("display", "block");
                    break;
                case "5":
                    menu5.Style.Add("display", "block");
                    break;
                case "6":
                    menu6.Style.Add("display", "block");
                    break;
                case "7":
                    menu7.Style.Add("display", "block");
                    break;
                case "8":
                    menu8.Style.Add("display", "block");
                    break;
                case "9":
                    menu9.Style.Add("display", "block");
                    break;
                case "10":
                    menu10.Style.Add("display", "block");
                    break;
                case "11":
                    menu11.Style.Add("display", "block");
                    break;
            }
        }
        protected void Anchor_Click(Object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login/Login.aspx");
        }
        protected void setting_Click(Object sender, EventArgs e)
        {
            Users_Entity ue = new Users_Entity();
            Users_BL ubl = new Users_BL();
            ue.ID = lblID.Text;
            DataTable dt = ubl.Users_Select(ue);
            string id = dt.Rows[0]["ID"].ToString();//select first Roll first Column for ID Selection to Send with That parameter
            Response.Redirect("~/Users/Users_Entry.aspx?ID=" + id);
        }

        protected void UserList_Click(Object sender, EventArgs e)
        {
            Response.Redirect("~/Users/UserList.aspx");
        }
        protected void UserEntry_Click(Object sender, EventArgs e)
        {
            Response.Redirect("~/Users/Users_Entry.aspx");
        }

        protected void PriceChange_Click(Object sender, EventArgs e)
        {
            Response.Redirect("~/SalesPrice/SalesPrice_Change.aspx");
        }

        protected void PriceList_Click(Object sender, EventArgs e)
        {
            Response.Redirect("~/SalesPrice/SalesPrice_List.aspx");
        }

        protected void About_Click(Object sender, EventArgs e)
        {
            Response.Redirect("~/About.aspx");
        }
        protected void notiLinkButton_Click(Object sender, EventArgs e)
        {
            Users_Entity ue = new Users_Entity();
            SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
            DataTable dt = new DataTable();
            ue.ID = lblID.Text;
            dt = sbl.SalePriceDetail_NotiList(ue);
            if (dt.Rows.Count > 0)
            {
                gvTestNoti.DataSource = dt;
                gvTestNoti.DataBind();
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('No Notifications Right Now!')</script>");
            }
        }
    }
}