<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="Users_List.aspx.cs" Inherits="SalesPrice.Setting.Users_List" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/wucCalendar.ascx" TagPrefix="uc1" TagName="wucCalendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-3.2.0.min.js"></script> 
<script type="text/javascript">
    function Number(evt) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
</script>
      <script type="text/javascript">
          function openModal1(text) {
              $('#myModal1').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
              $('#myModal1').modal('show');
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
        select {
            border: 1px solid #c4c4c4;
            width: 250px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <%--<p style="padding-top:10px"></p>--%>
    <div class="container" style="width:100%">
    
        <div class="col-lg-12 col-md-offset-0">
            <div class="panel panel-info panel-table" style="margin-left:-1%; margin-right:-1%">
                <div class="panel-heading" style ="background-color :#337ab7; color:white;">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h1 class="panel-title"><b style="font-weight:bold; font-size:20px;">ユーザー一覧</b></h1>
                        </div>
                    </div>
                    <br />
                </div>
                  <div class="panel-body">
                    <div class="row" style ="height :30px;">
                <div class="form-group "  style="vertical-align:middle"><div id="Div1" runat="server" style="padding-left:2%;padding-top:5px;">
                           ユーザー:
                            <asp:TextBox ID="txtUserID" runat="server" CssClass="col1" ></asp:TextBox>
                            &nbsp;&nbsp;
                            ステージ:
                            <asp:DropDownList runat="server" ID="ddlStage" CssClass="col1" Width="250px">
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <button id="Button1" type="button" class="btn btn-primary" runat="server" onserverclick="btnSearch_Click">
                                <span class="glyphicon glyphicon-search" aria-hidden="true"  style="vertical-align:middle;padding-bottom:5px;"></span>
                                    検索
                            </button><%--</div>
                             <div class="pull-right" style="padding-right:5%;">--%>
                    <div runat="server" id="add_hide" style="float:right; padding-right:5%;padding-bottom :15px;">
                                    <button id="Button2" type="button" class="btn btn-primary" onserverclick ="btnadduser_Click"  runat ="server" >
                                    <span class="glyphicon glyphicon-plus"
                                          aria-hidden="true" style="vertical-align:middle;padding-bottom:5px"></span>
                                    ユーザー作成
                                        </button></div>
                         <div runat="server" id="Div2" style="float:right; padding-right:5%;padding-bottom :15px; display:none; height:40px"  >
                                  </div>
                                </div>
                        </div>
                      </div>
                    <asp:GridView runat="server" ID="gvUser_List" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="#337ab7" HeaderStyle-ForeColor ="White" 
                        HeaderStyle-CssClass="ckmdiv"  AllowPaging="true" OnPageIndexChanging="gvUser_List_PageIndexChanging" PagerSettings-Mode="NumericFirstLast"   FirstPageText="First" LastPageText="Last"
                        OnRowDataBound="gvUser_List_RowDataBound"  >
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
                                <HeaderTemplate>ユーザー</HeaderTemplate>
                                <HeaderStyle Width="30%"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" Width="90%" style="text-align:center"  ID="lblUserID" Text='<%# Bind("UserID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>チーム</HeaderTemplate>
                                <HeaderStyle Width="50%" />
                                <ItemTemplate>
                                    <asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="false" ShowHeader="false" GridLines="None">
                                        <Columns>
                                            <asp:TemplateField  >
                                                <HeaderTemplate >Description</HeaderTemplate >
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Width="100%" ID="lblDescription" Text='<%# Bind("Description") %>' BackColor="White" ForeColor="Black"></asp:Label>
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
                                    <a id="btnedit" class="btn btn-info btn-xs" runat="server" onserverclick ="btnEdit_Click" style ="background-color:#337ab7;"><span class="glyphicon glyphicon-edit" aria-hidden="true"> 編集</span></a>
                                   
                                </ItemTemplate>
                                <ItemStyle CssClass="text-center" />
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderTemplate><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                <ItemTemplate>
                                    <a id="btndelete" class="btn btn-danger btn-xs" runat="server" onserverclick ="btnDelete_Click">
                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"> 削除</span></a>
                                </ItemTemplate>
                                <ItemStyle CssClass="text-center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="panel-footer ckmdiv" >
                    <div class="row" >
                        <div class="col ">
                            <div>
                                    <div class="pull-left ">
                                        Go To:
                                        <asp:TextBox Width="30px" runat="server" ID="txtGoto" onkeypress="return Number(event)" CssClass="col1 ckmdivsett" Height="30px"></asp:TextBox>                              
                                        <button id="btnGoto" type="button" class="btn btn-primary" runat="server" onserverclick="btnGoto_Click">
                                        <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span></button>
                                    </div>
                                <div class="pull-right">
                                Total_Count:<asp:Label runat="server" id="lblrowCount" Text="0"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Page Size:
                                <asp:DropDownList  runat="server" ID="ddlPageSize" Width="50px" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" Height="30px" CssClass="ckmdivsett">
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
    <div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">確認</h4>
      </div>
      <div class="modal-body">
        <p></p>
      </div> 
      <div class="modal-footer">
        <asp:Label runat="server" ID="lblDelID" Visible="false"></asp:Label>
          <asp:Label runat="server" ID="lblDelDescription" Visible="false"></asp:Label>
        <button type="button" runat="server" id="btnConfirmDelete" class="btn btn-default" data-dismiss="modal" onserverclick="btnConfirmDelete_Click">削除</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
      </div>
    </div>

  </div>
</div>
</asp:Content>
