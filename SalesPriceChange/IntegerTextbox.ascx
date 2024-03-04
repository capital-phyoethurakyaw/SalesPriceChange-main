<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IntegerTextbox.ascx.cs" Inherits="SalesPrice.IntegerTextbox" %>
  <script>
      function allowOnlyNumber(evt) {
          var charCode = (evt.which) ? evt.which : event.keyCode
          if (charCode > 31 && (charCode < 48 || charCode > 57))
              return false;
          return true;
      }
    </script>
<div runat="server" id="txtint" >
<asp:UpdatePanel runat ="server" >
    <ContentTemplate >
        <asp:TextBox ID="txtcost" runat="server" AutoPostBack ="true" OnTextChanged ="txtcost_TextChanged" onkeypress ="return allowOnlyNumber(event)" Width="120px" Height="30px" style="border-radius :0px"></asp:TextBox>
    </ContentTemplate>
</asp:UpdatePanel>
</div>
