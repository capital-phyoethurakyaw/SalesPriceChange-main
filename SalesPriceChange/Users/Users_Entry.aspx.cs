using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SalesPriceChange_BL;
using SalesPriceChange_Common;
using System.Data;

namespace  SalesPriceChange.Users
{
    public partial class Users_Entry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
             txtUserID.Focus();
             if (!IsPostBack)
             {
                 BindUserType();
                 if (Request.QueryString["ID"] != null)
                 {
                     Edit();
                 }
             }
        }
        private void BindUserType()
        {
            Stage_Entity ste = new Stage_Entity();
            Stage_BL sbl = new Stage_BL();
            DataTable dt = sbl.Stage_Select(ste);
            cblUserType.DataSource = dt;
            cblUserType.DataTextField = "Description";
            cblUserType.DataValueField = "StageID";
            cblUserType.DataBind();
        }



        protected void Save()
        {
            if (Check())
            {
                Users_Entity ue = new Users_Entity();
                Crypto crypto = new Crypto();
                ue.UserID = txtUserID.Text;
                ue.Password = crypto.Encrypt(txtPassword.Text, "SPC123");
                //ue.UserLevel = UserLevel().ToString();

                Stage_Entity ste = new Stage_Entity();

                List<string> selectedValues = cblUserType.Items.Cast<ListItem>().Where(li => li.Selected).Select(li => li.Value).ToList();
                ste.StageIDs = string.Join(",", selectedValues);

                Users_BL ubl = new Users_BL();
                string s = Session["UserID"].ToString();
                int i = Convert.ToInt16(s.Split(',')[0]);
                if (ubl.Users_Insert(ue, ste ,i)) 
                {
                    Response.Write("<script>alert('Save Successfully');</script>");
                    //Response.Redirect(Request.RawUrl);
                    Refresh();
                }
                else 
                {
                    Response.Write("<script>alert('Save failed');</script>");
                }
               
            }
            else { Response.Write("<script>alert('Save failed');</script>"); }
        }
       
        public void Refresh()
        {
            txtUserID.Text = string.Empty;
            txtPassword.Text = string.Empty;
            cblUserType.ClearSelection();
        }
        protected bool Check()
        {
            Users_BL ubl = new Users_BL();
            Users_Entity ue = new Users_Entity();
            ue.UserID = txtUserID.Text;
            if (ubl.checkUser(ue))
            {
                lblinfo.Visible = true;
                txtUserID.Attributes.Add("onfocus", "this.select()");
                return false;
            }
            else
            {
                lblinfo.Visible = false;
                return true;
            }
        }
        protected void Edit()
        {
            btnSave.Text = "Update";
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            Users_BL ubl = new Users_BL();
            Crypto crypto = new Crypto();
            Users_Entity ue = new Users_Entity();
            ue.ID = Request.QueryString["ID"];
            DataTable dt = ubl.Users_Select(ue);
            txtUserID.Text = dt.Rows[0]["UserID"].ToString();
            txtPassword.Text = crypto.Decrypt(dt.Rows[0]["Password"].ToString(), "SPC123");
            txtPassword.Attributes["value"] = txtPassword.Text;
           
           
            Stage_Entity ste = new Stage_Entity();
            Stage_BL sbl = new Stage_BL();
            string UsersID = ue.ID;
            DataTable dtb = sbl.Stage_Edit (UsersID);
            for (int i = 0; i < dtb.Rows.Count; i++)
            {
                cblUserType.Items.FindByValue(dtb.Rows[i]["StageID"].ToString()).Selected = true;
            }
        }

        protected void Update()
        {
            if (checkinfo())
            {
                Crypto crypto = new Crypto();
                Users_Entity ue = new Users_Entity();
                Stage_Entity ste = new Stage_Entity();
                Users_BL ubl = new Users_BL();
                ue.ID = Request.QueryString["ID"];
                ue.UserID = txtUserID.Text;
                ue.Password = crypto.Encrypt(txtPassword.Text, "SPC123");
                //ue.UserLevel = UserLevel().ToString();
                List<string> selectedValues = cblUserType.Items.Cast<ListItem>().Where(li => li.Selected).Select(li => li.Value).ToList();
                ste.StageIDs = string.Join(",", selectedValues);
                string s = Session["UserID"].ToString();
                int i = Convert.ToInt16(s.Split(',')[0]);
                if (ubl.Users_Update(ue, ste,i))
                {

                    string id = Session["UserID"].ToString().Split(',')[0];
                    Session["UserID"] = id + ',' + ue.UserID;
                    Response.Write("<script>alert('Update Successfully');</script>");
                    //Response.Redirect(Request.RawUrl);
                    Refresh();
                }
                else
                {
                    Response.Write("<script>alert('Update failed');</script>");
                }
            }
            else { Response.Write("<script>alert('Update failed');</script>"); }
        }
        public bool CheckUpdate()
        {
            Users_Entity ue = new Users_Entity();
            ue.UserID = txtUserID.Text;
            Users_BL ubl = new Users_BL();
            return ubl.CheckUpdate (ue, Request.QueryString["ID"].ToString());
        }
        protected bool  checkinfo()
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            Users_BL ubl = new Users_BL();
            Users_Entity ue = new Users_Entity();
            ue.ID = Request.QueryString["ID"];
            DataTable dt = ubl.Users_Edit(ue);
            if (!CheckUpdate())
            {
                lblinfo.Visible = true;
                txtUserID.Attributes.Add("onfocus", "this.select()");
                return false;
            }
            else
            {
                lblinfo.Visible = false;
                return true;
            }
        }

        protected void btnOk_click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save")
            {
                Save();
            }
            else 
            {
                Update();
            }
      
        }
    }
}
  