<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/SalePriceMaster.Master" CodeBehind="SalesPrice_Change.aspx.cs" Inherits="SalesPriceChange.SalesPrice.WebForm1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/style.css" rel="stylesheet" type="text/css"  />
    <link href="../Styles/Form.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <link href="../Styles/notidrop.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function StageChange(index) {
            var hfUserTypeID = document.getElementById('<%= hfUserTypeID.ClientID %>');
            if (index == "1") {
                var val1 = document.getElementById('<%= ddlStage1.ClientID %>').value;
                if (val1 == "1")
                    hfUserTypeID.value = "2";
                else if (val1 == "0")
                    hfUserTypeID.value = "1";
            }

            else if (index == "2") {
                var val2 = document.getElementById('<%= ddlStage2.ClientID %>').value;
                if (val2 == "1")
                    hfUserTypeID.value = "3,4";
                else if (val2 == "2")
                    hfUserTypeID.value = "1";
            }
            
            else if (index == "3" || index == "4") {
                var val3 = document.getElementById('<%= ddlStage3.ClientID %>').value;
                var val4 = document.getElementById('<%= ddlStage4.ClientID %>').value;
                if (val3 == "1" && val4 == "1")
                    hfUserTypeID.value = "5";

                else if (val3 == "2" || val4 == "2")
                    hfUserTypeID.value = "2";

                else if (val3 == "1")
                    hfUserTypeID.value = "4";

                else if (val4 == "1")
                    hfUserTypeID.value = "3";
            }
            else if (index == "5") {
                var val5 = document.getElementById('<%= ddlStage5.ClientID %>').value;
                if (val5 == "1")
                    hfUserTypeID.value = "6,7";

                else if (val5 == "2")
                    hfUserTypeID.value = "3,4";
            }
            else if (index == "6" || index == "7") {
                var val6 = document.getElementById('<%= ddlStage6.ClientID %>').value;
                var val7 = document.getElementById('<%= ddlStage7.ClientID %>').value;
                if (val6 == "1" && val7 == "1")
                    hfUserTypeID.value = "8";

                else if (val6 == "2" || val7 == "2")
                    hfUserTypeID.value = "5";

                else if (val6 == "1")
                    hfUserTypeID.value = "7";

                else if (val7 == "1")
                    hfUserTypeID.value = "6";
            }
        }
               
        
    </script>



    <script type="text/javascript">
        function ClearSelectedDate() {
            $find("_Calendar1").set_selectedDate(null);
            $("[id*=CalendarExtender1]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
        }
    </script>
    <script type="text/javascript">
        function ClearSelectedDate2() {
            $find("_Calendar2").set_selectedDate(null);
            $("[id*=CalendarExtender2]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
        }
    </script>
    <script type="text/javascript">
                 function ClearSelectedDate3() {
                     $find("_Calendar3").set_selectedDate(null);
                     $("[id*=CalendarExtender3]").val("");
                     $(".ajax__calendar_active").removeClass("ajax__calendar_active");
                     return false;
                 }
    </script>
    <script type="text/javascript">
                 function ClearSelectedDate4() {
                     $find("_Calendar4").set_selectedDate(null);
                     $("[id*=CalendarExtender4]").val("");
                     $(".ajax__calendar_active").removeClass("ajax__calendar_active");
                     return false;
                 }
    </script>
     <script type="text/javascript">
         function ClearSelectedDate5() {
             $find("_Calendar5").set_selectedDate(null);
             $("[id*=CalendarExtender5]").val("");
             $(".ajax__calendar_active").removeClass("ajax__calendar_active");
             return false;
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
        .btmtables
        {
            height:120px;
        }
       
.tbr
{
    height:100px;
}
.dld
{
    vertical-align:middle;
}
        .tablea
        {
            border-radius:1px;
        }
    </style>

</asp:Content >
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <div style="top:650px; width:100%; margin-top:2%"></div>
    <div class="main" style="clear:both; top:400px; background-color:#F0F0F0">
        <div style="top: 100px">
        <div style="float:left;">
        <asp:Table ID="table1" CssClass="table1" runat="server">
            <asp:TableRow>
                <asp:TableCell CssClass="back" Width="80px">No.</asp:TableCell>
                <asp:TableCell CssClass="FormHead" Width="200px"><asp:Label ID="lblFormNo" runat="server" Text="2016-0147"></asp:Label></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>
        <div style="float:right ">
    

        <asp:Table ID="table2" CssClass="table1" runat="server">
            <asp:TableRow >
            
               <asp:TableCell CssClass="back" Width="80px">申請日</asp:TableCell>
               <asp:TableCell> <asp:TextBox ID="txtApplyDate" Width="150px" Height="100%" runat="server"  CssClass="cldLogo" contentEditable="false"  Enabled="false" ></asp:TextBox>
              
        
                  <asp:ImageButton ID="imgPopup" ImageUrl="/Images/cldMini.PNG" ImageAlign="top" runat="server"  Enabled="true" /> 
                   <asp:ImageButton ID="cd1" ImageUrl="/Images/delCldar.PNG" ImageAlign="top" runat="server" OnClientClick = "return ClearSelectedDate();"  Enabled="true" /> 
                  
                   </asp:TableCell> 
                  
            </asp:TableRow>
              
        </asp:Table>
                  

 <cc1:CalendarExtender  ID="CalendarExtender1"  BehaviorID="_Calendar1" PopupButtonID="imgPopup" TargetControlID="txtApplyDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
       
 <cc1:CalendarExtender PopupButtonID="startPopup" ID="CalendarExtender2" BehaviorID="_Calendar2" TargetControlID="txtStartDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
 <cc1:CalendarExtender PopupButtonID="endPopup" ID="CalendarExtender3"  BehaviorID="_Calendar3" TargetControlID="txtEndDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
 
        </div>      
        </div>    
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
                <asp:TableRow>
               
                    <asp:TableCell Width="160px" CssClass="tdleft">
                        <asp:Label ID="Label33" runat="server" Text="販売価格変更申請"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell CssClass="tdright" ColumnSpan="3">
                        <asp:DropDownList runat="server" ID="ddlApplyType"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
              
                    <asp:TableCell CssClass="tdleft">
                        <asp:Label ID="Label44" runat="server" Text="開始期間"></asp:Label>
                    </asp:TableCell> 
                    <asp:TableCell CssClass="tdright">
                        <asp:TextBox runat="server" ID="txtStartDate" CssClass="cldLogo" Width="150px"  Enabled="false"></asp:TextBox>
                        <asp:TableCell >  <asp:ImageButton ID="startPopup" ImageUrl="/Images/cldMini.PNG" ImageAlign="top" runat="server"  Enabled="true"/>  
                         <asp:ImageButton ID="cd2" ImageUrl="/Images/delCldar.PNG" ImageAlign="top" runat="server" OnClientClick = "return ClearSelectedDate2();"  Enabled="true" /> 
                        </asp:TableCell>


                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label2" runat="server" Text="終了時期"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtEndDate" CssClass="cldLogo" Width="150px"  Enabled="false"></asp:TextBox>
                         <asp:TableCell >  <asp:ImageButton ID="endPopup" ImageUrl="/Images/cldMini.PNG" ImageAlign="top" runat="server"  Enabled="true" /> 
                          <asp:ImageButton ID="cd3" ImageUrl="/Images/delCldar.PNG" ImageAlign="top" runat="server" OnClientClick = "return ClearSelectedDate3();"  Enabled="true" /> 
                          </asp:TableCell>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
               
                    <asp:TableCell CssClass="tdleft">
                        <asp:Label ID="Label3" runat="server" Text="仕入先"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell CssClass="tdright">
                        <asp:DropDownList runat="server" ID="ddlSupplier"></asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label4" runat="server" Text="ブランド"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" ID="ddlBrand"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
               
                    <asp:TableCell Width="160px" CssClass="tdleft">
                        <asp:Label ID="Label55" runat="server" Text="対象商品"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell CssClass="tdright" ColumnSpan="3">
                        <asp:TextBox runat="server" ID="txtShippingUrl" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                
                    <asp:TableCell Width="160px" CssClass="tdleft">
                        <asp:Label ID="Label6" runat="server" Text="添付資料"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell CssClass="tdright">
                        <asp:RadioButton runat="server" ID="rdoAttach_Yes" GroupName="Attach" Text="有り" />
                        <asp:RadioButton runat="server" ID="rdoAttach_No" GroupName="Attach" Text="無し" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label7" runat="server" Text="MD単位"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:CheckBox runat="server" ID="chkProductNoUnit" Text="品番単位(全カラー対象)" />
                        <asp:CheckBox runat="server" ID="chkColorUnit" Text="カラー単位" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

    
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
                <asp:TableCell CssClass="back" Width="100px">販売価格</asp:TableCell>
                <asp:TableCell CssClass="tdleft" Width="100px">
                    <asp:Label ID="Label5" runat="server" Text="変更日"></asp:Label>
                </asp:TableCell>
                <asp:TableCell CssClass="tdright">
                    <asp:TextBox runat="server" CssClass="cldLogo" Width="150px" ID="txtSellingDate"  Enabled="false"></asp:TextBox>
                    
                 <asp:ImageButton ID="sellingPopup" ImageUrl="/Images/cldMini.PNG" ImageAlign="top" runat="server"  Enabled="true" /> 
                  <asp:ImageButton ID="cd4" ImageUrl="/Images/delCldar.PNG" ImageAlign="top" runat="server" OnClientClick = "return ClearSelectedDate4();"   Enabled="true"/> 
                  </asp:TableCell>
                <asp:TableCell CssClass="tdleft" Width="100px">
                    <asp:Label ID="Label8" runat="server" Text="価格変更"></asp:Label>
                </asp:TableCell>
                <asp:TableCell CssClass="tdright" Width="600px">
                    <div style="vertical-align:middle">
                    <asp:TextBox runat="server" ID="txtSellingDiscount1" Width="30px" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                    <asp:Label ID="Label9" runat="server" Text="％OFFに販売価格の変更（通常："></asp:Label>
                    <asp:TextBox runat="server" ID="txtSellingDiscount2" Width="30px" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                    <asp:Label ID="Label19" runat="server" Text="％OFF)"></asp:Label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>
        <div style="margin-top:5px">
            <asp:Table ID="table5" runat="server" Width="100%">
            <asp:TableRow>
                <asp:TableCell CssClass="back" Width="100px">仕入価格</asp:TableCell>
                <asp:TableCell CssClass="tdleft" Width="100px">
                    <asp:Label ID="Label10" runat="server" Text="変更日"></asp:Label>
                </asp:TableCell>
                <asp:TableCell CssClass="tdright">
                    <asp:TextBox runat="server"  Width="150px" ID="txtPurchaseDate" CssClass="cldLogo"  Enabled="false"></asp:TextBox>
               <asp:ImageButton ID="purchasePopup" ImageUrl="/Images/cldMini.PNG" ImageAlign="top" runat="server"  Enabled="true" />
                <asp:ImageButton ID="cd5" ImageUrl="/Images/delCldar.PNG" ImageAlign="top" runat="server" OnClientClick = "return ClearSelectedDate5();"  Enabled="true" /> 
               </asp:TableCell>  
                <asp:TableCell CssClass="tdleft" Width="100px">
                    <asp:Label ID="Label11" runat="server" Text="価格変更"></asp:Label>
                </asp:TableCell>
                <asp:TableCell CssClass="tdright" Width="600px">
                    <div style="vertical-align:middle">
                    <asp:TextBox runat="server" ID="txtPurchaseDiscount1" Width="30px" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                    <asp:Label ID="Label12" runat="server" Text="％仕入価格の変更（通常："></asp:Label>
                    <asp:TextBox runat="server" ID="txtPurchaseDiscount2" Width="30px" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                    <asp:Label ID="Label13" runat="server" Text="％)"></asp:Label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>
        <div style="margin-top:5px">
            <asp:Table ID="table6" runat="server" Width="100%">
            <asp:TableRow>
                <asp:TableCell CssClass="back" Width="223px">特別価格販売方法</asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:Label ID="Label14" runat="server" Text="特記"></asp:Label>
                </asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:DropDownList runat="server" ID="ddlSalePriceType"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell Width="80px">
                    <asp:Label ID="Label15" runat="server" Text="在庫フラグ"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList runat="server" ID="ddlInventoryType"></asp:DropDownList>
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
                <asp:TableCell CssClass="back" Width="223px">サイトバナー掲載</asp:TableCell>
                <asp:TableCell Width="100px">
                    <asp:Label ID="Label16" runat="server" Text="場所"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CheckBox runat="server" ID="chkHot" Text="HOT" />
                    <asp:CheckBox runat="server" ID="chkSaleBanner" Text="SALE（バナー）" />
                    <asp:CheckBox runat="server" ID="chkSaleText" Text="SALE（テキスト）" />
                    <asp:CheckBox runat="server" ID="chkHeader" Text="HEADER" />
                    <asp:CheckBox runat="server" ID="chkSide" Text="SIDE" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>
        <div style="margin-top:5px;">
            <asp:Table runat="server" Height="200px" Width="100%">
            <asp:TableRow>
                <asp:TableCell CssClass="back" Width="223px">備考</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" ID="txtRemark" TextMode="MultiLine" Width="99%" Height="200px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>

      <%--  /*start Bottom tables--%>
        <div style="margin-top:5px; width:100%;">
        <asp:Table ID="table10" CssClass="dld" >

        <asp:TableRow CssClass="tbr" >
        <td style="border:1px solid white; float:left;">
        <Table style="height:150px;float:left">
        <tr>
        <td>
        <asp:Label ID="lbltest" runat="server" Text="終了後はNO.<br>順にファイル<br>に保管！"></asp:Label>
        </td>
        </tr>
        </Table>
        </td>

        <%--<td style="width:35px;border-top:1px solid white;border-bottom:1px solid white; border-right:1px solid white; float:left"> </td>--%>
       


       <%-- here start middle bottom table--%>
        <td style="border:1px solid white; float:left;">
        <table style="text-align: center; border:1px solid white; position:relative; margin:0 auto; float:left; left:1%;">
        <tr >
        
        <td colspan="5"> 
         <asp:Label ID="Label23" runat="server" Text="制作チーム"></asp:Label>
        </td>
        </tr>

        <tr>
        <td colspan="2">
        <asp:Label ID="Label24" runat="server" Text="サイト反映"></asp:Label>
        </td>
        <td colspan="3">
        <asp:Label ID="Label25" runat="server" Text="商品管理価格訂正"></asp:Label>
        </td>
        </tr>

        <tr>
        <td>
         <asp:Label ID="Label17" runat="server" Text="商品UP"></asp:Label>
        
        </td>

       
        <td>
         <asp:Label ID="Label18" runat="server" Text="SKS取込"></asp:Label>
        </td>
        <td>
         <asp:Label ID="Label20" runat="server" Text="チェック"></asp:Label>
        </td>
        <td>
         <asp:Label ID="Label21" runat="server" Text="販売価格"></asp:Label>
        </td>
        <td class="style2">
         <asp:Label ID="Label22" runat="server" Text="仕入価格"></asp:Label>
     
        </td>
        </tr>

        <tr>
         <td>
        <asp:TextBox ID="txtStage7" runat="server"   Enabled="False" TextMode  = "MultiLine" Width="150px"></asp:TextBox>
        </td>
        <td>
        <asp:TextBox ID="txtStage6" runat="server" Enabled="False" TextMode  = "MultiLine" Width="150px"></asp:TextBox>
        </td>
        <td>
        <asp:TextBox ID="txtStage5" runat="server" Enabled="false" TextMode  = "MultiLine" Width="150px"></asp:TextBox>
        </td>
        <td>
        <asp:TextBox ID="txtStage4" runat="server" Enabled="False" TextMode  = "MultiLine" Width="150px" ></asp:TextBox>
        </td>
        <td class="style2">
        <asp:TextBox ID="txtStage3" runat="server" Enabled="False" TextMode  = "MultiLine" Width="150px"></asp:TextBox> 
              
        </td>
        </tr>

        <tr>
        <td>
         <asp:DropDownList ID="ddlStage7" runat="server" Enabled="False" onchange = "StageChange('7');">
          <asp:ListItem Value= "0" Text=""></asp:ListItem>
           <asp:ListItem Value= "1" >Approved</asp:ListItem>
           <asp:ListItem Value= "2" >Reject</asp:ListItem>
        </asp:DropDownList>
        </td>
        <td>
         <asp:DropDownList ID="ddlStage6" runat="server" Enabled="False" onchange = "StageChange('6');">
           <asp:ListItem Value= "0" Text=""></asp:ListItem>
           <asp:ListItem Value= "1" >Approved</asp:ListItem>
           <asp:ListItem Value= "2" >Reject</asp:ListItem>
        </asp:DropDownList>
        </td>
         <td>
         <asp:DropDownList ID="ddlStage5" runat="server" Enabled="False" onchange = "StageChange('5');">
            <asp:ListItem Value= "0" Text=""></asp:ListItem>
           <asp:ListItem Value= "1" >Approved</asp:ListItem>
           <asp:ListItem Value= "2" >Reject</asp:ListItem>
        </asp:DropDownList>
        </td>
         <td>
         <asp:DropDownList ID="ddlStage4" runat="server" Enabled="False" onchange = "StageChange('4');">
          <asp:ListItem Value= "0" Text=""></asp:ListItem>
           <asp:ListItem Value= "1" >Approved</asp:ListItem>
           <asp:ListItem Value= "2" >Reject</asp:ListItem>
        </asp:DropDownList>
        </td>
         <td class="style2">
         <asp:DropDownList ID="ddlStage3" runat="server" Enabled="False" onchange = "StageChange('3');">
          <asp:ListItem Value= "0" Text=""></asp:ListItem>
           <asp:ListItem Value= "1" >Approved</asp:ListItem>
           <asp:ListItem Value= "2" >Reject</asp:ListItem>
        </asp:DropDownList>
        </td>
        </tr>
        
        </table>
        </td>
       <%-- here stop Left Directed Arrow--%>
        <td style="width:80px;border-top:1px solid white;border-bottom:1px solid white; border-right:1px solid white;"">
        
            <img alt="" class="style1" src="../Images/downloadgg.png" style="float:left; height:50%; padding-top:5%; padding-left:1%; padding-right:1%"/>
        </td>

        <%-- here right bottom table--%>
        <td style="border:1px solid white; ">
         <table style="text-align: center;float:right">
        <tr>
        
        <td colspan="2"> 
         <asp:Label ID="Label26" runat="server" Text="仕入管理チーム"></asp:Label>
        </td>

        </tr>

        <tr>
        <td colspan="2">
        <asp:Label ID="Label27" runat="server" Text="申請"></asp:Label>
        </td>
       
        
        </tr>

        <tr>
        <td>
         <asp:Label ID="Label29" runat="server" Text="チェック"></asp:Label>
        </td>

        <td>
         <asp:Label ID="Label30" runat="server" Text="申請者"></asp:Label>
        </td>
       
        </tr>

        <tr>
        <td>
        <asp:TextBox ID="txtStage2" runat="server" Enabled="False" TextMode  = "MultiLine"  width="140px" ></asp:TextBox>
        </td>

        <td>
        <asp:TextBox ID="txtStage1" runat="server" Enabled="False"  TextMode  = "MultiLine"  width="140px"></asp:TextBox>
        </td>
       
        </tr>
        <tr>
        <td>
         <asp:DropDownList ID="ddlStage2" runat="server" Enabled="False" onchange = "StageChange('2');">
          <asp:ListItem Value= "0" Text=""></asp:ListItem>
           <asp:ListItem Value= "1" >Approved</asp:ListItem>
           <asp:ListItem Value= "2" >Reject</asp:ListItem>
         </asp:DropDownList>
        </td>

        <td>
              <asp:DropDownList ID="ddlStage1" runat="server" Enabled="False" onchange = "StageChange('1');">
               <asp:ListItem Value= "0" Text=""></asp:ListItem>
               <asp:ListItem Value= "1" >Approved</asp:ListItem>
              </asp:DropDownList>
        </td>
       
        </tr>

        
        </table>
        </td>
        </asp:TableRow>

        </asp:Table>
       
        </div>

        <div align="center" style="clear:both;">
            <asp:Button runat="server" CssClass="button" ID="btnSave" Text="登録"  Enabled ="false" 
              OnClick ="btnSave_Click"   />
        </div>
        
         <asp:HiddenField ID="hfUserTypeID" runat="server" />
    </div>

</asp:Content>
