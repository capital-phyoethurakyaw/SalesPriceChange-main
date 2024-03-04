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

namespace SalesPriceChange.Users
{
    public partial class UserList : System.Web.UI.Page
    {
        DataTable dt;

        Users_Entity ue = new Users_Entity();
        Users_BL ubl = new Users_BL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //string UserLevel = dt.Rows[0]["UserLevel"].ToString();
            //if (UserLevel == "1")
            //{
            //    gvUserList.Columns[4].Visible = false;
            //    gvUserList.Columns[5].Visible = false;
            //}
            if (!IsPostBack)
            {
                gvUserListBind();
                BindStage();
                ddlStage.Items.Insert(0, "Select");
                ddlStage.SelectedItem.Value = "0";
            }
        }

        [WebMethod(EnableSession = true)]
        public static string GetRequestCount()
        {
            if (HttpContext.Current.Session["UserID"] != null)
            {
                string UserID = HttpContext.Current.Session["UserID"].ToString().Split(',')[0];
                SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
                DataTable dt = sbl.SalePriceDetail_NotiCount(UserID);
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (String.IsNullOrEmpty(dt.Rows[0]["ID"].ToString()))
                    {
                        return string.Empty;
                    }
                    else
                    {
                        int count = dt.Rows[0]["ID"].ToString().Count(f => f == ',');
                        return (count + 1) + "$" + dt.Rows[0]["ID"].ToString();
                    }
                }
            }
            return string.Empty;
        }

        public void gvUserListBind()
        {
            ue = new Users_Entity();
            dt = ubl.Users_Select(ue);
            lblrowCount1.Text = Convert.ToString(dt.Rows.Count);
            gvUserList1.DataSource = dt;
            gvUserList1.DataBind();


        }
        private void BindStage()
        {
            Stage_BL sbl = new Stage_BL();
            Stage_Entity ste = new Stage_Entity();
            ddlStage.DataTextField = "Description";
            ddlStage.DataValueField = "StageID";
            ddlStage.DataSource = sbl.Stage_Select(ste);
            ddlStage.DataBind();
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

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btntrans = (Button)sender;
            GridViewRow Grow = (GridViewRow)btntrans.NamingContainer;
            string ID = ((Label)Grow.FindControl("lblid")).Text;
            Response.Redirect("Users_Entry.aspx?ID=" + ID);
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Stage_Entity ste = new Stage_Entity();
            Button btntrans = (Button)sender;
            GridViewRow Grow = (GridViewRow)btntrans.NamingContainer;
            ue.ID = ((Label)Grow.FindControl("lblID")).Text;
            if (ubl.User_Delete(ue, ste))
            {
                //Response.Write("<script>alert('Delete Successfully');</script>");
                Response.Redirect(Request.RawUrl);
                gvUserListBind();
                Search();
            }

        }
        protected void gvUserList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUserList1.PageIndex = e.NewPageIndex;
            gvUserListBind();
            Search();
        }
        protected void PageSize_Changed(object sender, EventArgs e)
        {
            gvUserList1.PageSize = Convert.ToInt32(ddlPageSize1.Text);
            gvUserListBind();
            Search();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Search();
        }
        public void Search()
        {
            DataTable dt = new DataTable();
            Stage_Entity se = new Stage_Entity();
            ue.UserID   = txtUserID.Text;
            se.StageID = ddlStage.SelectedItem.Value;
            dt = ubl.UserList_Search(ue, se);
            if (dt.Rows.Count > 0)
            {
                gvUserList1.DataSource = dt;
                gvUserList1.DataBind();
            }
        }
    }
}
