<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MDManagement_Entry.aspx.cs" Inherits="SalesPrice.MDManagement.MDManagement_Entry" %>
<%@ Register Src="~/DatePicker.ascx" TagPrefix="uc1" TagName="DatePicker" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                            <asp:Label ID="lblFormNo" runat="server" Text="申請番号"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtFormNo" Enabled="false"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblStartDate" runat="server" Text="開始日"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtStartDate" Enabled="false"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblSupplier" runat="server" Text="仕入先"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtSupplier" Enabled="false"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblBrand" runat="server" Text="ブランド"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtBrand" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="MD金額(税抜)"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtMDTaxExclude"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="MD金額(税込)"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtMDTaxInclude"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="処理内容"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlProcess">
                                <asp:ListItem Text="-----選択-----" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="値引伝票" Value="0"></asp:ListItem>
                                <asp:ListItem Text="現物補填" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="経験処理"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtExpProcess"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="残額(税抜)"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtBalTaxInclude"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="➀納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dpDelviery1" />
                        </td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="➀仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dpPurchase1" />
                        </td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="➀金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDel2" runat="server" Text="➁納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dpDelivery2" />
                        </td>
                        <td>
                            <asp:Label ID="lblPur2" runat="server" Text="➁仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dpPurchase2" />
                        </td>
                        <td>
                            <asp:Label ID="lblAmt2" runat="server" Text="➁金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount2"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="➂納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dpDelivery3" />
                        </td>
                        <td>
                            <asp:Label ID="Label13" runat="server" Text="➂仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dpPurchase3" />
                        </td>
                        <td>
                            <asp:Label ID="Label14" runat="server" Text="➂金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount3"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="➃納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery4" />
                        </td>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="➃仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase4" />
                        </td>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="➃金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount4"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label15" runat="server" Text="➄納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery5" />
                        </td>
                        <td>
                            <asp:Label ID="Label16" runat="server" Text="➄仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase5" />
                        </td>
                        <td>
                            <asp:Label ID="Label17" runat="server" Text="➄金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount5"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label18" runat="server" Text="➅納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery6" />
                        </td>
                        <td>
                            <asp:Label ID="Label19" runat="server" Text="➅仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase6" />
                        </td>
                        <td>
                            <asp:Label ID="Label20" runat="server" Text="➅金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount6"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label21" runat="server" Text="➆納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery7" />
                        </td>
                        <td>
                            <asp:Label ID="Label22" runat="server" Text="➆仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase7" />
                        </td>
                        <td>
                            <asp:Label ID="Label23" runat="server" Text="➆金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount7"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label24" runat="server" Text="➇納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery8" />
                        </td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Text="➇仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase8" />
                        </td>
                        <td>
                            <asp:Label ID="Label26" runat="server" Text="➇金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount8"></asp:TextBox>
                        </td>
                    </tr>
                      <tr>
                        <td>
                            <asp:Label ID="Label27" runat="server" Text="➈納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery9" />
                        </td>
                        <td>
                            <asp:Label ID="Label28" runat="server" Text="➈仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase9" />
                        </td>
                        <td>
                            <asp:Label ID="Label29" runat="server" Text="➈金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount9"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label30" runat="server" Text="➉納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery10" />
                        </td>
                        <td>
                            <asp:Label ID="Label31" runat="server" Text="➉仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase10" />
                        </td>
                        <td>
                            <asp:Label ID="Label32" runat="server" Text="➉金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount10"></asp:TextBox>
                        </td>
                    </tr>
                      <tr>
                        <td>
                            <asp:Label ID="Label33" runat="server" Text="⑪納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery11" />
                        </td>
                        <td>
                            <asp:Label ID="Label34" runat="server" Text="⑪仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase11" />
                        </td>
                        <td>
                            <asp:Label ID="Label35" runat="server" Text="⑪金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount11"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label36" runat="server" Text="⑫納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery12" />
                        </td>
                        <td>
                            <asp:Label ID="Label37" runat="server" Text="⑫仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase12" />
                        </td>
                        <td>
                            <asp:Label ID="Label38" runat="server" Text="⑫金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount12"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label39" runat="server" Text="⑬納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery13" />
                        </td>
                        <td>
                            <asp:Label ID="Label40" runat="server" Text="⑬仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase13" />
                        </td>
                        <td>
                            <asp:Label ID="Label41" runat="server" Text="⑬金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount13"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label42" runat="server" Text="⑭納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery14" />
                        </td>
                        <td>
                            <asp:Label ID="Label43" runat="server" Text="⑭仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase14" />
                        </td>
                        <td>
                            <asp:Label ID="Label44" runat="server" Text="⑭金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount14"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label45" runat="server" Text="⑮納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery15" />
                        </td>
                        <td>
                            <asp:Label ID="Label46" runat="server" Text="⑮仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase15" />
                        </td>
                        <td>
                            <asp:Label ID="Label47" runat="server" Text="⑮金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount15"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label48" runat="server" Text="⑯納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery16" />
                        </td>
                        <td>
                            <asp:Label ID="Label49" runat="server" Text="⑯仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase16" />
                        </td>
                        <td>
                            <asp:Label ID="Label50" runat="server" Text="⑯金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount16"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label51" runat="server" Text="⑰納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery17" />
                        </td>
                        <td>
                            <asp:Label ID="Label52" runat="server" Text="⑰仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase17" />
                        </td>
                        <td>
                            <asp:Label ID="Label53" runat="server" Text="⑰金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount17"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label54" runat="server" Text="⑱納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery18" />
                        </td>
                        <td>
                            <asp:Label ID="Label55" runat="server" Text="⑱仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase18" />
                        </td>
                        <td>
                            <asp:Label ID="Label56" runat="server" Text="⑱金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount18"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label57" runat="server" Text="⑲納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery19" />
                        </td>
                        <td>
                            <asp:Label ID="Label58" runat="server" Text="⑲仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase19" />
                        </td>
                        <td>
                            <asp:Label ID="Label59" runat="server" Text="⑲金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount19"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="Label60" runat="server" Text="⑳納品書日付"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtDelivery20" />
                        </td>
                        <td>
                            <asp:Label ID="Label61" runat="server" Text="⑳仕入処理日"></asp:Label>
                        </td>
                        <td>
                            <uc1:DatePicker runat="server" ID="dtPurchase20" />
                        </td>
                        <td>
                            <asp:Label ID="Label62" runat="server" Text="⑳金額（税抜）"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAmount20"></asp:TextBox>
                        </td>
                    </tr>
                </table>
        </div>
            <div class="row">
                <asp:GridView runat="server" ID="gv1" ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>Test</HeaderTemplate>
                            <ItemTemplate>
                                <uc1:DatePicker runat="server" ID="DatePicker" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
    </div>
    <div class="modal-footer">
        <button id="btnSave" type="button" class="btn btn-primary" data-dismiss="modal" runat ="server" >
        <span class="glyphicon glyphicon-save"
              aria-hidden="true"></span>
        <asp:Label ID="lblSave" runat="server" Text="登録"></asp:Label>
        </button>  
        <button type="button" class="btn btn-primary" data-dismiss="modal">閉じる</button>
    </div>
  </div>
    <div class="CustomContainer">
           
    </div>
        <script type="text/javascript">
            $('.form_date').datetimepicker({
                weekStart: 1,
                clearBtn: 1,
                autoclose: 1,
                startView: 2,
                minView: 2,
                forceParse: 0
            });
</script>
<script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/jquery-3.2.0.min.js") %>"></script> 
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/bootstrap.min.js") %>"></script> 
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/bootstrap-hover-dropdown.js") %>"></script> 
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/bootstrap-datetimepicker.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/bootstrap-datetimepicker.fr.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/Scripts/jquery-1.8.3.min.js") %>"></script>
    </form>
</body>
</html>
