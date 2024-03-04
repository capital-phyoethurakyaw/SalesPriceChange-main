<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chat.aspx.cs" Inherits="SalesPrice.Chat" MasterPageFile="~/SalePriceMaster.Master" %>
<asp:Content runat="server" ID="ichat" ContentPlaceHolderID="head">

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1" ID="ichat_1">

     <%-- <asp:updatepanel ID="Updatepanel1" runat="server" ClientIDMode="Static" UpdateMode="Always" >
        <ContentTemplate>--%>
<div style="padding-top:30px;">
<asp:TextBox ID="txtmsg" runat="server"  ReadOnly="true" Width="490px" Height="400px " TextMode="MultiLine"></asp:TextBox>

</div>
            <%--</ContentTemplate>
    </asp:updatepanel>--%>
    <div>
<table>
<tr>
<td colspan='2'>
<%--<asp:Image ID="Image1" runat="server" ImageUrl="~/img/head.PNG" /></td>--%>
    <%--<img src="img/head.PNG" />--%>
</tr>
<tr>
<td style="width: 100px; text-align: right">
</td>
<td style="width: 94px; text-align: center">
<strong><span style="font-size: 20px; color: #0000cc">Conversation between Operators&nbsp;&nbsp;
</span></strong></td>
</tr>
<tr>
<td style="width: 100px; text-align: right">
<strong>Operators</strong>:</td>
<td style="width: 94px">
<asp:TextBox ID="txtname" runat="server"></asp:TextBox>
<asp:Button ID="brnadd" runat="server" OnClick="brnadd_Click" Text="ADD" Font-Bold="true" />
<asp:Label ID="lbluname" runat="server" Font-Bold="true" ForeColor="#004000"></asp:Label></td>
</tr>
<tr>
<td style="width: 100px; height: 260px">
</td>
<td style="width: 94px; height: 260px">

<%--<asp:iframe frameborder="no" height="15" scrolling="no" src="MSGG.aspx" width="515">
</asp:iframe>--%>
    <asp:Panel runat="server" ID="panel_frame" ScrollBars="None" Width="515"  Height="15"> </asp:Panel>
   
</td>
</tr>
<tr>
<td style="width: 100px; height: 77px;">
</td>
<td style="width: 94px; height: 77px;">
<table style="width: 480px">
<tr>
<td style="width: 100px; height: 50px;">
<asp:TextBox ID="txtsend" runat="server" Height="47px" TextMode="MultiLine"></asp:TextBox></td>
<td style="width: 100px; height: 50px;">
<asp:Button ID="Button1" runat="server" Height="47px" OnClick="Button1_Click" Text="SEND"
Width="72px" Font-Bold="true" /></td>
</tr>
</table>
</td>
</tr>
</table>

</div>

</asp:Content>