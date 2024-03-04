<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="SalesPrice.Supplementary_Control.Test" %>

<%@ Register Src="~/JQuery_DatePicker.ascx" TagPrefix="uc1" TagName="JQuery_DatePicker" %>
<%@ Register Src="~/DatePicker.ascx" TagPrefix="uc1" TagName="DatePicker" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link href="Styles/bootstrap.min.css" rel="stylesheet" />
<link href="Styles/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="Scripts/jquery-1.8.3.min.js"></script>     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>jQuery Datepicker</h1>
    <asp:TextBox runat="server"  ID="txtDate1"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate2"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate3"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate4"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate5"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate6"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate7"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate8"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate9"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate10"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate11"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate12"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate13"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate14"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate15"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate16"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate17"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate18"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate19"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate20"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate21"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate22"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate23"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate24"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate25"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate26"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate27"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate28"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate29"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate30"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate31"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate32"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate33"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate34"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate35"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate36"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate37"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate38"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate39"></asp:TextBox>
    <asp:TextBox runat="server"  ID="txtDate40"></asp:TextBox>

    <script type="text/javascript">
        $('#<%= txtDate1.ClientID %>').datetimepicker({});
        $('#<%= txtDate2.ClientID %>').datetimepicker({});
        $('#<%= txtDate3.ClientID %>').datetimepicker({});
        $('#<%= txtDate4.ClientID %>').datetimepicker({});
        $('#<%= txtDate5.ClientID %>').datetimepicker({});
        $('#<%= txtDate6.ClientID %>').datetimepicker({});
        $('#<%= txtDate7.ClientID %>').datetimepicker({});
        $('#<%= txtDate8.ClientID %>').datetimepicker({});
        $('#<%= txtDate9.ClientID %>').datetimepicker({});
        $('#<%= txtDate10.ClientID %>').datetimepicker({});
        $('#<%= txtDate11.ClientID %>').datetimepicker({});
        $('#<%= txtDate12.ClientID %>').datetimepicker({});
        $('#<%= txtDate13.ClientID %>').datetimepicker({});
        $('#<%= txtDate14.ClientID %>').datetimepicker({});
        $('#<%= txtDate15.ClientID %>').datetimepicker({});
        $('#<%= txtDate16.ClientID %>').datetimepicker({});
        $('#<%= txtDate17.ClientID %>').datetimepicker({});
        $('#<%= txtDate18.ClientID %>').datetimepicker({});
        $('#<%= txtDate19.ClientID %>').datetimepicker({});
        $('#<%= txtDate20.ClientID %>').datetimepicker({});
        $('#<%= txtDate21.ClientID %>').datetimepicker({});
        $('#<%= txtDate22.ClientID %>').datetimepicker({});
        $('#<%= txtDate23.ClientID %>').datetimepicker({});
        $('#<%= txtDate24.ClientID %>').datetimepicker({});
        $('#<%= txtDate25.ClientID %>').datetimepicker({});
        $('#<%= txtDate26.ClientID %>').datetimepicker({});
        $('#<%= txtDate27.ClientID %>').datetimepicker({});
        $('#<%= txtDate28.ClientID %>').datetimepicker({});
        $('#<%= txtDate29.ClientID %>').datetimepicker({});
        $('#<%= txtDate30.ClientID %>').datetimepicker({});
        $('#<%= txtDate31.ClientID %>').datetimepicker({});
        $('#<%= txtDate32.ClientID %>').datetimepicker({});
        $('#<%= txtDate33.ClientID %>').datetimepicker({});
        $('#<%= txtDate34.ClientID %>').datetimepicker({});
        $('#<%= txtDate35.ClientID %>').datetimepicker({});
        $('#<%= txtDate36.ClientID %>').datetimepicker({});
        $('#<%= txtDate37.ClientID %>').datetimepicker({});
        $('#<%= txtDate38.ClientID %>').datetimepicker({});
        $('#<%= txtDate39.ClientID %>').datetimepicker({});
        $('#<%= txtDate40.ClientID %>').datetimepicker({});
</script>
</asp:Content>
