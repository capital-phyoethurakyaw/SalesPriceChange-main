<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SalePriceMaster.Master" CodeBehind="Datepicker_Test.aspx.cs" Inherits="SalesPrice.Datepicker_Test" %>

<%@ Register Src="~/JQuery_DatePicker.ascx" TagPrefix="uc1" TagName="JQuery_DatePicker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>jQuery Datepicker</h1>
        <uc1:JQuery_DatePicker runat="server" id="JQuery_DatePicker" />
    </asp:Content>
    

