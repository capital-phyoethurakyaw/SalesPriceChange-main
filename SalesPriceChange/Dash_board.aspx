<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="Dash_board.aspx.cs" Inherits="SalesPrice.Dash_board" enableEventValidation ="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/magic-check.css" rel="stylesheet" />
    <%--<script type="text/javascript" src="../Scripts/jquery-3.2.0.min.js"></script>--%>
    <style type="text/css">
        /*.header_dashboard {
    
        background-color:green;
        }*/
     
        .radioBtn .notActive {
            color: #3276b1;
            background-color: #fff;
        }
         .footable >thead >tr>th
            {
             position: inherit; 
             color:black;
            }
         .footable>thead>tr>th, .footable>thead>tr>td {
    position: inherit;
}
        body {
            color: none;
        }
        
        .footable {
    border-spacing: 0;
    width: 100%;
    border: solid #ccc 1px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    font-family: 'trebuchet MS','Lucida sans',Arial;
    font-size: 14px;
 color: none; 
}
        .footable.breakpoint>tbody>tr>td.expand {
    background: url("https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/img/plus.png") no-repeat 5px center !important;
    padding-left: 40px;
}

.footable.breakpoint>tbody>tr.footable-detail-show>td.expand {
    background: url("https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/img/minus.png") no-repeat 5px center !important;
}
        
    </style>
    <link href="Styles/footable.css" rel="stylesheet" />
      
      <meta name="viewport" content="width = device-width, initial-scale = 1.0, minimum-scale = 1.0, maximum-scale = 1.0, user-scalable = no" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="width:100%">
        <div class ="row">
            <div class="panel panel-info panel-table">
                <div class="panel-heading" style ="background-color :#337ab7; color:white;">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h1 class="panel-title"><b style="font-weight:bold; font-size:20px;">ダッシュボード</b></h1>
                        </div>
                    </div>
                </div>
                <div class="form-group" style="padding-top:10px;">
    		        <div class="col-sm-7 col-md-7">
    		            <div class="input-group">
    			            <div class="radioBtn btn-group">
                                <a id="rdoOnlyMe" class="btn btn-primary active" data-toggle="rdoValue" data-title="Me" runat="server"  onserverclick="rdbonly_checkchange">自分のタスク</a>
    				            <a id="rdoAll" class="btn btn-primary notActive" idata-toggle="rdoValue" data-title="All" runat="server" onserverclick="rdbAll_checkchange">全部のタスク</a>				
    			            </div>
    		            </div>
    	            </div>


                    <div >
                        <div >
                            <div style="vertical-align:middle;padding-bottom:-10px">
                                   
                                <div class="pull-right">
                                    Total_Count:<asp:Label runat="server" ID="lblrowCount" Text="0" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Page Size:
                                <asp:DropDownList runat="server" ID="ddlPageSize" AutoPostBack="true" Height="30px" OnSelectedIndexChanged="gvDashboard_Indexchanged" Width="50px">
                                    <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                </asp:DropDownList>&nbsp;&nbsp;&nbsp;
                                     <%--<div class="panel-footer" style="background:none; border-top:white">--%>
                                <div class="pull-right" style="float:right;margin-right:10px" >&nbsp;&nbsp;&nbsp;
                                    Go To:
                                        <asp:TextBox Width="30px" runat="server" ID="txtGoto" onkeypress="return isNumber(event)" Height="30px" style="border:1px solid grey; border-radius:4.5px; background-color :#F5F5F5; vertical-align:middle"></asp:TextBox>
                                    <button id="Button3" type="button" class="btn btn-primary" runat="server" onserverclick="btnGoto_Click">
                                        <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
                                    </button>
                                </div>
                               <%--</div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class ="panel-body">
                    
                       
                    <p style="padding-top:8px"></p>
                          <asp:GridView runat="server" ID="gvDashboard" AutoGenerateColumns="false"  CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="#337ab7" HeaderStyle-ForeColor ="White" ShowHeaderWhenEmpty ="true" 
                        AllowPaging="true" OnPageIndexChanging="gvDashboard_paging" PagerSettings-Mode="NumericFirstLast" PageSize="30" style="text-align:center">
                        <PagerStyle CssClass="pagination-ys" />
                        <PagerSettings PageButtonCount="5" />
                        <Columns>
                            <asp:TemplateField Visible ="false" >
                                <HeaderTemplate>ID</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblID" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="10%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderFormNo" Text="申請番号"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                  <a id="db_link" onserverclick="dblink_Click" runat="server"  target="_self">  <asp:Label runat="server" ID="lblFormNo" Text='<%# Bind("FormNo") %>'></asp:Label></a>
                                </ItemTemplate>                                
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderStyle Width="22%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblcurrentstage" Text="現段階"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblstage1" Text='<%# Bind("CurrentStage") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="8%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderStartDate" Text="開始日"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblStartDate" Text='<%# Bind("StartDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="8%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderEndDate" Text="終了日"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblEndDate" Text='<%# Bind("EndDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="18%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderSupplier" Text="仕入先"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblsupplier" Text='<%# Bind("Suppliers_ID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="text-center" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="12%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderBrand" Text="ブランド"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblBrand" Text='<%# Bind("Brand_ID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="text-center" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="12%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderApplyType" Text="申請区分"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblApply" Text='<%# Bind("ApplyType_ID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="text-center" />                           
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="8%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderMDManagement" Text="ＭＤ管理表"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblmanagement" Text='<%# Bind("MD_Management") %>'></asp:Label>

                                </ItemTemplate>
                                <HeaderStyle CssClass="text-center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
              <%--      <asp:GridView runat="server" ID="gvDashboard" AutoGenerateColumns="false" HeaderStyle-CssClass="header_dashboard"  CssClass="table table-striped table-bordered table-hover footable"  HeaderStyle-ForeColor ="White" ShowHeaderWhenEmpty ="true" 
                        AllowPaging="true" OnPageIndexChanging="gvDashboard_paging" PagerSettings-Mode="NumericFirstLast" PageSize="30" style="text-align:center;color:black"  >
                        <PagerStyle CssClass="pagination-ys" />
                        <PagerSettings PageButtonCount="5" />
                        <Columns>
                            <asp:TemplateField Visible ="false" >
                                <HeaderTemplate>ID</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblID" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                             <asp:TemplateField>
                                <HeaderStyle Width="22%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblcurrentstage" Text="現段階"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblstage1" Text='<%# Bind("CurrentStage") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="8%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderStartDate" Text="開始日"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblStartDate" Text='<%# Bind("StartDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="8%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderEndDate" Text="終了日"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblEndDate" Text='<%# Bind("EndDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="18%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderSupplier" Text="仕入先"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblsupplier" Text='<%# Bind("Suppliers_ID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="text-center" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="12%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderBrand" Text="ブランド"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblBrand" Text='<%# Bind("Brand_ID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="text-center" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="12%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderApplyType" Text="申請区分"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblApply" Text='<%# Bind("ApplyType_ID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="text-center" />                           
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="8%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderMDManagement" Text="ＭＤ管理表"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblmanagement" Text='<%# Bind("MD_Management") %>'></asp:Label>

                                </ItemTemplate>
                                <HeaderStyle CssClass="text-center" />
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderStyle Width="10%" />
                                <HeaderTemplate>
                                    <asp:Label runat="server" ID="lblHeaderFormNo" Text="申請番号"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                  <a id="db_link" onserverclick="dblink_Click" runat="server"  target="_self">  <asp:Label runat="server" ID="lblFormNo" Text='<%# Bind("FormNo") %>'></asp:Label></a>
                                </ItemTemplate>                                
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>--%>
                </div>
                <div class="panel-footer ckmdiv">
                 <div id="Div1" runat="server" class="ckmdiv">
    <p style="text-align:center; top:400px;"><asp:label id="ckm" CssClass="ckm" runat="server" Text="Capital Knowledge Myanmar"> </asp:label>
   
        <img src="Images/11140079_1632197250333718_8925207411363483344_n.jpg" style="height:20px;width:20px" /> </p>
</div>
                </div>
            </div>
        </div> 
        <asp:HiddenField ID="hfDashID" runat="server" />
    </div> 
   

    <%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>--%>
<%--    <script type="text/javascript">
        $(function () {
            $('[id*=gvDashboard]').footable();
        });
    </script>--%>

</asp:Content>
