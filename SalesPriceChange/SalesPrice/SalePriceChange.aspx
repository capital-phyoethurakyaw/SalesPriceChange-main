<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="SalePriceChange.aspx.cs" Inherits="SalesPrice.SalesPrice.SalePriceChange" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-3.2.0.min.js"></script> 
    <script src="../Scripts/jquery-3.2.0.min.js" type="text/javascript"></script>
    <script src="../Scripts/bootstrap.min.js" type="text/javascript"></script>
    <link href="../Styles/button.css" rel="stylesheet" />
    <script type="text/javascript">
        
        

        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
    </script>
    <script>
            function allowOnlyNumber(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }
    </script>
    <script type="text/javascript">
        function ClearSelectedDate()
        {
                $find("_ce1").set_selectedDate(null);
                $("[id*=ce1]").val("");
                $(".ajax__calendar_active").removeClass("ajax__calendar_active");
                return false;
            }

            function ClearSelectedDate2() {
                $find("_ce2").set_selectedDate(null);
                $("[id*=ce2]").val("");
                $(".ajax__calendar_active").removeClass("ajax__calendar_active");
                return false;
            }

            function ClearSelectedDate3() {
                $find("_ce3").set_selectedDate(null);
                $("[id*=ce3]").val("");
                $(".ajax__calendar_active").removeClass("ajax__calendar_active");
                return false;
            }

            function ClearSelectedDate4() {
                $find("_ce4").set_selectedDate(null);
                $("[id*=ce4]").val("");
                $(".ajax__calendar_active").removeClass("ajax__calendar_active");
                return false;
            }

            function ClearSelectedDate5() {
                $find("_ce5").set_selectedDate(null);
                $("[id*=ce5]").val("");
                $(".ajax__calendar_active").removeClass("ajax__calendar_active");
                return false;
            }
    </script>
    <style type="text/css">
        .auto-style1
        {
            width: 57px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">
        <div class="col-xl-12 col-md-offset-0">
            <div class="panel panel-info panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h1 class="panel-title">Sale Price Change</h1>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col col-xs-6">
                            <asp:Label runat="server" ID="lblID" Text="No:" Height="30px" Width="80px" CssClass="label-black"></asp:Label>
                            <asp:Label ID="lblFormNo" runat="server" Text="2016-0147" Height="30px" Width="200px" CssClass="label-border"></asp:Label>
                        </div>                
                        <div style="padding-right:10px" class="pull-right">
                            <asp:Label runat="server" ID="lblApplyDate" Text="申請日" Height="30px" Width="80px" CssClass="label-black"></asp:Label>
                            <asp:TextBox ID="txtApplyDate" runat="server" Width="100px" Height="30px" CssClass="label-border"  contentEditable="false"  Enabled="true" ></asp:TextBox>
                            <cc1:CalendarExtender  ID="ce1" BehaviorID="_ce1" PopupButtonID="imgPopup1" TargetControlID="txtApplyDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
                            <asp:Label  runat="server" ID="imgPopup1" class="glyphicon glyphicon-calendar ajax-calendar" ></asp:Label>
                            <asp:Label runat="server"  ID="cd1" class="glyphicon glyphicon-remove ajax-calendar" onclick="return ClearSelectedDate();"></asp:Label> 
                        </div>
                    </div>        
                    <div class="row">
                        <p class="warning">※販売に直接的な影響があるので、各担当は速やかに処理すること。漏れ、開始日遅れは厳禁</p>      
                    </div>
                    <div class="row">
                        <div class="col-xl-12 col-md-offset-0">
                            <div class="header1">
                                <asp:Label ID="Label1" runat="server" Text="販売価格変更申請"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top:10px">
                        <div class="col-lg-12 col-xs-12">
                            <asp:Label ID="Label33" Width="150px" runat="server" Text="販売価格変更申請"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlApplyType"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row" style="margin-top:10px">
                        <div class="col-lg-5 col-xs-12">
                            <asp:Label ID="Label2" Width="150px" runat="server" Text="開始期間"></asp:Label>
                            <asp:TextBox ID="txtStartDate" runat="server" Width="100px" Height="30px"  contentEditable="false"  Enabled="true" ></asp:TextBox>
                            <cc1:CalendarExtender  ID="ce2" BehaviorID="_ce2" PopupButtonID="imgPopup2" TargetControlID="txtStartDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
                            <asp:Label runat="server" ID="imgPopup2" class="glyphicon glyphicon-calendar ajax-calendar"></asp:Label>
                            <asp:Label runat="server"  ID="cd2" class="glyphicon glyphicon-remove ajax-calendar" onclick="return ClearSelectedDate2();"></asp:Label>
                        </div>
                        <div class="col-lg-7 col-xs-12">
                            <asp:Label ID="Label3" Width="100px" runat="server" Text="終了時期"></asp:Label>
                            <asp:TextBox ID="txtEndDate" runat="server" Width="100px" Height="30px"  contentEditable="false"  Enabled="true" ></asp:TextBox>
                            <cc1:CalendarExtender  ID="ce3" BehaviorID="_ce3" PopupButtonID="imgPopup3" TargetControlID="txtEndDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
                            <asp:Label runat="server" ID="imgPopup3" class="glyphicon glyphicon-calendar ajax-calendar"></asp:Label>
                            <asp:Label  runat="server" ID="cd3" class="glyphicon glyphicon-remove ajax-calendar" onclick="return ClearSelectedDate3();"></asp:Label>
                        </div>
                    </div>

                    <div class="row" style="margin-top:10px">
                        <div class="col-lg-5 col-xs-12">
                            <asp:Label ID="Label4" Width="150px" runat="server" Text="仕入先"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlSupplier"></asp:DropDownList>                     
                        </div>
                        <div class="col-lg-7 col-xs-12">
                           <asp:Label ID="Label5" Width="100px" runat="server" Text="ブランド"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlBrand"></asp:DropDownList>     
                        </div>
                    </div>
                    <div class="row" style="margin-top:10px">
                        <div class="col-lg-5 col-xs-12">
                            <asp:Label ID="Label6" Width="150px" runat="server" Text="対象商品"></asp:Label>
                            <asp:TextBox runat="server" ID="txtShippingUrl" Width="150px"></asp:TextBox>                    
                        </div>
                    </div>
                    <div class="row" style="margin-top:10px">
                        <div class="col-lg-5 col-xs-12">
                            <asp:Label ID="Label7" Width="150px" runat="server" Text="添付資料"></asp:Label>
                            <asp:RadioButton runat="server" ID="rdoAttach_Yes" GroupName="Attach" />有り
                            <asp:RadioButton runat="server" ID="rdoAttach_No" GroupName="Attach" /> 無し
                        </div>
                        <div class="col-lg-7 col-xs-12">
                           <asp:Label ID="Label8" Width="100px" runat="server" Text="MD単位"></asp:Label>
                            <asp:CheckBox runat="server" ID="chkProductNoUnit" /> 品番単位(全カラー対象)
                            <asp:CheckBox runat="server" ID="chkColorUnit"/> カラー単位
                        </div>
                    </div>
                    <div class="row" style="padding-top:20px">
                        <div class="col-lg-12 col-xs-12">
                                <p><b><u>価格変更内容</u></b></p>
                        </div>
                    </div>
                    <div class="row" style="padding-top:10px">
                        <div class="col-lg-12 col-xs-12">
                        <div class="square">
                        </div>
                        <b>&nbsp販売・仕入価格</b>
                            </div>
                    </div>
                    <div class="row" style="padding-top:10px">
                        <div class="col-lg-12 col-xs-12">                          
                            <asp:Label runat="server" ID="Label9" Text="販売価格" Height="30px" Width="150px" CssClass="label-black"></asp:Label>
                            <span style="padding-left:30px"></span>
                            <asp:Label ID="Label10" runat="server" Width="50px" Text="変更日"></asp:Label>
                            <asp:TextBox ID="txtSellingDate" runat="server" Width="100px" Height="30px"  contentEditable="false"  Enabled="true" ></asp:TextBox>
                            <cc1:CalendarExtender  ID="ce4" BehaviorID="_ce4" PopupButtonID="imgPopup4" TargetControlID="txtSellingDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
                            <asp:Label  runat="server" ID="imgPopup4" class="glyphicon glyphicon-calendar ajax-calendar"></asp:Label>
                            <asp:Label runat="server" ID="cd4" class="glyphicon glyphicon-remove ajax-calendar" onclick="return ClearSelectedDate4();"></asp:Label>
                            <span  style="padding-left:30px"></span>
                            <asp:Label ID="Label11" runat="server" Text="価格変更"></asp:Label>
                            <asp:TextBox runat="server" ID="txtSellingDiscount1" MaxLength="2" Width="30px" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                            <asp:Label ID="Label12" runat="server" Text="％OFFに販売価格の変更（通常："></asp:Label>
                            <asp:TextBox runat="server" ID="txtSellingDiscount2" MaxLength="2" Width="30px" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                            <asp:Label ID="Label19" runat="server" Text="％OFF)"></asp:Label>
                        </div>
                    </div>
                    <div class="row" style="padding-top:10px">
                        <div class="col-lg-12 col-xs-12">                          
                            <asp:Label runat="server" ID="Label13" Text="仕入価格" Height="30px" Width="150px" CssClass="label-black"></asp:Label>
                            <span style="padding-left:30px"></span>
                            <asp:Label ID="Label14" runat="server" Width="50px" Text="変更日"></asp:Label>
                            <asp:TextBox ID="txtPurchaseDate" runat="server" Width="100px" Height="30px"  contentEditable="false"  Enabled="true" ></asp:TextBox>
                            <cc1:CalendarExtender  ID="ce5" BehaviorID="_ce5" PopupButtonID="imgPopup5" TargetControlID="txtPurchaseDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
                            <asp:Label runat="server" ID="imgPopup5" class="glyphicon glyphicon-calendar ajax-calendar"></asp:Label>
                            <asp:Label runat="server" ID="cd5" class="glyphicon glyphicon-remove ajax-calendar" onclick="return ClearSelectedDate4();"></asp:Label>
                            <span style="padding-left:30px"></span>
                            <asp:Label ID="Label15" runat="server" Text="価格変更"></asp:Label>
                            <asp:TextBox runat="server" ID="txtPurchaseDiscount1" Width="30px" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                            <asp:Label ID="Label16" runat="server" Text="％仕入価格の変更（通常："></asp:Label>
                            <asp:TextBox runat="server" ID="txtPurchaseDiscount2" Width="30px" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                            <asp:Label ID="Label17" runat="server" Text="％)"></asp:Label>
                        </div>
                    </div>
                    <div class="row" style="padding-top:10px">
                        <div class="col-lg-12 col-xs-12">                          
                            <asp:Label runat="server" ID="Label18" Text="特別価格販売方法" Height="30px" Width="250px" CssClass="label-black"></asp:Label>
                            <span style="padding-left:30px"></span>
                            <asp:Label ID="Label20" runat="server" Text="特記" Width="50px"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlSalePriceType"></asp:DropDownList>
                            <span style="padding-left:30px"></span>
                            <asp:Label ID="Label24" runat="server" Text="在庫フラグ" Width="80px"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlInventoryType"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row" style="padding-top:10px">
                        <div class="col-lg-12 col-xs-12">
                        <div class="square">
                        </div>
                        <b>&nbspその他伝達事項</b>
                            </div>
                    </div>
                    <div class="row" style="padding-top:10px">
                        <div class="col-lg-12 col-xs-12">                          
                            <asp:Label runat="server" ID="Label21" Text="サイトバナー掲載" Height="30px" Width="250px" CssClass="label-black"></asp:Label>
                            <span style="padding-left:30px"></span>
                            <asp:Label ID="Label22" runat="server" Text="場所" Width="50px"></asp:Label>
                            <asp:CheckBox runat="server" ID="chkHot"/> HOT
                            <asp:CheckBox runat="server" ID="chkSaleBanner"  /> SALE（バナー）
                            <asp:CheckBox runat="server" ID="chkSaleText" /> SALE（テキスト）
                            <asp:CheckBox runat="server" ID="chkHeader" /> HEADER
                            <asp:CheckBox runat="server" ID="chkSide" /> SIDE
                        </div>
                    </div>
                    <div class="row" style="padding-top:10px">
                        <div class="col-lg-3 col-xs-12">                          
                            <asp:Label runat="server" ID="Label23" Text="備考" Height="170px" Width="250px" CssClass="label-blackRemark"></asp:Label>             
                        </div>
                        <div class="col-lg-9 col-xs-12">                          
                            <asp:TextBox runat="server" ID="txtRemark" Height="170px" Width="825px" TextMode="MultiLine"></asp:TextBox>
                        </div>                      
                    </div>
                    
                    <div class="table-responsive" style="height:96%; z-index:-10000">
                                              
                            <table class="table table-border1" style="z-index:-10000;">
                                <tr>
                                   
                                <%--    <td class="col-lg-3"  >
                                        <table class="table table-bordered" style="height:100%; width:100%">
                                            <tr>
                                                <td style="text-align:center; vertical-align:middle">
                                        <asp:Label ID="lbltest" runat="server" Text="終了後はNO.<br>順にファイル<br>に保管！"></asp:Label>
                                                 </td>
                                             </tr>
                                         </table>
                                    </td>--%>

                                     <td class="col-lg-4" style="height:100%">
                                        <table class="table table-bordered" style="height:100%; width:100%">
                                        <tr> 
                                            <td colspan="2" style="text-align:center; vertical-align:middle"> 
                                                終了後はNO.<br>順にファイル<br>に保管！"

                                                

                                            </td>

                                        </tr>
                                        

                                        </table>
                                    </td>
                                    
                                    <td style="width:1%">

                                    </td>

                                    <td class="col-lg-6">
                                        <table class="table table-bordered" style="height:100%; width:100%">
                                            <tr >
                                                <td colspan="5" style="text-align:center">制作チーム</td>

                                            </tr>
                                            <tr>
                                               
                                                <td   colspan="2" style="text-align:center">サイト反映</td>
                                                <td   colspan="3" style="text-align:center">商品管理価格訂正</td>
                                            </tr>
                                            <tr >
                                                <td style="text-align:center">商品UP </td>
                                                <td style="text-align:center">SKS取込</td>
                                                <td  style="text-align:center">チェック</td>
                                                <td  style="text-align:center">販売価格</td>
                                                <td style="text-align:center">仕入価格</td>
                                            </tr> 
                                             <tr >
                                                <td > <asp:TextBox ID="txtStage7" runat="server"   Enabled="False" TextMode  = "MultiLine" Width="105px"></asp:TextBox></td>
                                                <td  > <asp:TextBox ID="txtStage6" runat="server"   Enabled="False" TextMode  = "MultiLine" Width="105px"></asp:TextBox></td>
                                                <td  > <asp:TextBox ID="txtStage5" runat="server"   Enabled="False" TextMode  = "MultiLine" Width="105px"></asp:TextBox></td>
                                                <td  > <asp:TextBox ID="txtStage4" runat="server"   Enabled="False" TextMode  = "MultiLine" Width="105px"></asp:TextBox></td>
                                                <td > <asp:TextBox ID="txtStage3" runat="server"   Enabled="False" TextMode  = "MultiLine" Width="105px"></asp:TextBox></td>
                                            </tr>
                                            <tr >
                                                <td style="text-align:center">
                                                    <asp:DropDownList ID="ddlStage7" runat="server" Enabled="False" onchange = "StageChange('7');">
          <asp:ListItem Value= "0" Text=""></asp:ListItem>
           <asp:ListItem Value= "1" >Approved</asp:ListItem>
           <asp:ListItem Value= "2" >Reject</asp:ListItem>
        </asp:DropDownList>
                                                </td>
                                                <td style="text-align:center">

                                                     <asp:DropDownList ID="ddlStage6" runat="server" Enabled="False" onchange = "StageChange('6');">
           <asp:ListItem Value= "0" Text=""></asp:ListItem>
           <asp:ListItem Value= "1" >Approved</asp:ListItem>
           <asp:ListItem Value= "2" >Reject</asp:ListItem>
        </asp:DropDownList>                     </td>
                                                <td  style="text-align:center">

                                                   <asp:DropDownList ID="ddlStage5" runat="server" Enabled="False" onchange = "StageChange('5');">
            <asp:ListItem Value= "0" Text=""></asp:ListItem>
           <asp:ListItem Value= "1" >Approved</asp:ListItem>
           <asp:ListItem Value= "2" >Reject</asp:ListItem>
        </asp:DropDownList>
                                                </td>
                                                <td  style="text-align:center">

                                                    <asp:DropDownList ID="ddlStage4" runat="server" Enabled="False" onchange = "StageChange('4');">
          <asp:ListItem Value= "0" Text=""></asp:ListItem>
           <asp:ListItem Value= "1" >Approved</asp:ListItem>
           <asp:ListItem Value= "2" >Reject</asp:ListItem>
        </asp:DropDownList>

                                                </td>
                                                <td style="text-align:center">

                                                    <asp:DropDownList ID="ddlStage3" runat="server" Enabled="False" onchange = "StageChange('3');">
          <asp:ListItem Value= "0" Text=""></asp:ListItem>
           <asp:ListItem Value= "1" >Approved</asp:ListItem>
           <asp:ListItem Value= "2" >Reject</asp:ListItem>
        </asp:DropDownList>
                                                </td>
                                            </tr> 

                                        </table>
                                    </td>


                                    <td class="auto-style1" style="vertical-align:middle">
                                        <img src="../Images/33443.png" />
                                    </td>
                                    <td class="col-lg-4">
                                        <table class="table table-bordered" style="height:100%; width:100%">
                                        <tr> <td colspan="2" style="text-align:center;">仕入管理チーム</td></tr>
                                         <tr> <td colspan="2" style="text-align:center">申請</td></tr>
                                          <tr> 
                                              <td style="text-align:center">チェック</td>
                                              <td style="text-align:center">申請者</td>
                                          </tr>
                                          <tr>  
                                              <td style="text-align:center">
                                                  <asp:TextBox ID="txtStage2" runat="server" Enabled="False" TextMode  = "MultiLine"  width="105px" ></asp:TextBox>
                                              </td>
                                              <td style="text-align:center">
                                                   <asp:TextBox ID="txtStage1" runat="server" Enabled="False"  TextMode  = "MultiLine"  width="105px"></asp:TextBox>

                                              </td>

                                          </tr>
                                          <tr> 
                                               <td style="text-align:center">
                                                    <asp:DropDownList ID="ddlStage2" runat="server" Enabled="False" onchange = "StageChange('2');">
          <asp:ListItem Value= "0" Text=""></asp:ListItem>
           <asp:ListItem Value= "1" >Approved</asp:ListItem>
           <asp:ListItem Value= "2" >Reject</asp:ListItem>
         </asp:DropDownList>
                                               </td>
                                              <td style="text-align:center">
                                                   <asp:DropDownList ID="ddlStage1" runat="server" Enabled="False" onchange = "StageChange('1');">
               <asp:ListItem Value= "0" Text=""></asp:ListItem>
               <asp:ListItem Value= "1" >Approved</asp:ListItem>
              </asp:DropDownList>
                                              </td>

                                          </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        
                   
                    </div>
                        
                </div>
                <div class="panel-footer" align="center">
                     

                    <div class="row">
                        <div class="col col-xs-12">
                            <div class="text-center">
                                <asp:Button ID="btnSave" runat="server"  />
                                <%--<asp:button runat="server" id="btnSave"  class="btn btn-primary" validationgroup ="LoginFrame"  runat ="server" onserverclick="btnSave_Click"   >
                                    <span  class="glyphicon glyphicon-save"
                                          aria-hidden="true"></span>
                                    <asp:Label ID="lblSave" runat="server" Text="Save"></asp:Label>
                                 </asp:button>--%>
                               <%-- <asp:Button runat="server" CssClass="myButton" ID="btnSave" Text="登録"  Enabled ="true"
              OnClick ="btnSave_Click"   ></asp:Button>--%>
                                <%--  <asp:Button runat="server" CssClass="button" ID="btnSave" Text="登録"  Enabled="true"
            OnClick="btnSave_Click1" />--%>


                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
            
    </div>
            <asp:HiddenField ID="hfUserTypeID" runat="server" />
</div>
</asp:Content>
