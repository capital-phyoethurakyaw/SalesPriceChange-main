<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="SalePriceList.aspx.cs" Inherits="SalesPrice.SalesPrice.WebForm2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/wucCalendar.ascx" TagPrefix="uc1" TagName="wucCalendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script type="text/javascript" src="../Scripts/jquery-3.2.0.min.js"></script> 
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script> 
    <link href="../Styles/Common.css" rel="stylesheet" />
    <script type="text/javascript">
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
</script>
       <script type = "text/javascript">
           function Confirm() {
               if (confirm("Are you sure you want to delete?")) {
                   return true;
               } else {
                   return false;
               }
           }
          </script>
    <script>
        function allowOnlyNumber(evt) { 
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <p style="padding-top:10px"></p>
    <div class="container">
        <div class="row">
        <div class="col-md-12 col-md-offset-0">
            <div class="panel panel-info panel-table" >
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h1 class="panel-title"><b style="font-weight:bold;  text-shadow: 2px 2px White; font-size:20px;">SalePrice List</b></h1>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="form-group col-xs-12" style="vertical-align:middle">
                            FormID:
                            <asp:TextBox ID="txtFormID" Width="130px" runat="server"  ></asp:TextBox>
                            &nbsp;&nbsp;
                            ApplyDate: 
                            <uc1:wucCalendar runat="server" ID="wucCalendar"/>
                            &nbsp;&nbsp;
                            <button id="Button1" type="button" class="btn btn-primary" runat="server" onserverclick="btnSearch_Click">
                                <span class="glyphicon glyphicon-search"  aria-hidden="true"  style="vertical-align:middle"></span>
                                    Search
                            </button>
                             <div class="pull-right">
                                  <button id="Button2" type="button" class="btn btn-primary"  runat ="server" onserverclick ="btnaddform_Click" style=" vertical-align:middle;">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true" style="vertical-align:middle"></span>
                                    Add New Form
                                 </button>
                                </div>
                        </div>
                    </div>
                    <asp:GridView runat="server" ID="gvSalePriceList" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered table-hover"
                         AllowPaging="true" OnPageIndexChanging="gvSalePriceList_PageIndexChanging" PagerSettings-Mode="NumericFirstLast"   FirstPageText="First" LastPageText="Last">
                        <PagerStyle CssClass="pagination-ys"/>
                        <PagerSettings PageButtonCount="5" />
                        <Columns>                         
                            <asp:TemplateField Visible="false">
                                <HeaderTemplate >ID</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblID" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>FormNo</HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                <ItemTemplate >
                                    <asp:Label runat="server" ID="lblFormNo" Text='<%# Bind("FormNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>ApplyDate</HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblApplyDate" Text='<%# Bind("ApplyDate","{0:yyyy/MM/dd}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>Created By</HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblUserID" Text='<%# Bind("UserID") %>'></asp:Label>
                                </ItemTemplate>  
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" HorizontalAlign="Center"/>
                                <ItemTemplate >
                                    <a id="btneidt" class="btn btn-info btn-xs" runat="server" onserverclick="btnEdit1_Click"><span class="glyphicon glyphicon-edit" aria-hidden="true"> Edit</span></a>
                                    <a id="btndel" class="btn btn-danger btn-xs" runat ="server" onserverclick ="btnDel_Click" onclick ="return Confirm()"><span class="glyphicon glyphicon-trash" aria-hidden="true"> Del</span></a>
                                </ItemTemplate>
                                <ItemStyle CssClass="text-center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col col-xs-12">
                            <div>
                                    <div class="pull-left">
                                        Go To:
                                        <asp:TextBox Width="30px" runat="server" ID="txtGoto" onkeypress="return isNumber(event)"  Height="30px"></asp:TextBox> 
                                                                     
                                        <button id="Button3" type="button" class="btn btn-primary" runat="server" onserverclick="btnGoto_Click">
                                        <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span></button>
                                    </div>
                                <div class="pull-right">
                                Total_Count:<asp:Label runat="server" id="lblrowCount" Text="0"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Page Size:
                                <asp:DropDownList runat="server" ID="ddlPageSize" AutoPostBack="true" Height="30px" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" Width="50px" >
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--<div class="row">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <p class="navbar-text">A simple example of how-to put a bordered table within a panel. Responsive, place
                    holders in header/footer
                    for buttons or pagination.</p>
            </div>
        </nav>
    </div>--%>
</div>
</asp:Content>
