using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace SalesPrice
{
    public partial class Chat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string msg = (string)Application["message"];
            txtmsg.Text = msg;
        }
        protected void brnadd_Click(object sender, EventArgs e)
        {
            Session["name"] = txtname.Text;
            lbluname.Text = "Welcome" + txtname.Text;
            txtname.Text = "";

        }

        protected void Button1_Click(object sender, EventArgs e)
         {
             string name = string.Empty;
             try
             {
                 name = Session["UserID"].ToString().Split(',')[1].ToString();
             }
             catch
             {
                 Session["name"] = "temp_user";
                 name = Session["name"].ToString();
             }
           string message = txtsend.Text;
           string my = name + "::" + message;
           DateTime moment = DateTime.Now;
           int mhour = moment.Hour;
           int mmin = moment.Minute;
           string dd = "           " + mhour + ":" + mmin;
          string ee= color_painter(dd);
           Application["message"] = Application["message"] + my + ee + Environment.NewLine;
           txtsend.Text = "";
           Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri.ToString(), false);
         }
        public static string color_painter(string dd)
        {
            return  dd.ToString() ;

        }


    }
}