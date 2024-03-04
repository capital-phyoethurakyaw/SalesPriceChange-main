<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="StagesSetting.aspx.cs" Inherits="SalesPrice.SalesPrice.StagesSetting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .chch, .tb1
        {
            vertical-align:middle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <p style="padding-top:10px"></p>
        <div class="container">
        <div class="row">
        <div class="col-xl-12 col-md-offset-0">
            <div class="panel panel-info panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h1 class="panel-title">Stage Setting</h1>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col col-xs-6">
                            Stage: <asp:DropDownList runat="server" ID="ddlStage" AutoPostBack = "true" Width="320px" Height="30px" OnSelectedIndexChanged = "ddlStage_indexchanged"></asp:DropDownList>
                        </div>                
                        <div style="padding-right:10px" class="pull-right">
                            <asp:CheckBox ID="chk11" runat="server" />
                            <asp:Label runat="server" ID="lblApplyDate" Text="申請日" Height="30px" Width="80px" CssClass="label-black"></asp:Label>
                            <asp:TextBox ID="txtApplyDate" runat="server" Width="100px" Height="30px" CssClass="label-border" Enabled="false" ></asp:TextBox>
                            <span id="imgPopup1" class="glyphicon glyphicon-calendar ajax-calendar" contenteditable="false"></span>
                            <span id="cd1" class="glyphicon glyphicon-remove ajax-calendar"></span> 
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
                            <asp:CheckBox ID="chk1" runat="server" />
                            <asp:Label ID="Label33" Width="150px" runat="server" Text="販売価格変更申請"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlApplyType" Enabled="false"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row" style="margin-top:10px">
                        <div class="col-lg-5 col-xs-12">
                            <asp:CheckBox ID="chk2" runat="server" />
                            <asp:Label ID="Label2" Width="150px" runat="server" Text="開始期間"></asp:Label>
                            <asp:TextBox ID="txtStartDate" runat="server" Width="100px" Height="30px"  Enabled="false" ></asp:TextBox>
                            <span id="imgPopup2" class="glyphicon glyphicon-calendar ajax-calendar"></span>
                            <span id="cd2" class="glyphicon glyphicon-remove ajax-calendar"></span>
                        </div>
                        <div class="col-lg-7 col-xs-12">
                            <asp:Label ID="Label3" Width="100px" runat="server" Text="終了時期"></asp:Label>
                            <asp:TextBox ID="txtEndDate" runat="server" Width="100px" Height="30px"  Enabled="false" ></asp:TextBox>
                            <span id="imgPopup3" class="glyphicon glyphicon-calendar ajax-calendar"></span>
                            <span id="cd3" class="glyphicon glyphicon-remove ajax-calendar"></span>
                        </div>
                    </div>
                    <div class="row" style="margin-top:10px">
                        <div class="col-lg-5 col-xs-12">
                            <asp:CheckBox ID="chk3" runat="server" />
                            <asp:Label ID="Label4" Width="150px" runat="server" Text="仕入先"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlSupplier" Enabled="false"></asp:DropDownList>                     
                        </div>
                        <div class="col-lg-7 col-xs-12">
                           <asp:Label ID="Label5" Width="100px" runat="server" Text="ブランド"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlBrand" Enabled="false"></asp:DropDownList>     
                        </div>
                    </div>
                    <div class="row" style="margin-top:10px">
                        <div class="col-lg-5 col-xs-12">
                            <asp:CheckBox ID="chk4" runat="server" />
                            <asp:Label ID="Label6" Width="150px" runat="server" Text="対象商品"></asp:Label>
                            <asp:TextBox runat="server" ID="txtShippingUrl" Width="150px" Enabled="false"></asp:TextBox>                    
                        </div>
                    </div>
                    <div class="row" style="margin-top:10px">
                        <div class="col-lg-5 col-xs-12">
                            <asp:CheckBox ID="chk5" runat="server" />
                            <asp:Label ID="Label7" Width="150px" runat="server" Text="添付資料"></asp:Label>
                            <asp:RadioButton runat="server" ID="rdoAttach_Yes" GroupName="Attach" Enabled="false" />有り
                            <asp:RadioButton runat="server" ID="rdoAttach_No" GroupName="Attach" Enabled="false" /> 無し
                        </div>
                        <div class="col-lg-7 col-xs-12">
                           <asp:Label ID="Label8" Width="100px" runat="server" Text="MD単位"></asp:Label>
                            <asp:CheckBox runat="server" ID="chkProductNoUnit" Enabled="false" /> 品番単位(全カラー対象)
                            <asp:CheckBox runat="server" ID="chkColorUnit" Enabled="false"/> カラー単位
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
                            <asp:CheckBox ID="chk6" runat="server" />                         
                            <asp:Label runat="server" ID="Label9" Text="販売価格" Height="30px" Width="150px" CssClass="label-black"></asp:Label>
                            <span style="padding-left:30px"></span>
                            <asp:Label ID="Label10" runat="server" Width="50px" Text="変更日"></asp:Label>
                            <asp:TextBox ID="txtSellingDate" runat="server" Width="100px" Height="30px" Enabled="false" ></asp:TextBox>
                            <span id="imgPopup4" class="glyphicon glyphicon-calendar ajax-calendar"></span>
                            <span id="cd4" class="glyphicon glyphicon-remove ajax-calendar"></span>
                            <span style="padding-left:30px"></span>
                            <asp:Label ID="Label11" runat="server" Text="価格変更"></asp:Label>
                            <asp:TextBox runat="server" ID="txtSellingDiscount1" MaxLength="2" Width="30px" Enabled="false"></asp:TextBox>
                            <asp:Label ID="Label12" runat="server" Text="％OFFに販売価格の変更（通常："></asp:Label>
                            <asp:TextBox runat="server" ID="txtSellingDiscount2" MaxLength="2" Width="30px" Enabled="false"></asp:TextBox>
                            <asp:Label ID="Label19" runat="server" Text="％OFF)"></asp:Label>
                        </div>
                    </div>
                    <div class="row" style="padding-top:10px">
                        <div class="col-lg-12 col-xs-12">           
                            <asp:CheckBox ID="chk7" runat="server" />                    
                            <asp:Label runat="server" ID="Label13" Text="仕入価格" Height="30px" Width="150px" CssClass="label-black"></asp:Label>
                            <span style="padding-left:30px"></span>
                            <asp:Label ID="Label14" runat="server" Width="50px" Text="変更日"></asp:Label>
                            <asp:TextBox ID="txtPurchaseDate" runat="server" Width="100px" Height="30px" Enabled="false" ></asp:TextBox>
                            <span id="imgPopup5" class="glyphicon glyphicon-calendar ajax-calendar"></span>
                            <span id="cd5" class="glyphicon glyphicon-remove ajax-calendar"></span>
                            <span style="padding-left:30px"></span>
                            <asp:Label ID="Label15" runat="server" Text="価格変更"></asp:Label>
                            <asp:TextBox runat="server" ID="txtPurchaseDiscount1" Width="30px" Enabled="false"></asp:TextBox>
                            <asp:Label ID="Label16" runat="server" Text="％仕入価格の変更（通常："></asp:Label>
                            <asp:TextBox runat="server" ID="txtPurchaseDiscount2" Width="30px" Enabled="false"></asp:TextBox>
                            <asp:Label ID="Label17" runat="server" Text="％)"></asp:Label>
                        </div>
                    </div>
                    <div class="row" style="padding-top:10px">
                        <div class="col-lg-12 col-xs-12">         
                            <asp:CheckBox ID="chk8" runat="server" />                      
                            <asp:Label runat="server" ID="Label18" Text="特別価格販売方法" Height="30px" Width="250px" CssClass="label-black"></asp:Label>
                            <span style="padding-left:30px"></span>
                            <asp:Label ID="Label20" runat="server" Text="特記" Width="50px"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlSalePriceType" Enabled="false"></asp:DropDownList>
                            <span style="padding-left:30px"></span>
                            <asp:Label ID="Label24" runat="server" Text="在庫フラグ" Width="80px"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlInventoryType" Enabled="false"></asp:DropDownList>
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
                            <asp:CheckBox ID="chk9" runat="server" />                       
                            <asp:Label runat="server" ID="Label21" Text="サイトバナー掲載" Height="30px" Width="250px" CssClass="label-black"></asp:Label>
                            <span style="padding-left:30px"></span>
                            <asp:Label ID="Label22" runat="server" Text="場所" Width="50px"></asp:Label>
                            <asp:CheckBox runat="server" ID="chkHot" Enabled="false"/> HOT
                            <asp:CheckBox runat="server" ID="chkSaleBanner" Enabled="false"  /> SALE（バナー）
                            <asp:CheckBox runat="server" ID="chkSaleText" Enabled="false" /> SALE（テキスト）
                            <asp:CheckBox runat="server" ID="chkHeader" Enabled="false" /> HEADER
                            <asp:CheckBox runat="server" ID="chkSide" Enabled="false" /> SIDE
                        </div>
                    </div>
                    <div class="row" style="padding-top:10px">      
                                  
                        <div class="col-lg-12 col-xs-12" style="vertical-align:middle">         
                            <%--<asp:CheckBox ID="chk10" runat="server"  />   --%>     
                             <asp:CheckBox ID="chk10" runat="server" CssClass="chch"  />    
                            <asp:Label runat="server" ID="Label23" Text="備考" Height="170px" Width="250px" CssClass="label-blackRemark"></asp:Label>             
                       <%-- </div>
                        <div class="col-lg-9 col-xs-12"> --%>                         
                            <asp:TextBox runat="server" ID="txtRemark" Height="170px" Width="825px" TextMode="MultiLine" Enabled="false" CssClass="tb1"></asp:TextBox>
                        </div>                      
                    </div>                
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col col-xs-12">
                            <div class="text-center">
                                <button id="btnSave" type="button" class="btn btn-primary"  runat ="server" onserverclick="btnSave_Click"   >
                                    <span class="glyphicon glyphicon-save"
                                          aria-hidden="true"></span>
                                    <asp:Label ID="lblSave" runat="server" Text="Save"></asp:Label>
                                 </button>                                 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
