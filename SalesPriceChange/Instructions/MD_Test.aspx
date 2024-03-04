<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="MD_Test.aspx.cs" Inherits="SalesPrice.Instructions.MD_Test" %>

<%@ Register Src="~/IntegerTextbox.ascx" TagPrefix="uc1" TagName="IntegerTextbox" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-3.2.0.min.js"></script> 
        <link href="../Styles/Common.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.8.3.min.js"></script>
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

        function ClearSelectedDate() {
            $find("_cc1").set_selectedDate(null);
            $("[id*=cc1]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
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
    function openModal() {
        //$('#myModal').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
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
  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12 col-md-offset-0" style="width:auto">
            <div class="panel panel-info panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h1 class="panel-title"><b style="font-weight:bold;  text-shadow: 2px 2px White; font-size:20px;">補填管理表一覧</b></h1>
                        </div>
                    </div>
                    <br />
                </div>
                    <div class="panel-body">
                         

     <asp:Panel runat="server" id="searchPanel" >
                        <div class="panel panel-default panel-table" >
                             <div class="row" style="height:134.8px">
                                 <table style="padding-left:100px;left:100px; margin-left:100px; top:50px; margin-top:50px;">
                                     <tr style="padding-left:100px;">
                                         <td>
                                                    <asp:Label ID="Label10" runat="server" Text="申請番号:" Width="70px"></asp:Label>
                                         </td>
                                         <td>
                                                    <asp:TextBox runat="server" ID="form_ID" Width="120px"></asp:TextBox>
                                         </td>
                                         <td>
                                                    <asp:Label ID="Label8" runat="server" Text="仕入先:" Width="70px"></asp:Label>
                                         </td>
                                         <td>
                                                    <asp:TextBox runat="server" ID="vendor_ID" Width="120px"></asp:TextBox>
                                         </td>
                                         <td>
                                                    <asp:Label ID="Label9" runat="server" Text="ブランド:" Width="70px"></asp:Label>
                                         </td>
                                         <td>
                                                   <asp:TextBox runat="server" ID="stamp_ID" Width="120px"></asp:TextBox>
                                         </td>
                                         <td style="padding-left:50px">
                                               <a id="btnSearch" onserverclick="btnSearch_Click" class="btn btn-primary btn-md"  runat="server">
                                                <span class="glyphicon glyphicon-search" aria-hidden="true" style="vertical-align:middle; "> 
                                                    <asp:Label ID="Label18" runat="server"  Text="検索する"></asp:Label>
                                                </span>   
                                            </a>     
                                         </td>
                                     </tr>
                                 </table>




                             </div>
                         </div>
                         </asp:Panel>
                        <div class="form-group row">
                        <div class="col-md-4">
                            <a id="A1" class="btn btn-success btn-md text-right"  runat="server"  >
                                <asp:Label ID="Label7" runat="server"  Text="補填管理表を追加する"></asp:Label>
                            </a>
                            <button type="button" onclick="SaveState()" class="btn btn-default" >検索パネル</button>
                        </div>
                    </div>
                       


                    <asp:GridView runat="server" ID="gvMDManagement" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover"
                         AllowPaging="true" OnPageIndexChanging="gvSellingPriceUnit_PageIndexChanging"  PagerSettings-Mode="NumericFirstLast" PageSize="8">
                        <Columns>                         
                            <asp:TemplateField>
                                <HeaderTemplate >申請番号</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblID" Text='<%# Bind("ID") %>' CssClass="displaynone"></asp:Label>
                                      <asp:Label runat="server" ID="lblformno" Text='<%# Bind("FormNo") %>'></asp:Label>
                                     </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:TemplateField>
                                <HeaderTemplate>開始日</HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblstartdate" Text='<%# Bind("StartDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>仕入先</HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                <ItemTemplate>                              
                                    <asp:Label runat="server" ID="lblsupplier" Text='<%# Bind("Supplier") %>'></asp:Label>                                               
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>ブランド</HeaderTemplate>
                                <HeaderStyle CssClass="col-md-5 text-center" />
                                <ItemTemplate>
                                <asp:Label runat="server" ID="lblBrand" Text='<%# Bind("Brand") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField>
                                <HeaderTemplate><span  aria-hidden="true"> MDTax_Exclude</span></HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                 <ItemTemplate>
                                         <asp:Label runat="server" ID="md_exc" Width="100px" Text='<%# Bind("MDTaxExclude") %>'></asp:Label> 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate><span  aria-hidden="true">MDTax_Include</span></HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                 <ItemTemplate>
                                         <asp:Label runat="server" ID="md_inc" Width="100px" Text='<%# Bind("MDTaxInclude") %>'></asp:Label> 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate><span  aria-hidden="true">Processing Content</span></HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                 <ItemTemplate>
                                         <asp:Label runat="server" ID="process_content" Width="100px" Text='<%# Bind("Process") %>'></asp:Label> 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate><span  aria-hidden="true">Remarks</span></HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                 <ItemTemplate>
                                         <asp:Label runat="server"  ID="remarks" Width="100px" style="overflow-wrap:break-word" Text='<%# Bind("Remarks") %>'></asp:Label> 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate><span  aria-hidden="true">Account Processing</span></HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                 <ItemTemplate>
                                         <asp:Label runat="server" ID="acc_process" Width="100px" Text='<%# Bind("Expprocess") %>'></asp:Label> 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate><span  aria-hidden="true">Balance<br />(Tax_Exclude)</span></HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                 <ItemTemplate>
                                         <asp:Label runat="server" ID="bal_tax_exc" Width="100px" Text='<%# Bind("BaltaxInclude") %>'></asp:Label> 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate><span  aria-hidden="true">Delivery_Date</span></HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                 <ItemTemplate>
                                         <asp:Label runat="server" ID="deli_date" Width="100px" Text='<%# Bind("Delivery") %>'></asp:Label> 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate><span  aria-hidden="true">Purchase_Date</span></HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                 <ItemTemplate>
                                         <asp:Label runat="server" ID="purc_date" Width="100px" Text='<%# Bind("Purchase") %>'></asp:Label> 
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField>
                                <HeaderTemplate><span  aria-hidden="true">Amount<br />(Tax_Exclude)</span></HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                 <ItemTemplate>
                                         <asp:Label runat="server" ID="amount_exc_tax" Width="100px" Text='<%# Bind("Amount") %>'></asp:Label> 
                                      </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <HeaderTemplate><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></HeaderTemplate>
                                <HeaderStyle CssClass="col-md-2 text-center" />
                                 <ItemTemplate>
                                    <a id="btnedit" class="btn btn-info btn-xs" onserverclick="btnEdit_Click" runat="server" >
                                        <span class="glyphicon glyphicon-edit" aria-hidden="true">
                                            <asp:Label runat="server" ID="lblEdit" Text=" 編集"></asp:Label>
                                        </span>
                                    </a>       
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                        </Columns>
                    </asp:GridView>
                    </div>
            </div>
        </div>
       

    </div>
    <div id="myModal" class="modal fade" role="document">
  <div class="modal-dialog modal-ku" style="overflow-y:auto">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header modal-header-info">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><b>ＭＤ管理表</b></h4>
      </div>
      <div class="modal-body">
            <div class="row">

                <%--Start MD Prepare--%>
                <table class="tableEntry11" style="margin-left:18px; border-collapse: separate; border-spacing:0px 15px">
                    <tr>
                        <td>
                            <asp:Label ID="lblID" CssClass="displaynone" runat="server"></asp:Label>
                            <asp:Label ID="lblFormNo" runat="server" Text="申請番号"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtFormNo" Enabled="false"  style="text-align: center"></asp:TextBox>
                        </td>
                        <td id="Td1" runat="server" >
                            <asp:Label ID="lblStartDate" runat="server" Text="開始日"></asp:Label>
                        </td>
                        <td id="Td2" runat="server" >
                            <asp:TextBox runat="server" ID="txtStartDate" Enabled="false"  style="text-align: center"></asp:TextBox>
                        </td>
                        <td >
                            <asp:Label ID="lblSupplier" runat="server" Text="仕入先"></asp:Label>
                        </td>
                        <td style="padding-left:60px">
                            <asp:TextBox runat="server" ID="txtSupplier" Enabled="false"  style="text-align: center"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblBrand" runat="server" Text="ブランド"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtBrand" Enabled="false"  style="text-align: center"></asp:TextBox>
                        </td>
                    </tr>
                  
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="MD金額(税抜)"></asp:Label>
                        </td>
                        <td>
                            <%--<uc1:IntegerTextbox runat="server" ID="txtMDTaxExclude"  OnTextChanged="change_TextChanged"/>--%>
                           <%-- <asp:TextBox runat="server" ID="txtMDTaxExclude"  Enabled="true" ></asp:TextBox>--%>

                           <%--<asp:TextBox runat="server" ID="txtMDTaxExclude" OnTextChanged="mdtax_TextChanged" onkeypress="return isNumber(event)" OnBlur="Calculation()"></asp:TextBox>--%>
                       <asp:TextBox runat="server" ID="txtMDTaxExclude"  onkeypress="return isNumber(event)" OnBlur="Calculation()"></asp:TextBox>
                             </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="MD金額(税込)"></asp:Label>
                        </td>
                        <td >
                            <%--<uc1:IntegerTextbox runat="server" ID="txtMDTaxInclude" Enabled="false"/>--%>
                         <asp:TextBox runat="server" ID="txtMDTaxInclude" Enabled="false" ></asp:TextBox>
                        </td>
                        <td > 
                            <asp:Label ID="Label3" runat="server" Text="処理内容"></asp:Label>
                        </td>
                        <td  style="padding-left:60px">
                            <asp:DropDownList runat="server" ID="ddlProcess">
                                <asp:ListItem Text="-----選択-----" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="値引伝票" Value="0"></asp:ListItem>
                                <asp:ListItem Text="現物補填" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td rowspan="2">

                            <asp:Label ID="Label6" runat="server" Text="備考"></asp:Label>
                        </td>
                        <td rowspan="2">
                            <asp:TextBox runat="server" ID="txtRemark" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="経験処理"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtExpProcess" onkeypress="return isNumber(event)" ></asp:TextBox>
                        </td>

                        <td>
                            <asp:Label ID="Label5" runat="server" Text="残額(税抜)"></asp:Label>
                        </td>
                        <td >
                            <%--<uc1:IntegerTextbox runat="server" ID="txtBalTaxInclude" Enabled="false" />--%>
                        <asp:TextBox runat="server" ID="txtBalTaxInclude" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                  <div style="display: none;">
    <asp:Button ID="btnTextBoxEventHandler" runat="server"
    OnClick="btnTextBoxEventHandler_Click" />
                            </div>
                
             <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional" ChildrenAsTriggers="true">
                 
                            
            <ContentTemplate>
                  
                <asp:GridView runat="server" ShowFooter="true" Visible="true" ID="gv1" ShowHeader="false" onrowdatabound="MDGridView_RowDataBound" GridLines="both" ShowHeaderWhenEmpty="true" CssClass="tableEntry1" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblRowNo" Text='<%# Bind("ID") %>'></asp:Label>
                                <asp:Label runat="server" ID="col_text_1" Text="納品書日付"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField >
                            <HeaderTemplate>納品書日付</HeaderTemplate>
                            <ItemTemplate>
                               <div  class="input-group date form_date col-md-5" id="dpc" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                     <asp:TextBox  runat="server" ID="dpDelivery" MaxLength="10" CssClass="mama"  onkeydown = "return DateFormat(this, event.keyCode)" onBlur="ScoreValidation(this)"   Text='<%# Bind("Delivery") %>' style="float:left; border-top-right-radius:0px;border-bottom-right-radius:0px; cursor:text; width:115px"></asp:TextBox>
                                     <span id="Span1" runat="server"   class="input-group-addon " style="height:24px; cursor:pointer"><span id="Span2" runat="server" class="glyphicon glyphicon-calendar"></span></span> 
                               </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                     <asp:Label runat="server" ID="lblRowNo1" Text='<%# Bind("ID") %>'></asp:Label>
                                <asp:Label runat="server" ID="col_text_2" Text="仕入処理日"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>仕入処理日</HeaderTemplate>
                            <ItemTemplate>
                          <div  class="input-group date form_date col-md-5" id="dpcq" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd">
                                <asp:TextBox runat="server" ID="dpPurchase" MaxLength="10" CssClass="mama"  onkeydown = "return DateFormat(this, event.keyCode)"  Text='<%# Bind("Purchase") %>' style="float:left; border-top-right-radius:0px;border-bottom-right-radius:0px;width:113px"></asp:TextBox>
                                <span id="Span1q" runat="server" class="input-group-addon" style="height:24px; cursor:pointer"><span id="Span2q" runat="server" class="glyphicon glyphicon-calendar"></span></span> 
                         </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField>
                            <ItemTemplate>
                                     <asp:Label runat="server" ID="lblRowNo2" Text='<%# Bind("ID") %>'></asp:Label>
                                <asp:Label runat="server" ID="col_text_3" Text="金額（税抜）"></asp:Label>
                            </ItemTemplate>
                              
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>金額（税抜）</HeaderTemplate>
                            <ItemTemplate>
                                <asp:TextBox CssClass="noone" runat="server" ID="txtAmount" Text='<%# Bind("Amount") %>' style="width:115px" onkeypress="return isNumber(event)" OnBlur="Calc()" OnTextChanged="txtAmount_textchanged"></asp:TextBox>
                   
                                 </ItemTemplate>
                              <FooterStyle HorizontalAlign="center" />
                <FooterTemplate>
                 <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row"  style="width:100%; height:auto" ClientIDMode="Static" OnClick="ButtonAdd_Click"/>
                </FooterTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField>
                     <ItemStyle Width="100px" />
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton12" runat="server" onclick="LinkButton12_Click">Remove</asp:LinkButton>
                </ItemTemplate>
                </asp:TemplateField>
                    </Columns>

                </asp:GridView>
                </ContentTemplate>
                    </asp:UpdatePanel>
                                <script type = "text/javascript">
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
                <script type="text/javascript">
                    $("#txtMDTaxExclude").blur(function() {
                        alert("working");
                    });​
</script>
                <script type="text/javascript">
                    $(document).ready(function () {
                        var here = document.getElementsByClassName("here");
                        here.onfocusout(function () {
                            alert("here");
                            //your code

                        });
                    }); 
                </script>

            </div>
      </div> 
      <div class="modal-footer">
          <button id="btnSave" type="button" onserverclick="btnUpdate_Click" class="btn btn-primary" data-dismiss="modal" runat ="server" >
                                    <span class="glyphicon glyphicon-save"
                                          aria-hidden="true"></span>
                                    <asp:Label ID="lblSave" runat="server" Text="登録"></asp:Label>
            </button>  
        <button type="button" class="btn btn-primary" data-dismiss="modal">閉じる</button>
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

     //function AddNewRow()
     //{
     //var grd = document.getElementById(' gv1.ClientID %>');
     //var tbod=grd.rows[0].parentNode;
     //var newRow=grd.rows[grd.rows.length - 1].cloneNode(true);
     //tbod.appendChild(newrow);
     //return false;
     //}

     function Calc() {
         var grid = document.getElementById('<%= gv1.ClientID %>');
             //alert(grid.rows.length);
         var sum = 0;
         for (i = 0; i < grid.rows.length; i++) 
         {
             var install =  document.getElementById('ContentPlaceHolder1_gv1_txtAmount_'+i);
             var temp;
             //var install = NaN | 0;
             if(isNaN(install.value) || install.value == "")
             {
                 temp=0;
             }
             else temp = install.value;
             sum +=parseFloat(temp);
             var bal1= document.getElementById('ContentPlaceHolder1_txtBalTaxInclude');
             var md1= document.getElementById('ContentPlaceHolder1_txtMDTaxExclude').value;
             bal1.value= parseFloat(md1 - sum);
         } 
     } 
     function Calculation() {
         var grid1 = document.getElementById('<%= gv1.ClientID %>');
             //alert(grid.rows.length);
             var sum1 = 0;
             for (i = 0; i < grid1.rows.length; i++) 
             {
                 var install1 =  document.getElementById('ContentPlaceHolder1_gv1_txtAmount_'+i);
                 var tempp;
                 //var install = NaN | 0;
                 if(isNaN(install1.value) || install1.value == "")
                 {
                     tempp=0;
                 }
                 else tempp = install1.value;
                 sum1 +=parseFloat(tempp);

                 var bal11= document.getElementById('ContentPlaceHolder1_txtBalTaxInclude');
                 var md21= document.getElementById('ContentPlaceHolder1_txtMDTaxExclude').value;
                 var md11= isNaN(parseInt(md21)) ? 0 : parseInt(md21);
                 var pertax= document.getElementById('ContentPlaceHolder1_txtMDTaxInclude');
                 var num= 1.08;
                 pertax.value= Math.round(parseFloat( num * parseInt(md11)) );
                 bal11.value= parseFloat(md11-sum1);
             } 

         }
</script>
</asp:Content>

