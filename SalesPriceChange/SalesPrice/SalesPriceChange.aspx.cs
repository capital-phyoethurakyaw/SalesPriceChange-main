using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SalesPriceChange_BL;
using SalesPriceChange_Common;
using System.Data;
using System.Collections;
using AjaxControlToolkit;
using System.Globalization;

namespace SalesPrice.SalesPrice
{
    public partial class SalesPriceChange : System.Web.UI.Page
    {
        DateTime date = new DateTime();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtApplyDate.Attributes.Add("readonly", "readonly");
                txtStartDate.Attributes.Add("readonly", "readonly");
                txtEndDate.Attributes.Add("readonly", "readonly");
                txtPurchaseDate.Attributes.Add("readonly", "readonly");
                txtSellingDate.Attributes.Add("readonly", "readonly");

                BindCombo();
                if (Request.QueryString["ID"] != null)
                {
                    SetData();
                    lblSave.Text = "Update";
                }
                else
                {
                    lblFormNo.Text = GetFormID();
                    txtStage1.Enabled = true;
                    ddlStage1.Enabled = true;
                    txtApplyDate.Text = DateTime.Now.ToString("yyyy/MM/dd");
                    FormStage();
                }
            }
        }
        //First form mode
        private void FormStage()
        {
            if (Session["UserID"] != null)
            {
                Users_Entity ue = new Users_Entity();
                Stage_Entity se = new Stage_Entity();
                SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
                DataTable dt = new DataTable();
                string[] str = Session["UserID"].ToString().Split(',');
                ue.UserID = str[0];
                dt = sbl.FormStage_Check(ue);
                ControlStage();
                if (dt.Rows.Count > 0)
                {
                    StageSetting_BL sb = new StageSetting_BL();
                    se.StageID = "1";
                    DataTable dtt = new DataTable();
                    dtt = sb.StageID_Select(se);

                    for (int i = 0; i < dtt.Rows.Count; i++)
                    {
                        CheckStageID(dtt.Rows[i]["RowID"].ToString());
                    }
                }
            }
            else
            {
                Response.Redirect("~/Login/Login.aspx");
            }
        }

        private void BindCombo()
        {
            Apply_TypeBL apbl = new Apply_TypeBL();
            ddlApplyType.DataTextField = "Description";
            ddlApplyType.DataValueField = "ID";
            ddlApplyType.DataSource = apbl.ApplyType_Select();
            ddlApplyType.DataBind();

            Suppliers_BL sbl = new Suppliers_BL();
            ddlSupplier.DataTextField = "Description";
            ddlSupplier.DataValueField = "ID";
            ddlSupplier.DataSource = sbl.Suppliers_SelectAll();
            ddlSupplier.DataBind();

            SpecialPriceType_BL spbl = new SpecialPriceType_BL();
            ddlSalePriceType.DataTextField = "Description";
            ddlSalePriceType.DataValueField = "ID";
            ddlSalePriceType.DataSource = spbl.SpecialPriceType_SelectAll();
            ddlSalePriceType.DataBind();

            InventoryType_BL itbl = new InventoryType_BL();
            ddlInventoryType.DataTextField = "Description";
            ddlInventoryType.DataValueField = "ID";
            ddlInventoryType.DataSource = itbl.InventoryType_SelectAll();
            ddlInventoryType.DataBind();

            Brand_BL bbl = new Brand_BL();
            ddlBrand.DataTextField = "Description";
            ddlBrand.DataValueField = "ID";
            ddlBrand.DataSource = bbl.Brand_SelectAll();
            ddlBrand.DataBind();
        }
        //New FormID
        private string GetFormID()
        {
            SalesPriceDetail_BL spdbl = new SalesPriceDetail_BL();
            return spdbl.SalePriceDetail_GetFormID();
        }
        //Date format
        private string GetDate(string value)
        {
            if (string.IsNullOrWhiteSpace(value))
                return value;
            else
            {
                string sysUIFormat = CultureInfo.CurrentUICulture.DateTimeFormat.ShortDatePattern;
                DateTime date = DateTime.ParseExact(value.Split(' ')[0], sysUIFormat,
                                  CultureInfo.InvariantCulture);
                return date.ToString("yyyy/MM/dd");
            }
        }

        //Edit
        private void SetData()
        {
            SalesPriceDetail_Entity se = new SalesPriceDetail_Entity();
            SalesPriceDetail_BL qubl = new SalesPriceDetail_BL();
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            se.ID = Request.QueryString["ID"];
            DataTable dt = qubl.SalePrice_Edit(se);
            if (dt.Rows.Count > 0)
            {
                lblFormNo.Text = dt.Rows[0]["FormNo"].ToString();

                txtApplyDate.Text = date.ToString("yyyy/MM/dd");
                ddlApplyType.Text = dt.Rows[0]["ApplyType_ID"].ToString();
                txtApplyDate.Text = GetDate(dt.Rows[0]["ApplyDate"].ToString());
                txtStartDate.Text = GetDate(dt.Rows[0]["StartDate"].ToString());
                txtEndDate.Text = GetDate(dt.Rows[0]["EndDate"].ToString());
                ddlSupplier.Text = dt.Rows[0]["Suppliers_ID"].ToString();
                ddlBrand.Text = dt.Rows[0]["Brand_ID"].ToString();
                txtShippingUrl.Text = dt.Rows[0]["Shipping"].ToString();
                rdoAttach_Yes.Checked = dt.Rows[0]["Attachment"].ToString().Equals("True") ? true : false;
                rdoAttach_No.Checked = dt.Rows[0]["Attachment"].ToString().Equals("False") ? true : false;
                chkProductNoUnit.Checked = dt.Rows[0]["ProductNoUnit"].ToString().Equals("True") ? true : false;
                chkColorUnit.Checked = dt.Rows[0]["ColorUnit"].ToString().Equals("True") ? true : false;
                txtSellingDate.Text = GetDate(dt.Rows[0]["Selling_Date"].ToString());
                txtSellingDiscount1.Text = dt.Rows[0]["Selling_Discount1"].ToString().Equals("-1") ? string.Empty : dt.Rows[0]["Selling_Discount1"].ToString();
                txtSellingDiscount2.Text = dt.Rows[0]["Selling_Discount2"].ToString().Equals("-1") ? string.Empty : dt.Rows[0]["Selling_Discount2"].ToString();
                txtPurchaseDate.Text = GetDate(dt.Rows[0]["Purchase_Date"].ToString());
                txtPurchaseDiscount1.Text = dt.Rows[0]["Purchase_Discount1"].ToString().Equals("-1") ? string.Empty : dt.Rows[0]["Purchase_Discount1"].ToString();
                txtPurchaseDiscount2.Text = dt.Rows[0]["Purchase_Discount2"].ToString().Equals("-1") ? string.Empty : dt.Rows[0]["Purchase_Discount2"].ToString();
                ddlSalePriceType.Text = dt.Rows[0]["SpecialPriceType_ID"].ToString();
                ddlInventoryType.Text = dt.Rows[0]["InventoryType_ID"].ToString();
                chkHot.Checked = dt.Rows[0]["HOT"].ToString().Equals("True") ? true : false;
                chkSaleBanner.Checked = dt.Rows[0]["SaleBanner"].ToString().Equals("True") ? true : false;
                chkSaleText.Checked = dt.Rows[0]["SaleText"].ToString().Equals("True") ? true : false;
                chkHeader.Checked = dt.Rows[0]["Header"].ToString().Equals("True") ? true : false;
                chkSide.Checked = dt.Rows[0]["Side"].ToString().Equals("True") ? true : false;
                txtRemark.Text = dt.Rows[0]["Remark"].ToString();
                txtStage1.Text = dt.Rows[0]["Stage1Comment"].ToString();
                ddlStage1.Text = dt.Rows[0]["Stage1Status"].ToString();
                txtStage2.Text = dt.Rows[0]["Stage2Comment"].ToString();
                ddlStage2.Text = dt.Rows[0]["Stage2Status"].ToString();
                txtStage3.Text = dt.Rows[0]["Stage3Comment"].ToString();
                ddlStage3.Text = dt.Rows[0]["Stage3Status"].ToString();
                txtStage4.Text = dt.Rows[0]["Stage4Comment"].ToString();
                ddlStage4.Text = dt.Rows[0]["Stage4Status"].ToString();
                txtStage5.Text = dt.Rows[0]["Stage5Comment"].ToString();
                ddlStage5.Text = dt.Rows[0]["Stage5Status"].ToString();
                txtStage6.Text = dt.Rows[0]["Stage6Comment"].ToString();
                ddlStage6.Text = dt.Rows[0]["Stage6Status"].ToString();
                txtStage7.Text = dt.Rows[0]["Stage7Comment"].ToString();
                ddlStage7.Text = dt.Rows[0]["Stage7Status"].ToString();

                StageSetting_Entity sse = new StageSetting_Entity();
                StageSetting_BL ssbl = new StageSetting_BL();


                if (Session["UserID"].ToString().Split(',')[0] == null)
                {
                    Response.Redirect("~/Login/Login.aspx");
                }
                else
                {
                    sse.UserID = Session["UserID"].ToString().Split(',')[0];
                    sse.FormID = Request.QueryString["ID"];
                    DataTable dtb = ssbl.Stage_SelectRow(sse);
                    ControlStage();
                    for (int i = 0; i < dtb.Rows.Count; i++)
                    {
                        CheckStageID(dtb.Rows[i]["RowID"].ToString());
                    }

                    FormStage_Entity fe = new FormStage_Entity();
                    FormStage_BL fbl = new FormStage_BL();
                    fe.FormID = Request.QueryString["ID"];
                    fe.UserID = Session["UserID"].ToString().Split(',')[0];
                    DataTable dtut = fbl.FormStage_SelectByID(fe);
                    EnabledFalse();
                    for (int i = 0; i < dtut.Rows.Count; i++)
                    {
                        CheckStage(dtut.Rows[i]["StageID"].ToString());
                    }
                }
            }
        }

        public void EnabledFalse()
        {
            txtStage1.Enabled = false;
            ddlStage1.Enabled = false;
            txtStage2.Enabled = false;
            ddlStage2.Enabled = false;
            txtStage3.Enabled = false;
            ddlStage3.Enabled = false;
            txtStage4.Enabled = false;
            ddlStage4.Enabled = false;
            txtStage5.Enabled = false;
            ddlStage5.Enabled = false;
            txtStage6.Enabled = false;
            ddlStage6.Enabled = false;
            txtStage7.Enabled = false;
            ddlStage7.Enabled = false;

        }

        public void ControlStage()
        {
            ddlApplyType.Enabled = false;
            txtApplyDate.Enabled = false;
            txtStartDate.Enabled = false;
            txtEndDate.Enabled = false;
            ddlSupplier.Enabled = false;
            ddlBrand.Enabled = false;
            txtShippingUrl.Enabled = false;
            rdoAttach_Yes.Enabled = false;
            rdoAttach_No.Enabled = false;
            chkProductNoUnit.Enabled = false;
            chkColorUnit.Enabled = false;
            txtSellingDate.Enabled = false;
            txtSellingDiscount1.Enabled = false;
            txtSellingDiscount2.Enabled = false;
            txtPurchaseDate.Enabled = false;
            txtPurchaseDiscount1.Enabled = false;
            txtPurchaseDiscount2.Enabled = false;
            ddlSalePriceType.Enabled = false;
            ddlInventoryType.Enabled = false;
            chkHot.Enabled = false;
            chkSaleBanner.Enabled = false;
            chkSaleText.Enabled = false;
            chkHeader.Enabled = false;
            chkSide.Enabled = false;
            txtRemark.Enabled = false;
            imgPopup3.Enabled = false;
            cd3.Enabled = false;
            imgPopup2.Enabled = false;
            cd2.Enabled = false;
            imgPopup4.Enabled = false;
            cd4.Enabled = false;
            imgPopup5.Enabled = false;
            cd5.Enabled = false;
            imgPopup1.Enabled = false;
            cd1.Enabled = false;
            //btnSave.Attributes.Add("disable", "disabled");
            btnSave.Disabled = true;
        }
        //Control stage
        private void CheckStageID(string RowID)
        {
            switch (RowID)
            {
                case "1":
                    txtApplyDate.Enabled = true;
                    imgPopup1.Enabled = true;
                    cd1.Enabled = true;
                    ddlApplyType.Enabled = true;
                    //btnSave.Attributes.Remove("disable");
                    btnSave.Disabled = false;
                    break;
                case "2":
                    txtEndDate.Enabled = true;
                    imgPopup2.Enabled = true;
                    cd3.Enabled = true;
                    txtStartDate.Enabled = true;
                    imgPopup3.Enabled = true;
                    cd2.Enabled = true;
                    //btnSave.Attributes.Remove("disable");
                    btnSave.Disabled = false;
                    break;
                case "3":
                    ddlSupplier.Enabled = true;
                    ddlBrand.Enabled = true;
                    //btnSave.Attributes.Remove("disable");
                    btnSave.Disabled = false;
                    break;
                case "4":
                    txtShippingUrl.Enabled = true;
                    //btnSave.Attributes.Remove("disable");
                    btnSave.Disabled = false;
                    break;
                case "5":
                    rdoAttach_Yes.Enabled = true;
                    rdoAttach_No.Enabled = true;
                    chkProductNoUnit.Enabled = true;
                    chkColorUnit.Enabled = true;
                    //btnSave.Attributes.Remove("disable");
                    btnSave.Disabled = false;
                    break;
                case "6":
                    txtSellingDate.Enabled = true;
                    imgPopup4.Enabled = true;
                    cd4.Enabled = true;
                    txtSellingDiscount1.Enabled = true;
                    txtSellingDiscount2.Enabled = true;
                    //btnSave.Attributes.Remove("disable");
                    btnSave.Disabled = false;
                    break;
                case "7":
                    txtPurchaseDate.Enabled = true;
                    imgPopup5.Enabled = true;
                    cd5.Enabled = true;
                    txtPurchaseDiscount1.Enabled = true;
                    txtPurchaseDiscount2.Enabled = true;
                    //btnSave.Attributes.Remove("disable");
                    btnSave.Disabled = false;
                    break;
                case "8":
                    ddlSalePriceType.Enabled = true;
                    ddlInventoryType.Enabled = true;
                    //btnSave.Attributes.Remove("disable");
                    btnSave.Disabled = false;
                    break;
                case "9":
                    chkHot.Enabled = true;
                    chkSaleBanner.Enabled = true;
                    chkSaleText.Enabled = true;
                    chkHeader.Enabled = true;
                    chkSide.Enabled = true;
                    //btnSave.Attributes.Remove("disable");
                    btnSave.Disabled = false;
                    break;
                case "10":
                    txtRemark.Enabled = true;
                    //btnSave.Attributes.Remove("disable");
                    btnSave.Disabled = false;
                    break;

            }
        }
        //control stage
        private void CheckStage(string stage)
        {
            switch (stage)
            {
                case "1":
                    txtStage1.Enabled = true;
                    ddlStage1.Enabled = true;
                    break;
                case "2":
                    txtStage2.Enabled = true;
                    ddlStage2.Enabled = true;
                    break;

                case "3":
                    txtStage3.Enabled = true;
                    ddlStage3.Enabled = true;
                    break;
                case "4":
                    txtStage4.Enabled = true;
                    ddlStage4.Enabled = true;
                    break;
                case "5":
                    txtStage5.Enabled = true;
                    ddlStage5.Enabled = true;
                    break;
                case "6":
                    txtStage6.Enabled = true;
                    ddlStage6.Enabled = true;
                    break;
                case "7":
                    txtStage7.Enabled = true;
                    ddlStage7.Enabled = true;
                    break;
            }
        }
        //Save and update
        private SalesPriceDetail_Entity GetData()
        {
            SalesPriceDetail_Entity se = new SalesPriceDetail_Entity();
            se.ID = Request.QueryString["ID"];
            se.FormNo = lblFormNo.Text;
            se.ApplyDate = txtApplyDate.Text;
            se.ApplyType_ID = Convert.ToInt32(ddlApplyType.SelectedItem.Value);
            se.StartDate = txtStartDate.Text;
            se.EndDate = txtEndDate.Text;
            se.Suppliers_ID = Convert.ToInt32(ddlSupplier.SelectedItem.Value);
            se.Brand_ID = Convert.ToInt32(ddlBrand.SelectedItem.Value);
            se.Shipping = txtShippingUrl.Text;
            se.Attachment = rdoAttach_Yes.Checked;
            se.Attachment = rdoAttach_No.Checked;
            se.ProductNoUnit = chkProductNoUnit.Checked;
            se.ColorUnit = chkColorUnit.Checked;
            se.Selling_Date = txtSellingDate.Text;
            se.Selling_Discount1 = string.IsNullOrWhiteSpace(txtSellingDiscount1.Text) ? -1 : Convert.ToInt32(txtSellingDiscount1.Text);
            se.Selling_Discount2 = string.IsNullOrWhiteSpace(txtSellingDiscount2.Text) ? -1 : Convert.ToInt32(txtSellingDiscount2.Text);
            se.Purchase_Date = txtPurchaseDate.Text;
            se.Purchase_Discount1 = string.IsNullOrWhiteSpace(txtPurchaseDiscount1.Text) ? -1 : Convert.ToInt32(txtPurchaseDiscount1.Text);
            se.Purchase_Discount2 = string.IsNullOrWhiteSpace(txtPurchaseDiscount2.Text) ? -1 : Convert.ToInt32(txtPurchaseDiscount2.Text);
            se.SpecialPriceType_ID = Convert.ToInt32(ddlSalePriceType.SelectedItem.Value);
            se.InventoryType_ID = Convert.ToInt32(ddlInventoryType.SelectedItem.Value);
            se.Hot = chkHot.Checked;
            se.SaleBanner = chkSaleBanner.Checked;
            se.SaleText = chkSaleText.Checked;
            se.Header = chkHeader.Checked;
            se.Side = chkSide.Checked;
            se.Remark = txtRemark.Text;
            se.StageID = hfUserTypeID.Value;
            se.Stage1Comment = txtStage1.Text;
            se.Stage1Status = Convert.ToInt32(ddlStage1.SelectedItem.Value);
            se.Stage2Comment = txtStage2.Text;
            se.Stage2Status = Convert.ToInt32(ddlStage2.SelectedItem.Value);
            se.Stage3Comment = txtStage3.Text;
            se.Stage3Status = Convert.ToInt32(ddlStage3.SelectedItem.Value);
            se.Stage4Comment = txtStage4.Text;
            se.Stage4Status = Convert.ToInt32(ddlStage4.SelectedItem.Value);
            se.Stage5Comment = txtStage5.Text;
            se.Stage5Status = Convert.ToInt32(ddlStage5.SelectedItem.Value);
            se.Stage6Comment = txtStage6.Text;
            se.Stage6Status = Convert.ToInt32(ddlStage6.SelectedItem.Value);
            se.Stage7Comment = txtStage7.Text;
            se.Stage7Status = Convert.ToInt32(ddlStage7.SelectedItem.Value);
            string[] str = Session["UserID"].ToString().Split(',');
            se.CreatedUserID = str[0];
            se.CreatedDate = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
            se.UpdatedUserID = str[0];
            se.UpdatedDate = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
            se = ChangeStage(se);
            return se;
        }
        //StageChange
        private SalesPriceDetail_Entity ChangeStage(SalesPriceDetail_Entity se)
        {
            //Reject 
            if ((ddlStage6.SelectedValue.Equals("2") && ddlStage6.Enabled == true) || (ddlStage7.SelectedValue.Equals("2") && ddlStage7.Enabled == true))
                se.Stage5Status = 0;

            else if (ddlStage5.SelectedValue.Equals("2") && ddlStage5.Enabled == true)
            {
                se.Stage4Status = 0;
                se.Stage3Status = 0;
            }
            else if ((ddlStage3.SelectedValue.Equals("2") && ddlStage3.Enabled == true) || (ddlStage4.SelectedValue.Equals("2") && ddlStage4.Enabled == true))
                se.Stage2Status = 0;


            else if (ddlStage2.SelectedValue.Equals("2") && ddlStage2.Enabled == true)
                se.Stage1Status = 0;

            //approve 
            if (ddlStage1.SelectedValue.Equals("1") && ddlStage1.Enabled == true)
            {
                se.Stage2Status = 0;
            }
            else if (ddlStage2.SelectedValue.Equals("1") && ddlStage2.Enabled == true)
            {
                se.Stage3Status = 0;
                se.Stage4Status = 0;
            }
            else if ((ddlStage3.SelectedValue.Equals("1") && ddlStage3.Enabled == true) && (ddlStage4.SelectedValue.Equals("1") && ddlStage4.Enabled == true))
            {
                se.Stage5Status = 0;
            }
            else if (ddlStage5.SelectedValue.Equals("1") && ddlStage5.Enabled == true)
            {
                se.Stage6Status = 0;
                se.Stage7Status = 0;
            }

            return se;
        }
        //btnsave-click
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] == null)
                Save();
            else
                Update();
            SetData();
        }
        //FormSave
        private void Save()
        {
            if (!Check())
            {
                string script = "alert('FormNo is changed and will save with-" + lblFormNo.Text + "?');";
                Response.Write("<script>" + script + "</script>");
            }
            SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
            SalesPriceDetail_Entity se = GetData();
            if (ddlStage1.Text == "0")
                se.StageID = "1";
            else if (ddlStage1.Text == "1")
                se.StageID = "2";
            if (sbl.Save(se))
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
        //Duplicate formID check
        protected bool Check()
        {
            SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
            SalesPriceDetail_Entity se = GetData();
            se.FormNo = lblFormNo.Text;
            if (sbl.checkFormNo(se))
            {
                lblFormNo.Text = GetFormID();
                return false;
            }
            else { return true; }
        }
       
        public void Refresh()
        {
            SalesPriceDetail_Entity se = new  SalesPriceDetail_Entity();
            lblFormNo.Text = GetFormID();
            txtApplyDate.Text = DateTime.Now.ToString("yyyy/MM/dd");
            ddlApplyType.SelectedIndex = 0;
            txtStartDate.Text = String.Empty;
            txtEndDate.Text = String.Empty;
            ddlSupplier.SelectedIndex = 0;
            ddlBrand.SelectedIndex = 0;
            txtShippingUrl.Text = string.Empty;
            rdoAttach_Yes.Checked = false;
            rdoAttach_No.Checked = false;
            chkProductNoUnit.Checked = false;
            chkColorUnit.Checked = false;
            txtSellingDate.Text = String.Empty;
            txtSellingDiscount1.Text = String.Empty;
            txtSellingDiscount2.Text = String.Empty;
            txtPurchaseDate.Text = String.Empty;
            txtPurchaseDiscount1.Text = String.Empty;
            txtPurchaseDiscount2.Text = String.Empty;
            ddlSalePriceType.SelectedIndex = 0;
            ddlInventoryType.SelectedIndex = 0;
            chkHot.Checked = false;
            chkSaleBanner.Checked = false;
            chkSaleText.Checked = false;
            chkHeader.Checked = false;
            chkSide.Checked = false;
            txtRemark.Text = String.Empty;
            txtStage1.Text = String.Empty;
            ddlStage1.SelectedIndex = 0;
        }
        //Update test form
        private void Update()
        {
            SalesPriceDetail_Entity se = GetData();
            SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
            if (sbl.SalePriceList_Update(se))
            {
                Response.Write("<script>alert('Update Successfully');</script>");
                //Response.Redirect(Request.RawUrl);
            }
            else
            {
                Response.Write("<script>alert('Update failed');</script>");
            }
        }

    }
}