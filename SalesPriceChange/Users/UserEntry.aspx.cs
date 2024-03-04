using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using SalesPriceChange_BL;
using SalesPriceChange_Common;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.Serialization.Formatters.Binary;
using System.Configuration;
using AjaxControlToolkit;
using System.Collections;
using System.Globalization;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
//using SKYPE4COMLib;
using context = System.Web.HttpContext;


namespace SalesPrice.Users
{
    public partial class UserEntry : System.Web.UI.Page
    {
        public string user_role = ConfigurationManager.AppSettings["user_role"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUserID.Focus();
            if (!IsPostBack)
            {
                try
                {
                    TreeView1.Attributes.Add("onclick", "OnTreeClick(event)");
                    menu_Entity me = new menu_Entity();
                    menu_BL mb = new menu_BL();
                    DataTable dt = mb.menu_select(me);
                    TreeNode tnAll = new TreeNode("Root", "0");
                    tnAll.SelectAction = TreeNodeSelectAction.None;
                    TreeView1.Nodes.Add(tnAll);
                    PopulateTreeView(dt, 0, tnAll);
                    //testh();
                    BindUserType();
                    //from menus mode settings

                    testh();
                   
                }
                catch (Exception ex)
                {
                    error_check ec = new error_check();
                    ec.send_Exce_to_DB(ex);
                }
            }
            if (Request.QueryString["ID"] != null)
            {

                Users_Entity ue = new Users_Entity();
                string s = Session["UserID"].ToString();
                int i = Convert.ToInt16(s.Split(',')[0]);
                ue.ID = i.ToString();
                //Users_Entity ue = new Users_Entity();
                Stage_Entity ste = new Stage_Entity();
                Users_BL ubl = new Users_BL();
                string d = "16";
                string u_role = string.Empty;
                if (user_role == "1")
                {
                    u_role = "36";
                }
                else
                {
                    u_role = "10";
                }
                if (Convert.ToInt16(s.Split(',')[0]).ToString() != u_role)
                {
                    DataTable dt_filter = new DataTable();
                    dt_filter = ubl.entry_hide_filter(ue, d);
                    if (dt_filter.Rows.Count == 0)
                    {
                        //if (dt_filter.Rows[0]["UserID"].ToString() != "36")
                        //{
                        men_hide.Style.Add("display", "none");
                        stag_hide.Style.Add("display", "none");
                        //}
                    }
                }
                else if (Convert.ToInt16(s.Split(',')[0]).ToString() == u_role)
                {
                    //user_hide1.Attributes.Remove("class");
                    //user_hide1.Style.Remove("class");
                    //user_hide1.Style.Add("display","none");
                    //stag_hide.Attributes.Add("class", "active");
                    if (Request.QueryString["ID"] == ue.ID)
                    {
                        btn_admin.Style.Add("display", "none");
                    }

                }
                else
                {
                }

            }    
        }
      public void  testh()
        {
            if (Request.QueryString["ID"] != null)
            {
                Users_Entity ue = new Users_Entity();
                ue.ID = Request.QueryString["ID"];
                SetUser(ue);
                SetPermission(ue);
                SetMenu(ue);
                url = HttpContext.Current.Request.Url.AbsoluteUri.ToString();
            }
        }
        public static string url;

        private void SetPermission(Users_Entity ue)
        {
            try{
            Stage_Entity ste = new Stage_Entity();
            Stage_BL sbl = new Stage_BL();
            string UsersID = ue.ID;
            DataTable dtb = sbl.Stage_Edit(UsersID);

            //if (Convert.ToInt32(dtb.Rows[0]["StageID"]) != -1 ||  dtb.Rows.Count >0)
            if (dtb.Rows.Count > 0)
            {

                for (int i = 0; i < dtb.Rows.Count; i++)
                {
                    cblUserType.Items.FindByValue(dtb.Rows[i]["StageID"].ToString()).Selected = true;
                }
            }
             }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        private void SetUser(Users_Entity ue)
        {
            try
            {
                lblSave.Text = "更新";
                int ID = Convert.ToInt32(Request.QueryString["ID"]);
                Users_BL ubl = new Users_BL();
                Crypto crypto = new Crypto();
                DataTable dt = ubl.Users_Select(ue);
                txtUserID.Text = dt.Rows[0]["UserID"].ToString();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                txtPassword.Text = crypto.Decrypt(dt.Rows[0]["Password"].ToString(), "SPC123");
                txtPassword.Attributes["value"] = txtPassword.Text;
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        private void SetMenu(Users_Entity ue)
        {
            try
            {
                menu_BL mbl = new menu_BL();
                menu_Entity me = new menu_Entity();
                string UserID = Request.QueryString["ID"];
                DataTable dt = new DataTable();
                dt = mbl.Menu_Select(UserID);

                //from menus mode settings
                TreeNode node = TreeView1.Nodes[0];
                checkNode(node, dt);
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        //looping Check Value with recursive method in parent and child nodes  
        private void checkNode(TreeNode parentNode, DataTable dt)
        {
            try
            {
                DataRow[] dr = dt.Select("MenuID ='" + parentNode.Value.ToString() + "'");
                if (dr.Count() > 0)
                    parentNode.Checked = true;

                foreach (TreeNode subNode in parentNode.ChildNodes)
                {
                    checkNode(subNode, dt);
                }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        //Populating treeview Check Value in Recursive
        private void PopulateTreeView(DataTable dtParent, int parentId, TreeNode treeNode)
        {
            try
            {
                foreach (DataRow row in dtParent.Rows)
                {
                    menu_Entity me = new menu_Entity();
                    menu_BL mb = new menu_BL();
                    TreeNode child = new TreeNode
                    {
                        Text = row["Description"].ToString(),
                        Value = row["MenuID"].ToString()
                    };
                    child.SelectAction = TreeNodeSelectAction.None;
                    if (parentId == 0)
                    {
                        treeNode.ChildNodes.Add(child);
                        me.ParentID = child.Value;
                        DataTable dtChild = mb.menu_child(me);
                        PopulateTreeView(dtChild, int.Parse(child.Value), child);
                    }
                    else
                    {
                        treeNode.ChildNodes.Add(child);
                    }
                }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        //looping Check Node with selected dropdown Value
        protected void postmenu()
        {
            try
            {
                menu_BL mbl = new menu_BL();
                menu_Entity me = new menu_Entity();
                string UserID = Request.QueryString["ID"];
                DataTable dt = new DataTable();
                dt = mbl.Menu_Select(UserID);

                int i = 0;
                while (i < TreeView1.CheckedNodes.Count)
                {
                    TreeNode checkedNode = TreeView1.CheckedNodes[i];
                    checkedNode.Checked = false;
                }
                //from menus mode settings

                TreeNode node = TreeView1.Nodes[0];

                checkNode(node, dt);
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        private void BindUserType()
        {
            try
            {
                Stage_Entity ste = new Stage_Entity();
                Stage_BL sbl = new Stage_BL();
                DataTable dt = sbl.Stage_Select(ste);
                cblUserType.DataSource = dt;
                cblUserType.DataTextField = "Description";
                cblUserType.DataValueField = "StageID";
                cblUserType.DataBind();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        //UserSave
        protected void Save()
        {
            try
            {
                if (Check())
                {
                    Users_Entity ue = new Users_Entity();
                    Crypto crypto = new Crypto();
                    ue.UserID = txtUserID.Text;
                    ue.Password = crypto.Encrypt(txtPassword.Text, "SPC123");
                    ue.Email = txtEmail.Text;

                    Stage_Entity ste = new Stage_Entity();
                    List<string> selectedValues = cblUserType.Items.Cast<ListItem>().Where(li => li.Selected).Select(li => li.Value).ToList();
                    ste.StageIDs = string.Join(",", selectedValues);
                    if (ste.StageIDs == "")
                        ste.StageIDs = "-1";

                    Users_BL ubl = new Users_BL();
                    //menu_hide();
                    string s = Session["UserID"].ToString();
                    int i = Convert.ToInt16(s.Split(',')[0]);
                    if (!ubl.Users_Insert(ue, ste, i))
                    {
                        menu_hide();
                        //Response.Write("<script>alert('Save Successfully');</script>");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('"+ue.UserID+"を登録しました。');", true);
                        Refresh();
                    }
                    else
                    {
                        //Response.Write("<script>alert('Save failed');</script>");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2('登録エラー!');", true);
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('UserID " + txtUserID.Text + " Already Exists');", true);
                }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        //DuplicateUserID
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
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('Saved Successfully!');", true);
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('Updated Successfully!');", true);
            //menu_hide();
            if (Request.QueryString["ID"] == null)
            {
                Save();
            }
            else
            {
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('Updated Successfully!');", true);
                Update();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('Updated Successfully!');", true);
            }
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('Saved Successfully!');", true);
            //Response.Write("Update Successfully");
        }

        //UserUpdate
        protected void Update()
        {
            try
            {
                Label lbl = this.Master.FindControl("lblID") as Label;
                string LoginId = lbl.Text;
                ClientScriptManager cs = this.Page.ClientScript;
                if (checkinfo())
                {

                    Crypto crypto = new Crypto();
                    Users_Entity ue = new Users_Entity();
                    Stage_Entity ste = new Stage_Entity();
                    Users_BL ubl = new Users_BL();
                    ue.ID = Request.QueryString["ID"];
                    ue.UserID = txtUserID.Text;
                    ue.Password = crypto.Encrypt(txtPassword.Text, "SPC123");
                    ue.Email = txtEmail.Text;
                    //ue.UserLevel = UserLevel().ToString();
                    List<string> selectedValues = cblUserType.Items.Cast<ListItem>().Where(li => li.Selected).Select(li => li.Value).ToList();
                    ste.StageIDs = string.Join(",", selectedValues);
                    string s = Session["UserID"].ToString();
                    int i = Convert.ToInt16(s.Split(',')[0]);
                    //ClientScriptManager cs = Page.ClientScript;
                    if (ubl.Users_Update(ue, ste, i))
                    {
                        string id = Session["UserID"].ToString().Split(',')[0];
                        if (ue.ID.Equals(LoginId))
                            Session["UserID"] = id + ',' + ue.UserID;
                        menu_hide();
                        SetMenu(ue);
                        //Response.Redirect(Request.RawUrl);
                        //Response.Redirect("~/Users/UserEntry.aspx?ID=" + ue.ID, false);



                        ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", "openModal3('Update Successfully!');", true);
                        
                        //Response.Write("<script>alert('Update Successfully');</script>");
                        //Refresh();
                    }
                    else
                    {
                        //Response.Write("<script>alert('Update failed');</script>");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", "openModal2('Update Failed!');", true);
                    }
                  
             
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", "openModal2('UserID " + txtUserID.Text + " Already Exists');", true);
                    //Response.Write("<script>alert('Update failed');</script>");
                }
                //Response.Redirect("~/Users/UserEntry.aspx", false);
                
                
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        //Refresh form
        public void Refresh()
        {
            txtUserID.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtPassword.Attributes.Add("value", string.Empty);
            txtEmail.Text = string.Empty;
            cblUserType.ClearSelection();

            for (int i = 0; i < TreeView1.CheckedNodes.Count; )
            {
                TreeView1.CheckedNodes[i].Checked = false;
            }
        }
        //Duplicate UserID update
        protected bool checkinfo()
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

        //Duplicate UserID check

        public bool CheckUpdate()
        {
            Users_Entity ue = new Users_Entity();
            ue.UserID = txtUserID.Text;
            Users_BL ubl = new Users_BL();
            return ubl.CheckUpdate(ue, Request.QueryString["ID"].ToString());
        }
        protected void menu_hide()
        {
            try
            {
                Users_BL ubl1 = new Users_BL();
                Users_Entity ue1 = new Users_Entity();
                ue1.UserID = txtUserID.Text;
                DataTable dtmenu = ubl1.checkLogin(ue1);
                string meid = string.Empty;
                meid = dtmenu.Rows[0]["ID"].ToString();
                menu_Entity me = new menu_Entity();
                menu_BL mb = new menu_BL();
                //Label lbl = this.Master.FindControl("lblID") as Label;
                //me.UserID = lbl.Text;
                me.UserID = meid;
                string menuID = string.Empty;
                foreach (TreeNode node in TreeView1.CheckedNodes)
                {
                    menuID += node.Value + ",";
                }
                if (!string.IsNullOrEmpty(menuID))
                {
                    menuID = menuID.Remove(menuID.Length - 1);
                }
                me.MenuID = menuID;
                if (mb.Menu_Save(me))
                {
                    return;
                    //Response.Redirect("~/Users/UserEntry.aspx", false);
                }
                else
                {
                    //Response.Write("<script>alert('Update failed');</script>");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2('更新に失敗しました!');", true);
                }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

    }
}