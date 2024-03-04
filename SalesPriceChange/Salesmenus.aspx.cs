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

namespace SalesPriceChange
{
    public partial class Salesmenus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TreeView2.Attributes.Add("onclick", "OnTreeClick(event)");
                BindCombobox();

                menu_Entity me = new menu_Entity();
                menu_BL mb = new menu_BL();
                DataTable dt = mb.menu_select(me);
                TreeNode tnAll = new TreeNode("All", "0");
                TreeView2.Nodes.Add(tnAll);
                PopulateTreeView(dt, 0, tnAll);

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
        private Dictionary<string, bool> GetSelectedMenus()
        {
            Dictionary<string, bool> dictionary = new Dictionary<string, bool>();

            foreach (TreeNode node in TreeView2.Nodes)
            {
                if (node.Checked)
                    dictionary.Add(node.Value, node.Checked);
                GetSelectedChildMenus(dictionary, node);
            }

            return dictionary;
        }

        private void GetSelectedChildMenus(Dictionary<string, bool> dictionary, TreeNode node)
        {
            foreach (TreeNode childnode in node.ChildNodes)
            {
                if (childnode.Checked)
                    dictionary.Add(childnode.Value, childnode.Checked);
                GetSelectedChildMenus(dictionary, childnode);
            }
        }


    }
}