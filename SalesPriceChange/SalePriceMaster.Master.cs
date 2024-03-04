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
using System.Configuration;
using AjaxControlToolkit;


namespace SalesPriceChange
{
    public partial class SalePriceMaster : System.Web.UI.MasterPage
    {

        public int theme_id = 1;
        public static bool isMobileBrowser()
        {
            //GETS THE CURRENT USER CONTEXT
            HttpContext context = HttpContext.Current;

            //FIRST TRY BUILT IN ASP.NT CHECK
            if (context.Request.Browser.IsMobileDevice)
            {
                return true;
            }
            //THEN TRY CHECKING FOR THE HTTP_X_WAP_PROFILE HEADER
            if (context.Request.ServerVariables["HTTP_X_WAP_PROFILE"] != null)
            {
                return true;
            }
            //THEN TRY CHECKING THAT HTTP_ACCEPT EXISTS AND CONTAINS WAP
            if (context.Request.ServerVariables["HTTP_ACCEPT"] != null &&
                context.Request.ServerVariables["HTTP_ACCEPT"].ToLower().Contains("wap"))
            {
                return true;
            }
            //AND FINALLY CHECK THE HTTP_USER_AGENT 
            //HEADER VARIABLE FOR ANY ONE OF THE FOLLOWING
            if (context.Request.ServerVariables["HTTP_USER_AGENT"] != null)
            {
                //Create a list of all mobile types
                string[] mobiles =
                    new[]
                {
                    "midp", "j2me", "avant", "docomo", 
                    "novarra", "palmos", "palmsource", 
                    "240x320", "opwv", "chtml",
                    "pda", "windows ce", "mmp/", 
                    "blackberry", "mib/", "symbian", 
                    "wireless", "nokia", "hand", "mobi",
                    "phone", "cdm", "up.b", "audio", 
                    "SIE-", "SEC-", "samsung", "HTC", 
                    "mot-", "mitsu", "sagem", "sony"
                    , "alcatel", "lg", "eric", "vx", 
                    "NEC", "philips", "mmm", "xx", 
                    "panasonic", "sharp", "wap", "sch",
                    "rover", "pocket", "benq", "java", 
                    "pt", "pg", "vox", "amoi", 
                    "bird", "compal", "kg", "voda",
                    "sany", "kdd", "dbt", "sendo", 
                    "sgh", "gradi", "jb", "dddi", 
                    "moto", "iphone"
                };

                //Loop through each item in the list created above 
                //and check if the header contains that text
                foreach (string s in mobiles)
                {
                    if (context.Request.ServerVariables["HTTP_USER_AGENT"].
                                                        ToLower().Contains(s.ToLower()))
                    {
                        return true;
                    }
                }
            }

            return false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            //Label Masternoti = (Label)this.Master.FindControl("lblNoti");
            //Master.FindControl("title_master").Page.Title = "DashBoard?id=" + Masternoti.Text; 
            //if (Session["UserID"].ToString().Split(',')[0]== "")
            //{
            //    try
            //    {

            //            Users_BL ubl = new Users_BL();
            //            if (ubl.change_offline(lblID.Text.ToString()))
            //            {
            //                return;
            //            }

            //    }
            //    catch
            //    {
            //        Response.Redirect("~/Login/Login.aspx");
            //    }
            //    Session.Abandon();
            //    Response.Redirect("~/Login/Login.aspx");
            //}
            //else
            //{


            if (!IsPostBack)
            {
                try
                {
                    Theme_setting();
                }
                catch
                {
                }
            }

            BindGrid(true);
            if (string.IsNullOrEmpty(Page.Title) || !string.IsNullOrEmpty(Page.Title))
            {
                //Page.Title = ConfigurationManager.AppSettings["here"];  //title saved in web.config

                try
                {
                    lblNoti.Style.Add("color", "white");
                    string donoti = lblNoti.Text.ToString();

                    string dinoti = Session["notim"].ToString();
                    string denoti = " ";
                    string all = string.Concat("(", donoti, ")", denoti, dinoti);
                    if (!string.IsNullOrWhiteSpace(donoti))
                    {
                        Page.Title = all.ToString().PadLeft(100);
                    }
                    else
                    {
                        Page.Title = string.Concat(denoti, dinoti);
                    }

                }
                catch
                {
                    Response.Redirect("~/Login/Login.aspx");
                }

                //}
            }

        
        }

        private void BindGrid(bool isload)
        {
            string url = string.Empty;
            if (Session["UserID"] != null)
            {

                string uritry = string.Empty;
                try
                {
                    uritry = HttpContext.Current.Request.Url.AbsoluteUri.ToString();
                }
                catch
                {
                    uritry = this.Request.UrlReferrer.ToString();
                }
                try
                {
                    if (!string.IsNullOrWhiteSpace(uritry))
                    {

                        url = HttpContext.Current.Request.Url.AbsoluteUri;
                        string uli = new Uri(url).ToString();
                        string newurl = Request.Url.Segments[1].ToString();
                        string new1 = newurl.Length.ToString();
                        string lastPart = uli.Split('/').Last();
                        string forepart = lastPart.Split('.').First();
                        Session["notim"] = forepart.ToString();



                        string[] str = Session["UserID"].ToString().Split(',');
                        lblUserID.Text = str[1];
                        lblID.Text = str[0];
                        Users_Entity ue = new Users_Entity();
                        Instructions_BL ibl = new Instructions_BL();
                        DataTable dt = new DataTable();
                        ue.ID = str[0];
                        dt = ibl.Instruction_NotiList(ue);

                        if (dt.Rows.Count > 0)
                        {
                            lblNoti.Text = dt.Rows.Count.ToString();
                            gvTestNoti.DataSource = dt;
                            gvTestNoti.DataBind();
                        }
                        else
                        {
                            lblNoti.Text = string.Empty;
                            gvTestNoti.DataSource = null;
                            gvTestNoti.DataBind();
                        }


                        //Session["lnlmas"] = lblNoti.Text.ToString();
                        if (isload)
                            hiddenmenu(str[0]);
                    }
                    else
                    {
                        //online_status();
                        Response.Redirect("~/Login/Login.aspx");
                    }
                }
                catch
                {
                    //online_status();
                    Response.Redirect("~/Login/Login.aspx");
                }
            }
            else
            {
                //online_status();
                Response.Redirect("~/Login/Login.aspx");
            }
        }

        //public void online_status()
        //{
        //    try
        //    {
        //        string did = Session["UserID"].ToString().Split(',')[0].ToString();
        //        if (did != null)
        //        {
        //            Users_BL ubl = new Users_BL();
        //            if (ubl.change_offline(did))
        //            {
        //                return ;
        //            }
        //        }
        //    }
        //    catch
        //    {

        //    }
        //}

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

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            BindGrid(false);
        }

        private void hidemenu(string MenuID)
        {
            switch (MenuID)
            {
                case "1":
                    home.Style.Add("display", "block");
                    break;
                case "2":
                    instruction_cate.Style.Add("display", "block");
                    break;
                case "3":
                    instruction_list.Style.Add("display", "block");
                    break;
                case "4":
                    instruction.Style.Add("display", "block");
                    break;
                case "5":
                    MD_manage.Style.Add("display", "block");
                    break;
                case "6":
                    supply_control.Style.Add("display", "block");
                    break;
                case "7":
                    manage_screen.Style.Add("display", "block");
                    break;
                case "8":
                    apply_type.Style.Add("display", "block");
                    break;
                case "9":
                    suppliers_entry.Style.Add("display", "block");
                    break;
                case "10":
                    brand_entry.Style.Add("display", "block");
                    break;
                case "11":
                    cost_unit.Style.Add("display", "block");
                    break;
                case "12":
                    selling_price.Style.Add("display", "block");
                    break;
                case "13":
                    special_price.Style.Add("display", "block");
                    break;
                case "14":
                    inventory_type.Style.Add("display", "block");
                    break;
                case "15":
                    users_list.Style.Add("display", "block");
                    break;
                case "16":
                    users_entry.Style.Add("display", "block");
                    break;
                case "17":
                    category_entry.Style.Add("display", "none");
                    break;
            }
        }

        protected void Setting_Click(Object sender, EventArgs e)
        {
            Users_Entity ue = new Users_Entity();
            Users_BL ubl = new Users_BL();
            ue.ID = lblID.Text;
            DataTable dt = ubl.Users_Select(ue);
            string id = dt.Rows[0]["ID"].ToString();//select first Roll first Column for ID Selection to Send with That parameter
            Response.Redirect("~/Users/UserEntry.aspx?ID=" + id);
        }

        protected void Logout_Click(Object sender, EventArgs e)
        {
            //online_status();
            Session.Abandon();
            Response.Redirect("~/Login/Login.aspx");

        }

        protected void gvTestNoti_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbl = e.Row.FindControl("lblNotiID") as Label;
                HyperLink hl = e.Row.FindControl("lnkFormID") as HyperLink;
                hl.NavigateUrl = "~/Instructions/Instructions.aspx?ID=" + lbl.Text;
            }
        }

        protected void theme_1(object sender, EventArgs e)
        {
            theme_id = 1;
            string[] UserInfo = Session["UserID"].ToString().Split(',');

            Instructions_BL ibl = new Instructions_BL();
            if (ibl.update_theme(theme_id.ToString(), UserInfo[0]))
            {
                MyStyleSheet.Href = "~/Sheet_Style/1.css";
                ChangeSession("1");
            }
        }
        protected void theme_2(object sender, EventArgs e)
        {
            theme_id = 2;
            string[] UserInfo = Session["UserID"].ToString().Split(',');
            Instructions_BL ibl = new Instructions_BL();
            if (ibl.update_theme(theme_id.ToString(), UserInfo[0]))
            {
                MyStyleSheet.Href = "~/Sheet_Style/2.css";
                ChangeSession("2");
            }
        }
        protected void theme_3(object sender, EventArgs e)
        {
            theme_id = 3;
            string[] UserInfo = Session["UserID"].ToString().Split(',');
            Instructions_BL ibl = new Instructions_BL();
            if (ibl.update_theme(theme_id.ToString(), UserInfo[0]))
            {
                MyStyleSheet.Href = "~/Sheet_Style/3.css";
                ChangeSession("3");
            }
        }
        protected void theme_4(object sender, EventArgs e)
        {
            theme_id = 4;
            string[] UserInfo = Session["UserID"].ToString().Split(',');
            Instructions_BL ibl = new Instructions_BL();
            if (ibl.update_theme(theme_id.ToString(), UserInfo[0]))
            {
                MyStyleSheet.Href = "~/Sheet_Style/4.css";
                ChangeSession("4");
            }
        }
        protected void theme_5(object sender, EventArgs e)
        {
            theme_id = 5;
            string[] UserInfo = Session["UserID"].ToString().Split(',');
            Instructions_BL ibl = new Instructions_BL();
            if (ibl.update_theme(theme_id.ToString(), UserInfo[0]))
            {
                MyStyleSheet.Href = "~/Sheet_Style/5.css";
                ChangeSession("5");
            }
        }
        protected void theme_6(object sender, EventArgs e)
        {
            theme_id = 6;
            string[] UserInfo = Session["UserID"].ToString().Split(',');
            Instructions_BL ibl = new Instructions_BL();
            if (ibl.update_theme(theme_id.ToString(), UserInfo[0]))
            {
                MyStyleSheet.Href = "~/Sheet_Style/6.css";
                ChangeSession("6");
            }
        }
        private void ChangeSession(string value)
        {
            string[] UserInfo = Session["UserID"].ToString().Split(',');
            UserInfo[2] = value;
            Session["UserID"] = UserInfo[0] + "," + UserInfo[1] + "," + UserInfo[2];
        }

        protected void theme_original(Object sender, EventArgs e)
        {
            theme_id = 0;
            string[] UserInfo = Session["UserID"].ToString().Split(',');
            Instructions_BL ibl = new Instructions_BL();
            if (ibl.update_theme(theme_id.ToString(), UserInfo[0]))
            {
                MyStyleSheet.Href = "";
                ChangeSession("0");
            }
        }

        protected void Theme_setting()
        {
            try
            {
                string[] UserInfo = Session["UserID"].ToString().Split(',');

                
                MyStyleSheet.Href = "~/Sheet_Style/" + UserInfo[2] + ".css";


                if (Convert.ToInt32(UserInfo[2].ToString()) == 6)
                {
                    bg_theme.Attributes["class"] = "";
                    bg_theme.Attributes["class"] = "button-bg theme_1";

                }
                else if (Convert.ToInt32(UserInfo[2].ToString()) == 5)
                {
                    bg_theme.Attributes["class"] = "";
                    bg_theme.Attributes["class"] = "button-bg theme_0";
                }
                else
                {
                    bg_theme.Attributes["class"] = "";
                    bg_theme.Attributes["class"] = "button-bg theme_" + (Convert.ToInt32(UserInfo[2].ToString()) + 2).ToString();
                }
            }
            catch
            {
            }

        }

        protected void change_backtheme(object sender, EventArgs e)
        {
            string className =  btnb_wrp.Attributes["class"].ToString();
            if (className.Equals("button-wrap"))
            {
                btnb_wrp.Attributes["class"] = "";
                btnb_wrp.Attributes.Add("class", "button-wrap button-active");

            }
            else
            {
                btnb_wrp.Attributes["class"] = "";
                btnb_wrp.Attributes.Add("class", "button-wrap");
               
            }
            string[] UserInfo = Session["UserID"].ToString().Split(',');
            string added_thme_id=string.Empty;

           

            if (Convert.ToInt32(UserInfo[2].ToString()) == 6)
            {
                added_thme_id = "0";
                bg_theme.Attributes["class"] = "";
                bg_theme.Attributes["class"] = "button-bg theme_1";

            }
            else if(Convert.ToInt32(UserInfo[2].ToString()) == 5)
            {
                added_thme_id = (Convert.ToInt32(UserInfo[2].ToString()) + 1).ToString();
                bg_theme.Attributes["class"] = "";
                bg_theme.Attributes["class"] = "button-bg theme_0";
            }
            else
            {
                added_thme_id = (Convert.ToInt32(UserInfo[2].ToString()) + 1).ToString();
                bg_theme.Attributes["class"] = "";
                bg_theme.Attributes["class"] = "button-bg theme_"+(Convert.ToInt32(UserInfo[2].ToString()) + 2).ToString();
            }
            Instructions_BL ibl = new Instructions_BL();
            if (ibl.update_theme(added_thme_id, UserInfo[0]))
            {
                MyStyleSheet.Href = "~/Sheet_Style/" + added_thme_id + ".css";
                ChangeSession(added_thme_id);
            }
        }
    }
}