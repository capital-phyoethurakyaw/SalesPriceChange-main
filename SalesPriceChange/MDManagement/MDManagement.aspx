<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="MDManagement.aspx.cs" Inherits="SalesPrice.MDManagement.MDManagement" %>

<%@ Register Src="~/IntegerTextbox.ascx" TagPrefix="uc1" TagName="IntegerTextbox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://www.w3schools.com/icons/fontawesome_icons_webapp.asp" rel="stylesheet" />
 
   
    <link href="../Styles/bootstrap-toggle.min.css" rel="stylesheet" />

    <script src="../Scripts/bootstrap-toggle.min.js"></script>


    <script type="text/javascript" src="../Scripts/jquery-3.2.0.min.js"></script>
     <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="../Styles/Common.css" rel="stylesheet" />

    <script>

        $('html').bind('keypress', function (e) {
            if (e.keyCode == 13) {
                return false;
            }
            if (window.event.keyCode == 13)
                return false;
        });
    </script>
    <script type="text/javascript">
        function openModal() {
            $('#myModal').modal('show');
        }

        function SaveState() {
            var divid = document.getElementById("<%=searchPanel.ClientID%>");
            var hv = document.getElementById("ContentPlaceHolder1_panel");
            //alert(hv);
            var d = divid.style.display;
            if (d == "none") {
                $(divid).slideDown('slow');
                hv.value = "1";
            }
            else {
                $(divid).slideUp('slow');
                hv.value = "0";
            }
        }


        //success
        function openModal1(text) {
            $('#myModal2').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal2').modal('show');
        }

        //error
        function openModal2(text) {
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

    <script>
        $(document).ready(function () {
            $(".numbers").each(function () {
                $(this).format({ format: "#,###", locale: "us" });
            });
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
                    todayBtn: 1,
                    //language: 'es',
                    //format: 'yyyy-mm-dd',
                    //clearBtn: 1,
                    //autoclose: 1,
                    //weekStart: 1,
                    //startView: 2,
                  
                    //forceParse: 0,
                    //minView: 2,
                    //pickerPosition: "bottom-left", todayBtn: 1,
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

    <script type="text/javascript">
        $(document).on('keyup', '.commaSeperate', function () {
            var x = $(this).val();
            var x_val = x.toString().replace(/,/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            $(this).val('');
            $(this).val(x_val);
        });

        $(document).on('change', '.comma', function () {
            var x = $(this).val();
            var x_val = x.toString().replace(/,/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            $(this).val('');
            $(this).val(x_val);
        });
    </script>

    <script type="text/javascript">
        function isNumber1(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            //alert(charCode);
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function Calc() {
            var grid = document.getElementById('<%= gv1.ClientID %>');
            //alert(grid.rows.length);
            var sum = 0;
            for (i = 0; i < grid.rows.length; i++) {
                var install = document.getElementById('ContentPlaceHolder1_gv1_txtAmount_' + i);
                var temp;
                var first1;
                //var install = NaN | 0;

                if (install.value == "" || install.value.toString() == "" || install.value == null) {
                    temp = 0;
                    //alert(temp);
                }
                else {
                    if (install.value.toString().indexOf(",")) {
                        temp = parseFloat(install.value.toString().replace(/,/g, ""));

                    }
                    else {
                        temp = parseFloat(install.value.toString());
                    }
                }
                //else {temp = install.value;}
                //alert(temp);


                //alert(temp);

                sum += parseFloat(temp);

                var bal1 = document.getElementById('ContentPlaceHolder1_txtBalTaxInclude');
                var md1 = document.getElementById('ContentPlaceHolder1_txtMDTaxExclude').value;


                if (md1.toString().indexOf(",")) {
                    first1 = parseFloat(md1.toString().replace(/,/g, ""));
                }
                else {
                    first1 = md1.toString();
                }
                //var bal111= document.getElementById('ContentPlaceHolder1_txtMDTaxExclude');
                //var md1111= document.getElementById('ContentPlaceHolder1_txtMDTaxExclude').value;
                //bal111.value= parseFloat(md1111).toLocaleString();
                bal1.value = parseFloat(first1 - sum).toLocaleString();
                //parseFloat(install.value).toLocaleString();

            }

        }
        function Calculation() {
            var grid1 = document.getElementById('<%= gv1.ClientID %>');
            //alert(grid.rows.length);
            var sum1 = 0;
            for (i = 0; i < grid1.rows.length; i++) {
                var install1 = document.getElementById('ContentPlaceHolder1_gv1_txtAmount_' + i);
                var tempp;
                //var install = NaN | 0;
                if (install1.value == "" || install1.value.toString() == "" || install1.value == null) {
                    tempp = 0;
                }
                else {
                    //tempp = install1.value;

                    if (install1.value.toString().indexOf(",")) {
                        tempp = parseFloat(install1.value.toString().replace(/,/g, ""));

                    }
                    else {
                        tempp = parseFloat(install1.value.toString());
                    }
                }
                sum1 += parseFloat(tempp);

                var bal11 = document.getElementById('ContentPlaceHolder1_txtBalTaxInclude');
                var md21 = document.getElementById('ContentPlaceHolder1_txtMDTaxExclude').value;
                var md11 = isNaN(parseInt(md21)) ? 0 : parseInt(md21);



                var pertax = document.getElementById('ContentPlaceHolder1_txtMDTaxInclude');
                var num = 1;
                var taxRate = $('.ddlTex_Rate').val();

                if (taxRate == 0.08) { num = 1.08 }
                else num = 1.1;

                pertax.value = (Math.round(parseInt(num * parseInt(md11)))).toLocaleString();
                //(Math.round(parseInt( num * parseInt(md11)) )).toString();
                bal11.value = parseFloat(md11 - sum1).toLocaleString();
            }
        }
    </script>

    <%--<script type="text/javascript">
       window.onload ()
        {
            
            alert("FXXK");
            Calc();
            Calculation();
        }
    </script>--%>
    <script type="text/javascript">
        window.onload = function () {
            //alert("FXXK");
            Calc();
            Calculation();
        }
    </script>
    <%--    <script type="text/ecmascript">
        $(document).ready(function () {
            Calc();
            Calculation();
        });
    </script>--%>

    <script type="text/javascript">
        function myOverFunction() {
            Calc();
            Calculation();
        };
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            var bal1 = document.getElementById('ContentPlaceHolder1_txtMDTaxInclude');
            var bal222 = document.getElementById('ContentPlaceHolder1_txtBalTaxInclude');
           
            bal222.value = parseFloat(bal222.value).toLocaleString();
            var bae = IsNaN(bal1.value) ? 0 : (parseFloat(bal1.value));
            bal1.value = bae.toLocaleString();
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
            function myFunction(go) {
                alert(go.value);
                var bobo = go.value.toString();
                var lastPart1 = bobo.split("/").pop();
                var yy = bobo.split("/")[1];
                var zz = bobo.split("/")[0];
                var x = parseInt(lastPart1, 10);
                var y = parseInt(yy, 10);
                var z = parseInt(zz, 10);

                if (z > 2000 && z < 2100 && y > 0 && y < 13 && x > 0 && x < 32 && (go.value.length) > 7 && (go.value.length) < 11) {
                    return true;
                }
                else {
                    go.value = "";
                }
            }
        });
    </script>

    <style>
        .lbRemove {
            background-color: #DD313F;
            color: whitesmoke;
            border: 0;
            padding: 2.5px 3.75px;
            font-size: 14px;
            display: inline-block;
            text-transform: uppercase;
            margin-bottom: 0px;
            margin-top: 0px;
        }

            .lbRemove:hover {
                background-color: #E99292;
                color: white;
            }

        .lbAddrow {
            background-color: #E2939C;
            color: #fff;
            display: inline-block;
            text-transform: uppercase;
        }

            .lbAddrow:hover {
                background: red;
            }

        .upgd {
            vertical-align: middle;
            text-align: center;
        }
    </style>

    <style type="text/css">
        #dpPurchase {
            /*position: relative !important;*/
            position: relative;
            z-index: 1000600;
        }

        .form_date {
            overflow: scroll;
        }

        .modal-body {
            overflow-x: visible!important;
        }
    </style>

    <script type="text/javascript">
        function openModal1(text) {
            $('#myModal1').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal1').modal('show');
        }
    </script>
    <script type="text/javascript">
        function openModal6(text) {
            $('#myModal6').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal6').modal('show');
        }
    </script>
    <script>

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <asp:ScriptManager ID="ScriptManager1" 
    EnablePageMethods="true" 
    EnablePartialRendering="true" runat="server" />--%>
    <asp:HiddenField ID="panel" runat="server" Value="0" OnValueChanged="sdsds" />
    <%-- <input type="hidden" runat="server" id="hnnvalue"  value="0" onchange="sdsds"  />--%>
    <asp:HiddenField runat="server" ID="hfState" Value="collapse" />
    <div id="myModal2" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header-danger">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Wanrning</h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>


    <div class="panel panel-info panel-table">
        <div class="panel-heading" style="background-color: #337ab7; color: white;">
            <div class="row">
                <div class="col col-xs-6">
                    <h1 class="panel-title"><b style="font-weight: bold; font-size: 20px;">ＭＤ管理表一覧</b></h1>
                </div>
            </div>
        </div>
        <div class="panel-body" style="padding: 10px 1.5px 1.5px 1.5px;">
            <div id="searchPanel" runat="server">
                <div class="panel panel-default panel-table" style="height: 130px">
                    <div class="panel-heading" style="height: 30px">
                        <div class="row">
                            <div class="text-center">
                                <h3 class="panel-title"><b>検索</b></h3>
                            </div>
                        </div>
                    </div>
                    <div style="display: table; padding-top: 10px;">
                        <div style="display: table-row">
                            <div style="display: table-cell; width: 70px; text-align: right">
                                <asp:Label ID="Label16" runat="server" Text="申請番号:" Width="70px"></asp:Label>
                            </div>
                            <div style="display: table-cell; padding-left: 10px">
                                <asp:TextBox runat="server" ID="form_ID" Width="130px"></asp:TextBox>
                            </div>
                            <div style="display: table-cell; padding-left: 10px; text-align: right">
                                <asp:Label ID="Label20" runat="server" Text="仕入先:" Width="70px"></asp:Label>
                            </div>
                            <div style="display: table-cell; padding-left: 10px">
                                <asp:DropDownListChosen ID="ddlSupplier" runat="server" Height="40px" Width="220px"
                                    DataPlaceHolder="---選択---" AllowSingleDeselect="true">
                                </asp:DropDownListChosen>
                            </div>
                            <div style="display: table-cell; padding-left: 10px; text-align: right">
                                <asp:Label ID="Label8" runat="server" Text="ブランド:" Width="70px"></asp:Label>
                            </div>
                            <div style="display: table-cell; padding-left: 10px">
                                <asp:DropDownListChosen ID="ddlBrand" runat="server" Height="40px" Width="170px"
                                    DataPlaceHolder="---選択---" AllowSingleDeselect="true">
                                </asp:DropDownListChosen>
                            </div>
                            <div style="display: table-cell; padding-left: 10px; text-align: right">
                                <asp:Label ID="Label9" runat="server" Text="処理内容:" Width="70px"></asp:Label>
                            </div>
                            <div style="display: table-cell; padding-left: 10px">
                                <asp:DropDownListChosen ID="ddlsearch_process" runat="server" Height="40px" Width="130px"
                                    DataPlaceHolder="---選択---" AllowSingleDeselect="true">
                                </asp:DropDownListChosen>
                            </div>
                            <div style="display: table-cell; padding-left: 10px; text-align: right">
                                <asp:Label ID="Label10" runat="server" Text="経理処理:" Width="70px"></asp:Label>
                            </div>
                            <div style="display: table-cell; padding-left: 10px">
                                <asp:TextBox runat="server" ID="txtAccounting" Width="130px"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div style="display: table; padding-top: 7px;">
                        <div style="display: table-row">
                            <div style="display: table-cell; width: 70px; text-align: right;">
                                <asp:Label ID="Label22" runat="server" Text="納品書日:" Width="70px"></asp:Label>
                            </div>
                            <div style="display: table-cell; padding-left: 10px">
                                <div id="Div12" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                    <asp:TextBox runat="server" MaxLength="10" ID="del_start" Style="width: 90px; text-align: left;" onkeydown="return DateFormat(this, event.keyCode)" onblur="myFunction(this)" placeholder="yyyy/mm/dd"></asp:TextBox>
                                    <div id="Div17" runat="server" class="input-group-addon" style="vertical-align: middle; height: 20px">
                                        <div id="Div18" runat="server" class="glyphicon glyphicon-calendar" style="vertical-align: middle; margin-bottom: -7px"></div>
                                    </div>
                                    <asp:Label runat="server" Text="～" Width="30px" Style="text-align: center;"></asp:Label>
                                </div>
                            </div>
                            <div style="display: table-cell; width: 70px; text-align: right">
                                <div id="Div20" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                    <asp:TextBox runat="server" MaxLength="10" ID="del_end" Style="width: 90px; text-align: left;" onkeydown="return DateFormat(this, event.keyCode)" onblur="myFunction()" placeholder="yyyy/mm/dd"></asp:TextBox>
                                    <div id="Div21" runat="server" class="input-group-addon" style="vertical-align: middle; height: 20px">
                                        <div id="Div22" runat="server" class="glyphicon glyphicon-calendar" style="vertical-align: middle; margin-bottom: -7px"></div>
                                    </div>
                                </div>
                            </div>
                            <div style="display: table-cell; width: 70px; text-align: right; padding-top: 10px">
                                <asp:Label ID="Label11" runat="server" Text="すご楽承認日:" Width="100px"></asp:Label>
                            </div>
                            <div style="display: table-cell; padding-left: 10px">
                                <div id="Div2" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                    <asp:TextBox runat="server" MaxLength="10" ID="Appro_Start" Style="width: 90px; text-align: left;" onkeydown="return DateFormat(this, event.keyCode)" onblur="myFunction()" placeholder="yyyy/mm/dd"></asp:TextBox>
                                    <div id="Div3" runat="server" class="input-group-addon" style="vertical-align: middle; height: 20px">
                                        <div id="Div4" runat="server" class="glyphicon glyphicon-calendar" style="vertical-align: middle; margin-bottom: -7px"></div>
                                    </div>
                                    <asp:Label ID="Label12" runat="server" Text="～" Width="30px" Style="text-align: center;"></asp:Label>
                                </div>
                            </div>
                            <div style="display: table-cell; width: 70px; text-align: right">
                                <div id="Div13" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                    <asp:TextBox runat="server" MaxLength="10" ID="Appro_End" Style="width: 90px; text-align: left;" onkeydown="return DateFormat(this, event.keyCode)" onblur="myFunction()" placeholder="yyyy/mm/dd"></asp:TextBox>
                                    <div id="Div14" runat="server" class="input-group-addon" style="vertical-align: middle; height: 20px">
                                        <div id="Div15" runat="server" class="glyphicon glyphicon-calendar" style="vertical-align: middle; margin-bottom: -7px"></div>
                                    </div>
                                </div>
                            </div>
                            <div style="display: table-cell; width: 70px; text-align: right; padding-top: 10px">
                                <asp:Label ID="Label7" runat="server" Text="開始日:" Width="70px"></asp:Label>
                            </div>
                            <div style="display: table-cell; padding-left: 10px">
                                <div id="Div5" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                    <asp:TextBox runat="server" MaxLength="10" ID="date_St" Style="width: 90px; text-align: left;" onkeydown="return DateFormat(this, event.keyCode)" onblur="myFunction()" placeholder="yyyy/mm/dd"></asp:TextBox>
                                    <div id="Div6" runat="server" class="input-group-addon" style="vertical-align: middle; height: 20px">
                                        <div id="Div7" runat="server" class="glyphicon glyphicon-calendar" style="vertical-align: middle; margin-bottom: -7px"></div>
                                    </div>
                                    <asp:Label ID="Label13" runat="server" Text="～" Width="30px" Style="text-align: center;"></asp:Label>
                                </div>
                            </div>
                            <div style="display: table-cell; width: 70px; text-align: right">
                                <div id="Div8" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                    <asp:TextBox runat="server" MaxLength="10" ID="date_En" Style="width: 90px; text-align: left;" onkeydown="return DateFormat(this, event.keyCode)" onblur="myFunction()" placeholder="yyyy/mm/dd"></asp:TextBox>
                                    <div id="Div9" runat="server" class="input-group-addon" style="vertical-align: middle; height: 20px">
                                        <div id="Div10" runat="server" class="glyphicon glyphicon-calendar" style="vertical-align: middle; margin-bottom: -7px"></div>
                                    </div>
                                </div>
                            </div>
                            <div style="display: table-cell; width: 70px; text-align: right; padding-left: 20px">
                                <p>
                                    <a onserverclick="btnSearch_Click" id="A1" class="btn btn-primary btn-md" runat="server" style="width: 90px">
                                        <span class="glyphicon glyphicon-search"></span>検索する
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- <div class="form-group " style="vertical-align:middle">

                <div class="col-md-4">
                    <button type="button" onclick="SaveState()" class="btn btn-default" data-toggle="collapse" data-target="#searchPanel">検索パネル</button>
                    <button id="ddf" runat="server" class="btn btn-primary btn-md" onserverclick="export_Clickc" style="text-align:center">
                        <span class=" 	glyphicon glyphicon-export" aria-hidden="true" style="vertical-align: middle;">エクスポート</span>
                    </button>
                       
                </div>
                     <div class="row" style="vertical-align:middle" >
                       <asp:Label ID="Label15" runat="server" Text="合計金額" Width="150px" style="text-align:center;vertical-align:middle"></asp:Label><asp:Label ID="lblTotal_Results" runat="server" Text="" Width="30px" style="text-align:center;"></asp:Label> 
            <asp:Label ID="Label14" runat="server" Text="経理処理合計金額" Visible="false" Width="150px" style="display:inline-block;width:200px;text-align:center;vertical-align:middle; padding-left:50px"></asp:Label><asp:Label ID="lblTotal_Results_next" Visible="false" runat="server" Text="" Width="30px" style="text-align:center;"></asp:Label> 
                    <div class="col" style="background-color:white; padding-bottom:5px">
                        <div> 
                            <div class="pull-right" style="margin-top:-20px">
                            Total_Count:<asp:Label runat="server" id="lblrowCount" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Page Size:
                            <asp:DropDownList runat="server" ID="ddlPageSize" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" Height="30px" Width="50px">
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                <asp:ListItem Text="30" Selected="True" Value="30"></asp:ListItem>
                                <asp:ListItem Text="50"  Value="50"></asp:ListItem>
                            </asp:DropDownList>
                          
                            <div class="pull-right" style="margin-right:30px">
                                Go To:
                                <asp:TextBox Width="30px" runat="server" ID="txtGoto" onkeypress="return isNumber(event)" Height="30px" style="border:1px solid grey; border-radius:4.5px; background-color :#FFFFFF; vertical-align:middle"></asp:TextBox>                              
                                <button id="btnGoto" type="button" class="btn btn-primary" runat="server" onserverclick="btnGoto_Click" >
                                <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span></button>
                            
                            </div>
                                  </div>
                   
                        </div>
                    </div>
                </div>
                  
         
            </div>--%>

            <table style="padding-bottom: 20px !important; width: 100%; margin-bottom:20px !important">
                <tr>

                    <td>
                        <button type="button" onclick="SaveState()" class="btn btn-default" data-toggle="collapse" data-target="#searchPanel">検索パネル</button>

                        <button id="ddf" runat="server" class="btn btn-primary btn-md" onserverclick="export_Clickc" style="text-align: center">
                            <span class=" 	glyphicon glyphicon-export" aria-hidden="true" style="vertical-align: middle;">エクスポート</span>
                        </button>
                    </td>


                    <td>


                        <asp:Label ID="Label15" runat="server" Text="合計金額 -" Style="text-align: center; vertical-align: middle"></asp:Label>
                        <asp:Label ID="lblTotal_Results" runat="server" Text="" Width="30px" Style="text-align: center;"></asp:Label>
                        <asp:Label ID="Label14" runat="server" Text="経理処理合計金額" Visible="false" Width="150px" Style="display: inline-block; text-align: center; vertical-align: middle;"></asp:Label><asp:Label ID="lblTotal_Results_next" Visible="false" runat="server" Text="" Width="30px" Style="text-align: center;"></asp:Label>
                    </td>

                   


                    <td>

                        <asp:Label ID="Label17" runat="server" Text="指定日残額合計 -" Style="text-align: center; vertical-align: middle"></asp:Label>
                        <asp:Label ID="nonezero_first" runat="server" Text="0" Width="30px" Style="text-align: center;"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label19" runat="server" Text="残額合計 -" Style="text-align: center; vertical-align: middle"></asp:Label>
                        <asp:Label ID="all_second" runat="server" Text="0" Width="30px" Style="text-align: center;"></asp:Label>
                    </td>

                     <td>Total Count:<asp:Label runat="server" ID="lblrowCount" />
                    </td>

                    <td style="float: right">Page Size:<asp:DropDownList runat="server" ID="ddlPageSize" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" Height="30px" Width="50px">
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        <asp:ListItem Text="20" Value="20"></asp:ListItem>
                        <asp:ListItem Text="30" Selected="True" Value="30"></asp:ListItem>
                        <asp:ListItem Text="50" Value="50"></asp:ListItem>
                    </asp:DropDownList>
                    </td>

                    <td style="float: right">Go To:
                   <asp:TextBox Width="30px" runat="server" ID="txtGoto" onkeypress="return isNumber(event)" Height="30px" Style="border: 1px solid grey; border-radius: 4.5px; background-color: #FFFFFF; vertical-align: middle"></asp:TextBox>
                        <button id="btnGoto" type="button" class="btn btn-primary" runat="server" onserverclick="btnGoto_Click">
                            <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
                        </button>
                    </td>
                </tr>
            </table>






            <%--<asp:TextBox runat="server" ID="get_val" Text="1" Style=" font-size: 1px; width: 1px; height: 1px;"></asp:TextBox>--%>

            <%--<asp:Label ID="getval" Text="1" runat="server"  style="visibility:hidden"></asp:La--%>
           <asp:HiddenField ID="getval" runat="server" Value="1"/>
            <asp:HiddenField ID="getvala" runat="server" Value="all"/>
            <asp:GridView runat="server" ID="gvMDManagement" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" ShowHeaderWhenEmpty="true" HeaderStyle-BackColor="#337ab7" HeaderStyle-ForeColor="White"
             EmptyDataText="データなし"  HeaderStyle-CssClass="ckmdiv"  AllowPaging="true" OnPageIndexChanging="gvSellingPriceUnit_PageIndexChanging"  PagerSettings-Mode="NumericFirstLast" OnRowDataBound="GridView1_RowDataBound" PageSize="30" Style="text-align: center; font-size: 12px">
                <PagerStyle CssClass="pagination-ys" />
                <PagerSettings PageButtonCount="5" />
                <Columns>
                    <asp:TemplateField>
                        <HeaderStyle Width="7%" />
                        <HeaderTemplate>申請番号</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblID" Text='<%# Bind("ID") %>' CssClass="displaynone"></asp:Label>
                            <asp:Label runat="server" ID="lblformno" Text='<%# Bind("FormNo") %>' ToolTip='<%# Eval("FormNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>開始日</HeaderTemplate>
                        <HeaderStyle Width="6%" />
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblstartdate" Text='<%# Bind("StartDate") %>' ToolTip='<%# Eval("StartDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate><span aria-hidden="true">すご楽<br />
                            承認日</span></HeaderTemplate>
                        <HeaderStyle Width="6%" CssClass="text-center" />
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblApproval" Text='<%# Bind("Approval_Date") %>' ToolTip='<%# Eval("Approval_Date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>仕入先</HeaderTemplate>
                        <HeaderStyle Width="14%" />
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblsupplier" Text='<%# Bind("Supplier") %>' ToolTip='<%# Eval("Supplier") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>ブランド</HeaderTemplate>
                        <HeaderStyle Width="12%" />
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblBrand" Text='<%# Bind("Brand") %>' ToolTip='<%# Eval("Brand") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate><span aria-hidden="true">MD金額<br />
                            (税抜) </span></HeaderTemplate>
                        <HeaderStyle Width="6%" />
                        <ItemTemplate>
                            <asp:Label runat="server" ID="md_exc" Text='<%# Bind("MDTaxExclude","{0:N0}") %>' ToolTip='<%# Eval("MDTaxExclude","{0:N0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate><span aria-hidden="true">MD金額<br />
                            (税込) </span></HeaderTemplate>
                        <HeaderStyle Width="6%" />
                        <ItemTemplate>
                            <asp:Label runat="server" ID="md_inc" Text='<%# Bind("MDTaxInclude","{0:N0}") %>' ToolTip='<%# Eval("MDTaxInclude","{0:N0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate><span aria-hidden="true">処理内容</span></HeaderTemplate>
                        <HeaderStyle Width="5.5%" />
                        <ItemTemplate>
                            <asp:Label runat="server" ID="process_content" Text='<%# Bind("Process") %>' ToolTip='<%# Eval("Process") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate><span aria-hidden="true">備考</span></HeaderTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemTemplate>
                            <asp:Label runat="server" ID="remarks" Style="overflow-wrap: break-word; margin: 0 0; padding: 0 0;" Text='<%# Bind("Remarks") %>' ToolTip='<%# Eval("Remarks") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="false">
                        <HeaderTemplate><span aria-hidden="true">経理処理</span></HeaderTemplate>
                        <HeaderStyle Width="4%" />
                        <ItemTemplate>
                            <asp:Label runat="server" ID="acc_process" Text='<%# Bind("Expprocess","{0:N0}") %>' ToolTip='<%# Eval("Expprocess") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--Change this "残額(税抜)" into  "指定日残額" 2.8.2018--%>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <span aria-hidden="true">指定日残額  </span>

                            <input type="checkbox" runat="server" id="current_later" onchange="dd(this,1)"  checked="checked"  data-toggle="toggle" data-on=" ゼロなし" data-off="全部" />
                        </HeaderTemplate>
                        <HeaderStyle Width="7%" />
                        <ItemTemplate>
                            <%--<asp:Label runat="server" ID="bal_tax_exc" Text='<%# Bind("BaltaxInclude","{0:N0}") %>' ToolTip='<%# Eval("BaltaxInclude","{0:N0}") %>'></asp:Label>--%>
                            <asp:Label runat="server" ID="bal_tax_exc" Text='<%# String.Format("{0:N0}",((Convert.ToInt32(Eval("MDTaxExclude"))) - (Convert.ToInt32(Eval("Amount")))) ) %> '></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <span aria-hidden="true">残額(税抜)
                              <input type="checkbox" id="current_latera" runat="server" onchange="dd(this,2)"  data-toggle="toggle" data-on="ゼロなし" data-off="全部" />
                            </span>
                        </HeaderTemplate>
                        <HeaderStyle Width="4%" />
                        <ItemTemplate>
                            <%--Text='<%# String.Format("{0:N0}",((Convert.ToInt32(Eval("MDTaxExclude"))) - (Convert.ToInt32( Eval("M_amount")  )))) %> '--%>
                            <asp:Label runat="server" ID="newfiled" Text='<%# String.Format("{0:N0}",(Convert.ToInt32((Convert.IsDBNull(Eval("MDTaxExclude"))? "0" : Eval("MDTaxExclude")))) - Convert.ToInt32((Convert.IsDBNull(Eval("M_amount"))? "0" : Eval("M_amount"))) ) %> '></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>


                    <%--<%#Convert.ToInt32(Eval("TotalLeave")) -Convert.ToInt32(Eval("LeaveTaken")) %>--%>
                    <%--Text='<%# GetDifference(Eval("TotalIncome"),Eval("TotalCost"))%>'--%>
                    <asp:TemplateField>
                        <HeaderTemplate><span aria-hidden="true">納品書<br />
                            日付</span></HeaderTemplate>
                        <HeaderStyle Width="6%" />
                        <ItemTemplate>
                            <%--change to My_Date 2.8.2018--%>
                            <%--<asp:Label runat="server" ID="deli_date" Text='<%# Bind("Delivery") %>' ToolTip='<%# Eval("Delivery") %>'></asp:Label>--%>
                            <asp:Label runat="server" ID="deli_date" Text='<%# Bind("My_Date") %>' ToolTip='<%# Eval("My_Date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="false">
                        <HeaderTemplate><span aria-hidden="true">仕入処理日</span></HeaderTemplate>
                        <HeaderStyle CssClass="col-md-2 text-center" />
                        <ItemTemplate>
                            <asp:Label runat="server" ID="purc_date" Width="70px" Text='<%# Bind("Purchase") %>' ToolTip='<%# Eval("Purchase") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate><span aria-hidden="true">金額（税抜)</span></HeaderTemplate>
                        <HeaderStyle CssClass="col-md-2 text-center" />
                        <ItemTemplate>
                            <asp:Label runat="server" ID="amount_exc_tax" Width="80px" Text='<%# Bind("M_amount","{0:N0}") %>' ToolTip='<%# Eval("M_amount","{0:N0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></HeaderTemplate>
                        <HeaderStyle CssClass="col-md-2 text-center" />
                        <ItemTemplate>
                            <a id="btnedit" class="btn btn-info btn-xs" onserverclick="btnEdit_Click" runat="server" style="background-color: #337ab7; width: 60px;">
                                <span class="glyphicon glyphicon-edit" aria-hidden="true">
                                    <asp:Label runat="server" ID="lblEdit" Text="編集" Style="text-align: left"></asp:Label>
                                </span>
                            </a>

                            <a id="btndel" class="btn btn-danger btn-xs" runat="server" onserverclick="btnDelete_Click"><span class="glyphicon glyphicon-trash" aria-hidden="true">削除</span></a>
                        </ItemTemplate>
                    </asp:TemplateField>


                </Columns>
            </asp:GridView>

            <div class="panel-footer  ckmdiv">
                <div>
                    <p style="text-align: center; top: 400px;">
                        Capital Knowledge Myanmar
   <%--<img src="../Images/11140079_1632197250333718_8925207411363483344_n.jpg" />--%>
                        <img src="../Images/11140079_1632197250333718_8925207411363483344_n.jpg" style="height: 20px; width: 20px" />
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div id="myModal" class="modal fade" role="document" style="height: 100%">
        <div class="modal-dialog modal-ku" style="overflow-y: auto; height: 100%">
            <div class="modal-content" style="height: 100%">
                <div class="modal-header modal-header-info" style="background-color: #337ab7; color: white;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><b>ＭＤ管理表</b></h4>
                </div>
                <div class="modal-body" style="overflow-y: scroll;">
                    <div id="Div1" runat="server" style="width: 100%; height: auto">
                        <div class="row">
                            <%--<div class="panel-heading" style="height: 30px; background-color:#F0F0F0; width:98%; margin-left:13px">
                                <div class="text-center">
                                    <h3 class="panel-title"><b>編集</b></h3>
                                </div>         
                            </div>--%>
                            <table class="tableEntry11">
                                <tr>
                                    <td style="width: 100px; text-align: right">
                                        <asp:Label ID="lblID" CssClass="displaynone" runat="server"></asp:Label>
                                        <asp:Label ID="lblFormNo" runat="server" Text="申請番号:" Width="100px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" Width="130px" ID="txtFormNo" Enabled="false" Style="text-align: center"></asp:TextBox>
                                    </td>
                                    <td style="width: 100px; text-align: right">
                                        <asp:Label ID="lblStartDate" runat="server" Text="開始日:" Width="100px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" Width="130px" ID="txtStartDate" Enabled="false" Style="text-align: center"></asp:TextBox>
                                    </td>
                                    <td style="width: 100px; text-align: right">
                                        <asp:Label ID="lblBrand" runat="server" Text="ブランド:" Width="100px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtBrand" Enabled="false" Style="text-align: center"></asp:TextBox>
                                    </td>
                                    <td style="width: 70px; text-align: right; padding-left: 10px">
                                        <asp:Label ID="lblSupplier" runat="server" Text="仕入先:" Width="70px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtSupplier" Enabled="false" Width="220px" Style="text-align: center"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; text-align: right; padding-top: 10px">
                                        <asp:Label ID="Label1" runat="server" Text="MD金額(税抜):" Width="100px"></asp:Label>
                                    </td>
                                    <td style="padding-top: 10px">
                                        <asp:TextBox runat="server" Width="130px" ID="txtMDTaxExclude" CssClass="numbers" onkeypress="return isNumber1(event)" OnBlur="Calculation()" Style="text-align: right"></asp:TextBox>
                                    </td>
                                    <td style="width: 100px; text-align: right; padding-top: 10px">
                                        <asp:Label ID="Label2" runat="server" Text="MD金額(税込):" Width="100px"></asp:Label>
                                    </td>
                                   
                                    <td style="padding-top: 10px">
                                        <asp:TextBox Width="130px" runat="server" ID="txtMDTaxInclude" onkeydown="javascript:return false" Style="text-align: right"></asp:TextBox>
                                    </td>
                                    <td style="width: 100px; text-align: right; padding-top: 10px">
                                        <asp:Label ID="Label3" runat="server" Text="処理内容:" Width="100px"></asp:Label>
                                    </td>
                                    <td style="padding-top: 10px">
                                        <asp:DropDownListChosen ID="ddlProcess" runat="server" Width="165px"
                                            DataPlaceHolder="---選択---" AllowSingleDeselect="true">
                                        </asp:DropDownListChosen>
                                        <%--<asp:DropDownList runat="server" ID="ddlProcess" Width="150px" Height="25">
                                            <asp:ListItem Text="-----選択-----" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="値引伝票" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="現物補填" Value="3"></asp:ListItem>
                                        </asp:DropDownList>--%>
                                    </td>
                                    <td rowspan="2" style="width: 50px; text-align: right; padding-top: 10px; margin: initial">
                                        <asp:Label ID="Label6" runat="server" Text="備考:" Width="50px"></asp:Label>
                                    </td>
                                    <td rowspan="2" style="margin: initial; padding-top: 10px">
                                        <asp:TextBox runat="server" ID="txtRemark" TextMode="MultiLine" Width="220px" Height="80px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>

                                    <%--Have been Hidded For this "Accounting treatment"--%>
                                   <%-- <td style="width: 100px; text-align: right; padding-top: 10px">
                                        <asp:Label ID="Label4" runat="server" Width="100px" Visible="false" Text="経理処理:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox Width="130px" runat="server" Visible="false" ID="txtExpProcess" onkeypress="return isNumber(event)" Style="text-align: right"></asp:TextBox>
                                    </td>--%>
                                     <td style="width: 100px; text-align: right; padding-top: 8px">
                                        <asp:Label ID="Label4" runat="server" Text="税率:" Width="100px"></asp:Label>
                                    </td>
                                     <td style="padding-top: 8px">

                                        <asp:DropDownListChosen ID="ddlTex_Rate" CssClass="ddlTex_Rate" runat="server" Width="130px">
                                        </asp:DropDownListChosen>
                                       
                                        <%-- <asp:DropDownList ID="ddlTex_Rate" CssClass="ddlTex_Rate" runat="server" Width="130px" >
                                             <asp:ListItem Value="0.10">10%</asp:ListItem>
                                             <asp:ListItem Value="0.08">8%</asp:ListItem>
                                         </asp:DropDownList>--%>
                                    </td>
                                  
                                    <td style="width: 100px">
                                        <asp:Label Width="100px" ID="Label5" runat="server" Text="残額(税抜):"></asp:Label>
                                    </td>
                                    
                                    <td>
                                        <asp:TextBox runat="server" Width="130px" ID="txtBalTaxInclude" onkeydown="javascript:return false" Style="text-align: right"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="lblApproval" runat="server" Text="すご楽承認日:" Width="100px"></asp:Label>
                                    </td>
                                    <td>
                                        <div class="input-group date form_date col-md-5" id="dlcps" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                            <asp:TextBox runat="server" Width="130px" ID="txtAppro_Date" MaxLength="10" onkeydown="return DateFormat(this, event.keyCode)"></asp:TextBox>
                                            <span id="Span1q2" runat="server" class="input-group-addon" style="height: 24px; cursor: pointer"><span id="Span2q" runat="server" class="glyphicon glyphicon-calendar"></span></span>
                                        </div>


                                    </td>
                                </tr>
                                <tr>
                                    
                                   <%-- <td>
                                        <asp:DropDownList runat="server" CssClass="ddlTex_Rate" Width="165px">
                                                 
                                                    <asp:ListItem Value="0.10">10%</asp:ListItem>
                                                    <asp:ListItem Value="0.08">8%</asp:ListItem>
                                                </asp:DropDownList>
                                    </td>--%>
                                     <%--<td style="padding-top: 10px">
                                        <asp:DropDownListChosen ID="ddlTex_Rate" CssClass="ddlTex_Rate" DataPlaceHolder="--- 10% ---" runat="server" Width="130px">
                                        </asp:DropDownListChosen>
                                       
                                    </td>--%>
                                     <%--Have been Hidded For this "Accounting treatment"--%>
                                      <td style="width: 100px; text-align: right; padding-top: 10px">
                                        <asp:Label ID="Label24" runat="server" Width="100px" Visible="false" Text="経理処理:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox Width="130px" runat="server" Visible="false" ID="txtExpProcess" onkeypress="return isNumber(event)" Style="text-align: right"></asp:TextBox>
                                    </td>
                                    <td hidden>
                                        <asp:TextBox runat="server" ID="ddlTex_Rate_Copy">

                                        </asp:TextBox>
                                    </td>

                                </tr>
                            </table>
                        </div>
                    </div>
                    <div style="background-color: white; overflow: scroll; height: 350px">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional" ChildrenAsTriggers="true">
                            <ContentTemplate>
                                <div class="panel-body">
                                    <asp:GridView runat="server" OnRowDataBound="gv1_RowDataBound" ShowFooter="true" Visible="true" ID="gv1" ShowHeader="true"
                                        HeaderStyle-CssClass="upgd" GridLines="Horizontal" HeaderStyle-HorizontalAlign="center" CssClass="tableEntry1 table table-striped table-bordered table-hover"
                                        AutoGenerateColumns="false" Style="text-align: center" HeaderStyle-BackColor="#337ab7" HeaderStyle-ForeColor="White">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <HeaderTemplate>No</HeaderTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="col_text_1" Style="width: 60px !important;"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderTemplate>納品書日付</HeaderTemplate>
                                                <ItemTemplate>
                                                    <div data-date-container='#myModalId' class="input-group date form_date col-md-5" id="dpc" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="padding-left: 35px; position: relative">
                                                        <asp:TextBox runat="server" ID="dpDelivery" MaxLength="10" CssClass="mama" onkeydown="return DateFormat(this, event.keyCode)" onBlur="ScoreValidation(this)" Text='<%# Bind("Delivery") %>' Style="float: left; border-top-right-radius: 0px; border-bottom-right-radius: 0px; cursor: text; width: 115px; position: relative"></asp:TextBox>
                                                        <span id="Span1" runat="server" class="input-group-addon " style="height: 24px; cursor: pointer"><span id="Span2" runat="server" class="glyphicon glyphicon-calendar"></span></span>
                                                    </div>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="text-center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <div class="input-group date form_date col-md-5" id="dpcq" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="padding-left: 30px; position: relative; display: none">
                                                        <asp:TextBox runat="server" ID="dpPurchase" MaxLength="10" CssClass="mama" onkeydown="return DateFormat(this, event.keyCode)" Text='<%# Bind("Purchase") %>' Style="float: left; border-top-right-radius: 0px; border-bottom-right-radius: 0px; width: 113px; vertical-align: middle"></asp:TextBox>
                                                        <span id="Span1q" runat="server" class="input-group-addon" style="height: 24px; cursor: pointer"><span id="Span2q" runat="server" class="glyphicon glyphicon-calendar"></span></span>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderTemplate>金額（税抜）</HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:TextBox CssClass="noona comma" runat="server" AutoCompleteType="Disabled" ID="txtAmount" Text='<%# Bind("Amount","{0:N0}") %>' onkeypress="return isNumber(event)" Style="width: 150px; text-align: right" OnBlur="Calc()"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemStyle Width="100px" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton12" CssClass="lbRemove" onmouseover="myOverFunction()" Width="80px" runat="server" OnClick="remove_Click" Style="padding-left: 5px; text-decoration: none"> <span class="glyphicon glyphicon-trash"  aria-hidden="true"></span> 削除 </asp:LinkButton>
                                                </ItemTemplate>
                                                <FooterStyle HorizontalAlign="center" />
                                                <FooterTemplate>
                                                    <asp:Button ID="ButtonAdd" runat="server" CssClass="lbAddrow" Text="新しい行を追加" Height="40px" Style="width: 100%; background-color: #4C9ED9" ClientIDMode="Static" OnClick="ButtonAdd_Click" />
                                                </FooterTemplate>
                                                <FooterStyle Height="60px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>






                    </div>
                </div>
                <div class="panel-footer" onmouseover="myOverFunction()" style="padding-top: 50px; background-color: white; border-color: white;" align="center">
                    <button id="btnSave" type="button" onserverclick="btnUpdate_Click" class="btn btn-primary hovers" data-dismiss="modal" runat="server">
                        <span class="glyphicon glyphicon-save"
                            aria-hidden="true"></span>
                        <asp:Label ID="lblSave" runat="server" Text="登録"></asp:Label>
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">閉じる</button>
                </div>
                <div class="input-group date form_date col-md-5" id="dpcq1" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="padding-left: 30px; position: relative; visibility: hidden">
                    <asp:TextBox runat="server" ID="dpPurchase1" MaxLength="10" CssClass="mama" onkeydown="return DateFormat(this, event.keyCode)" Text='<%# Bind("Purchase") %>' Style="float: left; border-top-right-radius: 0px; border-bottom-right-radius: 0px; width: 113px; vertical-align: middle; visibility: hidden; padding-top: 20px"></asp:TextBox>
                    <span id="Span1q1" runat="server" class="input-group-addon" style="height: 24px; cursor: pointer"><span id="Span2q1" runat="server" class="glyphicon glyphicon-calendar"></span></span>
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
    <div id="myModal6" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header-info">
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
    <script>


        // here to retrieve the value of toggle switch insdide gv
        function dd(e, val) {

            var x = document.getElementById('<%= gvMDManagement.ClientID %>').querySelectorAll("div.toggle");
            //var x = document.getElementById('ContentPlaceHolder1_gvMDManagement').querySelectorAll("div.toggle");

            if (val == 1) {
                var x_val = x[0].getAttribute('class');
                if (x_val.indexOf('btn-primary') > -1) {
                    //x[0].setAttribute("runat", "server");
                    //x[0].setAttribute("id", "server");

                    document.getElementById('<%= getval.ClientID %>').value = 1;
                    //document.getElementById("ContentPlaceHolder1_getval").value = 1;

                    document.getElementById('<%= A1.ClientID %>').click();
                    //document.getElementById("ContentPlaceHolder1_A1").click();
                }
                else {
                    document.getElementById('<%= getval.ClientID %>').value = 0;
                    //document.getElementById("ContentPlaceHolder1_getval").value = 0;

                    document.getElementById('<%= A1.ClientID %>').click();
                    //document.getElementById("ContentPlaceHolder1_A1").click();

                }
            }
            else {
                var x_val = x[1].getAttribute('class');
                if (x_val.indexOf('btn-primary')  > -1) {
                    //x[0].setAttribute("runat", "server");
                    //x[0].setAttribute("id", "server");

                    document.getElementById('<%= getvala.ClientID %>').value = 'nonezero';
                    //document.getElementById("ContentPlaceHolder1_getvala").value = 'nonezero';
                    document.getElementById('<%= A1.ClientID %>').click();
                    //document.getElementById("ContentPlaceHolder1_A1").click();
                }
                else {
                    document.getElementById('<%= getvala.ClientID %>').value = 'all';
                    //document.getElementById("ContentPlaceHolder1_getvala").value = 'all';

                    document.getElementById('<%= A1.ClientID %>').click();
                    //document.getElementById("ContentPlaceHolder1_A1").click();

                }

            }

            //var $h = $('#<%=  gvMDManagement.ClientID %>').find('//*[@id="ContentPlaceHolder1_gvMDManagement"]/tbody/tr[1]/th[11]/span/div');
           //var $h = document.evaluate('//*[@id="ContentPlaceHolder1_gvMDManagement"]/tbody/tr[1]/th[11]/span/div', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
       
       }

        //var firstPhoneNumber = document.evaluate('//*[@id="ContentPlaceHolder1_gvMDManagement"]/tbody/tr[1]/th[11]/span/div', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);

        //alert('The first phone number found is ' + firstPhoneNumber.singleNodeValue.textContent);
        //alert('The first phone number found is ' + firstPhoneNumber.singleNodeValue.style.backgroundColor.toString());
        //alert($r.value)
        //}

    </script>
    <script>
        $(document).ready(function () {
            //alert(document.getElementById("ContentPlaceHolder1_getval").value);
            var $h = $('#<%=  gvMDManagement.ClientID %>').find('input[id$="current_later"]');

            if (document.getElementById("ContentPlaceHolder1_getval").value == "1") {
                //x[0].removeAttribute("class");
              
                //alert("on")
                //$('#current_later').prop('checked', true).change(),
                //$h[1].bootstrapToggle('on') ContentPlaceHolder1_gvMDManagement_current_later
            
            }
            else {
                //document.getElementById("ContentPlaceHolder1_gvMDManagement_current_later").removeAttribute("checked");
                //document.getElementById("ContentPlaceHolder1_gvMDManagement_current_later").setAttribute("checked","unchecked");
                //document.getElementById("ContentPlaceHolder1_gvMDManagement_current_later").bootstrapToggle('off')
                //alert("off")
                //$('#current_later').prop('checked', false).change()
                //$h[1].bootstrapToggle('off')
                //alert("off")
            }
        });

    </script>
    <script type="text/javascript">
        function myFunc(a) {
           
            var x = document.getElementById('ContentPlaceHolder1_gvMDManagement').querySelectorAll("div.toggle");
            //var x_val = x[0].getAttribute('class');
        
            if (a == 1) {
              
                //x[0].setAttribute("class", "toggle btn btn-default off");
                //x[0].setAttribute("class", "toggle btn btn-primary");     // for none zero   1
            }
            else {
                //x[0].removeAttribute("class");
                //x[0].setAttribute("class", "toggle btn btn-default off");   // for zero      0
        
            }
        }
</script>
    <script>
        $(window).on("load", function () {
            var $h = $('#<%=  gvMDManagement.ClientID %>').find('input[id$="current_later"]');

            if (document.getElementById("ContentPlaceHolder1_getval").value == "1") {
                //x[0].removeAttribute("class");

                //alert("on")
                //$('#current_later').prop('checked', true).change(),
                //$h[1].bootstrapToggle('on') ContentPlaceHolder1_gvMDManagement_current_later

            }
            else {
                //document.getElementById("ContentPlaceHolder1_gvMDManagement_current_later").removeAttribute("checked");
                //document.getElementById("ContentPlaceHolder1_gvMDManagement_current_later").bootstrapToggle('off')
                //alert("off")
                //$('#current_later').prop('checked', false).change()
                //$h[1].bootstrapToggle('off')
                //alert("off")
            }
           
        }
        )
    </script>
    <script src="../Scripts/chosen.jquery.js"></script>

    <script type="text/javascript">
        $('.ddlTex_Rate').change(function () {
           
            CalculateTax();


             
            
        });

        function CalculateTax() {
 
            var val1 = document.getElementById('<%=txtMDTaxExclude.ClientID%>').value;
            var taxRate = $('.ddlTex_Rate').val();

            if (taxRate == 0.08) {

                var cal_tax = Math.floor((parseFloat(val1)) * 1.08);

                document.getElementById('<%=txtMDTaxInclude.ClientID%>').value = cal_tax.toString();

            }
            else {

                var cal_tax = Math.floor((parseFloat(val1)) * 1.1);

                document.getElementById('<%=txtMDTaxInclude.ClientID%>').value = cal_tax.toString();
            }
        }
    </script>
</asp:Content>

