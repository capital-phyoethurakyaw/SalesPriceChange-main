<%@ Page Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="SalesPrice.Users.UserList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/wucCalendar.ascx" TagPrefix="uc1" TagName="wucCalendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-3.2.0.min.js"></script> 
    <link href="../TestCalendar/css/jquery.datepick.css" rel="stylesheet" />
    <script src="../TestCalendar/js/jquery.plugin.min.js"></script>
    <script src="../TestCalendar/js/jquery.datepick.js"></script>
    <script src="../Scripts/jquery.min.js"></script>
    <script src="../Scripts/jmjs.js"></script>
    <script>
        $(function () {
            $('#popupDatepicker1').datepick();
            $('#inlineDatepicker1').datepick({ onSelect: showDate });
            alert("not here");
        });

        function showDate(date) {
            alert('The date chosen is ' + date); alert("not here");
        }
</script>
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
    <style type="text/css">
        .ddl11
        {
            box-shadow: 10px 10px 5px #888888;
            border-radius:5px;
            border:1px solid gray;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="padding-top:10px"></p>
    <div class="container">
        <div class="row">
        <div class="col-md-12 col-md-offset-0">
            <div class="panel panel-info panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h1 class="panel-title"><b style="font-weight:bold;  text-shadow: 2px 2px White; font-size:20px;">User List</b></h1>
                        </div>
                    </div>
                    <br />
                </div>

                <p>A popup datepicker <input runat="server" type="text" id="popupDatepicker1"/></p>
<p>Or inline</p>
<div id="inlineDatepicker1"></div>





                  <div class="panel-body">
                    <div class="row">
                <div class="form-group col-xs-12"  style="vertical-align:middle">
                            UserID:
                            <asp:TextBox ID="txtUserID" Width="150px" runat="server"  Height="30px"></asp:TextBox>
                            &nbsp;&nbsp;
                            Stage: 
                            <asp:DropDownList runat="server" ID="ddlStage" Width="150px" Height="30px"  >
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <button id="Button1" type="button" class="btn btn-primary" runat="server" onserverclick="btnSearch_Click"  >
                                <span class="glyphicon glyphicon-search" aria-hidden="true"  style="vertical-align:middle"></span>
                                    Search
                            </button>
                             <div class="pull-right">
                                    <button id="Button2" type="button" class="btn btn-primary" runat ="server" onserverclick ="btnadduser_Click" >
                                    <span class="glyphicon glyphicon-plus"
                                          aria-hidden="true" style="vertical-align:middle"></span>
                                    Add New Uer
                                        </button>
                                </div>
                        </div>
                      </div>
              
                    <asp:GridView runat="server" ID="gvUserList" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered table-hover"
                         AllowPaging="true" OnPageIndexChanging="gvUserList_PageIndexChanging" PagerSettings-Mode="NumericFirstLast"   FirstPageText="Start" LastPageText="End"
                        OnRowDataBound="gvUserList_RowDataBound">
                        <PagerStyle CssClass="pagination-ys"/>
                        <PagerSettings PageButtonCount="5" />
                        <Columns>                         
                            <asp:TemplateField Visible="false">
                                <HeaderTemplate >ID</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblID" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>UserID</HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblUserID" Text='<%# Bind("UserID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Description</HeaderTemplate>
                                <HeaderStyle CssClass="col-md-5 text-center" />
                                <ItemTemplate>
                                    <asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="false" ShowHeader="false" GridLines="None">
                                        <Columns>
                                            <asp:TemplateField  >
                                                <HeaderTemplate >Description</HeaderTemplate >
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblDescription" Text='<%# Bind("Description") %>' BackColor="White" ForeColor="Black"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                <ItemTemplate>
                                    <a id="btnedit" class="btn btn-info btn-xs" runat="server" onserverclick="btnEdit_Click"><span class="glyphicon glyphicon-edit" aria-hidden="true"> Edit</span></a>
                                    <a id ="btndel"  class="btn btn-danger btn-xs" runat ="server" onserverclick ="btndel_click" onclick ="return Confirm()"><span class="glyphicon glyphicon-trash" aria-hidden="true"> Del</span></a>
                                </ItemTemplate>
                                <ItemStyle CssClass="text-center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="panel-footer" >
                    <div class="row" >
                        <div class="col col-xs-12">
                            <div>
                                    <div class="pull-left">
                                        Go To:
                                        <asp:TextBox Width="30px" runat="server" ID="txtGoto" onkeypress="return isNumber(event)" Height="30px"></asp:TextBox>                              
                                        <button id="btnGoto" type="button" class="btn btn-primary" runat="server" onserverclick="btnGoto_Click" >
                                        <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span></button>
                                    </div>
                                <div class="pull-right">
                                Total_Count:<asp:Label runat="server" id="lblrowCount" Text="0"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Page Size:
                                <asp:DropDownList runat="server" ID="ddlPageSize" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" Height="30px" Width="50px">
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
</div>
</asp:Content>

