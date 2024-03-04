<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="Suppliers_Entry.aspx.cs" Inherits="SalesPrice.Setting.Suppliers_Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
          <script type = "text/javascript">
              function Confirm() {
                  if (confirm("Are you sure you want to delete?")) {
                      return true;
                  } else {
                      return false;
                  }
              }
          </script>
    <script type="text/javascript">
        function openModal(text) {
            $('#myModal').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal').modal('show');
        }
</script>
    <script type="text/javascript">
        function openModal1(text) {
            $('#myModal1').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal1').modal('show');
        }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%-- <p style="padding-top:10px"></p>--%>
    <div class="container" style="width:100%">
       
        <div class="">

            <div class="panel panel-info panel-table" style="margin-left:-1%; margin-right:-1%; width:100%">
                <div class="panel-heading" style ="background-color :#337ab7; color:white;">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h1 class="panel-title"><b style="font-weight:bold; font-size:20px;">仕入先一覧</b></h1>
                        </div>
                    </div>
                    <br />
                </div>
                 <div class="row">
                        <br />
                        <div style="padding-right:5%; float:right">
                           <%-- <h1 ><b style="font-weight:bold;  text-shadow: 2px 2px grey; font-size:25px;">Error Backup_List</b></h1>--%>
                       
                <asp:Label runat="server" ID="lblsr2" Text="仕入先-" Font-Bold="true" Font-Size="16px"></asp:Label>
<asp:TextBox ID="txtSiteIDSearch2"   Height="30px" runat="server" CssClass="col1" onkeypress="return allowOnlyNumber(event);" ></asp:TextBox>

                            <button id="btnDate2" type="button" class="btn btn-primary ddl111" runat="server" onserverclick="btnSearch_Click"    >
                                        <span class="glyphicon glyphicon-search" aria-hidden="true" style="vertical-align:middle;  height:18px"></span>&nbsp;&nbsp; 
                                    検索
                            </button>
                             </div>
                    </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                  <div class="panel-body" style ="padding-top :3px">
                    <div class="row">
                        <div class="form-group col-xs-8"  style="vertical-align:middle">                 
                    </div>
                    </div>
                        
                                    <asp:GridView ShowFooter="true" runat="server" ID="gvSuppliers" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="#337ab7" HeaderStyle-ForeColor ="White"
                                    HeaderStyle-CssClass="ckmdiv"  AllowPaging="true" OnPageIndexChanging="gvSuppliers_PageIndexChanging" PagerSettings-Mode="NumericFirstLast" PageSize="8">
                                        <Columns>
                                            <asp:TemplateField Visible="false">
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" ID="lblHeaderID" Text="ID"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblID" Text='<%# Bind("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label runat="server" ID="lblFooterID"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderStyle Width="5%" />
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" ID="lblHeaderPreference" Text="Preference"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:TextBox Width="90%" style="text-align:right" runat="server" ID="txtPreference" OnTextChanged="txtPereference_OnTextChanged" AutoPostBack="true" onkeypress="return isNumber(event)" Text='<%# Bind("Preference") %>'></asp:TextBox>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox Width="90%" style="text-align:right" runat="server" ID="txtFooterPreference"></asp:TextBox>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderStyle Width ="75%" />
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" ID="lblHeaderDescription" Text="仕入先"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblDescription" Text='<%# Bind("Description") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox runat="server" ID="txtDescription" CssClass="col1 col1a" ></asp:TextBox>
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="text-center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                            <HeaderTemplate><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></HeaderTemplate>
                                            <HeaderStyle Width="15%"  />
                                            <ItemTemplate>
                                                <a id="btnedit" class="btn btn-info btn-xs" onserverclick="btnEdit_Click" runat="server" style ="background-color :#337ab7;">
                                                    <span class="glyphicon glyphicon-edit" aria-hidden="true">
                                                        <asp:Label runat="server" ID="lblEdit" Text=" 編集"></asp:Label>
                                                    </span>
                                                </a>
                                                <a id ="btndel"  class="btn btn-danger btn-xs" runat ="server" onserverclick="btnDelete_Click"><span class="glyphicon glyphicon-trash" aria-hidden="true"> 削除</span></a>
                                            </ItemTemplate>
                                            <FooterTemplate >
                                                <a id ="btnSave" class="btn btn-success btn-xs" runat ="server" onserverclick="btnSave_Click" style="height:30px; vertical-align:middle;line-height:30px; background-color:#3CD887;">
                                                    <span class="glyphicon glyphicon-download-alt" aria-hidden="true"> 
                                                        <asp:Label runat="server" ID="lblSave" Text=" 登録"></asp:Label>
                                                    </span>
                                                </a>
                                                <a id ="btnCancel" class="btn btn-default btn-xs" runat ="server" onserverclick="btnCancel_Click" visible="false" style="height:30px; vertical-align:middle;line-height:30px; background-color:gray ; color:white ;"
>
                                                  <span class="glyphicon glyphicon-remove-sign"   aria-hidden="true"> 
                                                        <asp:Label runat="server" ID="lblCancel" Text=" キャンセル"></asp:Label>
                                                    </span>
                                                </a>
                                            </FooterTemplate>
                                            <FooterStyle CssClass="text-center col-md-3" />
                                            <ItemStyle CssClass="text-center col-md-3" />
                                        </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                
                      </div>
                 <div class="panel-footer ckmdiv">
                    <div class="row">
                        <div class="col">
                            <div>
                                    <div class="pull-left ">
                                        Go To:
                                        <asp:TextBox Width="35px" runat="server" ID="txtGoto" onkeypress="return isNumber(event)"  CssClass="col1 ckmdivsett" Height="34px" style="border:1px solid grey; border-radius:4.5px; background-color :#F5F5F5; vertical-align:middle"></asp:TextBox>                              
                                        <button id="Button3" type="button" class="btn btn-primary" runat="server" onserverclick="btnGoto_Click">
                                        <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span></button>
                                    </div>
                                <div class="pull-right">
                                Total_Count:<asp:Label runat="server" id="lblrowCount" Text="0"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <%--  Page Size:
                                <asp:DropDownList runat="server" ID="ddlPageSize"  AutoPostBack="true" Height="30px" OnSelectedIndexChanged="gvSupplier_Indexchanged" Width="50px" >
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="25" Value="25"></asp:ListItem>
                                </asp:DropDownList>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
                        </asp:UpdatePanel>
            </div>
        </div>
    </div>  

    <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header-info" >
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Information</h4>
      </div>
      <div class="modal-body">
        <p></p>
      </div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
