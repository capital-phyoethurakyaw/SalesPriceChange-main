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
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
//using SKYPE4COMLib;
using context = System.Web.HttpContext;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;

namespace SalesPrice.Instructions
{
    public partial class Smart_Spc : System.Web.UI.Page
    {
      
            Instructions_Entity ie = new Instructions_Entity();
        protected void Page_Load(object sender, EventArgs e)
        {
            //mainSkype = new Skype4Sharp.Skype4Sharp(authCreds);
            //mainSkype.Login();
            if (!IsPostBack)
            {
                try
                {
                    //Master.FindControl("title_master").Page.Title = "Instruction_List";
                    BindCombo();
                    BindUserCombox();
                    if (Request.QueryString["ID"] != null)
                    {
                        InstructionSetdata();
                        file_upload_check();
                    }
                    else
                    {
                        EnabledFalse();
                        lblFormNo.Text = GetFormID();
                        dpApplyDate.Text = DateTime.Now.ToString("yyyy/MM/dd");
                        
                        ddlStage1.Enabled = true;
                        dpStage1.Enabled = true;
                        dpStage1.Text = DateTime.Now.ToString("yyyy/MM/dd");
                        lblstage1user.Text = Session["UserID"].ToString().Split(',')[1];
                        lblstage1userID.Text = Session["UserID"].ToString().Split(',')[0];
                        Divg20.Attributes["class"] = Divg20.Attributes["class"].Replace("boo", "form_date");

                        file_upload_false();
                    }
                    if (((Session["UserID"].ToString().Split(',')[1]).ToString()) == "@ckm$spc" || ((Session["UserID"].ToString().Split(',')[1]).ToString()) == "ckmspc1")
                    {
                        footer_btn.Style.Add("visibility", "hidden");
                        btnCopy.Visible = false;
                    }
                }
                catch (Exception ex)
                {
                    error_check ec = new error_check();
                    ec.send_Exce_to_DB(ex);
                }
            }

        }

        private void BindCombo()
        {
            Apply_TypeBL apbl = new Apply_TypeBL();
            ddlApplyType.DataTextField = "Description";
            ddlApplyType.DataValueField = "ID";
            ddlApplyType.DataSource = apbl.ApplyType_Select();
            ddlApplyType.DataBind();

            //Category_BL ctdl = new Category_BL();
            //Categoryddl.DataTextField = "Description";
            //Categoryddl.DataValueField = "ID";
            //Categoryddl.DataSource = ctdl.Category_Select();
            //Categoryddl.DataBind();



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



            SellingPriceUnit_BL spul = new SellingPriceUnit_BL();
            ddlSellingPrice.DataTextField = "Description";
            ddlSellingPrice.DataValueField = "ID";
            ddlSellingPrice.DataSource = spul.SellingPriceUnit_SelectAll();
            ddlSellingPrice.DataBind();

            CostUnit_BL cubl = new CostUnit_BL();
            ddlCostUnit.DataTextField = "Description";
            ddlCostUnit.DataValueField = "ID";
            ddlCostUnit.DataSource = cubl.CostUnit_Select();
            ddlCostUnit.DataBind();
        }
        private void BindUserCombox()
        {
            try
            {
                Users_BL ubl = new Users_BL();
                ddlstage3User.DataTextField = "UserID";
                ddlstage3User.DataValueField = "ID";


                DataTable tds = new DataTable();


                tds = ubl.Users_SelectByStage();

                for (int i = tds.Rows.Count - 1; i >= 0; i--)
                {
                    DataRow dr = tds.Rows[i];
                    if (dr["UserID"].ToString() == "@ckm$spc" || dr["UserID"].ToString() == "ckmspc1")
                        dr.Delete();
                }

                ddlstage3User.DataSource = tds;
                ddlstage3User.DataBind();
                ddlstage3User.Items.Insert(0, "-----選択-----");
                ddlstage3User.SelectedItem.Value = "0";

                Users_BL ul = new Users_BL();
                ddlstage5User.DataTextField = "UserID";
                ddlstage5User.DataValueField = "ID";
                ddlstage5User.DataSource = ul.User_Selectbystage6();
                ddlstage5User.DataBind();
                ddlstage5User.Items.Insert(0, "-----選択-----");
                ddlstage5User.SelectedItem.Value = "0";
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        public string status_ucrrent;

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (lblSave.Text == "登録")
                {
                    InstructionsSave();
                    Refresh();
                    uploadFile();
                }
                else if (lblSave.Text == "更新")
                {
                    InstructionUpdate();
                    InstructionSetdata();

                }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }

        }

        private void InstructionsSave()
        {
            try
            {
                if (!Check())
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('フォームは次のように変更されました。" + lblFormNo.Text + "?');", true);
                }
                Instructions_Entity ie = InstructionGetData();
                Instructions_BL ibl = new Instructions_BL();
                lblcurrentstage_mail.Text = ie.CurrentStage.ToString();
                status_ucrrent = ie.CurrentStage.ToString();
                if (ibl.Instructions_Save(ie))
                {
                    string dfsdf = ie.CurrentStage.ToString();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('正常に保存されました!');", true);
                    Email();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('保存に失敗しました!');", true);
                }
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        public void Check_Status()
        {

        }
        public void Email()
        {
            try
            {
                DataTable dte = new DataTable();
                Instructions_BL ibl = new Instructions_BL();
                Instructions_Entity ie = new Instructions_Entity();
                ie.FormNo = lblFormNo.Text.Remove(0, 1);
                string ele = "";
                string pre = ie.CurrentStage.ToString();
                string lbl = lblcurrentstage.Text;
                status_ucrrent = lblcurrentstage_mail.Text;
                dte = ibl.Instruction_Email(status_ucrrent);
                if (dte.Rows.Count > 0)
                {
                    //string[] handlers=new string[];
                    List<string> elements = new List<string>();
                    for (int i = 0; i < dte.Rows.Count; i++)
                    {

                        string temp_user = (dte.Rows[i]["UserID"].ToString()) + "さん,";
                        if (temp_user != "ckmspc1さん," && temp_user != "@ckm$spcさん,")
                        {
                            elements.Add(temp_user);
                        }
                        //Handlers[i]=temp_user;
                        //SendEmail(elements.ToString());
                    }
                    ele = (String.Join(" ", elements)).Remove((String.Join(" ", elements)).Length - 1);
                    //if (ele.Contains("@ckmspc1"))
                    //{
                    //    ele.Replace(" @ckmspc1 ", " ");
                    //}
                }
                else
                {

                    ele = "";
                }
                SendEmail(ele);
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        public string test_mail=ConfigurationManager.AppSettings["mail_status"].ToString();
        public void SendEmail(string handlerss)
        {
            try
            {
                //capitalpsports2014@gmail.com", "CapitalSport
                var smtp = new System.Net.Mail.SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                
                    if (test_mail == "1")
                    {
                        smtp.Credentials = new NetworkCredential("freemanasfreeze@gmail.com", "revengerevenge");
                      
                    }
                    else
                    {
                        smtp.Credentials = new NetworkCredential("capitalpsports2014@gmail.com", "capitalsportscapitalsports");
                    }
                    smtp.Timeout = 10000;
                }
                string Sub = "タスクが割り振られましたので対応してください。";
                string Form_Number = lblFormNo.Text;
                string Start_Date = dpStartDate.Text;
                string End_Date = dpEndDate.Text;
                string Brand_Option = ddlBrand.SelectedItem.Text.ToString();
                string Classified_MD = ddlApplyType.SelectedItem.Text.ToString();
                string URL_Add = "   " + HttpContext.Current.Request.Url.AbsoluteUri.ToString();

                Instructions_BL ib = new Instructions_BL();
                DataTable dti = new DataTable();
                dti = ib.Instruction_retrieve(Form_Number);

                //Instructions_Entity ie = new Instructions_Entity();

                if (!URL_Add.ToString().Contains("?"))
                {
                    string idurl = string.Empty;
                    if (dti.Rows.Count > 0)
                    {
                        idurl = dti.Rows[0][0].ToString();
                        URL_Add = URL_Add + "?ID=" + idurl;
                    }


                }
                string Stat_Cu = "";
                string body = "";


                if (status_ucrrent == "9" || handlerss == "")
                {
                    Stat_Cu = "この書式番号は正常に終了しました";
                    //string Status_Option = Stat_Cu;


                    body = "完了した問題" + Environment.NewLine + Environment.NewLine + Form_Number + Stat_Cu + Environment.NewLine + "このフォーム番号は終了しました";
                    MailMessage mm;
                    if (test_mail == "1")
                    {
                        mm = new MailMessage("capitalsports@gmail.com", "freemanasfreeze@gmail.com", "要求されたタスク", body);
                     
                    }
                    else
                    {
                        mm = new MailMessage("capitalpsports2014@gmail.com", "d030e977.act-gr.co.jp@jp.teams.ms", "要求されたタスク", body);
                    }
                    //mm.IsBodyHtml = true;

                    //smtp.Credentials = new NetworkCredential("freemanasfreeze@gmail.com", "revengerevenge");
                    // Passing values to smtp object
                    smtp.Send(mm);
                }
                else
                {
                    switch (status_ucrrent)
                    {
                        case "1":
                            Stat_Cu = "仕入管理チーム / 申請 / 申請者 ";
                            break;
                        case "2":
                            Stat_Cu = "仕入管理チーム / 申請 / チェック";
                            break;
                        case "3":
                            Stat_Cu = "制作チーム / 商品管理 / 作業依頼";
                            break;
                        case "4":
                            Stat_Cu = "制作チーム / 商品管理 / 価格変更";
                            break;
                        case "5":
                            Stat_Cu = "制作チーム / 商品管理 / チェック";
                            break;
                        case "6":
                            Stat_Cu = "制作チーム / サイト反映 / 商品ＵＰ";
                            break;
                        case "7":
                            Stat_Cu = "制作チーム / サイト反映 / バナー作成";
                            break;
                        case "8":
                            Stat_Cu = "総合チェック";
                            break;
                    }
                    //string Status_Option = Stat_Cu;


                    body = Environment.NewLine + "タスク対応者          ---" + handlerss + Environment.NewLine + Sub + Environment.NewLine + "指示書no.       ---" + Form_Number + Environment.NewLine + Environment.NewLine + "開始日          ---" + Start_Date + Environment.NewLine + "終了日          ---" + End_Date + Environment.NewLine + "ブランド          ---" + Brand_Option + Environment.NewLine + "申請区分        ---" + Classified_MD + Environment.NewLine + "ステータス        ---" + Stat_Cu + Environment.NewLine + "TASK URL       ---" + "このリンクに従ってください" + URL_Add;
                    //string table="<html><head></head><body><table style='width:100%'><tr><th>Firstname</th><th>Lastname</th><th>Age</th></tr><tr><td>Jill</td><td>Smith</td><td>50</td></tr><tr><td>Eve</td><td>Jackson</td><td>94</td> </tr></table></body></html>";
                    //body+="<html><head></head><body>";
                    //body+="<table style='width:100%; border:0px'>";

                    //body += "<tr><td>タスク対応者</td><td>---</td><td>" + handlerss + "</td> </tr>";
                    //body += "<br/>";
                    //body += "<tr><th>" + Sub + "</th><th></th><th></th></tr>";
                    //body += "<br/>";
                    //body += "<tr><td></td><td></td><td></td></tr>";
                    //body += "<tr><td>指示書no.</td><td>---</td><td>" + Form_Number +"</td></tr>";
                    //body += "<tr><td>開始日</td><td>---</td><td>"+ Start_Date +"</td></tr>";
                    //body += "<tr><td>終了日</td><td>---</td><td>"+ End_Date +"</td> </tr>";
                    //body += "<tr><td>ブランド</td><td>---</td><td>" + Brand_Option + "</td></tr>";
                    //body += "<tr><td>申請区分</td><td>---</td><td>" + Classified_MD + "</td> </tr>";
                    //body += "<tr><td>ステータス</td><td>---</td><td>" + Stat_Cu + "</td> </tr>";
                    //body += "<tr><td>Task_URL</td><td>---</td><td> このリンクに従ってください "+ URL_Add + "</td> </tr>";
                    //body +="</table></body></html>";

                    //MailMessage mm = new MailMessage("capitalpsports2014@gmail.com", "g-1000000043-156026@mail.talknote.com", Sub, body);
                    // Passing values to smtp object

                    MailMessage mm;
                 
                    if (test_mail == "1")
                    {
                        mm = new MailMessage("freemanasfreeze@gmail.com", "freemanasfreeze@gmail.com", "要求されたタスク", body);
                    }
                    else
                    { 
                       mm = new MailMessage("capitalpsports2014@gmail.com", "d030e977.act-gr.co.jp@jp.teams.ms", "要求されたタスク", body);
                   
                    }
                    //mm.IsBodyHtml = true;
                    smtp.Send(mm);
                }




                //Skype snd = new Skype();
                //snd.Attach();

                //snd.Chats();

                //snd.SendMessage("capital.maythagyanaung@gmail.com", "Hello");
                //ChatMessage rMessage = mainSkype.SendMessage("c0mmodity", "Hello me!");

            }
            catch (Exception ex)
            {

                send_Exce_to_DB(ex);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2('Please Select User');", true);
            }
        }

        //   public  static Skype4Sharp.Skype4Sharp mainSkype;
        //public static SkypeCredentials authCreds = new SkypeCredentials("USERNAME", "PASSWORD");
        //public static void Main(string[] args)
        //{
        //  mainSkype = new Skype4Sharp.Skype4Sharp(authCreds);
        //  mainSkype.Login();
        //}

        public void send_Exce_to_DB(Exception exdb)
        {
            Label Lblusername = (this.Master.FindControl("lblUserID") as Label);
            string lbluser = Lblusername.Text.ToString();
            Session["usererror"] = lbluser;
            error_log_bl erbl = new error_log_bl();
            if (erbl.error_log_insert(exdb))
            {
                //put the Alert Message or success message
            }
        }
        private void InstructionUpdate()
        {
            try
            {
                alert();
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }
        protected void alert()
        {
            Instructions_Entity ie = InstructionGetData();
            try
            {
                uploadFile();
            }
            catch
            {
                file_upload_check();
            }
            file_upload_check(); ;
            Instructions_BL ibl = new Instructions_BL();
            if (ibl.Instruction_Update(ie))
            {
                string lbl = lblcurrentstage.Text;
                status_ucrrent = ie.CurrentStage.ToString();
                lblcurrentstage_mail.Text = ie.CurrentStage.ToString();




                //else
                //{
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('正常に更新されました!');", true);
                //}
                gotoswitch();
                Email();





            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('更新に失敗しました!');", true);
            }
        }
        public string Stat_Cuur;
        protected void gotoswitch()
        {
            Instructions_Entity ie = InstructionGetData();
            Instructions_BL ibl = new Instructions_BL();
            status_ucrrent = lblcurrentstage.Text;
            switch (status_ucrrent)
            {
                case "1":

                    if (ddlStage1.SelectedValue.ToString() == "0")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('ステージを選択してください!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('正常に更新されました!');", true);
                    }

                    break;
                case "2":

                    if (ddlStage2.SelectedValue.ToString() == "0")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('ステージを選択してください!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('正常に更新されました!');", true);
                    }

                    break;
                case "3":

                    if (ddlStage3.SelectedValue.ToString() == "0")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('ステージを選択してください!');", true);
                    }


                    else if (ddlStage3.SelectedValue != "2")
                    {
                        if (ddlstage3User.SelectedValue.Equals("0") && ddlstage3User.Enabled == true)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2('ユーザーを選択してください');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('正常に更新されました!');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('正常に更新されました!');", true);
                    }

                    break;
                case "4":
                    if (ddlStage4.SelectedValue.ToString() == "0")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('ステージを選択してください!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('正常に更新されました!');", true);
                    }
                    break;
                case "5":

                    if (ddlStage5.SelectedValue.ToString() == "0")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('ステージを選択してください!');", true);
                    }

                    else if (ddlStage5.SelectedValue != "2")
                    {
                        if (ddlstage5User.SelectedValue.Equals("0") && ddlstage5User.Enabled == true)
                        {
                            if (ie.IsFinished != 1)
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('正常に更新されました!');", true);

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('正常に更新されました!');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('正常に更新されました!');", true);
                    }
                    break;
                case "6":
                    if (ddlStage6.SelectedValue.ToString() == "0")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('ステージを選択してください!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('正常に更新されました!');", true);
                    }
                    break;
                case "7":
                    if (ddlStage7.SelectedValue.ToString() == "0")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('ステージを選択してください!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('正常に更新されました!');", true);
                    }
                    break;
                case "8":

                    if (ddlStage8.SelectedValue == "1")
                    {
                        //現在のフォー   ムが正常に完了しました
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('現在のフォー " + lblFormNo.Text + " ムが正常に完了しました!');", true);
                    }

                    else if (ddlStage8.SelectedValue.ToString() == "0")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('ステージを選択してください!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('正常に更新されました!');", true);
                    }
                    break;
            }
        }
        private Instructions_Entity InstructionGetData()
        {

            Instructions_Entity ie = new Instructions_Entity();
            ie.NotiUserID = 0;
            ie.ID = Request.QueryString["ID"];
            ie.FormType = lblFormNo.Text[0].ToString();
            ie.FormNo = lblFormNo.Text.Remove(0, 1);
            ie.Form = lblFormNo.Text;
            ie.ApplyDate = dpApplyDate.Text;
            ie.ApplyType_ID = Convert.ToInt32(ddlApplyType.SelectedItem.Value);
            //ie.Category_ID = Convert.ToInt32(Categoryddl.SelectedItem.Value);
            ie.StartDate = dpStartDate.Text;
            ie.EndDate = dpEndDate.Text;
            ie.Suppliers_ID = Convert.ToInt32(ddlSupplier.SelectedItem.Value);
            ie.Brand_ID = Convert.ToInt32(ddlBrand.SelectedItem.Value);
            ie.Category = txtcategory.Text;
            ie.TargetItem = rdoAttach_Yes.Checked ? 0 : 1;
            ie.MD_Unit = rdbProductNoUnit.Checked ? 0 : 1;
            ie.MD_Management = rdbManagement_Yes.Checked ? 0 : 1;
            ie.ContactToyonaka = rdbContact_Yes.Checked ? 0 : 1;
            ie.Selling_Price = txtpricechange.Text.Replace(",", string.Empty);
            ie.SellingPrice_Unit = Convert.ToInt32(ddlSellingPrice.SelectedItem.Value);
            ie.SpecialPriceType_ID = Convert.ToInt32(ddlSalePriceType.SelectedItem.Value);
            //ie.Cost = txtpurchaseprice.Text.Replace(",", string.Empty);
            ie.Cost =  Convert.ToDecimal(String.Format("{0:N2}",txtpurchaseprice.Text));
            ie.CostUnit = Convert.ToInt32(ddlCostUnit.SelectedItem.Value);
            ie.InventoryType_ID = Convert.ToInt32(ddlInventoryType.SelectedItem.Value);
            ie.PriceChange_Remark = txtPriceRemark.Text;
            ie.Purchasing_Remark = txtPurchaseNote.Text;
            ie.ItemMemo = txtProductNote.Text;
            ie.BossMemo = txtmemo.Text;
            ie.ItemUp = rdbProduct_Yes.Checked ? 0 : 1;
            ie.SiteBanner = rdbBanner_Yes.Checked ? 0 : 1;
            ie.Hot = chkHot.Checked;
            ie.SaleBanner = chkSaleBanner.Checked;
            ie.SaleText = chkSaleText.Checked;
            ie.Header = chkHeader.Checked;
            ie.Side = chkSide.Checked;
            ie.SiteRemark = txtRemark.Text;
            //ie.StageID = hfUserTypeID.Value;
            ie.Stage1Status = Convert.ToInt32(ddlStage1.SelectedItem.Value);
            ie.Stage1Date = dpStage1.Text;
            ie.Stage1User = lblstage1userID.Text;
            ie.Stage2Status = Convert.ToInt32(ddlStage2.SelectedItem.Value);
            ie.Stage2Date = dpStage2.Text;
            ie.Stage2User = lblstage2userID.Text;
            ie.Stage3Status = Convert.ToInt32(ddlStage3.SelectedItem.Value);
            ie.Stage3Date = dpStage3.Text;
            ie.Stage3User = lblstage3userID.Text;
            ie.Stage3TargetUser = Convert.ToInt32(ddlstage3User.SelectedItem.Value);
            ie.Stage4Status = Convert.ToInt32(ddlStage4.SelectedItem.Value);
            ie.Stage4Date = dpStage4.Text;
            ie.Stage4User = lblstage4userID.Text;
            ie.Stage5Status = Convert.ToInt32(ddlStage5.SelectedItem.Value);
            ie.Stage5Date = dpStage5.Text;
            ie.Stage5User = lblstage5userID.Text;
            ie.Stage5TargetUser = Convert.ToInt32(ddlstage5User.SelectedItem.Value);
            ie.Stage6Status = Convert.ToInt32(ddlStage6.SelectedItem.Value);
            ie.Stage6Date = dpStage6.Text;
            ie.Stage6User = lblstage6userID.Text;
            ie.Stage7Status = Convert.ToInt32(ddlStage7.SelectedItem.Value);
            ie.Stage7Date = dpStage7.Text;
            ie.Stage7User = lblstage7userID.Text;
            ie.Stage8Status = Convert.ToInt32(ddlStage8.SelectedItem.Value);
            ie.Stage8Date = dpStage8.Text;
            ie.Stage8User = lblstage8userID.Text;
            ie = ChangeStage(ie);

            return ie;


        }

        private void InstructionSetdata()
        {
            try
            {

                lblSave.Text = "更新";
                btnCopy.Visible = true;
                Instructions_Entity ie = new Instructions_Entity();
                Instructions_BL ibl = new Instructions_BL();
                int ID = Convert.ToInt32(Request.QueryString["ID"]);
                ie.ID = Request.QueryString["ID"];
                DataTable dt = ibl.Instruction_Edit(ie);
                if (dt.Rows.Count > 0)
                {
                    lblFormNo.Text = dt.Rows[0]["FormType"].ToString() + dt.Rows[0]["FormNo"].ToString();
                    ddlApplyType.Text = dt.Rows[0]["ApplyType_ID"].ToString();
                    //Categoryddl.Text = dt.Rows[0]["Category_ID"].ToString();
                    dpApplyDate.Text = dt.Rows[0]["ApplyDate"].ToString();
                    dpStartDate.Text = dt.Rows[0]["StartDate"].ToString();
                    dpEndDate.Text = dt.Rows[0]["EndDate"].ToString();
                    ddlSupplier.Text = dt.Rows[0]["Supplier_ID"].ToString();
                    ddlBrand.Text = dt.Rows[0]["Brand_ID"].ToString();
                    txtcategory.Text = dt.Rows[0]["Category"].ToString();
                    rdbManagement_Yes.Checked = dt.Rows[0]["MD_Management"].ToString().Equals("0") ? true : false;
                    rdbManagement_No.Checked = dt.Rows[0]["MD_Management"].ToString().Equals("1") ? true : false;
                    rdbContact_Yes.Checked = dt.Rows[0]["ContactToyonaka"].ToString().Equals("0") ? true : false;
                    rdbContact_No.Checked = dt.Rows[0]["ContactToyonaka"].ToString().Equals("1") ? true : false;
                    rdbProductNoUnit.Checked = dt.Rows[0]["MD_Unit"].ToString().Equals("0") ? true : false;
                    rdbColorUnit.Checked = dt.Rows[0]["MD_Unit"].ToString().Equals("1") ? true : false;
                    rdbProduct_Yes.Checked = dt.Rows[0]["ItemUp"].ToString().Equals("0") ? true : false;
                    rdbProduct_No.Checked = dt.Rows[0]["ItemUp"].ToString().Equals("1") ? true : false;
                    rdbBanner_Yes.Checked = dt.Rows[0]["SiteBanner"].ToString().Equals("0") ? true : false;
                    rdbBanner_No.Checked = dt.Rows[0]["SiteBanner"].ToString().Equals("1") ? true : false;
                    rdoAttach_Yes.Checked = dt.Rows[0]["TargetItem"].ToString().Equals("0") ? true : false;
                    rdoAttach_No.Checked = dt.Rows[0]["TargetItem"].ToString().Equals("1") ? true : false;
                    txtpricechange.Text = dt.Rows[0]["Selling_Price"].ToString();
                    ddlSellingPrice.Text = dt.Rows[0]["Selling_Price_Unit_ID"].ToString();
                    txtpurchaseprice.Text = dt.Rows[0]["Cost"].ToString();
                    ddlCostUnit.Text = dt.Rows[0]["Cost_Unit_ID"].ToString();
                    ddlSalePriceType.Text = dt.Rows[0]["SpecialPrice_Type_ID"].ToString();
                    ddlInventoryType.Text = dt.Rows[0]["Inventory_Type_ID"].ToString();
                    txtPriceRemark.Text = dt.Rows[0]["PriceChange_Remark"].ToString();
                    txtPurchaseNote.Text = dt.Rows[0]["Purchasing_Remark"].ToString();
                    txtProductNote.Text = dt.Rows[0]["ItemMemo"].ToString();
                    txtmemo.Text = dt.Rows[0]["BossMemo"].ToString();
                    chkHot.Checked = dt.Rows[0]["HOT"].ToString().Equals("True") ? true : false;
                    chkSaleBanner.Checked = dt.Rows[0]["SaleBanner"].ToString().Equals("True") ? true : false;
                    chkSaleText.Checked = dt.Rows[0]["SaleText"].ToString().Equals("True") ? true : false;
                    chkHeader.Checked = dt.Rows[0]["Header"].ToString().Equals("True") ? true : false;
                    chkSide.Checked = dt.Rows[0]["Side"].ToString().Equals("True") ? true : false;
                    txtRemark.Text = dt.Rows[0]["Site_Remark"].ToString();
                    dpStage1.Text = dt.Rows[0]["Stage1Date"].ToString();
                    ddlStage1.Text = dt.Rows[0]["Stage1Status"].ToString();
                    lblstage1userID.Text = dt.Rows[0]["Stage1UserID"].ToString();
                    lblstage1user.Text = dt.Rows[0]["Stage1User"].ToString();
                    dpStage2.Text = dt.Rows[0]["Stage2Date"].ToString();
                    ddlStage2.Text = dt.Rows[0]["Stage2Status"].ToString();
                    lblstage2userID.Text = dt.Rows[0]["Stage2UserID"].ToString();
                    lblstage2user.Text = dt.Rows[0]["Stage2User"].ToString();
                    dpStage3.Text = dt.Rows[0]["Stage3Date"].ToString();
                    ddlStage3.Text = dt.Rows[0]["Stage3Status"].ToString();
                    lblstage3userID.Text = dt.Rows[0]["Stage3UserID"].ToString();
                    lblstage3user.Text = dt.Rows[0]["Stage3User"].ToString();
                    ddlstage3User.Text = dt.Rows[0]["Stage3TargetUser"].ToString();
                    dpStage4.Text = dt.Rows[0]["Stage4Date"].ToString();
                    ddlStage4.Text = dt.Rows[0]["Stage4Status"].ToString();
                    lblstage4userID.Text = dt.Rows[0]["Stage4UserID"].ToString();
                    lblstage4user.Text = dt.Rows[0]["Stage4User"].ToString();
                    dpStage5.Text = dt.Rows[0]["Stage5Date"].ToString();
                    ddlStage5.Text = dt.Rows[0]["Stage5Status"].ToString();
                    lblstage5userID.Text = dt.Rows[0]["Stage5UserID"].ToString();
                    lblstage5user.Text = dt.Rows[0]["Stage5User"].ToString();
                    ddlstage5User.Text = dt.Rows[0]["Stage5TargetUser"].ToString();
                    dpStage6.Text = dt.Rows[0]["Stage6Date"].ToString();
                    ddlStage6.Text = dt.Rows[0]["Stage6Status"].ToString();
                    lblstage6userID.Text = dt.Rows[0]["Stage6UserID"].ToString();
                    lblstage6user.Text = dt.Rows[0]["Stage6User"].ToString();
                    dpStage7.Text = dt.Rows[0]["Stage7Date"].ToString();
                    ddlStage7.Text = dt.Rows[0]["Stage7Status"].ToString();
                    lblstage7userID.Text = dt.Rows[0]["Stage7UserID"].ToString();
                    lblstage7user.Text = dt.Rows[0]["Stage7User"].ToString();
                    dpStage8.Text = dt.Rows[0]["Stage8Date"].ToString();
                    ddlStage8.Text = dt.Rows[0]["Stage8Status"].ToString();
                    lblstage8userID.Text = dt.Rows[0]["Stage8UserID"].ToString();
                    lblstage8user.Text = dt.Rows[0]["Stage8User"].ToString();
                    lblcurrentstage.Text = dt.Rows[0]["CurrentStage"].ToString();

                    EnabledFalse();
                    if (dt.Rows[0]["IsFinished"].ToString().Equals("False"))
                        CheckStage(dt.Rows[0]["CurrentStage"].ToString());




                    ie.FormNo = dt.Rows[0]["FormNo"].ToString();

                    if (dt.Rows[0]["CurrentStage"].ToString() == "9")
                    {
                        footer_btn.Style.Add("visibility", "hidden");
                    }
                    if (dt.Rows[0]["IsFinished"].ToString() == "True")
                    {
                        footer_btn.Style.Add("visibility", "hidden");
                        btnCopy.Visible = false;
                    }


                    dt = ibl.Instruction_Copy(ie);
                    if (dt.Rows.Count > 0)
                        btnCopy.Visible = false;


                }



            }
            catch (Exception ex)
            {
                send_Exce_to_DB(ex);
            }
        }
        protected void btnCopy_Click(object sender, EventArgs e)
        {
            InstructionCopy();

        }
        private void InstructionCopy()
        {
            try
            {

                lblcurrentstage.Text = "1";
                lblSave.Text = "登録";
                btnCopy.Visible = false;
                lblFormNo.Text = lblFormNo.Text.Replace("S", "E");
                ResetStage();
                dpStage1.Enabled = true;
                lblstage1user.Enabled = true;
                ddlStage1.Enabled = true;
                //Instructions_Entity ie = InstructionGetData();
                //Instructions_BL ibl = new Instructions_BL();

                //if (ibl.Instructions_Save(ie))
                //{
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('Saved Successfully!');", true);
                //    Refresh();
                //}
                //else
                //{
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3('Save Fail!');", true);
                //}
            }
            catch (Exception ex)
            {
                error_check ec = new error_check();
                ec.send_Exce_to_DB(ex);
            }
        }

        private void CheckStage(string stage)
        {
            try
            {
                Users_Entity ue = new Users_Entity();
                Instructions_Entity ie = new Instructions_Entity();
                Instructions_BL ibl = new Instructions_BL();
                ie.FormID = Convert.ToInt32(Request.QueryString["ID"]);
                ie.UserID = Convert.ToInt32(Session["UserID"].ToString().Split(',')[0]);
                DataTable dtb = ibl.Instruction_Access(ie);
                string[] arr = new string[dtb.Rows.Count];
                for (int i = 0; i < dtb.Rows.Count; i++)
                {
                    arr[i] = dtb.Rows[i]["StageID"].ToString();
                }
                if (arr.Contains(stage))
                {
                    //if (ddlstage3User.SelectedItem.Text.ToString() == ue.UserID.ToString())

                    //if (dtb.Rows.Count > 0)
                    //{




                    switch (stage)
                    {
                        case "1":

                            dpStage1.Text = DateTime.Now.ToString("yyyy/MM/dd");
                            dpStage1.Enabled = true;
                            ddlStage1.Enabled = true;

                            Divg20.Attributes["class"] = Divg20.Attributes["class"].Replace("boo", "form_date");

                            //Divg20.Disabled = true;
                            //Divg20.Attributes.Add("class", "form_date");
                            //Divg20.Attributes["class"].Replace("boo", "form_date");
                            //Divg20.Attributes["class"] += "form_date";
                            lblstage1user.Enabled = true;
                            lblstage1user.Text = Session["UserID"].ToString().Split(',')[1];
                            lblstage1userID.Text = Session["UserID"].ToString().Split(',')[0];
                            break;
                        case "2":
                            //Div26.Attributes.Add("class", "form_date");
                            //Div26.Attributes["class"] += "form_date";
                            dpStage2.Text = DateTime.Now.ToString("yyyy/MM/dd");
                            dpStage2.Enabled = true;
                            ddlStage2.Enabled = true;
                            lblstage2user.Enabled = true;
                            lblstage2user.Text = Session["UserID"].ToString().Split(',')[1];
                            lblstage2userID.Text = Session["UserID"].ToString().Split(',')[0];
                            Div26.Attributes["class"] = Div26.Attributes["class"].Replace("boo", "form_date");
                            break;
                        case "3":

                            dpStage3.Text = DateTime.Now.ToString("yyyy/MM/dd");
                            dpStage3.Enabled = true;
                            ddlStage3.Enabled = true;
                            ddlstage3User.Enabled = true;
                            lblstage3user.Enabled = true;
                            lblstage3user.Text = Session["UserID"].ToString().Split(',')[1];
                            lblstage3userID.Text = Session["UserID"].ToString().Split(',')[0];
                            Div13.Attributes["class"] = Div13.Attributes["class"].Replace("boo", "form_date");

                            break;
                        case "4":
                            Label Lblusername = (this.Master.FindControl("lblUserID") as Label);
                            if ((Session["UserID"].ToString().Split(',')[1]).ToString().Equals(ddlstage3User.SelectedItem.Text))
                            {

                                dpStage4.Text = DateTime.Now.ToString("yyyy/MM/dd");
                                dpStage4.Enabled = true;
                                ddlStage4.Enabled = true;
                                lblstage4user.Enabled = true;
                                lblstage4user.Text = Session["UserID"].ToString().Split(',')[1];
                                lblstage4userID.Text = Session["UserID"].ToString().Split(',')[0];
                                Div20.Attributes["class"] = Div20.Attributes["class"].Replace("boo", "form_date");
                            }

                            break;
                        case "5":
                            dpStage5.Text = DateTime.Now.ToString("yyyy/MM/dd");
                            dpStage5.Enabled = true;
                            ddlStage5.Enabled = true;
                            ddlstage5User.Enabled = true;
                            lblstage5user.Enabled = true;
                            lblstage5user.Text = Session["UserID"].ToString().Split(',')[1];
                            lblstage5userID.Text = Session["UserID"].ToString().Split(',')[0];
                            Diav7.Attributes["class"] = Diav7.Attributes["class"].Replace("boo", "form_date");
                            break;
                        case "6":
                            //if ((Session["UserID"].ToString().Split(',')[1]).ToString().Equals(ddlstage5User.SelectedItem.Text))
                            //{

                            dpStage6.Text = DateTime.Now.ToString("yyyy/MM/dd");
                            dpStage6.Enabled = true;
                            ddlStage6.Enabled = true;
                            lblstage6user.Enabled = true;
                            lblstage6user.Text = Session["UserID"].ToString().Split(',')[1];
                            lblstage6userID.Text = Session["UserID"].ToString().Split(',')[0];
                            Dsiv4.Attributes["class"] = Dsiv4.Attributes["class"].Replace("boo", "form_date");
                            //}
                            break;
                        case "7":
                            dpStage7.Text = DateTime.Now.ToString("yyyy/MM/dd");
                            dpStage7.Enabled = true;
                            ddlStage7.Enabled = true;
                            lblstage7user.Enabled = true;
                            lblstage7user.Text = Session["UserID"].ToString().Split(',')[1];
                            lblstage7userID.Text = Session["UserID"].ToString().Split(',')[0];
                            Dfiv1.Attributes["class"] = Dfiv1.Attributes["class"].Replace("boo", "form_date");
                            break;
                        case "8":
                            dpStage8.Text = DateTime.Now.ToString("yyyy/MM/dd");
                            dpStage8.Enabled = true;
                            ddlStage8.Enabled = true;
                            lblstage8user.Enabled = true;
                            lblstage8user.Text = Session["UserID"].ToString().Split(',')[1];
                            lblstage8userID.Text = Session["UserID"].ToString().Split(',')[0];
                            Divr1.Attributes["class"] = Divr1.Attributes["class"].Replace("boo", "form_date");
                            break;
                    }
                }
                else
                {
                    footer_btn.Style.Add("visibility", "hidden");
                    btnCopy.Visible = false;
                }
                //}
            }
            catch (Exception ex)
            {
                send_Exce_to_DB(ex);
            }
            //Response.Redirect("", false);
        }
        public void EnabledFalse()
        {
            try
            {
                dpStage1.Enabled = false;
                ddlStage1.Enabled = false;
                Divg20.Attributes["class"] = Divg20.Attributes["class"].Replace("form_date", "");
                dpStage2.Enabled = false;
                ddlStage2.Enabled = false;
                Div26.Attributes["class"] = Div26.Attributes["class"].Replace("form_date", "");
                dpStage3.Enabled = false;
                ddlStage3.Enabled = false;
                ddlstage3User.Enabled = false;
                Div13.Attributes["class"] = Div13.Attributes["class"].Replace("form_date", "");
                dpStage4.Enabled = false;
                ddlStage4.Enabled = false;
                Div20.Attributes["class"] = Div20.Attributes["class"].Replace("form_date", "");
                dpStage5.Enabled = false;
                ddlstage5User.Enabled = false;
                ddlStage5.Enabled = false;
                Diav7.Attributes["class"] = Diav7.Attributes["class"].Replace("form_date", "");
                dpStage6.Enabled = false;
                ddlStage6.Enabled = false;
                Dsiv4.Attributes["class"] = Dsiv4.Attributes["class"].Replace("form_date", "");
                dpStage7.Enabled = false;
                ddlStage7.Enabled = false;
                Dfiv1.Attributes["class"] = Dfiv1.Attributes["class"].Replace("form_date", "");
                dpStage8.Enabled = false;
                ddlStage8.Enabled = false;
                Divr1.Attributes["class"] = Divr1.Attributes["class"].Replace("form_date", "");
                lblstage1user.Enabled = false;
                lblstage2user.Enabled = false;
                lblstage3user.Enabled = false;
                lblstage4user.Enabled = false;
                lblstage5user.Enabled = false;
                lblstage6user.Enabled = false;
                lblstage7user.Enabled = false;
                lblstage8user.Enabled = false;
            }
            catch (Exception ex)
            {
                send_Exce_to_DB(ex);
            }



        }
        public void ResetStage()
        {
            EnabledFalse();
            ddlStage1.SelectedIndex = 0;
            dpStage2.Text = string.Empty;
            ddlStage2.SelectedIndex = 0;
            dpStage3.Text = string.Empty;
            ddlStage3.SelectedIndex = 0;
            ddlstage3User.SelectedIndex = 0;
            dpStage4.Text = string.Empty;
            ddlStage4.SelectedIndex = 0;
            dpStage5.Text = string.Empty;
            ddlstage5User.SelectedIndex = 0;
            ddlStage5.SelectedIndex = 0;
            dpStage6.Text = string.Empty;
            ddlStage6.SelectedIndex = 0;
            dpStage7.Text = string.Empty;
            ddlStage7.SelectedIndex = 0;
            dpStage8.Text = string.Empty;
            ddlStage8.SelectedIndex = 0;
            lblstage2user.Text = string.Empty;
            lblstage3user.Text = string.Empty;
            lblstage4user.Text = string.Empty;
            lblstage5user.Text = string.Empty;
            lblstage6user.Text = string.Empty;
            lblstage7user.Text = string.Empty;
            lblstage8user.Text = string.Empty;

        }

        private Instructions_Entity ChangeStage(Instructions_Entity ie)
        {

            switch (lblcurrentstage.Text)
            {
                case "1":
                    if (ddlStage1.SelectedValue.Equals("1"))
                    {
                        ie.CurrentStage = 2;
                        ie.Stage2Status = 0;
                    }
                    else
                    {
                        ie.CurrentStage = 1;
                        ie.NotiUserID = Convert.ToInt32(Session["UserID"].ToString().Split(',')[0]);
                    }
                    break;
                case "2":
                    if (ddlStage2.SelectedValue.Equals("1"))
                    {
                        ie.CurrentStage = 3;
                        ie.Stage3Status = 0;
                    }
                    else if (ddlStage2.SelectedValue.Equals("2"))
                    {
                        ie.CurrentStage = 1;
                        ie.Stage1Status = 0;
                    }
                    else
                    {
                        ie.CurrentStage = 2;
                        ie.NotiUserID = Convert.ToInt32(Session["UserID"].ToString().Split(',')[0]);
                    }
                    break;
                case "3":
                    if (ddlStage3.SelectedValue.Equals("1"))
                    {
                        if (ddlstage3User.SelectedValue.Equals("0"))
                            ie.CurrentStage = 3;
                        else
                        {
                            ie.NotiUserID = Convert.ToInt32(ddlstage3User.SelectedItem.Value);
                            ie.CurrentStage = 4;
                            ie.Stage4Status = 0;
                        }
                    }
                    else if (ddlStage3.SelectedValue.Equals("2"))
                    {
                        ie.CurrentStage = 2;
                        ie.Stage2Status = 0;
                    }
                    else
                    {
                        ie.CurrentStage = 3;
                        ie.NotiUserID = Convert.ToInt32(Session["UserID"].ToString().Split(',')[0]);
                    }
                    break;
                case "4":
                    if (ddlStage4.SelectedValue.Equals("1"))
                    {
                        ie.CurrentStage = 5;
                        ie.Stage5Status = 0;
                    }
                    else if (ddlStage4.SelectedValue.Equals("2"))
                    {
                        ie.NotiUserID = Convert.ToInt32(lblstage3userID.Text);
                        ie.CurrentStage = 3;
                        ie.Stage3Status = 0;
                    }
                    else
                    {
                        ie.CurrentStage = 4;
                        ie.NotiUserID = Convert.ToInt32(Session["UserID"].ToString().Split(',')[0]);
                    }
                    break;
                case "5":
                    if (ddlStage5.SelectedValue.Equals("1"))
                    {
                        //Removed for ddlstage5User Because of Customer repair
                        if (ddlstage5User.SelectedValue.Equals("0"))
                        {
                            if (rdbProduct_No.Checked == true)
                            {
                                if (rdbBanner_No.Checked == true)
                                {
                                    ie.CurrentStage = 8;
                                    ie.Stage8Status = 0;
                                }
                                else
                                {
                                    ie.CurrentStage = 7;
                                    ie.Stage7Status = 0;
                                }
                                //The original
                                //ie.IsFinished = 1;

                            }

                            else
                            {
                                //original
                                //ie.CurrentStage = 5;
                                ie.CurrentStage = 6;
                            }


                        }
                        else
                        {
                            ie.NotiUserID = Convert.ToInt32(ddlstage5User.SelectedItem.Value);
                            ie.CurrentStage = 6;
                            if (rdbProduct_Yes.Checked == true)
                                ie.Stage6Status = 0;
                            else
                            {
                                ie.IsFinished = 1;
                                ie.NotiUserID = -1;
                            }
                        }
                    }
                    else if (ddlStage5.SelectedValue.Equals("2"))
                    {
                        ie.CurrentStage = 4;
                        ie.Stage4Status = 0;
                    }
                    else
                    {
                        ie.CurrentStage = 5;
                        ie.NotiUserID = Convert.ToInt32(Session["UserID"].ToString().Split(',')[0]);
                    }
                    break;
                case "6":
                    if (ddlStage6.SelectedValue.Equals("1"))
                    {

                        if (rdbBanner_Yes.Checked == true)
                        {
                            ie.Stage7Status = 0;
                            ie.CurrentStage = 7;
                        }
                        else
                        {
                            ie.CurrentStage = 8;
                            ie.Stage8Status = 0;

                            //ie.IsFinished = 1;
                            //ie.NotiUserID = -1;
                        }
                    }
                    else if (ddlStage6.SelectedValue.Equals("2"))
                    {
                        ie.NotiUserID = Convert.ToInt32(lblstage5userID.Text);
                        ie.CurrentStage = 5;
                        ie.Stage5Status = 0;
                    }
                    else
                    {
                        ie.CurrentStage = 6;
                        ie.NotiUserID = Convert.ToInt32(Session["UserID"].ToString().Split(',')[0]);
                    }
                    break;
                case "7":
                    if (ddlStage7.SelectedValue.Equals("1"))
                    {
                        ie.CurrentStage = 8;
                        ie.Stage8Status = 0;
                    }
                    else if (ddlStage7.SelectedValue.Equals("2"))
                    {
                        if (rdbProduct_Yes.Checked == true)
                        {
                            ie.CurrentStage = 6;
                            ie.Stage6Status = 0;

                        }
                        else
                        {
                            ie.CurrentStage = 5;
                            ie.Stage5Status = 0;
                        }
                    }
                    else
                    {
                        ie.CurrentStage = 7;
                        ie.NotiUserID = Convert.ToInt32(Session["UserID"].ToString().Split(',')[0]);
                    }
                    break;
                case "8":
                    if (ddlStage8.SelectedValue.Equals("1"))
                    {
                        ie.CurrentStage = 9;
                        ie.IsFinished = 1;
                    }
                    else if (ddlStage8.SelectedValue.Equals("2"))
                    {
                        if (rdbBanner_Yes.Checked == true)
                        {
                            ie.CurrentStage = 7;
                            ie.Stage7Status = 0;
                        }
                        else
                        {
                            if (rdbProduct_Yes.Checked == true)
                            {
                                ie.CurrentStage = 6;
                                ie.Stage6Status = 0;
                            }
                            else
                            {
                                ie.CurrentStage = 5;
                                ie.Stage5Status = 0;
                            }
                        }
                    }
                    else
                    {
                        ie.CurrentStage = 8;
                        ie.NotiUserID = Convert.ToInt32(Session["UserID"].ToString().Split(',')[0]);
                    }
                    break;
                default:
                    ie.CurrentStage = 1;
                    ie.Stage1Status = 0;
                    break;
            }
            return ie;

        }
        private string GetFormID()
        {

            Instructions_BL ibl = new Instructions_BL();
            return ibl.Instructions_GetFormID();


        }
        protected bool Check()
        {

            Instructions_Entity ie = new Instructions_Entity();
            Instructions_BL ibl = new Instructions_BL();
            ie.FormNo = lblFormNo.Text;
            if (ibl.CheckFormNo(ie))
            {
                lblFormNo.Text = GetFormID();
                return false;
            }
            else { return true; }
        }


        public void Refresh()
        {
            lblFormNo.Text = GetFormID();
            ddlApplyType.SelectedIndex = 0;
            dpStartDate.Text = String.Empty;
            dpEndDate.Text = String.Empty;
            ddlSupplier.SelectedIndex = 0;
            ddlBrand.SelectedIndex = 0;
            //Categoryddl.SelectedIndex = 0;
            txtcategory.Text = string.Empty;
            rdoAttach_No.Checked = false;
            rdoAttach_Yes.Checked = true;
            rdbManagement_Yes.Checked = true;
            rdbManagement_No.Checked = false;
            rdbContact_Yes.Checked = true;
            rdbContact_No.Checked = false;
            rdbBanner_Yes.Checked = true;
            rdbBanner_No.Checked = false;
            rdbProduct_Yes.Checked = true;
            rdbProduct_No.Checked = false;
            rdbProductNoUnit.Checked = true;
            rdbColorUnit.Checked = false;
            txtpricechange.Text = string.Empty;
            ddlSellingPrice.SelectedIndex = 0;
            ddlSalePriceType.SelectedIndex = 0;
            txtpurchaseprice.Text = string.Empty;
            ddlCostUnit.SelectedIndex = 0;
            ddlInventoryType.SelectedIndex = 0;
            txtProductNote.Text = string.Empty;
            txtPurchaseNote.Text = string.Empty;
            txtmemo.Text = string.Empty;
            txtPriceRemark.Text = string.Empty;
            ddlSalePriceType.SelectedIndex = 0;
            ddlInventoryType.SelectedIndex = 0;
            chkHot.Checked = false;
            chkSaleBanner.Checked = false;
            chkSaleText.Checked = false;
            chkHeader.Checked = false;
            chkSide.Checked = false;
            txtRemark.Text = String.Empty;
            ddlStage1.SelectedIndex = 0;
        }
        protected void upload_Click(object sender, EventArgs e)
        {
            if (btnupload.Text.ToString() != "Remove File")
            {
                //string strFilename = string.Empty;
                string strMessage = string.Empty;
                //strFilename = upload_input.PostedFile.FileName.ToString();

                //strMessage = uploadFile(strFilename, sys.AppSettings["FolderPath"].ToString());

                strMessage = uploadFile();
            }
            else
            {
                string msg = "フォーム番号 "+ lblFormNo.Text+"のファイルを削除してもよろしいですか？";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal1('" + msg + "');", true);

            }

            

        }
        protected void delete_file()
            {
                Instructions_BL ibl = new Instructions_BL();
                DataTable dt = new DataTable();


                dt = ibl.retrieve_file(lblFormNo.Text.ToString());
                string file = Server.MapPath("~/Down") + "\\" + lblFormNo.Text.ToString() + dt.Rows[0]["Attach_Fname"].ToString();
                if (Directory.Exists(Path.GetDirectoryName(file)))
                {
                    File.Delete(file);
                    file_upload_false();
                    btnupload.Text = "Upload";
                    fail_upload.Text = "No File Uploaded";
                    fail_upload.ForeColor = System.Drawing.Color.Red;
                    fail_upload.Font.Size = 10;

                    Instructions_BL ibl1 = new Instructions_BL();

                    if (ibl1.delete_Ufile(lblFormNo.Text.ToString()))
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal('" + "ファイルは正常に削除されました" + "');", true);
                    }

                }
            }
        public string uploadFile()
        {
            try
            {

                if (upload_input.PostedFile.ContentLength > 0)
                {

                    string uid = (Session["UserID"].ToString().Split(',')[0]).ToString();
                    string filename = upload_input.PostedFile.FileName;
                    int lastSlash = filename.LastIndexOf("\\");
                    string trailingPath = filename.Substring(lastSlash + 1);
                    string dd = "~/Down";
                    Instructions_BL ibl1 = new Instructions_BL();
                    string for_form1 = string.Empty;
                    for_form1 = lblFormNo.Text.ToString();
                    if (Request.QueryString["ID"] == null)
                    {

                        string[] strarr = for_form1.Split('-');
                        for_form1 = strarr[0] + "-" + (Convert.ToInt32(strarr[1]) - 1).ToString("D5");

                    }

                    string fullPath = Server.MapPath(dd) + "\\" + for_form1 + trailingPath;
                    upload_input.PostedFile.SaveAs(fullPath);
                    //upload_input.PostedFile.SaveAs(Server.MapPath(@folderName) + "\\" + fileName);
                    //upload_input.PostedFile.SaveAs( Server.MapPath("C:/Users/Dell/Downloads/Music/") + fileName);
                    //C:\Users\Dell\Desktop\Zips\
                    Instructions_BL ibl = new Instructions_BL();
                    string for_form = string.Empty;
                    for_form = lblFormNo.Text.ToString();
                    if (Request.QueryString["ID"] == null)
                    {

                        string[] strarr = for_form.Split('-');
                        for_form = strarr[0] + "-" + (Convert.ToInt32(strarr[1]) - 1).ToString("D5");

                    }


                    if (ibl.Instructions_Upload(uid, filename, dd, for_form))
                    {
                        return "File uploaded successfully";
                    }
                    else
                    {

                        return "Failed to upload";
                    }

                }

                else
                {

                    return "Unable to upload,file exceeds maximum limit";

                }

            }

            catch (UnauthorizedAccessException ex)
            {

                return ex.Message + "Permission to upload file denied";

            }

        }
        protected void down_Click(object sender, EventArgs e)
        {
            try
            {
                string[] d_id = Session["UserID"].ToString().Split(',');
                string d_last = d_id[0];
                string lblform = lblFormNo.Text.ToString();
                Instructions_BL ibl = new Instructions_BL();
                DataTable dt = new DataTable();

                dt = ibl.retrieve_file(lblFormNo.Text.ToString());
                if (dt.Rows.Count > 0)
                {
                    Download(lblform.ToString() + dt.Rows[0]["Attach_Fname"].ToString(), "~/Down" + "/" + lblform.ToString() + dt.Rows[0]["Attach_Fname"].ToString());
                    //Download("S2017-00032style123.css", "~/Down/S2017-00032style123.css");

                }
            }
            catch
            {
            }
        }
        public static void Download(string sFileName, string sFilePath)
        {
            try
            {
                Regex.Replace(sFilePath.TrimEnd(), @"\s+", "");

                //string sfilepath1 = sFilePath.Replace(" ", string.Empty);
                HttpContext.Current.Response.ContentType = "APPLICATION/OCTET-STREAM";
                String Header = "Attachment; Filename=" + sFileName;
                HttpContext.Current.Response.AppendHeader("Content-Disposition", Header);
                System.IO.FileInfo Dfile = new System.IO.FileInfo(HttpContext.Current.Server.MapPath(@sFilePath.TrimEnd()));
                HttpContext.Current.Response.WriteFile(Dfile.FullName);
                HttpContext.Current.Response.End();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        protected void file_upload_false()
        {
            upload_input.Visible = true;
            btnupload.Visible = false;//for later, to change to false
            fail_upload.Visible = true;
            btndown.Visible = false;
        }
        protected void file_upload_check()
        {
            try
            {
                Instructions_BL ibl = new Instructions_BL();
                DataTable dt = new DataTable();

                dt = ibl.retrieve_file(lblFormNo.Text.ToString());
                if (dt.Rows.Count > 0)
                {
                    string filename = dt.Rows[0]["Attach_Fname"].ToString();
                    string name = dt.Rows[0]["UserID"].ToString();

                    upload_input.Visible = false;

                    btnupload.Visible = true;
                    btnupload.Text = "Remove File";

                    fail_upload.Visible = true;
                    fail_upload.Text = filename + "uploaded_by " + name;
                    fail_upload.ForeColor = System.Drawing.Color.Blue;
                    fail_upload.Font.Size = 8;
                    wid.Width = "275";



                    btndown.Visible = true;

                }
                else
                {
                    file_upload_false();
                }
            }
            catch
            {
            }
        }
        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            delete_file();

        }
        }
    }

