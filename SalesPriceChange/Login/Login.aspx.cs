using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SalesPriceChange_Common;
using SalesPriceChange_BL;
using System.Data;
using System.Configuration;
using System.Collections.Specialized;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;
using System.IO;
using System.Xml;
namespace SalesPrice.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUserID.Focus();
            XMLtoDT();
        }
        public void XMLtoDT()
        {
            //XmlDocument doc = new XmlDocument();

            //doc.LoadXml("C:\\Users\\Phyoe Thura Kyaw\\Desktop\\Phyoe Data Dic.txt");
            //StringWriter sw = new StringWriter();
            //XmlTextWriter tx = new XmlTextWriter(sw);
            //doc.WriteTo(tx);
            //sw.ToString();




            //WebClient web = new WebClient();
            //string url = string.Format("https://api.facebook.com/method/fql.query?query=SELECT url, share_count, like_count, comment_count, total_count, click_count FROM link_stat where url=http://aspdotnet-suresh.com");
            ////string response = 
            //DataSet ds = new DataSet();
            //using (StringReader stringReader = new StringReader(response))
            //{
            //    ds = new DataSet();
            //    ds.ReadXml(stringReader);
            //}
            //DataTable dt = ds.Tables[0];

        }
        public string user_role = ConfigurationManager.AppSettings["user_role"].ToString();
        protected void Submit_ServerClick(object sender, EventArgs e)
        {
            string superuserID = ConfigurationManager.AppSettings["UserID"].ToString();
            string superIDpass = ConfigurationManager.AppSettings["LoginPassword"].ToString();
            if (txtUserID.Value.ToString() == superuserID & txtPassword.Value.ToString() == superIDpass)
            {
                Response.Redirect("~/Dashboard.aspx");
                //if (dtLogin.Rows[0]["ID"].ToString() == "36")
                //{

                //    Response.Write("<script> alert('Welcome!  Have a nice day')</script>");
                //}
            }
            else
            {

                Crypto crypto = new Crypto();
                Users_Entity ue = new Users_Entity();
                ue.UserID = txtUserID.Value;
                ue.Password = crypto.Encrypt(txtPassword.Value, "SPC123");
                Users_BL ubl = new Users_BL();
                DataTable dtLogin = ubl.checkLogin(ue);
                if (dtLogin.Rows.Count > 0)
                {
                    string u_role = string.Empty;
                    if (user_role == "1")
                    {
                        u_role = "ckmspc1";
                    }
                    else
                    {
                        u_role = "@ckm$spc";
                    }
                    if (dtLogin.Rows[0]["UserID"].ToString() != u_role)
                    {
                        Session["UserID"] = dtLogin.Rows[0]["ID"].ToString() + "," + dtLogin.Rows[0]["UserID"].ToString() + "," + dtLogin.Rows[0]["Theme"].ToString();
                        //if (dtLogin.Rows[0]["ID"].ToString() == "36")
                        //{

                        //    Response.Write("Welcome!  Have a nice day");
                        //}
                        //if (ubl.check_online(dtLogin.Rows[0]["ID"].ToString()))
                        //{
                            Response.Redirect("~/Dash_board.aspx");
                        //}
                    }

                }
                else
                {
                    //string uid = ue.UserID.ToString();
                    //string upass = ue.Password.ToString();
                    //string superuserID = ConfigurationManager.AppSettings["UserID"].ToString();
                    //string superIDpass = ConfigurationManager.AppSettings["LoginPassword"].ToString();
                    //if (uid == superuserID & upass == superIDpass)
                    //{
                    //    Response.Redirect("~/SalesPrice/SalePriceList.aspx");
                    //}
                    //else
                    //{

                    lblErrorMsg.Visible = true;
                    //}
                }
            }
        }
    }
}