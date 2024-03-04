<%@ Page Title="" Language="C#"  MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="User_List.aspx.cs" Inherits="SalesPriceChange.Users.UserList" EnableEventValidation ="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/style.css" rel="stylesheet" type="text/css"  />
<script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <link href="../Styles/notidrop.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script src="http://localhost:62647/Scripts/bootstrap.min.js"></script>
    <link href="http://localhost:62647/Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/button.css" rel="stylesheet" />
    <link href="../Styles/edit.css" rel="stylesheet" />

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

<script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <link href="../Styles/notidrop.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(document).ready(function () {
        setInterval(ajaxCall, 500); // 5000 MS == 5 seconds
    });

    function ajaxCall() {
        $.ajax({
            type: "POST",
            url: "UserList.aspx/GetRequestCount",
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
<style type="text/css">


.gvplist
{
    box-shadow:0px 0px 10px gray;
    text-align:initial;
    width:300px;
}
.rows
{
    
    background-color: white;
	font-family: Arial;
	
	color: #000;
}
.rows:hover
{

}
.header
{
      background-color: #4BA5F9;
	font-family: Arial;
	color: White;
    height:40px;
}
.pager
{
 background-color: #4BA5F9;
	font-family: Arial;
	color: yellow;   
}
 .round1
    {
    border:0px solid black;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  overflow: hidden;
    box-shadow:0px 0px 10px gray;
    }
  .alt_rows1
    {
    
    }
    .gvuser
    {
         width:300px;
    }
    .gradient
    {
        
border:2px solid #456879;
	border-radius:10px;
	height: 22px;
	width: 230px;
    animation-fill-mode:backwards;

    }
    .editUserList
    {

    }
</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  style="width:800px; box-shadow:0px 0px 5px gray; text-align:left; padding-left:5%;padding-right:5%;padding-bottom:5%; margin-left:25% !important; margin-right:25% !important;margin-top:5%;margin-bottom:5%;  margin-top:5px;">
  <br />
  <h3 style="text-align:center"><b>USER LIST </b></h3>
        <div class="round1">
    <asp:GridView runat="server" ID="gvUserList1" AutoGenerateColumns="false" OnRowDataBound="gvUserList_RowDataBound" CssClass="gvplist" AllowPaging="true" AllowSorting="true"
       HeaderStyle-CssClass="header" PagerStyle-CssClass="pager" AlternatingRowStyle-CssClass="alt_rows1"
          RowStyle-CssClass="rows" Height="196px" Width="100%"  onpageindexchanging="gvUserList_PageIndexChanging" PagerSettings-Mode="NumericFirstLast"   FirstPageText="First" LastPageText="Last" PageSize="3">
        
  <Columns>
  <asp:TemplateField Visible="false">
 <HeaderTemplate>ID</HeaderTemplate >
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblID" Text='<%# Bind("ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
       
 <asp:TemplateField  ItemStyle-HorizontalAlign="Center">
 <HeaderTemplate>UserID</HeaderTemplate >
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblUserID" Text='<%# Bind("UserID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        
               <asp:TemplateField >
 <HeaderTemplate>Description</HeaderTemplate >
              <ItemTemplate>
             <asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="false" ShowHeader="false" GridLines="None" >
<Columns>
  <asp:TemplateField  >
 <HeaderTemplate >Description</HeaderTemplate >
 <ItemTemplate>
  <asp:Label runat="server" ID="lblDescription" Text='<%# Bind("Description") %>'></asp:Label>
 </ItemTemplate>
   </asp:TemplateField>
</Columns>
</asp:GridView>
            </ItemTemplate>
             </asp:TemplateField>
           <asp:TemplateField ItemStyle-HorizontalAlign="Center">
            <HeaderTemplate ></HeaderTemplate >
            <ItemTemplate>
            <asp:Button  ID = "btnEdit" runat="server" Text="Edit" onClick = "btnEdit_Click" CssClass="editButton" ></asp:Button>
            </ItemTemplate>
           </asp:TemplateField>


           <asp:TemplateField>
            <HeaderTemplate ></HeaderTemplate >
            <ItemTemplate>
            <asp:Button  ID = "btnDelete" runat="server" Text="Delete" onClick = "btnDelete_Click"  CssClass="editButton"></asp:Button>
            </ItemTemplate>
           </asp:TemplateField>
       </Columns>
</asp:GridView>
            </div>
        <br />
      <div style="background-color:#E8F1F8;  box-shadow:0px 0px 5px gray; 
 border:0px solid black;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  overflow: hidden;
    box-shadow:0px 0px 10px gray;">  
       <br />   
 &nbsp; &nbsp;PageSize:<asp:DropDownList ID="ddlPageSize1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="PageSize_Changed" Width="45px" CssClass="gradient">
    <asp:ListItem Text="3" Value="3" />
    <asp:ListItem Text="5" Value="5" />
    <asp:ListItem Text="10" Value="10" />
</asp:DropDownList>
          &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
           &nbsp;
UserID:<asp:TextBox ID="txtUserID" runat="server" Width="250px" Height="25px" CssClass="gradient" ></asp:TextBox>
          
          
          
          <br />
          <br />
&nbsp; &nbsp;Total_Count:<asp:Label runat="server" id="lblrowCount1"/> 
           &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
Stage:
        <asp:DropDownList ID="ddlStage" runat="server" Width="250px" Height="25px" CssClass="gradient" AppendDataBoundItems ="true"  >
        </asp:DropDownList>
         
          <br /> <br />  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; 
           &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; 
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick ="btnSearch_Click" CssClass="editButton" />
          <br /> <br />
        </div>


</div>
</asp:Content>
