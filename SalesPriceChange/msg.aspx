<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="msg.aspx.cs" Inherits="SalesPrice.msg"  MasterPageFile="~/SalePriceMaster.Master"%>


<asp:Content ID="msg_head" runat="server" ContentPlaceHolderID="head">
   <%-- <meta http-equiv="refresh" content="2"/>--%>
</asp:Content>
<asp:Content ID="msg_bd" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:updatepanel runat="server" ClientIDMode="Static" UpdateMode="Always" >
        <ContentTemplate>
<div style="padding-top:30px;">
<asp:TextBox ID="txtmsg" runat="server" ReadOnly="true" Width="490px" Height="400px " TextMode="MultiLine"></asp:TextBox>

</div>
          </ContentTemplate>
    </asp:updatepanel>

</asp:Content>

