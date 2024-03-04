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
using System.Configuration;

namespace SalesPrice.Setting
{
    public partial class Users_List : System.Web.UI.Page
    {
        DataTable dt;
        Users_Entity ue = new Users_Entity();
        Users_BL ubl = new Users_BL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    BindStage();
                    Search();                   
                }
                catch (Exception ex)
                {
                    error_check ec = new error_check();
                    ec.send_Exce_to_DB(ex);
                }
            }
            //if (Request.QueryString["ID"] != null)
            //{
          //string str= Session["UserID"].ToString();
          string s = Session["UserID"].ToString();
          int i = Convert.ToInt16(s.Split(',')[0]);
                ue.ID = i.ToString();
                string d = "16";
                DataTable dt_filter = new DataTable();
                dt_filter = ubl.entry_hide_filter(ue, d);
                if (dt_filter.Rows.Count == 0)
                {
                    //men_hide.Style.Add("visibility", "hidden");
                    //stag_hide.Style.Add("visibility", "hidden");
                    Button2.Style.Add("display", "none");
                    Div2.Style.Add("display", "block");


                    gvUser_List.Columns[4].Visible = false;
                    gvUser_List.Columns[3].Visible = false;
                }
            //}
          
        }

        private void BindStage()
        {
            Stage_BL sbl = new Stage_BL();
            Stage_Entity ste = new Stage_Entity();
            ddlStage.DataTextField = "Description";
            ddlStage.DataValueField = "StageID";
            ddlStage.DataSource = sbl.Stage_Select(ste);
            ddlStage.DataBind();
            ddlStage.Items.Insert(0, "-----選択-----");
            ddlStage.SelectedItem.Value = "0";
        }
        
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                HtmlAnchor anc = sender as HtmlAnchor;
                GridViewRow Grow = (GridViewRow)anc.NamingContainer;
                string ID = ((Label)Grow.FindControl("lblid")).Text;
                Response.Redirect("~/Users/UserEntry.aspx?ID=" + ID);
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                HtmlAnchor a = sender as HtmlAnchor;
                GridViewRow row = a.NamingContainer as GridViewRow;
                Label lbl = row.FindControl("lblUserID") as Label;
                Label lblID = row.FindControl("lblID") as Label;

                lblDelID.Text = lblID.Text;
                lblDelDescription.Text = lbl.Text;

                string msg = "売価単位" + lbl.Text + "を削除しますか？";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal1('" + msg + "');", true);
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string id = lblDelID.Text;
                Users_BL ubl = new Users_BL();

                if (ubl.User_Delete(id))
                {
                    string msg = "売価単位" + lblDelDescription.Text + "を削除しました。";
                    Search();
                    BindStage();
                }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        protected void btnadduser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Users/UserEntry.aspx");
        }

        protected void btnGoto_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtGoto.Text != "0")
                {
                    if (!string.IsNullOrWhiteSpace(txtGoto.Text))
                    {
                        gvUser_List.PageIndex = Convert.ToInt32(txtGoto.Text) - 1;
                        gvUser_List.PageSize = Convert.ToInt32(ddlPageSize.Text);
                        Search();
                        txtGoto.Text = string.Empty;
                    }
                }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                gvUser_List.PageIndex = 0;
                Search();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        //Userlist search
        public string user_role = ConfigurationManager.AppSettings["user_role"].ToString();
        public void Search()
        {
            try
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
                DataTable dt = new DataTable();
                Stage_Entity se = new Stage_Entity();
                ue.UserID = txtUserID.Text;
                se.StageID = ddlStage.SelectedItem.Value;
                dt = ubl.UserList_Search(ue, se);
                //dt.AcceptChanges();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    //dt.Rows[][""]
                    if (dt.Rows[i]["UserID"].ToString() == u_role)
                    {
                        dt.Rows[i].Delete();
                        dt.Rows.RemoveAt(i);
                    }

                }

                dt.AcceptChanges();
               
                lblrowCount.Text = dt.Rows.Count.ToString();
                gvUser_List.DataSource = dt;
                gvUser_List.DataBind();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        protected void gvUser_List_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    Label lbl = e.Row.FindControl("lblID") as Label;
                    ue.ID = lbl.Text;
                    dt = ubl.UsersDescription_Select(ue);
                    //for (int i = 0; i < dt.Rows.Count; i++)
                    //{
                    //    //dt.Rows[][""]
                    //    dt.Rows[i].Delete();

                    //}

                    //dt.AcceptChanges();

                    //string c2 = e.Row.Cells[2].Text.ToString();
                    //if (c2 == "") e.Row.Visible = false;


                    GridView gv = e.Row.FindControl("gvUser") as GridView;

                    //if (Items.Keys.Equals("lblUserID"))
                    //{
                    ////    e.Row.Visible = false;
                    //}
                    //object objTemp = gv.DataKeys[e.Row.RowIndex].Value as object;
                    //if (objTemp != null)
                    //{
                    //    string id = objTemp.ToString();
                        
                    //    //Do your operations
                    //}
                    gv.DataSource = dt;
                    gv.DataBind();
                    //object objTemp = gvUser_List.DataKeys[e.Row.RowIndex].Value as object;
                    //if (objTemp != null)
                    //{
                    //    string id = objTemp.ToString();

                    //    //Do your operations
                    //}
                }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        //protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    Control ctl = e.CommandSource as Control;
        //    GridViewRow CurrentRow = ctl.NamingContainer as GridViewRow;
        //    object objTemp = gvUser_List.DataKeys[CurrentRow.RowIndex].Value as object;
        //    if (objTemp != null)
        //    {
        //        string id = objTemp.ToString();
        //        //Do your operations
        //    }
        //}
        //Pageindex
        protected void gvUser_List_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvUser_List.PageIndex = e.NewPageIndex;
                Search();
                //Search();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                gvUser_List.PageIndex = 0;
                gvUser_List.PageSize = Convert.ToInt32(ddlPageSize.Text);
                Search();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
    }
}