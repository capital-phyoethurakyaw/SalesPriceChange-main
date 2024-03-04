using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SalesPriceChange_Common;
using SalesPriceChange_BL;
using System.Web.Services;
using System.Web.UI.HtmlControls;

namespace SalesPrice.Users
{
    public partial class UserList : System.Web.UI.Page
    {
        DataTable dt;
        Users_Entity ue = new Users_Entity();
        Users_BL ubl = new Users_BL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvUserListBind();
                BindStage();
            }
        }
        //GridViewBind
        public void gvUserListBind()
        {
            ue = new Users_Entity();
            dt = ubl.Users_Select(ue);
            lblrowCount.Text = Convert.ToString(dt.Rows.Count);
            gvUserList.DataSource = dt;
            gvUserList.DataBind();
        }

        private void BindStage()
        {
            Stage_BL sbl = new Stage_BL();
            Stage_Entity ste = new Stage_Entity();
            ddlStage.DataTextField = "Description";
            ddlStage.DataValueField = "StageID";
            ddlStage.DataSource = sbl.Stage_Select(ste);
            ddlStage.DataBind();
            ddlStage.Items.Insert(0, "Select");
            ddlStage.SelectedItem.Value = "0";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Search();
        }
        //Pagesize
        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvUserList.PageIndex = 0;
            gvUserList.PageSize = Convert.ToInt32(ddlPageSize.Text);
            Search();
        }
        //User edit
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            HtmlAnchor anc = sender as HtmlAnchor;
            GridViewRow Grow = (GridViewRow)anc.NamingContainer;
            string ID = ((Label)Grow.FindControl("lblid")).Text;
            Response.Redirect("UserEntry.aspx?ID=" + ID);
        }
        //User delete
        protected void btndel_click(object sender, EventArgs e)
        {
            Stage_Entity ste = new Stage_Entity();
            HtmlAnchor anc = sender as HtmlAnchor;
            GridViewRow Grow = (GridViewRow)anc.NamingContainer;
            ue.ID = ((Label)Grow.FindControl("lblID")).Text;

            ubl.User_Delete(ue, ste);
            //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Delete Successfully')", true);
            //gvUserListBind();
            Search();
        }
         //Useradd     
        protected void btnadduser_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserEntry.aspx?");
        }

        protected void btnGoto_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtGoto.Text))
            {
                gvUserList.PageIndex = Convert.ToInt32(txtGoto.Text) - 1;
                gvUserList.PageSize = Convert.ToInt32(ddlPageSize.Text);
                Search();
            }
        }
        //Userlist search
        public void Search()
        {
            DataTable dt = new DataTable();
            Stage_Entity se = new Stage_Entity();
            ue.UserID = txtUserID.Text;
            se.StageID = ddlStage.SelectedItem.Value;
            dt = ubl.UserList_Search(ue, se);
            lblrowCount.Text = dt.Rows.Count.ToString();
            gvUserList.DataSource = dt;
            gvUserList.DataBind();
           
        }

        protected void gvUserList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbl = e.Row.FindControl("lblID") as Label;
                ue.ID = lbl.Text;
                dt = ubl.UsersDescription_Select(ue);

                GridView gv = e.Row.FindControl("gvUser") as GridView;
                gv.DataSource = dt;
                gv.DataBind();
            }
        }
        //Pageindex
        protected void gvUserList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUserList.PageIndex = e.NewPageIndex;
            gvUserListBind();
            Search();
        }
    }
}