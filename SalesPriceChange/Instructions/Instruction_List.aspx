<%@ Page Title="" Language="C#" EnableEventValidation="false"  MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="Instruction_List.aspx.cs" Inherits="SalesPrice.Instructions.Instruction_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-3.2.0.min.js"></script>
    <%--<script src='http://code.jquery.com/jquery-latest.min.js' type='text/javascript'></script>--%>
    <link href="../Styles/Common.css" rel="stylesheet" />
    <script type="text/javascript">
        function openModal() {
            $('#myModal').modal('show');
        }
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function SaveState() {
            var divid = document.getElementById("<%=searchPanel.ClientID%>");
            var d = divid.style.display;
            if (d == "none")
                $(divid).slideDown('slow');
            else
                $(divid).slideUp('slow');
        }
        function Confirm() {
            if (confirm("Are you sure you want to delete?")) {
                return true;
            } else {
                return false;
            }
        }
    </script>
    <script type="text/javascript">
        var isShift = false;
        var seperator = "/";
        function DateFormat(txt, keyCode) {
            if (keyCode == 16)
                isShift = true;
            //Validate that its Numeric
            if (((keyCode >= 48 && keyCode <= 57) || keyCode == 8 || keyCode <= 37 || keyCode <= 39 || (keyCode >= 96 && keyCode <= 105)) && isShift == false && keyCode != 32) {
                if ((txt.value.length == 4 || txt.value.length == 7) && keyCode != 8) {
                    txt.value += seperator;
                }
                return true;

            }
            else {
                return false;

            }
        }

        $(document).ready(function () {
            document.getElementById("<%= txtEndDate.ClientID%>").onfocusout = function () { myFunction() };
            function myFunction() {
                var fwo = document.getElementById("<%=txtEndDate.ClientID%>");
                var bobo = fwo.value.toString();
                var lastPart1 = bobo.split("/").pop();
                var yy = bobo.split("/")[1];
                var zz = bobo.split("/")[0];
                var x = parseInt(lastPart1, 10);
                var y = parseInt(yy, 10);
                var z = parseInt(zz, 10);
                if (z > 2000 && z < 2100 && y > 0 && y < 13 && x > 0 && x < 32 && (fwo.value.length) > 7 && (fwo.value.length) < 11) {
                    return true;
                }
                else {
                    fwo.value = "";
                }
            }
        });
    </script>
    <script type = "text/javascript">
        var isShift = false;
        var seperator = "/";
        function DateFormat(txt, keyCode) {
            if (keyCode == 16)
                isShift = true;
            if (((keyCode >= 48 && keyCode <= 57) || keyCode == 8 || keyCode <= 37 || keyCode <= 39 || (keyCode >= 96 && keyCode <= 105)) && isShift == false && keyCode != 32) {
                if ((txt.value.length == 4 || txt.value.length == 7) && keyCode != 8) {
                    txt.value += seperator;
                }
                return true;

            }
            else {
                return false;

            }
        }
        $(document).ready(function () {
            document.getElementById("<%= txtStartDate.ClientID%>").onfocusout = function () { myFunction() };
            function myFunction() {
                var fwo = document.getElementById("<%=txtStartDate.ClientID%>");
            var bobo = fwo.value.toString();
            var lastPart1 = bobo.split("/").pop();
            var yy = bobo.split("/")[1];
            var zz = bobo.split("/")[0];
            var x = parseInt(lastPart1, 10);
            var y = parseInt(yy, 10);
            var z = parseInt(zz, 10);
            if (z > 2000 && z < 2100 && y > 0 && y < 13 && x > 0 && x < 32 && (fwo.value.length) > 7 && (fwo.value.length) < 11) {
                return true;
            }
            else {
                fwo.value = "";
            }
        }
        });
    </script>
    <script type="text/javascript">
        // when dom is ready we initialize the UpdatePanel requests
        $(document).ready(function () {
            //$('.modal.fade.in').on('scroll', $.proxy(this.place, this));
            //$(window).on('resize', $.proxy(this.place, this));
            function pageLoad() {
                $('.form_date').datetimepicker({
                    showOnFocus: false,
                    weekStart: 1,
                    clearBtn: 1,
                    autoclose: 1,
                    startView: 2,
                    minView: 2,
                    forceParse: 0,
                    picktime: false,
                    format: "yyyy/mm/dd",
                });
            }

            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_initializeRequest(InitializeRequest);
            prm.add_endRequest(EndRequest);

            // Place here the first init of the DatePicker           
            $('.form_date').datetimepicker({
                showOnFocus: false,
                weekStart: 1,
                clearBtn: 1,
                autoclose: 1,
                startView: 2,
                minView: 2,
                forceParse: 0,
                picktime: false,
                format: "yyyy/mm/dd",
            });
        });

        function InitializeRequest(sender, args) {
            // make unbind before update the dom, to avoid memory leaks.
            $('.form_date').unbind();
        }

        function EndRequest(sender, args) {
            // after update occur on UpdatePanel re-init the DatePicker
            $('.form_date').datetimepicker({
                showOnFocus: false,
                weekStart: 1,
                clearBtn: 1,
                autoclose: 1,
                startView: 2,
                minView: 2,
                forceParse: 0,
                picktime: false,
                format: "yyyy/mm/dd",

            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField runat="server" ID="hfState" Value="collapse" />
    <div class="panel panel-info panel-table">
        <div class="panel-heading" style ="background-color :#337ab7; color:white;">
            <div class="row">
                <div class="col col-xs-6">
                    <h1 class="panel-title"><b style="font-weight: bold; font-size: 20px;">申請番号管理表</b></h1>
                </div>
            </div>
        </div>
        <div class="panel-body" style ="padding :10px 1.5px 1.5px 1.5px;">
            <div id="searchPanel" runat="server">
                <div class="panel panel-default panel-table" style ="height :130px">
                    <div class="panel-heading" style="height: 30px">
                        <div class="row">
                            <div class="text-center">
                                <h3 class="panel-title"><b>検索</b></h3>
                            </div>
                        </div>
                    </div>
                    <div style="padding: 10px 0px 0px 0px; margin-left:10px">
                        <table>
                            <tr>
                                <td style="width:70px;text-align:right">
                                    <asp:Label ID="Label1" runat="server" Text="申請番号:" Width="70px"></asp:Label>
                                </td>
                                <td style="padding-left:10px">
                                    <asp:TextBox runat="server" ID="txtFormNo" Width="130px"></asp:TextBox>
                                </td>
                                <td style="width:70px;text-align:right">
                                    <asp:Label ID="Label1123" runat="server" Text="カテゴリ:" Width="70px"></asp:Label>
                                </td>
                                <td style ="padding-left:10px;">
                                   <asp:TextBox runat="server" ID="txtCategory" Width="130px"></asp:TextBox>
                                </td>
                                <td style ="padding-left:10px;text-align:right">
                                    <asp:Label ID="Label2" runat="server" Text="開始日:" Width="70px"></asp:Label>
                                </td>
                                <td id="Td2" runat="server" style ="padding-left:10px;text-align:right;">
                                    <div id="Div1"  class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy/mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                        <asp:TextBox runat="server" MaxLength="10" ID="txtStartDate" style="width:90px; text-align:left;" onkeydown = "return DateFormat(this, event.keyCode)"  onblur="myFunction()" placeholder="yyyy/mm/dd"></asp:TextBox>
                                        <div id="Div2" runat="server" class="input-group-addon" style="vertical-align:middle;height:20px">
                                            <div id="Div3" runat="server" class="glyphicon glyphicon-calendar" style="vertical-align:middle;margin-bottom:-7px" ></div>
                                        </div> 
                                    </div>
                                </td>
                                <td style ="padding-left :5px;text-align:right">
                                    <asp:Label ID="Label3" runat="server" Text="終了日:" Width="70px"></asp:Label>
                                </td>
                                <td id="Td1" runat="server" style ="padding-left :10px;text-align:left">
                                    <div id="Div13" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                        <asp:TextBox runat="server" MaxLength="10" ID="txtEndDate" Style="width:90px; text-align:left;" onkeydown="return DateFormat(this, event.keyCode)" onblur="myFunction()" placeholder="yyyy/mm/dd"></asp:TextBox>
                                        <div id="Div14" runat="server" class="input-group-addon" style="vertical-align:middle;height:20px">
                                            <div id="Div15" runat="server" class="glyphicon glyphicon-calendar" style="vertical-align:middle;margin-bottom:-7px"></div>
                                        </div>
                                    </div>                                            
                                </td>                                
                                <td style ="padding-left:10px;text-align:right">
                                    <asp:Label ID="Label8" runat="server" Text="ＭＤ管理表:" Width="80px"></asp:Label>
                                </td>
                                <td style ="padding-left:10px">
                                    <asp:DropDownListChosen ID="ddlManagement" runat="server" NoResultsText ="No results match." Height="40px" width="120px"
                                      DataPlaceHolder="---選択---" AllowSingleDeselect="true">               
                                    </asp:DropDownListChosen>
                                </td>
                            </tr>
                            <tr>
                                <td style ="padding-left:10px;padding-top:10px;text-align:right">
                                    <asp:Label ID="Label6" runat="server" Text="申請区分:" Width="70px"></asp:Label>
                                </td>
                                <td style ="padding-left:10px;padding-top:10px;">
                                    <asp:DropDownListChosen ID="ddlApplyType" runat="server" NoResultsText ="No results match." Height="40px" width="130px"
                                      DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                    </asp:DropDownListChosen>
                                </td>
                                <td style ="padding-left:10px;padding-top:10px;text-align:right">
                                    <asp:Label ID="Label7" runat="server" Text="対象品番データ:" Width="110px"></asp:Label>
                                </td>
                                <td style ="padding-left:10px;padding-top:10px;text-align:right">
                                    <asp:TextBox runat="server" ID="txtTargetItem" Width="129px"></asp:TextBox>
                                </td>
                                <td style ="padding-left:5px;padding-top:10px;text-align:right">
                                    <asp:Label ID="Label5" runat="server" Text="ブランド:" Width="70px"></asp:Label>
                                </td>
                                <td style ="padding-left:10px;padding-top:10px;">
                                    <asp:DropDownListChosen ID="ddlBrand" runat="server" NoResultsText ="No results match." Height="40px" width="130px"
                                      DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                    </asp:DropDownListChosen>
                                </td>
                                <td style ="padding-left:10px;padding-top:10px;text-align:right">
                                    <asp:Label ID="Label4" runat="server" Text="仕入先:" Width="70px"></asp:Label>
                                </td>
                                <td style ="padding-left :10px;padding-top:10px;">
                                    <asp:DropDownListChosen ID="ddlSupplier" runat="server" Height="40px" width="130px"
                                      DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                    </asp:DropDownListChosen>
                                </td>
                                <td style ="padding-left:10px;padding-top:10px;text-align:right">
                                    <asp:Label ID="Label9" runat="server" Text="完了:" Width="70px"></asp:Label>
                                </td>
                                <td style ="padding-left:10px;padding-top:10px;">
                                    <asp:DropDownListChosen ID="ddlSIsFinished" runat="server" NoResultsText ="No results match." Height="30px" width="120px"
                                      DataPlaceHolder="---選択---" AllowSingleDeselect="true">          
                                    </asp:DropDownListChosen>
                                </td>   
                                <td colspan="2" style ="padding-left:20px;padding-top:15px;">
                                    <p>
                                        <a onserverclick="btnSearch_Click" id="btnSearch" class="btn btn-primary btn-md" runat="server" style="width:120px">
                                            <span class="glyphicon glyphicon-search"></span> 検索する
                                        </a>
                                    </p>
                                </td>                         
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="form-group " style="padding-bottom:5px;">
                <div class="col-md-4">
                    <button type="button" onclick="SaveState()" class="btn btn-default" data-toggle="collapse" data-target="#searchPanel">検索パネル</button>
                 <button id="ddf" runat="server" class="btn btn-primary btn-md" onserverclick="ddf_Click" style="text-align:center">
                     <span class=" 	glyphicon glyphicon-export" aria-hidden="true" style="vertical-align: middle;">エクスポート
                    </span>
                     </button>
                    <button id="btnNew" runat="server" class="btn btn-success btn-md text-right" onserverclick="btnNew_Click" style="text-align:center">
                     指示書新規作成
                </button>
                </div>
                 <div style="padding-bottom:10px; margin-left:-200px">
                <div style="padding-bottom:10px" >
                    <div  style="vertical-align:middle;padding-bottom:10px">
                        
                        <div class="pull-right">
                            Total_Count:<asp:Label runat="server" ID="lblrowCount" Text="0" />
                           
                        Page Size:
                        <asp:DropDownList runat="server" ID="ddlPageSize" AutoPostBack="true" Height="30px" OnSelectedIndexChanged="gvInstruction_Indexchanged" Width="50px">
                            <asp:ListItem  Text="10" Value="10"></asp:ListItem>
                            <asp:ListItem  Selected="True" Text="30" Value="30"></asp:ListItem>
                            <asp:ListItem Text="50" Value="50"></asp:ListItem>
                            <asp:ListItem Text="100" Value="100"></asp:ListItem>
                        </asp:DropDownList>
                            &nbsp;&nbsp;&nbsp;
                        <div class="pull-right" style="">&nbsp;&nbsp;&nbsp;
                            Go To:
                                <asp:TextBox Width="30px" runat="server" ID="txtGoto" onkeypress="return isNumber(event)" Height="30px" style="border:1px solid grey; border-radius:4.5px; background-color :#F5F5F5; vertical-align:middle"></asp:TextBox>
                            <button id="Button3" type="button" class="btn btn-primary" runat="server" onserverclick="btnGoto_Click">
                                <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
                            </button>
                        </div>
                           
                        </div>
                    </div>
                </div>
            </div>
            </div>
             
           
            <asp:GridView runat="server" ID="gvInstruction" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" ShowHeaderWhenEmpty ="true" HeaderStyle-BackColor="#337ab7" HeaderStyle-ForeColor ="White" 
             OnSorting="gvInstruction_Sorting" AllowSorting="true" PageSize ="30" HeaderStyle-CssClass="header_dashboard"  AllowPaging="true" OnPageIndexChanging="gvInstruction_paging" PagerSettings-Mode="NumericFirstLast"  style="text-align:center">
                <PagerStyle CssClass="pagination-ys" />
                <PagerSettings PageButtonCount="5" />
                <Columns>
                    <asp:TemplateField Visible="false">
                        <HeaderTemplate>ID</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblID" Text='<%# Bind("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderStyle Width="8%" />
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderFormNo" Text="申請番号"></asp:Label>                 
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblForm" Text='<%# Bind("Form") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField   HeaderText="開始日" SortExpression="StartDate">
                        <HeaderStyle Width="6%" />
                 <%--       <HeaderTemplate>
                            <asp:Label runat="server"  ID="lblHeaderStartDate" Text="開始日"></asp:Label>
                        </HeaderTemplate>--%>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblStartDate" Text='<%# Bind("StartDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="EndDate">
                        <HeaderStyle Width="8%" />
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderEndDate" Text="終了日"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblEndDate" Text='<%# Bind("EndDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderStyle Width="16%" />
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderCategory" Text="カテゴリ"></asp:Label>
                        </HeaderTemplate>
                        
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCategory" Text='<%# Bind("Category") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderStyle Width="16%" />
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderSupplier" Text="仕入先"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblSuppliers" Text='<%# Bind("Suppliers_ID") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderStyle Width="14%" CssClass="text-center" />
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderBrand" Text="ブランド"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblBrandID" Text='<%# Bind("Brand_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderStyle Width="10%" CssClass="text-center" />
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderApplyType" Text="申請区分"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblApplyTypeID" Text='<%# Bind("ApplyType_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderMDManagement" Text="ＭＤ管理表"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblMDManagement" Text='<%# Bind("MD_Management") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" Width="7%" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="headerCurrentStage" Text="現在"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                              <asp:Label runat="server" ID="currentstage" Text='<%# Bind("Current_Stage") %>'></asp:Label>
                        </ItemTemplate>
                        
                                    <HeaderStyle CssClass="text-center" Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderIsFinished" Text="完了"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chkIsFinished" Enabled="false" Checked='<%# Bind("IsFinished") %>' />
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" Width="4%" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></HeaderTemplate>
                        <HeaderStyle CssClass="col-md-2 text-center" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <a id="btneidt" class="btn btn-info btn-xs" runat="server" onserverclick="btnEdit1_Click" style ="background-color :#337ab7">
                                <span class="glyphicon glyphicon-edit" aria-hidden="true">指示書</span>
                            </a>                            
                        </ItemTemplate>
                        <ItemStyle CssClass="text-center" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div> 
                        <div class="panel-footer ckmdiv">
                 <div id="Div4" runat="server" class="ckmdiv">
    <p style="text-align:center; top:400px;"><asp:label id="ckm" CssClass="ckm" runat="server" Text="Capital Knowledge Myanmar"> </asp:label>
   
      <img src="../Images/11140079_1632197250333718_8925207411363483344_n.jpg" style="height:20px;width:20px" /> </p>
</div>
                </div>
    </div>
    <script src="../Scripts/chosen.jquery.js"></script>
</asp:Content>
