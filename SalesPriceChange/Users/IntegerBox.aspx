<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IntegerBox.aspx.cs" Inherits="SalesPrice.Users.IntegerBox" %>

<%@ Register Src="~/IntegerTextbox.ascx" TagPrefix="uc1" TagName="IntegerTextbox" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:IntegerTextbox runat="server" ID="IntegerTextbox"/>
    </div>
    </form>
</body>
</html>
