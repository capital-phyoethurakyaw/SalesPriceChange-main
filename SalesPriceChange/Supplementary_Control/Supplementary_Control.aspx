<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="Supplementary_Control.aspx.cs" Inherits="SalesPrice.Supplementary_Control.Supplementary_Control" %>
<%@ Register Src="~/IntegerTextbox.ascx" TagPrefix="uc2" TagName="IntegerTextbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        //entry form
        function openModal() {
            //$('#myModal').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal').modal('show');
            document.getElementById("<%= searchPanel.ClientID%>").style.display = "block";
        }

        function SaveState() {
            var divid = document.getElementById("<%=searchPanel.ClientID%>");
            var d = divid.style.display;
            if (d == "none")
                $(divid).slideDown('slow');

            else
                $(divid).slideUp('slow');
        }


        //success
        function openModal1(text) {
            $('#myModal1').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal1').modal('show');
        }

        //error
        function openModal2(text) {
            $('#myModal2').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal2').modal('show');
        }

        //delete
        function openModal3(text) {
            $('#myModal3').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal3').modal('show');
        }

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
            document.getElementById("<%=txtProcessDate.ClientID%>").onfocusout = function () {

                                            var dore = document.getElementById("<%=txtProcessDate.ClientID%>");
                                            var bobo = dore.value.toString();
                                            var lastPart1 = bobo.split("/").pop();
                                            var yy = bobo.split("/")[1];
                                            var zz = bobo.split("/")[0];
                                            var x = parseInt(lastPart1, 10);
                                            var y = parseInt(yy, 10);
                                            var z = parseInt(zz, 10);
                                            if (z > 2000 && z < 2100 && y > 0 && y < 13 && x > 0 && x < 32 && (dore.value.length) > 7 && (dore.value.length) < 11) {
                                                return true;
                                            }
                                            else {
                                                dore.value = "";
                                            }
                                        }
                                    });
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
            document.getElementById("<%= txtSDate.ClientID%>").onfocusout = function () { myFunction() };
            function myFunction() {
                var fwo = document.getElementById("<%=txtSDate.ClientID%>");
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
    <style type="text/css">
        .datepick {
            z-index: 1051 !important;
        }

        input[type=checkbox] {
            transform: scale(2.3);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField runat="server" ID="hfState" Value="collapse" />

    <div class="panel panel-info panel-table">
        <div class="panel-heading" style="background-color: #337ab7; color: white;">
            <div class="row">
                <div class="col col-xs-6">
                    <h1 class="panel-title"><b style="font-weight: bold; font-size: 20px;">補填管理表一覧</b></h1>
                </div>
            </div>
            <br />
        </div>
        <asp:Panel ID="Panel1" runat="server" class="panel-body">
            <asp:Panel runat="server" ID="searchPanel">
                <div class="panel panel-default panel-table" style="height: 180px">
                    <div class="panel-heading" style="height: 30px;">
                        <div class="row">
                            <div class="text-center">
                                <h3 class="panel-title"><b>検索</b></h3>
                            </div>
                        </div>
                    </div>

                    <table style="width: 100%; margin-top: 1%;">
                        <tr>
                            <td>
                                <div style="display: table-cell; width: 70px; text-align: right">
                                    <asp:Label ID="Label6" runat="server" Text="申請番号:" Width="70px"></asp:Label>
                                </div>

                            </td>
                            <td style="padding-bottom: 10px">
                                <div style="display: table-cell; padding-left: 10px">
                                    <asp:TextBox runat="server" ID="txtSApplyNo" Width="130px"></asp:TextBox>
                                </div>
                            </td>
                            <td>
                                <div style="display: table-cell; padding-left: 10px; text-align: right">
                                    <asp:Label ID="Label20" runat="server" Text="仕入先:" Width="70px"></asp:Label>
                                </div>

                            </td>
                            <td>
                                <div style="display: table-cell; padding-left: 10px">
                                    <asp:DropDownListChosen ID="ddlSupplier_Name" runat="server" Height="40px" Width="180px"
                                        DataPlaceHolder="---選択---" AllowSingleDeselect="true">
                                    </asp:DropDownListChosen>
                                </div>
                            </td>
                            <td>
                                <div style="display: table-cell; text-align: right">
                                    <%--padding-left:10px;--%>
                                    <asp:Label ID="Label19" runat="server" Text="ブランド:" Width="70px"></asp:Label>
                                </div>

                            </td>
                            <td>
                                <div style="display: table-cell; padding-left: 10px">
                                    <asp:DropDownListChosen ID="ddlBrand_Name" runat="server" Height="40px" Width="170px"
                                        DataPlaceHolder="---選択---" AllowSingleDeselect="true">
                                    </asp:DropDownListChosen>
                                </div>
                            </td>
                            <td>
                                <div style="display: table-cell; padding-left: 10px; text-align: right">
                                    <asp:Label ID="Label21" runat="server" Text="補填内容:" Width="70px"></asp:Label>
                                </div>

                            </td>
                            <td>
                                <div style="display: table-cell; padding-left: 10px">
                                    <asp:TextBox runat="server" ID="txtSContent" Width="130px"></asp:TextBox>
                                </div>
                            </td>
                            <%--<td>                
                                        <div style="display: table-cell;width:70px;text-align:right">
                                              <asp:Label ID="Label22" runat="server" Text="金額:" Width="70px"></asp:Label>
                                          </div>
                                          
                           </td>                
                            <td>                
                                             <div style="display: table-cell;padding-left:10px;width:130px">
                                              <uc2:IntegerTextbox runat="server" ID="txtSAmount"/>
                                          </div>     
                           </td> --%>
                            <td>
                                <div style="display: table-cell; width: 70px; text-align: right;">
                                    <asp:Label ID="Label29" runat="server" Text="補填完了:" Width="75px"></asp:Label>
                                </div>
                            </td>
                            <td>
                                <div style="display: table-cell; padding-left: 10px">
                                    <asp:DropDownListChosen ID="ddlSIsFinished" runat="server" Height="40px" Width="120px" DataPlaceHolder="---選択---" AllowSingleDeselect="true"></asp:DropDownListChosen>
                                </div>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <div style="display: table-cell; width: 70px; padding-left: 10px; text-align: right;">
                                    <asp:Label ID="Label10" runat="server" Text="補填種別:" Width="70px"></asp:Label>
                                </div>

                            </td>
                            <td style="padding-bottom: 10px">
                                <div style="display: table-cell; padding-left: 10px">
                                    <asp:DropDownListChosen ID="ddlSCompensation" runat="server" Height="40px" Width="130px"
                                        DataPlaceHolder="---選択---" AllowSingleDeselect="true">
                                    </asp:DropDownListChosen>
                                </div>
                            </td>
                            <td>


                                <div style="display: table-cell; width: 70px; text-align: right; padding-top: 10px; padding-left: 10px">
                                    <asp:Label ID="Label12" runat="server" Text="備考:" Width="70px"></asp:Label>
                                </div>


                            </td>
                            <td>

                                <div style="display: table-cell; padding-left: 10px">
                                    <asp:TextBox runat="server" ID="txtSRemark" Width="130px"></asp:TextBox>
                                </div>

                            </td>
                            <td>

                                <div style="display: table-cell; width: 70px; text-align: right; padding-top: 10px">
                                    <asp:Label ID="Label14" runat="server" Text="納品書日:" Width="70px"></asp:Label>
                                </div>

                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td style="width: 160px">
                                            <div id="Div19" class="input-group date form_date_top col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="padding-left: 10px">
                                                <asp:TextBox runat="server" MaxLength="10" ID="txtSDate" Style="width: 90px; text-align: left;" onkeydown="return DateFormat(this, event.keyCode)" onblur="myFunction()" placeholder="yyyy/mm/dd"></asp:TextBox>
                                                <div id="Div23" runat="server" class="input-group-addon" style="vertical-align: middle; height: 20px">
                                                    <div id="Div24" runat="server" class="glyphicon glyphicon-calendar" style="vertical-align: middle; margin-bottom: -7px"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <label style="vertical-align: middle; padding-top: 10px">
                                                <asp:CheckBox runat="server" ID="chkBlank" Style="vertical-align: central" Checked /></label>
                                        </td>
                                        <td>
                                            <span style="padding-left: 10px">
                                                <asp:Label runat="server" ID="lblBlank" Text="空白表示"></asp:Label>
                                            </span>

                                        </td>
                                    </tr>
                                </table>


                            </td>
                            <td>
                                <div style="display: table-cell; width: 70px; text-align: right">
                                    <asp:Label ID="Label22" runat="server" Text="金額:" Width="70px"></asp:Label>
                                </div>
                            </td>
                            <td>
                                <div style="display: table-cell; padding-left: 10px; width: 130px">
                                    <%--<uc2:IntegerTextbox runat="server" ID="txtSAmount"/>--%>
                                    <asp:TextBox runat="server" ID="txtSAmount" Width="130px" onkeypress="return isNumber(event);"></asp:TextBox>
                                </div>
                            </td>

                        </tr>
                        <tr>

                            <td>
                                <div style="display: table-cell; width: 80px; text-align: right; padding-top: 10px">
                                    <asp:Label ID="Label26" runat="server" Text="すご楽処理日:" Width="80px"></asp:Label>
                                </div>
                            </td>
                            <td>
                                <div style="display: table-cell; padding-left: 10px">
                                    <%--width:70px;text-align:right;--%>
                                    <div id="Div25" class="input-group date form_date_top col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                        <asp:TextBox runat="server" MaxLength="10" ID="sugo_updated" Style="width: 90px; text-align: left;" onkeydown="return DateFormat(this, event.keyCode)" onblur="myFunction()" placeholder="yyyy/mm/dd"></asp:TextBox>
                                        <div id="Div26" runat="server" class="input-group-addon" style="vertical-align: middle; height: 20px">
                                            <div id="Div27" runat="server" class="glyphicon glyphicon-calendar" style="vertical-align: middle; margin-bottom: -7px"></div>
                                        </div>
                                    </div>
                                </div>
                            </td>


                            <td>
                                <div style="display: table-cell; width: 70px; text-align: right; padding-left: 10px;">
                                    <asp:Label ID="Label28" runat="server" Text="～" Width="70px"></asp:Label>
                                </div>
                            </td>
                            <td>
                                <div style="display: table-cell; padding-left: 10px">
                                    <%--width:70px;text-align:right;--%>
                                    <div id="Div20" class="input-group date form_date_top col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                        <asp:TextBox runat="server" MaxLength="10" ID="sugo_updated_2" Style="width: 90px; text-align: left;" onkeydown="return DateFormat(this, event.keyCode)" onblur="myFunction()" placeholder="yyyy/mm/dd"></asp:TextBox>
                                        <div id="Div21" runat="server" class="input-group-addon" style="vertical-align: middle; height: 20px">
                                            <div id="Div22" runat="server" class="glyphicon glyphicon-calendar" style="vertical-align: middle; margin-bottom: -7px"></div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div style="display: table-cell; width: 70px; text-align: right; padding-top: 10px">
                                    <asp:Label ID="Label24" runat="server" Text="開始日:" Width="70px"></asp:Label>
                                </div>


                            </td>
                            <td>
                                <div style="display: table-cell; width: 70px; text-align: right; padding-left: 10px">
                                    <div id="Div10" class="input-group date form_date_top col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                        <asp:TextBox runat="server" MaxLength="10" ID="Start_date" Style="width: 90px; text-align: left;" onkeydown="return DateFormat(this, event.keyCode)" onblur="myFunction()" placeholder="yyyy/mm/dd"></asp:TextBox>
                                        <div id="Div11" runat="server" class="input-group-addon" style="vertical-align: middle; height: 20px">
                                            <div id="Div12" runat="server" class="glyphicon glyphicon-calendar" style="vertical-align: middle; margin-bottom: -7px"></div>
                                        </div>
                                    </div>
                                </div>


                            </td>
                            <td>
                                <div style="display: table-cell; width: 80px; text-align: right;">
                                    <div style="display: table-cell; width: 80px; text-align: right;">
                                        <asp:Label ID="Label25" runat="server" Text="終了日:" Width="70px"></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div style="display: table-cell; width: 70px; text-align: right; padding-left: 10px">
                                    <div style="display: table-cell; width: 70px; text-align: right;">
                                        <div id="Div13" class="input-group date form_date_top col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                            <asp:TextBox runat="server" MaxLength="10" ID="End_date" Style="width: 90px; text-align: left;" onkeydown="return DateFormat(this, event.keyCode)" onblur="myFunction()" placeholder="yyyy/mm/dd"></asp:TextBox>
                                            <div id="Div14" runat="server" class="input-group-addon" style="vertical-align: middle; height: 20px">
                                                <div id="Div15" runat="server" class="glyphicon glyphicon-calendar" style="vertical-align: middle; margin-bottom: -7px"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td colspan="2">
                                <div style="display: table-cell; width: 70px; text-align: right; padding-left: 20px">
                                    <p>
                                        <a id="A2" onserverclick="btnSearch_Click" class="btn btn-primary btn-md" runat="server">
                                            <span class="glyphicon glyphicon-search" aria-hidden="true" style="vertical-align: middle;">
                                                <asp:Label ID="Label11" runat="server" Text="検索する"></asp:Label>
                                            </span>
                                        </a>
                                    </p>
                                </div>
                            </td>
                        </tr>

                    </table>




                </div>
            </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td>
                        <button type="button" onclick="SaveState()" class="btn btn-default">検索パネル</button>

                        <button id="ddf" runat="server" class="btn btn-primary btn-md" onserverclick="export_Click" style="text-align: center">
                            <span class="glyphicon glyphicon-export" aria-hidden="true" style="vertical-align: middle;">エクスポート</span>
                        </button>

                        <a id="A1" class="btn btn-success btn-md text-right" runat="server" onserverclick="btnAdd_Click">
                            <asp:Label ID="Label13" runat="server" Text="補填管理表を追加する"></asp:Label>
                        </a>
                    </td>
                    <td>
                        <asp:Label ID="lbl_gin" runat="server" Text="金額合計:"></asp:Label>
                        <asp:Label ID="lbl_ginko" runat="server" Text="0"></asp:Label>
                    </td>
                    <td style="float: right">


                        <asp:Label ID="Label15" runat="server" Text="Page Size:"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlPageSize" AutoPostBack="true" Height="30px" OnSelectedIndexChanged="gvSupplementary_Indexchanged" Width="50px">

                            <asp:ListItem Text="30" Value="30"></asp:ListItem>
                            <asp:ListItem Text="50" Value="50"></asp:ListItem>
                            <asp:ListItem Text="100" Value="100"></asp:ListItem>
                        </asp:DropDownList>
                    </td>

                    <td style="float: right">
                        <asp:Label ID="Label17" runat="server" Text="Total_Count:"></asp:Label>
                        <asp:Label runat="server" ID="lblrowCount" Text="0" />

                        <asp:Label ID="Label16" runat="server" Text="    Go To:"></asp:Label>
                        <asp:TextBox Width="30px" runat="server" ID="txtgoto" onkeypress="return isNumber(event)" Style="border: 1px solid grey; border-radius: 4.5px; background-color: #F5F5F5; vertical-align: middle;" Height="30px"></asp:TextBox>
                        <button id="Button3" type="button" class="btn btn-primary" runat="server" onserverclick="btnGoto_Click">
                            <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
                        </button>

                    </td>

                </tr>
            </table>

            <asp:GridView runat="server" ShowHeaderWhenEmpty="true" ID="gvSupplementary" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover"
                AllowPaging="true" OnPageIndexChanging="gvInstruction_paging" HeaderStyle-CssClass="header_dashboard" PagerSettings-Mode="NumericFirstLast" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#337AB7" PageSize="30" Style="text-align: center">
                <Columns>
                    <asp:TemplateField Visible="false">
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderID" Text="ID"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblID" Text='<%# Bind("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="col-md-1" HeaderStyle-CssClass="text-center">
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderApplyNo" Text="申請番号"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblApplyNo" Text='<%# Bind("ApplyNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="col-md-1" HeaderStyle-CssClass="text-center">
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderSupplier" Text="仕入先"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblSuppliers" Text='<%# Bind("Supplier") %>'></asp:Label>
                            <asp:Label runat="server" CssClass="displaynone" ID="lblSuppliers_ID" Text='<%# Bind("Suppliers_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="col-md-1">
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderBrand" Text="ブランド"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblBrand" Text='<%# Bind("Brand") %>'></asp:Label>
                            <asp:Label runat="server" CssClass="displaynone" ID="lblBrandID" Text='<%# Bind("Brand_ID") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="col-md-2">
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderContent" Text="補填内容"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblContent" Text='<%# Bind("Content") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="col-md-2">
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderContent" Text="開始日"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="start_date" Text='<%# Bind("Start_Date") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="col-md-2">
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderContent" Text="終了日"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="end_date" Text='<%# Bind("End_Date") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="col-md-1">
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderAmount" Text="金額"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblAmount" Text='<%# Bind("Amount") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                        <ItemStyle CssClass="text-right" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="col-md-1">
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderCType" Text="補填種別"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCompensationType" Text='<%# Bind("Compensation_Type") %>'></asp:Label>
                            <asp:Label runat="server" CssClass="displaynone" ID="lblCompensationTypeID" Text='<%# Bind("Compensation_TypeID") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="col-md-2">
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderRemark" Text="備考"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblRemark" Text='<%# Bind("Remark") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="col-md-1">
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderProcessDate" Text="納品書日"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblProcessDate" Text='<%# Bind("Process_Date") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="col-md-1 text-center">
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderIsFinished" Text="補填完了"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblIsFinished" Text='<%# Bind("IsFinished") %>'></asp:Label>
                            <asp:Label runat="server" CssClass="displaynone" ID="lblIsFinishedID" Text='<%# Bind("IsFinishedID") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="col-md-1 text-center">
                        <HeaderTemplate>
                            <asp:Label runat="server" ID="lblHeaderUpdatedDate" Text="すご楽処理日"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblUpdatedDate" Text='<%# Bind("Updated_Date") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="col-md-2 text-center">
                        <HeaderTemplate><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></HeaderTemplate>
                        <HeaderStyle />
                        <ItemTemplate>
                            <a id="btnedit" class="btn btn-info btn-xs" onserverclick="btnEdit_Click" runat="server" style="background-color: #337ab7">
                                <span class="glyphicon glyphicon-edit" aria-hidden="true">
                                    <asp:Label runat="server" ID="lblEdit" Text=" 編集"></asp:Label>
                                </span>
                            </a>
                            <a id="btnDelete" class="btn btn-danger btn-xs" runat="server" onserverclick="btnDelete_Click">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true">
                                    <asp:Label runat="server" ID="lbldel" Text=" 削除"></asp:Label>
                                </span>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:Panel>
        <div class="panel-footer ckmdiv">
            <div>
                <p style="text-align: center; top: 400px;">
                    Capital Knowledge Myanmar
   <%--<img src="../Images/11140079_1632197250333718_8925207411363483344_n.jpg" />--%>
                    <img src="../Images/11140079_1632197250333718_8925207411363483344_n.jpg" style="height: 20px; width: 20px" />
                </p>
            </div>
        </div>
    </div>
    <div id="myModal" class="modal fade" role="document">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header modal-header-info ckmdiv" style="background-color: #337AB7">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><b>補填管理表</b></h4>
                </div>
                <div class="modal-body">
                    <div class="container" style="margin-left: 130px;">
                        <div class="row">
                            <table id="Table1" runat="server" class="tableEntry112">
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Label ID="lblID" CssClass="displaynone" runat="server"></asp:Label>
                                        <asp:Label ID="Label8" runat="server" Text="申請番号:" Width="70px"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px">
                                        <asp:TextBox runat="server" ID="txtApplyNo" CssClass="text-center" Enabled="false" Width="214px" Height="30px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-top: 10px">
                                        <asp:Label ID="lblSupplier" runat="server" Text="仕入先:" Width="70px"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px; padding-top: 10px">
                                        <asp:DropDownListChosen ID="ddlSupplier" runat="server" Height="40px" Width="180px"
                                            DataPlaceHolder="---選択---" AllowSingleDeselect="true">
                                        </asp:DropDownListChosen>
                                        <asp:RequiredFieldValidator InitialValue="-1" ID="Req_ID"
                                            ValidationGroup="g1" runat="server" ControlToValidate="ddlSupplier"
                                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-top: 10px">
                                        <asp:Label ID="Label1" runat="server" Text="ブランド:" Width="70px"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px; padding-top: 10px">
                                        <asp:DropDownListChosen ID="ddlBrand" runat="server" Height="40px" Width="180px"
                                            DataPlaceHolder="---選択---" AllowSingleDeselect="true">
                                        </asp:DropDownListChosen>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="ddlBrand" ErrorMessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />

                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-top: 10px">
                                        <asp:Label ID="Label2" runat="server" Text="補填内容:"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px; padding-top: 10px">
                                        <asp:TextBox runat="server" Width="214px" Height="30px" ID="txtContent"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-top: 10px">
                                        <asp:Label ID="Label3" runat="server" Text="金額:"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px; padding-top: 10px">
                                        <uc2:IntegerTextbox runat="server" ID="txtAmount" instyle="width:215px; text-align:right" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-top: 10px">
                                        <asp:Label ID="Label4" runat="server" Text="補填種別:"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px; padding-top: 10px">
                                        <asp:DropDownListChosen ID="ddlCompensationType" runat="server" Height="40px" Width="220px"
                                            DataPlaceHolder="---選択---" AllowSingleDeselect="true">
                                        </asp:DropDownListChosen>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="ddlCompensationType" ErrorMessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />

                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-top: 10px">
                                        <asp:Label ID="Label5" runat="server" Text="備考:"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px; padding-top: 10px">
                                        <asp:TextBox runat="server" ID="txtRemark" TextMode="MultiLine" Width="214px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-top: 10px">
                                        <asp:Label ID="lblProcessDate" runat="server" Text="納品書日:"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px; padding-top: 10px">

                                        <div id="Div7" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="width: 215px">
                                            <asp:TextBox runat="server" MaxLength="10" ID="txtProcessDate" CssClass="moretable" Style="height: 30px; text-align: center; border-top-right-radius: 0px; border-bottom-right-radius: 0px;" Enabled="true" Width="165px" onkeydown="return DateFormat(this, event.keyCode)"></asp:TextBox>
                                            <div id="Div8" runat="server" class="input-group-addon" style="line-height: 0 !important; padding-top: initial; border: 1px solid #C4C4C4; border-radius: 1.5px; cursor: pointer; border-top-left-radius: 0px; border-bottom-left-radius: 0px; cursor: pointer;">
                                                <div id="Div9" runat="server" class="glyphicon glyphicon-calendar" style="margin-left: 0px; font-size: 20px; border: 1px solid transparent; margin-top: 0px; margin-left: 0px; font-size: 20px; border: 1px solid transparent; margin-top: 0px;"></div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-top: 10px">
                                        <asp:Label ID="Label18" runat="server" Text="開始日:" Width="70px"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px; padding-top: 10px">

                                        <div id="Div1" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="width: 215px">
                                            <asp:TextBox runat="server" MaxLength="10" ID="TextBox1" CssClass="moretable" Style="height: 30px; text-align: center; border-top-right-radius: 0px; border-bottom-right-radius: 0px;" Enabled="true" Width="165px" onkeydown="return DateFormat(this, event.keyCode)"></asp:TextBox>
                                            <div id="Div2" runat="server" class="input-group-addon" style="line-height: 0 !important; padding-top: initial; border: 1px solid #C4C4C4; border-radius: 1.5px; cursor: pointer; border-top-left-radius: 0px; border-bottom-left-radius: 0px; cursor: pointer;">
                                                <div id="Div3" runat="server" class="glyphicon glyphicon-calendar" style="margin-left: 0px; font-size: 20px; border: 1px solid transparent; margin-top: 0px; margin-left: 0px; font-size: 20px; border: 1px solid transparent; margin-top: 0px;"></div>
                                            </div>
                                        </div>
                                    </td>


                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-top: 10px">
                                        <asp:Label ID="Label23" runat="server" Text="終了日:" Width="70px"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px; padding-top: 10px">

                                        <div id="Div4" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="width: 215px">
                                            <asp:TextBox runat="server" MaxLength="10" ID="TextBox2" CssClass="moretable" Style="height: 30px; text-align: center; border-top-right-radius: 0px; border-bottom-right-radius: 0px;" Enabled="true" Width="165px" onkeydown="return DateFormat(this, event.keyCode)"></asp:TextBox>
                                            <div id="Div5" runat="server" class="input-group-addon" style="line-height: 0 !important; padding-top: initial; border: 1px solid #C4C4C4; border-radius: 1.5px; cursor: pointer; border-top-left-radius: 0px; border-bottom-left-radius: 0px; cursor: pointer;">
                                                <div id="Div6" runat="server" class="glyphicon glyphicon-calendar" style="margin-left: 0px; font-size: 20px; border: 1px solid transparent; margin-top: 0px; margin-left: 0px; font-size: 20px; border: 1px solid transparent; margin-top: 0px;"></div>
                                            </div>
                                        </div>
                                    </td>


                                </tr>

                                <tr>
                                    <td style="text-align: right;">
                                        <asp:Label ID="Label7" runat="server" Text="補填完了:"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px; padding-top: 10px">
                                        <asp:DropDownListChosen ID="ddlisFinished" runat="server" Height="40px" Width="220px"
                                            DataPlaceHolder="---選択---"
                                            AllowSingleDeselect="true">
                                        </asp:DropDownListChosen>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="ddlisFinished" ErrorMessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />

                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="btnSave" type="button" class="btn btn-primary" data-dismiss="modal" runat="server" onserverclick="btnSave_Click">
                        <span class="glyphicon glyphicon-save"
                            aria-hidden="true"></span>
                        <asp:Label ID="lblSave" runat="server" Text="登録"></asp:Label>
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">閉じる</button>
                </div>
            </div>

        </div>
    </div>
    <div id="myModal1" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header modal-header-success">
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
    <div id="myModal2" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header modal-header-danger">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Alert</h4>
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
    <div id="myModal3" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header modal-header-danger">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">確認</h4>
                </div>
                <div class="modal-body">
                    <p></p>
                </div>
                <div class="modal-footer">
                    <asp:Label runat="server" ID="lblDelID" Visible="false"></asp:Label>
                    <asp:Label runat="server" ID="lblDelDescription" Visible="false"></asp:Label>
                    <button type="button" runat="server" id="btnConfirmDelete" class="btn btn-danger" data-dismiss="modal" onserverclick="btnConfirmDelete_Click">削除</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
                </div>
            </div>

        </div>
    </div>




    <link href="Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="Styles/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
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
            showTrigger: '#calImg',
            today: 1,
            pickerPosition: 'top-left'




        });
        $('.form_date_top').datetimepicker({

            showOnFocus: false,
            weekStart: 1,
            clearBtn: 1,
            autoclose: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            picktime: false,
            format: "yyyy/mm/dd",
            showTrigger: '#calImg',
            today: 1,
            pickerPosition: 'bottom-left'




        });
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

    <script>
        var isopened = false;
        $(document).ready(function () {

            //$('#ddlSupplier').chosen();
            $('.search_ddl').chosen();

            $('body').on('focus', '.chosen-container-single input', function () {
                if (!$(this).closest('.chosen-container').hasClass('chosen-container-active')) {
                    $(this).closest('.chosen-container').trigger('mousedown');
                    //or use this instead
                    //$('#select').trigger('liszt:open');
                }
            });
        });
    </script>
    <script src="../Scripts/chosen.jquery.js"></script>
    <script>
        window.onunload = refreshParent;
        function refreshParent() {
            window.opener.location.reload();
        }
    </script>
</asp:Content>
