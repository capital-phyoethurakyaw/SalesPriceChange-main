<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="SalesPrice_Entry.aspx.cs" Inherits="SalesPrice.SalesPrice.SalesPrice_Entry" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="head">
<script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <link href="../Styles/notidrop.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" >
        $(document).ready(function () {
            $("#notificationLink").click(function () {
                $("#notificationContainer").fadeToggle(300);
                $("#notification_count").fadeOut("slow");
                return false;
            });

            //Document Click
            $(document).click(function () {
                $("#notificationContainer").hide();
            });
            //Popup Click
            $("#notificationContainer").click(function () {
                return false
            });

        });
</script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
        <div style="margin-left:auto;margin-right:auto;width:900px;">
        <div style="float:left;width:700px">
        <b><asp:Label ID="lblno" runat="server" Text="NO."></asp:Label>        </b>
        <asp:Label ID="lblnumber" runat="server" Text="2016-98958"> </asp:Label>
         </div>     
         <div>
       <b> <asp:Label ID="Label3" runat="server" Text="申請日"></asp:Label></b>
             <asp:Textbox   ID="ApplyDate" runat="server"> </asp:Textbox> 
        </div>       
        <asp:Label ID="Label1" runat="server" Text="※販売に直接的な影響があるので、各担当は速やかに処理すること。漏れ、開始日遅れは厳禁" style="text-align:center"></asp:Label>
    </div>

    <div style="margin-left:auto;padding-top:5px;margin-right:auto;width:900px;;height:20px;text-align:center;background-color:#81B03F;margin-top:8px;">
        <asp:Label ID="Label14" runat="server" Text="販売価格変更申請"></asp:Label>
    </div>

    <div style="margin-left:auto;margin-right:auto;margin-top:5px;width:900px;background-color:#81B03F">
    <div style="margin-left:30px;margin-top:3px;">
        <asp:Label ID="Label2" runat="server" Text="販売価格変更申請" style="margin-top:3px;"></asp:Label>        
        <asp:DropDownList ID="dllApplyType" runat="server" style="margin-left:20px;width:100px;margin-top:3px;">
        </asp:DropDownList>
        <br />
    </div>
    <div style="margin-left:30px;margin-top:3px;">

        <asp:Label ID="Label4" runat="server" Text="開始期間"></asp:Label>
        <asp:TextBox ID="txtPeriod_From" runat="server" style="margin-left:83px"></asp:TextBox> 
         <img  id="ImageButton1"   src="Styles/clear.png"   onclick='cleartxtfrom()'   alt="img1" style="width:14px;;height:14px; margin-left:-3px;border:0.1px; background-color:#f9f9f9; border-radius:1px;cursor:pointer;" />
         <asp:Label ID="Label5" runat="server" Text="終了時期"></asp:Label>
         <asp:TextBox ID="txtPeriod_To" runat="server"></asp:TextBox>
        <br />
 
        <div style="margin-top:3px;">
        <asp:Label ID="Label6" runat="server" Text="仕入先"></asp:Label>
        <asp:DropDownList ID="ddlsupplier" runat="server" style="margin-left:98px;width:100px">
        </asp:DropDownList>

        <asp:Label ID="Label7" runat="server" Text="ブランド"></asp:Label>
        <asp:DropDownList ID="ddlbrand" runat="server" Width="100px">
        </asp:DropDownList>
        </div>
      
      <div style="margin-top:3px;">
        <asp:Label ID="Label8" runat="server" Text="対象商品"></asp:Label>
        <asp:TextBox ID="txtshippingurl" runat="server" style="margin-left:82px"></asp:TextBox>
      </div>
            
      <div style="margin-top:3px">
        <asp:Label ID="Label9" runat="server" Text="添付資料"></asp:Label>
        <asp:RadioButton ID="rdomale" runat="server" GroupName="radlist" style="margin-left:73px"/>有り
        <asp:RadioButton ID="rdofemale"  runat="server" GroupName="radlist"/>無し &nbsp&nbsp&nbsp&nbsp&nbsp

        <asp:Label ID="Label10" runat="server" Text="MD単位"></asp:Label>
        <asp:CheckBox ID="chkColor" runat="server" Text="品番単位(全カラー対象)"/>
        <asp:CheckBox ID="chkProduct" runat="server" Text="品番単位(全カラー対象)"/>
    </div>
     </div>
</div>

    <div style="margin-left:auto;margin-right:auto;width:900px;background-color:transparent;margin-top:10px;margin-bottom:-8px;"> 
    <b><asp:Label ID="Label12" runat="server" Text="価格変更内容" style="text-decoration:underline"></asp:Label></b>
    </div>

    <div style="margin-left:auto;margin-right:auto;width:900px;background-color:transparent;margin-bottom:-8px;">
    <ul style="list-style-type:square">    
    <li>
        <asp:Label ID="Label13" runat="server" Text="販売・仕入価格"></asp:Label>
    </li></ul>
    <div style="margin-left:auto;margin-right:auto;width:900px;background-color:#81B03F">
        <div style="width:900px;margin-left:auto;margin-right:auto;background-color:#81B03F;margin-top:-13px;">   
        <asp:Label ID="Label15" runat="server" Text="販売価格" style="margin-left:30px;margin-top:3px"></asp:Label> |
        <asp:Label ID="Label16" runat="server" Text="変更日"></asp:Label>
            <asp:TextBox ID="sellingDate" runat="server" style="margin-top:3px"></asp:TextBox>&nbsp&nbsp&nbsp&nbsp
            <asp:Label ID="Label17" runat="server" Text="価格変更"></asp:Label>
            <asp:TextBox ID="sellingDiscount1" runat="server" Width="30px" style="margin-left:5px;"></asp:TextBox>
            <asp:Label ID="Label18" runat="server" Text="％OFFに販売価格の変更（通常："></asp:Label>
            <asp:TextBox ID="sellingDiscount2" runat="server" Width="30px"></asp:TextBox>
            <asp:Label ID="Label19" runat="server" Text="％OFF)"></asp:Label>
    </div>

    <div style="width:900px;margin-left:auto;margin-right:auto;background-color:#81B03F;margin-top:3px">   
        <asp:Label ID="Label20" runat="server" Text="仕入価格" style="margin-left:30px"></asp:Label> |
        <asp:Label ID="Label21" runat="server" Text="変更日"></asp:Label>
            <asp:TextBox ID="purchaseDate" runat="server"></asp:TextBox>&nbsp&nbsp&nbsp&nbsp
            <asp:Label ID="Label22" runat="server" Text="価格変更"></asp:Label>
            <asp:TextBox ID="purchaseDis1" runat="server" Width="30px" style="margin-left:5px;"></asp:TextBox>
            <asp:Label ID="Label23" runat="server" Text="％仕入価格の変更（通常："></asp:Label>
            <asp:TextBox ID="purchaseDis2" runat="server" Width="30px"></asp:TextBox>
            <asp:Label ID="Label24" runat="server" Text="％）"></asp:Label>
    </div>  

    <div style="width:900px;margin-left:auto;margin-right:auto;background-color:#81B03F;margin-top:3px;margin-bottom:3px">
        <asp:Label ID="Label25" runat="server" Text="特別価格販売方法" style="margin-left:30px"></asp:Label>
        <asp:Label ID="Label26" runat="server" Text="特記" style="margin-left:10px;margin-bottom:3px"></asp:Label>
        <asp:DropDownList ID="ddlsalevaluemethod1" runat="server" Width="100px">
        </asp:DropDownList>
        <asp:Label ID="Label27" runat="server" Text="在庫フラグ"  style="margin-left:10px;margin-bottom:3px"></asp:Label>
        <asp:DropDownList ID="ddlsalevaluemethod2" runat="server" Width="100px" style="margin-bottom:3px">
        </asp:DropDownList>
    </div>
        </div>
          </div>

    <div style="width:900px;margin-left:auto;margin-right:auto;margin-top:3px">
    <ul style="list-style-type:square">    
    <li>
        <asp:Label ID="Label28" runat="server" Text="その他伝達事項"></asp:Label>
    </li></ul>
    <div style="margin-top:-13px;background-color:#81B03F">
        <asp:Label ID="Label29" runat="server" Text="サイトバナー掲載" style="margin-left:30px"></asp:Label>
        <asp:Label ID="Label30" runat="server" Text="場所" style="margin-left:20px"></asp:Label>&nbsp&nbsp&nbsp&nbsp
        <asp:CheckBox ID="chkHOT" runat="server" />HOT 
        <asp:CheckBox ID="chkSaleBanner" runat="server" /> SALE（バナー）
        <asp:CheckBox ID="chkSaleText" runat="server" />SALE（テキスト）
        <asp:CheckBox ID="chkHeader" runat="server" /> HEADER 
        <asp:CheckBox ID="chkSide" runat="server" />SIDE
    </div>
    </div>
<%--//75A026--%>
    <div style="width:900px;margin-left:auto;margin-right:auto;margin-top:3px">
        <asp:Label ID="Label31" runat="server" Text="備考" Width="100px" height="100px" style="background-color:#81B03F;float:left;text-align:center;padding-top:60px;"></asp:Label>
      <asp:TextBox ID="txtRemark" runat="server" Width="792px" height="150px" style="border-color:Teal" TextMode="MultiLine"></asp:TextBox>
    </div>
    <div style="width:900px;margin-left:auto;margin-right:auto;margin-top:9px;">
    <div style="width:100px;;height:120px;border:2px solid #75A026;float:left;margin-right:30px;">
        <b><asp:Label ID="Label32" runat="server" Text="終了後はNO.順にファイルに保管！" Width="100px" height="100px" style="padding-top:35px;text-align:center"></asp:Label></b>
     </div>

     <div style="float:left">
 <table style="border:1px solid #75A026;">
    <tr style="border:1px solid #75A026;"><td align="center" colspan="5" style="border:1px solid #75A026">制作チーム</td>
    </tr>
    <tr style="border:1px solid #75A026"><td align="center" colspan="2" style="border:1px solid #75A026">サイト反映</td>
            <td align="center" colspan="3" style="border:1px solid #75A026">商品管理価格訂正</td>
     </tr>
    <tr style="border:1px solid #75A026"><td style="border:1px solid #75A026">商品UP</td>
            <td style="border:1px solid #75A026" align="justify">SKS取込</td>
            <td style="border:1px solid #75A026">チェック</td>
            <td style="border:1px solid #75A026">販売価格</td>
            <td style="border:1px solid #75A026">仕入価格</td>
    
    </tr>
    <tr style="border:1px solid #75A026"><td style="border:1px solid #75A026">
        <asp:TextBox ID="TextBox9" runat="server" Width="80px"></asp:TextBox></td>
            <td style="border:1px solid #75A026" ;height="45">
                <asp:TextBox ID="TextBox10" runat="server" Width="80px"></asp:TextBox></td>
            <td style="border:1px solid #75A026" ;height="45">
                <asp:TextBox ID="TextBox11" runat="server" Width="80px"></asp:TextBox></td>
            <td style="border:1px solid #75A026" ;height="45">
                <asp:TextBox ID="TextBox12" runat="server" Width="80px"></asp:TextBox></td>
            <td style="border:1px solid #75A026" ;height="45">
                <asp:TextBox ID="TextBox13" runat="server" Width="80px"></asp:TextBox></td>    
    </tr>
    </table>
    </div>
    <div style="float:left">       
      <asp:Image id="Image1" runat="server"
           AlternateText="Image text"
           ImageAlign="left"
           ImageUrl="images/arrow2.jpg" Width="100" height="70" style="padding-top:30px"/>
    </div>
    <div>
    <table>
    <tr>
    <td colspan="2" align="center">仕入管理チーム</td>
    </tr>
    <tr>
    <td colspan="2" align="center">申請</td>
    </tr>
    <tr>
    <td align="center">チェック</td>
    <td align="center">申請者</td>
    </tr>
    <tr>
    <td ;height="40"><asp:TextBox ID="TextBox14" runat="server" Width="80px" 
            style="margin-bottom: 6px"></asp:TextBox></td>
    <td ;height="40"><asp:TextBox ID="TextBox15" runat="server" Width="80px"></asp:TextBox></td>
    </tr>
    </table>
    </div>
    </div>
    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btndesign" 
            onclick="Save_Click"/>
</asp:Content>
