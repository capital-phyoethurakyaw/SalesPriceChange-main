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
using System.Globalization;
using System.Text.RegularExpressions;
namespace SalesPrice.Users

{
    public partial class UserMenu : System.Web.UI.Page
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
            //        public void CustomValidaorMethod(object source, ServerValidateEventArgs args)
            //{
            //string valuePassed = string.Empty;
            //if(args.Value != null)
            //valuePassed = args.Value;
            //DateTime dt = DateTime.MinValue;
            //args.IsValid = true;
            //try
            //{
            //IFormatProvider format = new CultureInfo( "en-US");
            ////write custom code to validate date time or just parse it
      
            //using DateTime.Parse
            //dt = DateTime.Parse(valuePassed,format,DateTimeStyles.None);
            //}
            //catch
            //{
            //args.IsValid = false;
            //}
            //}
            



        //for Custom Date 
        //protected void CustomValidator1_ServerValidate(object sender, ServerValidateEventArgs e)
        //{


        //    DateTime d;
        //    e.IsValid = DateTime.TryParseExact(e.Value, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out d);
        //}
        //get selected Value from Tree View
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
        //binding selected dropdown item Value
        private void BindCombobox()
        {
            Users_BL sbl = new Users_BL();
            Users_Entity ue = new Users_Entity();
            ddlmenu.DataTextField = "UserID";
            ddlmenu.DataValueField = "ID";
            ddlmenu.DataSource = sbl.Users_Select(ue);
            ddlmenu.DataBind();
        }
        //looping Check Node with selected dropdown Value
        protected void Menu_SelectedIndexChanged(object sender, EventArgs e)
        {
            menu_BL mbl = new menu_BL();
            menu_Entity me = new menu_Entity();
            string UserID = ddlmenu.SelectedItem.Value;
            DataTable dt = new DataTable();
            dt = mbl.Menu_Select(UserID);

            int i = 0;
            while (i < TreeView1.CheckedNodes.Count)
            {
                TreeNode checkedNode = TreeView1.CheckedNodes[i];
                checkedNode.Checked = false;
            }

            TreeNode node = TreeView1.Nodes[0];


            checkNode(node, dt);
        }
       

        protected void btnUpdate_click(object sender, EventArgs e)
        {
            Save();
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
                Response.Write("<script>alert('Update Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Update failed');</script>");
            }
        }
    }
}