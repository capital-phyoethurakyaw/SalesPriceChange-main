<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DecryptPassword.aspx.cs" Inherits="SalesPriceChange.Users.DecryptPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
       <tr>
       <td>
        <asp:label ID ="lblpass" runat="server" text="Password:"></asp:label>
       </td>
      
       <td >
       <asp:textbox ID="txtPass" runat="server">
        </asp:textbox>
       </td>
      
       </tr>
       <tr ><td >
           <asp:label ID ="lbldekey" runat="server" text="DecryptKey:"></asp:label></td>
           <td >
               <asp:textbox ID="txtdekey" runat="server">
               </asp:textbox></td>
           </tr>
           <tr ><td > <asp:button ID="lbldecrypt" runat="server" text="Decrypt" 
                   onclick="btnDecrypt_Click"  /></td>
           <td >
               <asp:textbox ID ="txtresult" runat="server">
               </asp:textbox></td>
                 <td > <asp:label ID ="lblwaring" runat="server" text="Cannot convert decryption" visible = "false" forecolor = "red"></asp:label></td>
              </tr>
    </table>
    </div>
    </form>
</body>
</html>
