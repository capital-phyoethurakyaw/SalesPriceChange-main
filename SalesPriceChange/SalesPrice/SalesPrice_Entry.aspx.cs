using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using SalesPriceChange_BL;
using SalesPriceChange_Common;
using System.Configuration;


namespace SalesPrice.SalesPrice
{
    public partial class SalesPrice_Entry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Apply_TypeBL apbl = new Apply_TypeBL();
            dllApplyType.DataTextField = "Description";
            dllApplyType.DataValueField = "ID";
            dllApplyType.DataSource = apbl.ApplyType_Select();
            dllApplyType.DataBind();


            InventoryType_BL itbl = new InventoryType_BL();
            ddlsalevaluemethod2.DataTextField = "Description";
            ddlsalevaluemethod2.DataValueField = "ID";
            ddlsalevaluemethod2.DataSource = itbl.InventoryType_SelectAll();
            ddlsalevaluemethod2.DataBind();

            Suppliers_BL sbl = new Suppliers_BL();
            ddlsupplier.DataTextField = "Description";
            ddlsupplier.DataValueField = "ID";
            ddlsupplier.DataSource = sbl.Suppliers_SelectAll();
            ddlsupplier.DataBind();

            SpecialPriceType_BL spbl = new SpecialPriceType_BL();
            ddlsalevaluemethod1.DataTextField = "Description";
            ddlsalevaluemethod1.DataValueField = "ID";
            ddlsalevaluemethod1.DataSource = spbl.SpecialPriceType_SelectAll();
            ddlsalevaluemethod1.DataBind();


            Brand_BL bbl = new Brand_BL();
            ddlbrand.DataTextField = "Description";
            ddlbrand.DataValueField = "ID";
            ddlbrand.DataSource = bbl.Brand_SelectAll();
            ddlbrand.DataBind();
            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    Edit();
                    btnSave.Text = "Update";
                   
                }
            }       

        }
        
        protected void Edit()
        {
           
            SalesPriceDetail_Entity se = new SalesPriceDetail_Entity();
            SalesPriceDetail_BL qubl = new SalesPriceDetail_BL();
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            se.ID = Request.QueryString["ID"];
            DataTable dt = qubl.SalePrice_Edit(se);
            ApplyDate.Text = dt.Rows[0]["ApplyDate"].ToString();
            dllApplyType.Text = dt.Rows[0]["ApplyType_ID"].ToString();
            txtPeriod_From.Text = dt.Rows[0]["StartDate"].ToString();
            txtPeriod_To.Text = dt.Rows[0]["EndDate"].ToString();
            if (dt.Rows[0]["Suppliers_ID"].ToString().Equals(-1))
            {
                ddlsupplier.Text = string.Empty;
            }
           
            if (dt.Rows[0]["Brand_ID"].ToString().Equals(-1))
            {
                ddlbrand.Text = string.Empty;
            }
            txtshippingurl.Text = dt.Rows[0]["Shipping"].ToString();
            string attachment = dt.Rows[0]["Attachment"].ToString();
            if (attachment == "True")
            {
                rdomale.Checked = true;
            }
            else
            {
                rdofemale.Checked = true;
            }
        
          
            
            if(chkColor.Text=="True")
            {
                chkColor.Checked = Convert.ToBoolean(1);
                
            }
            else
            {
                chkColor.Checked = Convert.ToBoolean(0);   
            }
            
            if (chkProduct.Text == "True")
            {
                chkProduct.Checked = true;
            }
            else
            {
                chkProduct.Checked = false;
            }
            sellingDate.Text = dt.Rows[0]["Selling_Date"].ToString();
           
            if (dt.Rows[0]["Selling_Discount1"].ToString().Equals(-1))
            {
                sellingDiscount1.Text = string.Empty;
            }
           
            if (dt.Rows[0]["Selling_Discount2"].ToString().Equals(-1))
            {
                sellingDiscount2.Text = string.Empty;
            }
            purchaseDate.Text = dt.Rows[0]["Purchase_Date"].ToString();
            
            if (dt.Rows[0]["Purchase_Discount1"].ToString().Equals(-1))
            {
                purchaseDis1.Text = string.Empty;
            }
           
            if (dt.Rows[0]["Purchase_Discount2"].ToString().Equals(-1))
            {
                purchaseDis2.Text = string.Empty;
            }
           
            if (dt.Rows[0]["SpecialPriceType_ID"].ToString().Equals(-1))
            {
                ddlsalevaluemethod1.Text = string.Empty;
            }
           
            if (dt.Rows[0]["InventoryType_ID"].ToString().Equals(-1))
            {
                ddlsalevaluemethod2.Text = string.Empty;
            }
           
            if (chkHOT.Text == "True")
            {
                chkHOT.Checked = true;
            }
            else
            {
                chkHOT.Checked = false;
            }
          
            if (chkSaleBanner.Text == "True")
            {
                chkSaleBanner.Checked = true;
            }
            else
            {
                chkSaleBanner.Checked = false;
            }
           
            if (chkSaleText.Text == "True")
            {
                chkSaleText.Checked = true;
            }
            else
            {
                chkSaleText.Checked = false;
            }
           
            if (chkHeader.Text == "True")
            {
                chkHeader.Checked = true;
            }
            else
            {
                chkHeader.Checked = false;
            }
           
            if (chkSide.Text == "True")
            {
                chkSide.Checked = true;
            }
            else
            {
                chkSide.Checked = false;
            }
            txtRemark.Text = dt.Rows[0]["Remark"].ToString();


        }
     

        protected void Save_Click(object sender, EventArgs e)
        {
            //if (btnSave.Text == "Save")
            //{
            //    SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
            //    SalesPriceDetail_Entity se = new SalesPriceDetail_Entity();

            //    se.FormNo = " 2016-98958";
            //    DateTime dtnew = Convert.ToDateTime(ApplyDate.Text);
            //    se.ApplyDate = dtnew;

            //    se.ApplyType_ID = Convert.ToInt32(dllApplyType.Text);

            //    DateTime dtStartDate = Convert.ToDateTime(txtPeriod_From.Text);
            //    se.StartDate = dtStartDate;
            //    DateTime dtEndDate = Convert.ToDateTime(txtPeriod_To.Text);
            //    se.EndDate = dtEndDate;
            //    if (String.IsNullOrWhiteSpace(ddlsupplier.Text))
            //    {
            //        se.Suppliers_ID = -1;
            //    }
            //    else
            //    {
            //        se.Suppliers_ID = Convert.ToInt32(ddlsupplier.Text);
            //    }

            //    if (String.IsNullOrWhiteSpace(ddlbrand.Text))
            //    {
            //        se.Brand_ID = -1;
            //    }
            //    else
            //    {
            //        se.Brand_ID = Convert.ToInt32(ddlbrand.Text);
            //    }
            //    se.Shipping = txtshippingurl.Text;
            //    if (rdomale.Checked)
            //    {
            //        se.Attachment = true;
            //    }
            //    else
            //    {
            //        se.Attachment = false;

            //    }
            //    se.ColorUnit = Convert.ToBoolean(chkColor.Checked);
            //    se.ProductNoUnit = Convert.ToBoolean(chkProduct.Checked);
            //    DateTime dtsellingDate = Convert.ToDateTime(sellingDate.Text);
            //    se.Selling_Date = dtsellingDate;
            //    if (txtshippingurl.Text == "")
            //    {
            //        se.Shipping = null;
            //    }
            //    if (String.IsNullOrWhiteSpace(sellingDiscount1.Text))
            //    {
            //        se.Selling_Discount1 = -1;
            //    }
            //    else
            //    {
            //        se.Selling_Discount1 = Convert.ToInt32(sellingDiscount1.Text);
            //    }

            //    if (String.IsNullOrWhiteSpace(sellingDiscount2.Text))
            //    {
            //        se.Selling_Discount2 = -1;
            //    }
            //    else
            //    {
            //        se.Selling_Discount2 = Convert.ToInt32(sellingDiscount2.Text);
            //    }
            //    DateTime dtPurchaseDate = Convert.ToDateTime(purchaseDate.Text);
            //    se.Purchase_Date = dtPurchaseDate;

            //    if (String.IsNullOrWhiteSpace(purchaseDis1.Text))
            //    {
            //        se.Purchase_Discount1 = -1;
            //    }
            //    else
            //    {
            //        se.Purchase_Discount1 = Convert.ToInt32(purchaseDis1.Text);
            //    }
            //    if (String.IsNullOrWhiteSpace(purchaseDis2.Text))
            //    {
            //        se.Purchase_Discount2 = -1;
            //    }
            //    else
            //    {
            //        se.Purchase_Discount2 = Convert.ToInt32(purchaseDis2.Text);
            //    }


            //    if (String.IsNullOrWhiteSpace(ddlsalevaluemethod1.Text))
            //    {
            //        se.SpecialPriceType_ID = -1;
            //    }
            //    else
            //    {
            //        se.SpecialPriceType_ID = Convert.ToInt32(ddlsalevaluemethod1.Text);
            //    }
            //    if (String.IsNullOrWhiteSpace(ddlsalevaluemethod2.Text))
            //    {
            //        se.InventoryType_ID = -1;
            //    }
            //    else
            //    {
            //        se.InventoryType_ID = Convert.ToInt32(ddlsalevaluemethod2.Text);
            //    }

            //    se.Hot = Convert.ToBoolean(chkHOT.Checked);
            //    se.SaleBanner = Convert.ToBoolean(chkSaleBanner.Checked);
            //    se.SaleText = Convert.ToBoolean(chkSaleText.Checked);
            //    se.Header = Convert.ToBoolean(chkHeader.Checked);
            //    se.Side = Convert.ToBoolean(chkSide.Checked);
            //    if (txtRemark.Text == "")
            //    {
            //        se.Remark = null;
            //    }
            //    se.Remark = txtRemark.Text;
            //    se.CurrentStage = 1;
            //    sbl.Save(se);
            //}
            //else
            //{
            //    Update();
            //}
            
        }
        protected void Update()
        {
                //SalesPriceDetail_Entity se = new SalesPriceDetail_Entity();
                //SalesPriceDetail_BL sbl = new SalesPriceDetail_BL();
                //se.ID = Request.QueryString["ID"];
                //se.FormNo = " 2016-98958";
                //DateTime dtnew = Convert.ToDateTime(ApplyDate.Text);
                //se.ApplyDate = dtnew;

                //se.ApplyType_ID = Convert.ToInt32(dllApplyType.Text);

                //DateTime dtStartDate = Convert.ToDateTime(txtPeriod_From.Text);
                //se.StartDate = dtStartDate;
                //DateTime dtEndDate = Convert.ToDateTime(txtPeriod_To.Text);
                //se.EndDate = dtEndDate;
                //if (String.IsNullOrWhiteSpace(ddlsupplier.Text))
                //{
                //    se.Suppliers_ID = -1;
                //}
                //else
                //{
                //    se.Suppliers_ID = Convert.ToInt32(ddlsupplier.Text);
                //}

                //if (String.IsNullOrWhiteSpace(ddlbrand.Text))
                //{
                //    se.Brand_ID = -1;
                //}
                //else
                //{
                //    se.Brand_ID = Convert.ToInt32(ddlbrand.Text);
                //}
                //se.Shipping = txtshippingurl.Text;
                //if (rdomale.Checked)
                //{
                //    se.Attachment = true;
                //}
                //else
                //{
                //    se.Attachment = false;

                //}
                //se.ColorUnit = Convert.ToBoolean(chkColor.Checked);
                //se.ProductNoUnit = Convert.ToBoolean(chkProduct.Checked);
                //DateTime dtsellingDate = Convert.ToDateTime(sellingDate.Text);
                //se.Selling_Date = dtsellingDate;
                //if (txtshippingurl.Text == "")
                //{
                //    se.Shipping = null;
                //}
                //if (String.IsNullOrWhiteSpace(sellingDiscount1.Text))
                //{
                //    se.Selling_Discount1 = -1;
                //}
                //else
                //{
                //    se.Selling_Discount1 = Convert.ToInt32(sellingDiscount1.Text);
                //}

                //if (String.IsNullOrWhiteSpace(sellingDiscount2.Text))
                //{
                //    se.Selling_Discount2 = -1;
                //}
                //else
                //{
                //    se.Selling_Discount2 = Convert.ToInt32(sellingDiscount2.Text);
                //}
                //DateTime dtPurchaseDate = Convert.ToDateTime(purchaseDate.Text);
                //se.Purchase_Date = dtPurchaseDate;

                //if (String.IsNullOrWhiteSpace(purchaseDis1.Text))
                //{
                //    se.Purchase_Discount1 = -1;
                //}
                //else
                //{
                //    se.Purchase_Discount1 = Convert.ToInt32(purchaseDis1.Text);
                //}
                //if (String.IsNullOrWhiteSpace(purchaseDis2.Text))
                //{
                //    se.Purchase_Discount2 = -1;
                //}
                //else
                //{
                //    se.Purchase_Discount2 = Convert.ToInt32(purchaseDis2.Text);
                //}


                //if (String.IsNullOrWhiteSpace(ddlsalevaluemethod1.Text))
                //{
                //    se.SpecialPriceType_ID = -1;
                //}
                //else
                //{
                //    se.SpecialPriceType_ID = Convert.ToInt32(ddlsalevaluemethod1.Text);
                //}
                //if (String.IsNullOrWhiteSpace(ddlsalevaluemethod2.Text))
                //{
                //    se.InventoryType_ID = -1;
                //}
                //else
                //{
                //    se.InventoryType_ID = Convert.ToInt32(ddlsalevaluemethod2.Text);
                //}

                //se.Hot = Convert.ToBoolean(chkHOT.Checked);
                //se.SaleBanner = Convert.ToBoolean(chkSaleBanner.Checked);
                //se.SaleText = Convert.ToBoolean(chkSaleText.Checked);
                //se.Header = Convert.ToBoolean(chkHeader.Checked);
                //se.Side = Convert.ToBoolean(chkSide.Checked);
                //if (txtRemark.Text == "")
                //{
                //    se.Remark = null;
                //}
                //se.Remark = txtRemark.Text;
                //se.CurrentStage = 1;
                //if (sbl.SalePriceList_Update(se))
                //{
                //    Response.Write("<script>alert('Update Successfully');</script>");
                    
                //}
                //else
                //{
                //    Response.Write("<script>alert('Update failed');</script>");
                //}

            }
       
        }
    }
