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

namespace SalesPrice.Setting
{
    public partial class Users_Entry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUserID.Focus();
            if (!IsPostBack)
            {
                //from menus mode settings
                TreeView1.Attributes.Add("onclick", "OnTreeClick(event)");

                menu_Entity me = new menu_Entity();
                menu_BL mb = new menu_BL();
                DataTable dt = mb.menu_select(me);
                TreeNode tnAll = new TreeNode("Root", "0");
                tnAll.SelectAction = TreeNodeSelectAction.None;
                TreeView1.Nodes.Add(tnAll);
                PopulateTreeView(dt, 0, tnAll);

                BindUserType();
                if (Request.QueryString["ID"] != null)
                {
                    lblSave.Text = "更新";
                    Users_Entity ue = new Users_Entity();
                    ue.ID = Request.QueryString["ID"];
                    SetUser(ue);
                    SetPermission(ue);
                    SetMenu(ue);
                }
            }
        }
             private void SetPermission(Users_Entity ue)
        {
            Stage_Entity ste = new Stage_Entity();
            Stage_BL sbl = new Stage_BL();
            string UsersID = ue.ID;
            DataTable dtb = sbl.Stage_Edit(UsersID);
            for (int i = 0; i < dtb.Rows.Count; i++)
            {
                cblUserType.Items.FindByValue(dtb.Rows[i]["StageID"].ToString()).Selected = true;
            }
        }

        private void SetUser(Users_Entity ue)
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            Users_BL ubl = new Users_BL();
            Crypto crypto = new Crypto();
            DataTable dt = ubl.Users_Select(ue);
            txtUserID.Text = dt.Rows[0]["UserID"].ToString();
            txtPassword.Text = crypto.Decrypt(dt.Rows[0]["Password"].ToString(), "SPC123");
            txtPassword.Attributes["value"] = txtPassword.Text;
        }

        private void SetMenu(Users_Entity ue)
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

        //from menus modes settings
        //get selected Value from Tree View
        //protected void UserStage()
        //{
        //    menu_BL mbl = new menu_BL();
        //    menu_Entity me = new menu_Entity();
        //    Label lbl = this.Master.FindControl("lblID") as Label;

        //    string UserID = lbl.Text;
        //    DataTable dt = new DataTable();
        //    dt = mbl.Menu_Select(UserID);
           
        //    TreeNode node = TreeView1.Nodes[0];
        //    checkNode(node, dt);
        //}
        //looping Check Value with recursive method in parent and child nodes  
        private void checkNode(TreeNode parentNode, DataTable dt)
        {
            DataRow[] dr = dt.Select("MenuID ='" + parentNode.Value.ToString() + "'");
            if (dr.Count() > 0)
                parentNode.Checked = true;

            foreach (TreeNode subNode in parentNode.ChildNodes)
            {
                checkNode(subNode, dt);
            }
        }

        //Populating treeview Check Value in Recursive
        private void PopulateTreeView(DataTable dtParent, int parentId, TreeNode treeNode)
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

        //looping Check Node with selected dropdown Value
        protected void postmenu()
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

        //protected void btnUpdate_click(object sender, EventArgs e)
        //{
        //    Save1();
        //}

        //protected void Save1()
        //{
        //    menu_Entity me = new menu_Entity();
        //    menu_BL mb = new menu_BL();
        //    me.UserID = ddlmenu.SelectedItem.Value;
        //    string menuID = string.Empty;
        //    foreach (TreeNode node in TreeView1.CheckedNodes)
        //    {
        //        menuID += node.Value + ",";
        //    }
        //    if (!string.IsNullOrEmpty(menuID))
        //    {
        //        menuID = menuID.Remove(menuID.Length - 1);
        //    }
        //    me.MenuID = menuID;

        //    if (mb.Menu_Save(me))
        //    {
        //        Response.Write("<script>alert('Update Successfully');</script>");
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('Update failed');</script>");
        //    }
        //}

        //for User account and Stage Level Selection
        //UserEdit

        //BindStage
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
        //UserSave
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
                if (ubl.Users_Insert(ue, ste,i))
                {
                    menu_hide();
                    Response.Write("<script>alert('Save Successfully');</script>");
                    Refresh();
                }
                else
                {
                    Response.Write("<script>alert('Save failed');</script>");
                }

            }
            else { Response.Write("<script>alert('Save failed');</script>"); }
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
            if (Request.QueryString["ID"] == null)
            {
                Save();
            }
            else
            {
                Update();
            }
        }

        //UserUpdate
        protected void Update()
        {
            Label lbl = this.Master.FindControl("lblID") as Label;
            string LoginId = lbl.Text;
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
                    if(ue.ID.Equals(LoginId))
                        Session["UserID"] = id + ',' +ue.UserID;
                    Response.Write("<script>alert('Update Successfully');</script>");
                    //Response.Redirect(Request.RawUrl);
                    //Refresh();
                    //Response.Redirect("~/Users/UserList.aspx?");
                }
              
                else
                {
                    Response.Write("<script>alert('Update failed');</script>");
                }
            }
            else { Response.Write("<script>alert('Update failed');</script>"); }
        }
        //Refresh form
        public void Refresh()
        {
            txtUserID.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtPassword.Attributes.Add("value", string.Empty);
            cblUserType.ClearSelection();


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
                
            }
            else
            {
                Response.Write("<script>alert('Update failed');</script>");
            }
        }
    }
}
        


 