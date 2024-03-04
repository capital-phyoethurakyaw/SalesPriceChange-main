using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using SalesPriceChange_BL;
using SalesPriceChange_Common;
using System.Configuration;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.Serialization.Formatters.Binary;
using AjaxControlToolkit;

namespace SalesPrice.Users
{
    public partial class User_Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {              
                TreeView1.Attributes.Add("onclick", "OnTreeClick(event)");
                BindCombobox();

                menu_Entity me = new menu_Entity();
                menu_BL mb = new menu_BL();
                DataTable dt = mb.menu_select(me);
                TreeNode tnAll = new TreeNode("Root", "0");
                tnAll.SelectAction = TreeNodeSelectAction.None;
                TreeView1.Nodes.Add(tnAll);
                PopulateTreeView(dt, 0, tnAll);
                UserStage();
            }
        }

        private void BindCombobox()
        {
            Users_BL sbl = new Users_BL();
            Users_Entity ue = new Users_Entity();
            ddlmenu.DataTextField = "UserID";
            ddlmenu.DataValueField = "ID";
            ddlmenu.DataSource = sbl.Users_Select(ue);
            ddlmenu.DataBind();
        }

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

      
        protected void Save()
        {
            menu_Entity me = new menu_Entity();
            menu_BL mb = new menu_BL();
            me.UserID = ddlmenu.SelectedItem.Value;
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
                Response.Redirect(Request.RawUrl);
                Response.Write("<script>alert('Save Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Save failed');</script>");
            }
        }
        protected void Menu_SelectedIndexChanged(object sender, EventArgs e)
        {
            menu_BL mbl = new menu_BL();
            menu_Entity me = new menu_Entity();
            string UserID = ddlmenu.SelectedItem.Value;
            DataTable dt = new DataTable();
            dt = mbl.Menu_Select(UserID);

            int i = 0;
            while(i < TreeView1.CheckedNodes.Count)
            {
                TreeNode checkedNode = TreeView1.CheckedNodes[i];
                checkedNode.Checked = false;
            }
          
            TreeNode node = TreeView1.Nodes[0];
            checkNode(node,dt);
        }

        public void checkNode(TreeNode parentNode,DataTable dt)
        {
            DataRow[] dr = dt.Select("MenuID ='" + parentNode.Value.ToString() + "'");
            if (dr.Count() > 0)
                parentNode.Checked = true;

            foreach (TreeNode subNode in parentNode.ChildNodes)
            {
                checkNode(subNode,dt);
            }
        }
        protected void UserStage()
        {
            menu_BL mbl = new menu_BL();
            menu_Entity me = new menu_Entity();
            string UserID = ddlmenu.SelectedItem.Value;
            DataTable dt = new DataTable();
            dt = mbl.Menu_Select(UserID);
            TreeNode node = TreeView1.Nodes[0];
            checkNode(node, dt);
        }
        protected void btnok_click(object sender, EventArgs e)
        {
            Save();
        }
    }
}
     