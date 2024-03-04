<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/SalePriceMaster.Master" CodeBehind="Stage_Setting.aspx.cs" Inherits="SalesPriceChange.SalesPrice.Stage_Setting" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/style.css" rel="stylesheet" type="text/css"  />
    <link href="../Styles/Form.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
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
       
    
  
    <style type="text/css">
        .cldLogo
        {
           background: #F0F0F0;
        }
        .table1, th, td
        {
        border: 1px solid black;
        }
        .style1
        {
            width: 62px;
            height: 60px;
        }
        .style2
        {
            width: 94px;
        }
        .table1
        {
            float:right;
        }
    </style>
  
</asp:Content >
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="main" style="clear:both;">
<asp:UpdatePanel ID="udmenu" UpdateMode="Conditional" runat="server">
<ContentTemplate>

    <div style="vertical-align:middle; margin-top:1.75%;">
        <div   style="top:100px "> 
         
      Stage- <asp:DropDownList runat="server" ID="ddlStage" AutoPostBack = "true" Width="320px" Height="30px" OnSelectedIndexChanged = "ddlStage_indexchanged"></asp:DropDownList> 
        <asp:Table ID="table2" CssClass="table1" runat="server">
            <asp:TableRow >
         
            <asp:TableCell Width  = "10px">
                <asp:CheckBox ID="chb11" runat="server" /></asp:TableCell>
               <asp:TableCell CssClass="back" Width="80px">申請日</asp:TableCell>
               <asp:TableCell> <asp:TextBox ID="txtApplyDate" Width="150px" Height="100%" runat="server"  CssClass="cldLogo" contentEditable="false"  Enabled="false" ></asp:TextBox>
              
        
                  <asp:ImageButton ID="imgPopup" ImageUrl="/Images/cldMini.PNG" ImageAlign="top" runat="server"  Enabled="false" /> 
                   <asp:ImageButton ID="cd1" ImageUrl="/Images/delCldar.PNG" ImageAlign="top" runat="server" OnClientClick = "return ClearSelectedDate();"  Enabled="false" /> 
                  
                   </asp:TableCell> 
                  
            </asp:TableRow>
              
        </asp:Table>
        </div>
           
    

        
       
        </div>
         <cc1:CalendarExtender  ID="CalendarExtender1"  BehaviorID="_Calendar1" PopupButtonID="imgPopup" TargetControlID="txtApplyDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
        
       
        <br />
        <br />

        <div style="clear:both;">
            <p class="warning">※販売に直接的な影響があるので、各担当は速やかに処理すること。漏れ、開始日遅れは厳禁</p>      
        </div>
        <div class="header1">
            <asp:Label ID="Label1" runat="server" Text="販売価格変更申請"></asp:Label>
        </div>
        <div style="margin-top:5px">
            <asp:Table runat="server" ID="table3" Width="100%">
                <asp:TableRow runat="server" ID="df">
               <asp:TableCell Width  = "10px" >
                   <asp:CheckBox ID="chb1" runat="server" /></asp:TableCell>
                    <asp:TableCell Width="160px" CssClass="tdleft">
                        <asp:Label ID="Label33" runat="server" Text="販売価格変更申請"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell CssClass="tdright" ColumnSpan="3">
                        <asp:DropDownList runat="server" ID="ddlApplyType" Enabled ="false"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
               <asp:TableCell Width  = "10px" >
                   <asp:CheckBox ID="chb2" runat="server" /></asp:TableCell>
                    <asp:TableCell CssClass="tdleft">
                        <asp:Label ID="Label44" runat="server" Text="開始期間"></asp:Label>
                    </asp:TableCell> 
                    <asp:TableCell CssClass="tdright">
                        <asp:TextBox runat="server" ID="txtStartDate" CssClass="cldLogo" Width="150px" Enabled ="false"></asp:TextBox>
                        <asp:TableCell >  <asp:ImageButton ID="startPopup" ImageUrl="/Images/cldMini.PNG" ImageAlign="top" runat="server" Enabled ="false" />  
                         <asp:ImageButton ID="cd2" ImageUrl="/Images/delCldar.PNG" ImageAlign="top" runat="server" OnClientClick = "return ClearSelectedDate2();"  Enabled="false"/> 
                        </asp:TableCell>


                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label2" runat="server" Text="終了時期"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtEndDate" CssClass="cldLogo" Width="150px" Enabled ="false"></asp:TextBox>
                         <asp:TableCell >  <asp:ImageButton ID="endPopup" ImageUrl="/Images/cldMini.PNG" ImageAlign="top" runat="server" Enabled ="false"/> 
                          <asp:ImageButton ID="cd3" ImageUrl="/Images/delCldar.PNG" ImageAlign="top" runat="server" OnClientClick = "return ClearSelectedDate3();"  Enabled="false"/> 
                          </asp:TableCell>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                <asp:TableCell Width  = "10px" >
                   <asp:CheckBox ID="chb3" runat="server" /></asp:TableCell>
                    <asp:TableCell CssClass="tdleft">
                        <asp:Label ID="Label3" runat="server" Text="仕入先"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell CssClass="tdright">
                        <asp:DropDownList runat="server" ID="ddlSupplier" Enabled ="false"></asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label4" runat="server" Text="ブランド"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" ID="ddlBrand" Enabled ="false"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                <asp:TableCell Width  = "10px" >
                   <asp:CheckBox ID="chb4" runat="server" /></asp:TableCell>
                    <asp:TableCell Width="160px" CssClass="tdleft">
                        <asp:Label ID="Label55" runat="server" Text="対象商品"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell CssClass="tdright" ColumnSpan="3">
                        <asp:TextBox runat="server" ID="txtShippingUrl" Width="150px" Enabled ="false"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                 <asp:TableCell Width  = "10px" >
                   <asp:CheckBox ID="chb5" runat="server" /></asp:TableCell>
                    <asp:TableCell Width="160px" CssClass="tdleft">
                        <asp:Label ID="Label6" runat="server" Text="添付資料"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell CssClass="tdright">
                        <asp:RadioButton runat="server" ID="rdoAttach_Yes" GroupName="Attach" Text="有り" Enabled ="false"/>
                        <asp:RadioButton runat="server" ID="rdoAttach_No" GroupName="Attach" Text="無し" Enabled ="false"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label7" runat="server" Text="MD単位"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:CheckBox runat="server" ID="chkProductNoUnit" Text="品番単位(全カラー対象)" Enabled ="false"/>
                        <asp:CheckBox runat="server" ID="chkColorUnit" Text="カラー単位" Enabled ="false"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

          
 <cc1:CalendarExtender PopupButtonID="startPopup" ID="CalendarExtender2" BehaviorID="_Calendar2" TargetControlID="txtStartDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
 <cc1:CalendarExtender PopupButtonID="endPopup" ID="CalendarExtender3"  BehaviorID="_Calendar3" TargetControlID="txtEndDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
 
 <cc1:CalendarExtender PopupButtonID="sellingPopup" ID="CalendarExtender4"  BehaviorID="_Calendar4" TargetControlID="txtSellingDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
 <cc1:CalendarExtender PopupButtonID="purchasePopup" ID="CalendarExtender5" BehaviorID="_Calendar5" TargetControlID="txtPurchaseDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
 


        </div>
        <div style="margin-top:-8px">
            <p><b><u>価格変更内容</u></b></p>
        </div>
        <div class="square">
        </div>
        <b>&nbsp販売・仕入価格</b>
        <div>
        <asp:Table ID="table4" runat="server" Width="100%">
            <asp:TableRow>
             <asp:TableCell Width  = "10px" >
                   <asp:CheckBox ID="chb6" runat="server" /></asp:TableCell>
                <asp:TableCell CssClass="back" Width="100px">販売価格</asp:TableCell>
                <asp:TableCell CssClass="tdleft" Width="100px">
                    <asp:Label ID="Label5" runat="server" Text="変更日"></asp:Label>
                </asp:TableCell>
                <asp:TableCell CssClass="tdright">
                    <asp:TextBox runat="server" CssClass="cldLogo" Width="150px" ID="txtSellingDate" Enabled ="false"></asp:TextBox>
                    
                 <asp:ImageButton ID="sellingPopup" ImageUrl="/Images/cldMini.PNG" ImageAlign="top" runat="server"  Enabled="false" /> 
                  <asp:ImageButton ID="cd4" ImageUrl="/Images/delCldar.PNG" ImageAlign="top" runat="server" OnClientClick = "return ClearSelectedDate4();" Enabled ="false" /> 
                  </asp:TableCell>
                <asp:TableCell CssClass="tdleft" Width="100px">
                    <asp:Label ID="Label8" runat="server" Text="価格変更"></asp:Label>
                </asp:TableCell>
                <asp:TableCell CssClass="tdright" Width="600px">
                    <div style="vertical-align:middle">
                    <asp:TextBox runat="server" ID="txtSellingDiscount1" Width="30px" onkeypress="return allowOnlyNumber(event);" Enabled ="false"></asp:TextBox>
                    <asp:Label ID="Label9" runat="server" Text="％OFFに販売価格の変更（通常："></asp:Label>
                    <asp:TextBox runat="server" ID="txtSellingDiscount2" Width="30px" onkeypress="return allowOnlyNumber(event);" Enabled = "false"  ></asp:TextBox>
                    <asp:Label ID="Label19" runat="server" Text="％OFF)"></asp:Label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>
        <div style="margin-top:5px">
            <asp:Table ID="table5" runat="server" Width="100%">
            <asp:TableRow>
             <asp:TableCell Width  = "10px" >
                   <asp:CheckBox ID="chb7" runat="server" /></asp:TableCell>
                <asp:TableCell CssClass="back" Width="100px">仕入価格</asp:TableCell>
                <asp:TableCell CssClass="tdleft" Width="100px">
                    <asp:Label ID="Label10" runat="server" Text="変更日"></asp:Label>
                </asp:TableCell>
                <asp:TableCell CssClass="tdright">
                    <asp:TextBox runat="server"  Width="150px" ID="txtPurchaseDate" CssClass="cldLogo" Enabled ="false"></asp:TextBox>
               <asp:ImageButton ID="purchasePopup" ImageUrl="/Images/cldMini.PNG" ImageAlign="top" runat="server"  Enabled="false"/>
                <asp:ImageButton ID="cd5" ImageUrl="/Images/delCldar.PNG" ImageAlign="top" runat="server" OnClientClick = "return ClearSelectedDate5();" Enabled ="false"/> 
               </asp:TableCell>  
                <asp:TableCell CssClass="tdleft" Width="100px">
                    <asp:Label ID="Label11" runat="server" Text="価格変更"></asp:Label>
                </asp:TableCell>
                <asp:TableCell CssClass="tdright" Width="600px">
                    <div style="vertical-align:middle">
                    <asp:TextBox runat="server" ID="txtPurchaseDiscount1" Width="30px" onkeypress="return allowOnlyNumber(event);" Enabled ="false"></asp:TextBox>
                    <asp:Label ID="Label12" runat="server" Text="％仕入価格の変更（通常："></asp:Label>
                    <asp:TextBox runat="server" ID="txtPurchaseDiscount2" Width="30px" onkeypress="return allowOnlyNumber(event);" Enabled ="false"></asp:TextBox>
                    <asp:Label ID="Label13" runat="server" Text="％)"></asp:Label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>
        <div style="margin-top:5px">
            <asp:Table ID="table6" runat="server" Width="100%">
            <asp:TableRow>
             <asp:TableCell Width  = "10px" >
                   <asp:CheckBox ID="chb8" runat="server" /></asp:TableCell>
                <asp:TableCell CssClass="back" Width="223px">特別価格販売方法</asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:Label ID="Label14" runat="server" Text="特記"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList runat="server" ID="ddlSalePriceType" Enabled ="false"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell Width="80px">
                    <asp:Label ID="Label15" runat="server" Text="在庫フラグ"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList runat="server" ID="ddlInventoryType" Enabled ="false"></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>
        <div style="margin-top:5px">
            <div class="square">
            </div>
            <b>&nbspその他伝達事項</b>
        </div>    
        <div style="margin-top:5px">
            <asp:Table ID="table7" runat="server" Width="100%">
            <asp:TableRow>
             <asp:TableCell Width  = "10px" >
                   <asp:CheckBox ID="chb9" runat="server" /></asp:TableCell>
                <asp:TableCell CssClass="back" Width="223px">サイトバナー掲載</asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:Label ID="Label16" runat="server" Text="場所"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CheckBox runat="server" ID="chkHot" Text="HOT" Enabled ="false"/>
                    <asp:CheckBox runat="server" ID="chkSaleBanner" Text="SALE（バナー）" Enabled ="false"/>
                    <asp:CheckBox runat="server" ID="chkSaleText" Text="SALE（テキスト）" Enabled ="false"/>
                    <asp:CheckBox runat="server" ID="chkHeader" Text="HEADER" Enabled ="false" />
                    <asp:CheckBox runat="server" ID="chkSide" Text="SIDE" Enabled ="false" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>
        <div style="margin-top:5px;">
            <asp:Table ID="table8" runat="server" Height="200px" Width="100%">
            <asp:TableRow>
             <asp:TableCell Width  = "10px" >
                   <asp:CheckBox ID="chb10" runat="server" /></asp:TableCell>
                <asp:TableCell CssClass="back" Width="223px">備考</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" ID="txtRemark" TextMode="MultiLine" Width="99%" Height="200px" Enabled ="false" ></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>


       
        
         <asp:HiddenField ID="hfUserTypeID" runat="server" />
         


 </ContentTemplate>
    </asp:UpdatePanel>
    <div align="center">
            <asp:Button runat="server" CssClass="button" ID="btnSave" OnClick ="btnSave_Click" Text="登録" 
              />
        </div>
        
    </div>
</asp:Content>

