<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="Users_Entry.aspx.cs" Inherits="SalesPriceChange.Users.Users_Entry"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--    <link href="../Styles/style.css" rel="stylesheet" type="text/css"  />
    <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <link href="../Styles/notidrop.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <link href="../Styles/notidrop.css" rel="stylesheet" type="text/css" />--%>
    <link href="../Styles/button.css" rel="stylesheet" />
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:Left; margin-left:25% !important;margin-top:5%; margin-right:25% !important; box-shadow:0px 0px 5px gray; text-align:justify; padding: 10px;">
       <h3 style="text-align:center"><b>Manage User Accounts </b></h3>
        <table><tr><td>
        <asp:Label runat="server" ID="lblUserID" Text="UserID" CssClass="txtLabel"></asp:Label></td>
        <td><asp:TextBox runat="server" ID="txtUserID" CssClass="txtInput"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" id="reqUserID" controltovalidate="txtUserID" errormessage="*" ForeColor="Red" ValidationGroup = "LoginFrame" /></td></tr>
        <asp:label ID= "lblinfo" runat="server" text="UserID is already exist" Visible = "false" Forecolor = "red" ></asp:label>
        <tr><td>
        <asp:Label runat="server" ID="lblPassword" Text="Password" CssClass="txtLabel"></asp:Label></td>
        <td><asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="txtInput" ></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" id="reqPassword" controltovalidate="txtPassword" errormessage="*" ForeColor="Red" ValidationGroup = "LoginFrame" /></td></tr>
       <%-- <tr><td>
            <asp:Label ID="lbluserlevel" runat="server" Text="UserLevel"></asp:Label>
        </td>
        <td>
            <asp:RadioButton ID="rdbAdmin" runat="server" Text ="Admin" GroupName ="UserLevel"   />
            <asp:RadioButton ID="rdbUser" runat="server" Text ="User" GroupName ="UserLevel" Checked= "true" />
            </td>
        </tr>--%>
        </table>
        <asp:Label runat="server" ID="lblUserType" Text="Stage-" CssClass="txtLabel" style="margin-left:4px;"></asp:Label>
        <asp:CheckBoxList runat="server" ID="cblUserType"></asp:CheckBoxList>
      <div style="width:100%; text-align:center"> 
   
<asp:button id="btnSave" CssClass="myButton"  runat="server" text="Save" OnClick ="btnOk_click"  />
<%--<cc1:modalpopupextender id="ModalPopupExtender1" runat="server" 
    CancelControlID ="btnCancel"
	targetcontrolid="btnSave" popupcontrolid="Panel1" 
	popupdraghandlecontrolid="PopupHeader"
	backgroundcssclass="modalBackground">
</cc1:modalpopupextender>

<asp:panel id="Panel1" style="display: none" runat="server" >
	<div class="modalPopup">
                <div class="PopupHeader" id="PopupHeader">
                    Information</div>
                    <hr style="border-bottom: 2px dashed gray; "/>
                <div class="PopupBody">
                    <p>
                        <asp:Label ID="lblpop1" runat="server" Text="Do you want to save?"></asp:Label></p>
                </div>
                <div class="Controls">
                    &nbsp; &nbsp;<asp:Button ID="btnOkay" runat="server" Text="OK" OnClick ="btnOk_click" CssClass="left" ValidationGroup = "LoginFrame"/>  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; 
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="right" /> &nbsp; &nbsp;--%>
		</div>
        </div>
</asp:Content>
