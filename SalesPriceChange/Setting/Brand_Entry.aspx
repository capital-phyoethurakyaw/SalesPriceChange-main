<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="Brand_Entry.aspx.cs" Inherits="SalesPrice.Setting.Brand_Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
          <script type = "text/javascript">
              function Confirm() {
                  if (confirm("Are you sure you want to delete?")) {
                      return true;
                  } else {
                      return false;
                  }
              }

              function setfilename(val) {
                  var fileName = val.substr(val.lastIndexOf("\\") + 1, val.length);
                  document.getElementById('<% =txtFilePath.ClientID %>').value = fileName;
              }
          </script> 

    <script type="text/javascript">
        function openModal(text) {
            $('#myModal').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal').modal('show');
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

    <script type="text/javascript">
        function openModal1(text) {
            $('#myModal1').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal1').modal('show');
        }
</script>
    <style>
        .upload-drop-zone {
            height: 200px;
            border-width: 2px;
            margin-bottom: 20px;
            }

        /* skin.css Style*/
        .upload-drop-zone {
          color: #ccc;
          border-style: dashed;
          border-color: #ccc;
          line-height: 200px;
          text-align: center
        }
        .upload-drop-zone.drop {
          color: #222;
          border-color: #222;
        }

        .image-preview-input {
            position: relative;
            overflow: hidden;
            margin: 0px;    
            color: #333;
            border-color: #ccc;    
        }
        .image-preview-input input[type=file] {
        	position: absolute;
        	top: 0;
        	right: 0;
        	margin: 0;
        	padding: 0;
        	font-size: 20px;
        	cursor: pointer;
        	opacity: 0;
        	filter: alpha(opacity=0);
        }
        .image-preview-input-title {
            margin-left:2px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <%--  <p style="padding-top:10px"></p>--%>
    <div class="container" style="width:100%">
       
        <div class="panel panel-body">
            <div class="panel panel-info panel-table" style="margin-left:-1%; margin-right:-1%; width:100%">
                <div class="panel-heading" style ="background-color :#337ab7; color:white;">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h1 class="panel-title"><b style="font-weight:bold;  font-size:20px;">ブランド一覧</b></h1>
                        </div>
                    </div>
                    <br />
                </div>
				<div class="row" style="padding-top:30px">
                    <div class="input-group image-preview" style="width:60%">
				
		</div> 
			</div>
                 <div >
                     <div class="pull-left" style="padding-left:10px;">
                          <input placeholder="Choose File. . . " type="text" runat="server" id="txtFilePath" class="image-preview-filename col1" style="height:auto; height:30px; padding-left:10px" disabled="disabled" />
			
				    <button type="button" class="btn btn-custom2 image-preview-clear" style="display:none;"> <span class="glyphicon glyphicon-remove"></span> Clear </button>
		
				    <div class="btn btn-custom1 image-preview-input"> 
                        <span class="glyphicon glyphicon-folder-open"></span> <span class="image-preview-input-title">参照</span>
					    <input type="file" runat="server" id="fileupload1" accept="application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" name="input-file-preview" onchange="setfilename(this.value);"/>
				
				    </div>
				    <button type="button" id="btnImport" runat="server" style="    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;" onserverclick="btnImport_ServerClick" class="btn btn-custom2 "> <span class="btn-label"><i class="glyphicon glyphicon-import"></i> </span>取込み</button>
	
			</div>
                        <div style="padding-right:5%; float:right" class="pull-right">
                           <%-- <h1 ><b style="font-weight:bold;  text-shadow: 2px 2px grey; font-size:25px;">Error Backup_List</b></h1>--%>
                       
    <asp:Label runat="server" ID="lblsr3" Text="ブランド-" Font-Bold="true" Font-Size="16px"></asp:Label> 
<asp:TextBox ID="txtSiteIDSearch2"   Height="30px" runat="server"  CssClass="col1" onkeypress="return allowOnlyNumber(event);" ></asp:TextBox>

                            <button id="btnDate2" type="button" class="btn btn-primary ddl111" runat="server" onserverclick="btnSearch_Click"   >
                                        <span class="glyphicon glyphicon-search" aria-hidden="true" style="vertical-align:middle;  height:18px" "></span>&nbsp;&nbsp; 
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
                      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                          <ContentTemplate>
                              <asp:GridView ShowFooter="true" runat="server" ID="gvBrand" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="#337ab7" HeaderStyle-ForeColor ="White"
                                     AllowPaging="true"  HeaderStyle-CssClass="ckmdiv" OnPageIndexChanging="gvBrand_PageIndexChanging" PagerSettings-Mode="NumericFirstLast" PageSize="8">
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
                                                    <asp:TextBox Width="90%" style="text-align:right" runat="server" onkeypress="return isNumber(event)" ID="txtFooterPreference"></asp:TextBox>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderStyle Width ="75%" />
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" ID="lblHeaderDescription" Text="ブランド"></asp:Label>
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
                                                <a id="btnedit" class="btn btn-info btn-xs" onserverclick="btnEdit_Click" runat="server" style ="background-color :#337ab7;" >
                                                    <span class="glyphicon glyphicon-edit" aria-hidden="true">
                                                        <asp:Label runat="server" ID="lblEdit" Text=" 編集"></asp:Label>
                                                    </span>
                                                </a>
                                                <a id ="btndel"  class="btn btn-danger btn-xs" runat ="server" onserverclick="btnDelete_Click" ><span class="glyphicon glyphicon-trash" aria-hidden="true"> 削除</span></a>
                                            </ItemTemplate>
                                            <FooterTemplate >
                                                <a id ="btnSave" class="btn btn-success btn-xs" runat ="server" onserverclick="btnSave_Click" style="height:30px; vertical-align:middle;line-height:30px;  background-color:#3CD887;">
                                                    <span class="glyphicon glyphicon-download-alt" aria-hidden="true"> 
                                                        <asp:Label runat="server" ID="lblSave" Text=" 登録"></asp:Label>
                                                    </span>
                                                </a>
                                                <a id ="btnCancel" class="btn btn-default btn-xs" runat ="server" onserverclick="btnCancel_Click" visible="false" style="height:30px; vertical-align:middle;line-height:30px; background-color:gray ; color:white ;">
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
                          </ContentTemplate>
                      </asp:UpdatePanel>
                    
                                
                      </div>
                               <div class="panel-footer ckmdiv">
                    <div class="row">
                        <div class="col">
                            <div>
                                    <div class="pull-left ">
                                        Go To:
                                        <asp:TextBox Width="35px" runat="server" ID="txtGoto" onkeypress="return isNumber(event)"  CssClass="col1 ckmdivsett" Height="34px" style="border:1px solid grey; border-radius:4.5px; background-color :#F5F5F5; vertical-align:middle"></asp:TextBox>                              
                                        </div>
                            </span>                              
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        <button id="Button3" type="button" class="btn btn-primary" runat="server" onserverclick="btnGoto_Click">
                                        <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span></button>
                                                            <div class="pull-right">
                                Total_Count:<asp:Label runat="server" id="lblrowCount" Text="0"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <%-- Page Size:
                                <asp:DropDownList runat="server" ID="ddlPageSize" Visible="false" AutoPostBack="true" Height="30px" OnSelectedIndexChanged="gvBrand_Indexchanged" Width="50px" >
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
                </div>
            </ContentTemplate>
                        </asp:UpdatePanel>
            </div>
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
