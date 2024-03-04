<%@ Page Title="" Language="C#"  MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="SalesPrice_List.aspx.cs" Inherits="SalesPriceChange.SalesPrice.SalesPrice_List" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/Noti.css" />
    <link href="~/Styles/style.css" rel="stylesheet" type="text/css"  />
    <link href="../Styles/button.css" rel="stylesheet" />
    <link href="../Styles/edit.css" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        setInterval(ajaxCall, 500); // 5000 MS == 5 seconds
    });
    function ajaxCall() {
        $.ajax({
            type: "POST",
            url: "SalesPrice_List.aspx/GetRequestCount",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                if (typeof result.d === 'undefined' || result.d == null) {
                    $('#<%=Master.FindControl("lblNoti").ClientID %>').text('');
                }
                else {
                    var value = result.d.split('$');
                    // Put result of call into label
                    $('#<%=Master.FindControl("lblNoti").ClientID %>').text(value[0]);
                    $('#<%=Master.FindControl("lblGridID").ClientID %>').text(value[1]);
                }
            }
        });
    }
</script>

<script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <link href="../Styles/notidrop.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" >
        $(document).ready(function () {
            $("#notificationLink").click(function () {
                $("#notificationContainer").fadeToggle(300);
//                $("#notification_count").fadeOut("slow");
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
<style type="text/css">
.pager1
{
 background-color: #4BA5F9;
	font-family: Arial;
	color: yellow; 
    padding-left:5px;  
}
.rows
{
    
    background-color: white;
	font-family: Arial;
	
	color: #000;
}
.rows:hover 
{
	background-color: #6A91B5;
	font-family: Arial;
	color: #fff;
}
.color1
{
   color:black; 
}
.header1
{
    background-color: #4BA5F9;
	font-family: Arial;
	color: White;
    height:40px;
    text-align:center;
}
.gvplist
{
    box-shadow:0px 0px 10px gray;
   text-align:center;
    
}
    .round
    {
    border:0px solid black;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  overflow: hidden;
    box-shadow:0px 0px 10px gray;
    }

    .alt_rows
    {
    background-color:pink;
    }
    .alt_rows:hover 
{
	background-color: #6A91B5;
	font-family: Arial;
	color: #fff;
}
    .cldLogo
    {
    border:2px solid #456879;
	border-radius:10px;
	height: 22px;
	width: 230px;
    animation-fill-mode:backwards;
    }
  
     .gradienttext1 
    {
        
border:2px solid #456879;
	border-radius:10px;
	height: 22px;
	width: 230px;
    animation-fill-mode:backwards;

    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel-group">
        <div class="panel-primary">
            <div class="panel-heading">Panel Heading</div>
            <div class="panel-body">Panel Content</div>
        </div>
    </div>
    <br /><br /><br />
<div style="box-shadow:0px 0px 5px gray; margin-left:25% !important; margin-right:25% !important; padding-left:5%;padding-right:5%;padding-bottom:5%; margin-bottom:5%; margin-top:-55px;">
<br />
<h3 style="text-align:center"><b>PRICE LIST </b></h3>
    <div class="round">
<asp:GridView ID="gvSalePriceList"  runat="server" AutoGenerateColumns="False" 
        CssClass="gvplist" AllowSorting="True" Width="560px" 
     AllowPaging="True" PagerStyle-CssClass="pager1" AlternatingRowStyle-CssClass="alt_rows"
        HeaderStyle-CssClass="header1"   RowStyle-CssClass="rows" 
        onpageindexchanging="gvSalePriceList_PageIndexChanging" PagerSettings-Mode="NumericFirstLast"   FirstPageText="First" LastPageText="Last">
 <Columns>
  <asp:TemplateField Visible="false">
                <HeaderTemplate >ID</HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" ID="ID" Text='<%# Bind("ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
         <asp:TemplateField ItemStyle-HorizontalAlign="Center">
              <HeaderStyle HorizontalAlign="Center" />
                <HeaderTemplate  >FormNo</HeaderTemplate>
            
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblFormNo" Text='<%# Bind("FormNo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>ApplyDate</HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblApplyDate" Text='<%# Bind("ApplyDate","{0:yyyy/MM/dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>Created By</HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblUserID" Text='<%# Bind("UserID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate></HeaderTemplate>
                <ItemTemplate>
                  <asp:Button ID ="btnEdit1" runat="server" Text="Edit" OnClick="btnEdit1_Click"  CssClass="editButton"></asp:Button>
                </ItemTemplate>
            </asp:TemplateField>
              

        </Columns>
</asp:GridView>
        </div> <br />
    
      <div style="background-color:#E8F1F8;  box-shadow:0px 0px 5px gray; 
 border:0px solid black;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  overflow: hidden;
    box-shadow:0px 0px 10px gray;">  
       <br /> 
        
  &nbsp; &nbsp;PageSize:
<asp:DropDownList ID="ddlPageSize" runat="server" Width="55px" AutoPostBack="true" OnSelectedIndexChanged="PageSize_Changed" CssClass="gradienttext1">
    <asp:ListItem Text="10" Value="10" />
    <asp:ListItem Text="30" Value="30" />
    <asp:ListItem Text="50" Value="50" />
    <asp:ListItem Text="100" Value="100"/>
</asp:DropDownList>

          
 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; 
FormNo:<asp:TextBox ID="txtFormID" runat="server" CssClass="gradienttext1" Width="250px"
    ></asp:TextBox>
          <br /><br />

          &nbsp; &nbsp; Total_Count:<asp:Label runat="server" id="lblrowCount"/> 
           &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 
ApplyDate: <cc1:ToolKitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolKitScriptManager><asp:TextBox ID="txtApplyDate11" Width="180px" Height="22px" runat="server"  CssClass="cldLogo" contentEditable="false"  Enabled="true" ></asp:TextBox>
              <asp:ImageButton ID="imgPopup" ImageUrl="/Images/cldMini.PNG" ImageAlign="top" runat="server"  Enabled="true" /> 
              <asp:ImageButton ID="cd1" ImageUrl="/Images/delCldar.PNG" ImageAlign="top" runat="server" OnClientClick = "return ClearSelectedDate();"  Enabled="true" /> 
              <cc1:CalendarExtender  ID="CalendarExtender11"  BehaviorID="_Calendar11" PopupButtonID="imgPopup" TargetControlID="txtApplyDate11"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
    <br /><br />&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; 
          &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; 
          &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; 
          &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                  
                  
               
          <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick ="btnSearch_Click" CssClass="editButton" />
          <br /><br />
          </div>
       
</div>



    <script type="text/javascript">
        function ClearSelectedDate() {
            $find("_Calendar11").set_selectedDate(null);
            $("[id*=CalendarExtender11]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
        }
    </script>
</asp:Content>
