 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supplementary_Control_Entry.aspx.cs" Inherits="SalesPrice.Supplementary_Control.Supplementary_Control_Entry" %>
<%@ Register Src="~/DatePicker.ascx" TagPrefix="uc1" TagName="DatePicker" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../Styles/bootstrap.min.css" rel="stylesheet" /> 
    <link type="text/css" href="../Styles/font-awesome.css" rel="stylesheet" />
    <link type="text/css" href="../Styles/Common.css" rel="stylesheet" /> 
    <link href="../Styles/bootstrap-datetimepicker.min.css" rel="stylesheet" />
</head>
<body>

    <form id="form1" runat="server">
          <div class="panel panel-primary">
    <div class="panel-heading">Panel Heading</div>
    <div class="panel-body" style="height:80%;overflow-y:scroll">
        <div class="row">
            <table class="tableEntry1">
                      <tr>
                        <td>
                            <asp:Label ID="lblID" CssClass="displaynone" runat="server"></asp:Label>
                            <asp:Label ID="lblApplyNo" runat="server" Text="申請番号"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtApplyNo" ></asp:TextBox>
                        </td>
                        </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblSuppliers" runat="server" Text="仕入先"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtSuppliers" ></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                    
                        <td>
                            <asp:Label ID="lblBrand" runat="server" Text="ブランド"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtBrand"></asp:TextBox>
                        </td>
                      </tr>
                       <tr>
                        <td>
                            <asp:Label ID="lblContent" runat="server" Text="補填内容"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtContent"></asp:TextBox>
                        </td>
                      </tr>
                      <tr>
                        <td>
                            <asp:Label ID="lblAmount" runat="server" Text="金額"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblCompensationType" runat="server" Text="補填種別"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtCompensationType"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblRemark" runat="server" Text="備考"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtRemark"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblProcessDate" runat="server" Text="処理日"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtProcessDate"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblIsFinished" runat="server" Text="完了"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtIsFinished"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblUpdatedDate" runat="server" Text="完了日"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtUpdatedDate"></asp:TextBox>
                        </td>
                    </tr>
                 
                </table>
        </div>
           
    </div>
    <div class="modal-footer" >
        <button id="btnSave"  type="button" class="btn btn-primary" data-dismiss="modal" runat ="server" >
        <span class="glyphicon glyphicon-save"
              aria-hidden="true"></span>
        <asp:Label ID="lblSave" runat="server" Text="Save"></asp:Label>
        </button>  
       <%-- <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>--%>
    </div>
  </div>
         </form>
</body>
</html>
