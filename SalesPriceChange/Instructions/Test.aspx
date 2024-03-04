<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="SalesPrice.Instructions.Test" MasterPageFile="~/SalePriceMaster.Master" %>
    <%--<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="Instructions.aspx.cs" Inherits="SalesPrice.Instructions.Sales_Price_Change" %>--%>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    <%@ Register Src="~/IntegerTextbox.ascx" TagPrefix="uc1" TagName="IntegerTextbox" %>
    
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <%--  <link href="../Styles/Common.css" rel="stylesheet" /><%--<compilation debug="true" targetFramework="4.0"/>--%>--%>
    <link href="../Styles/chosen.css" rel="stylesheet" />
    <script src="../Scripts/skype_uri.js"></script>
    <style type="text/css">
        .mtml1 {
            vertical-align:middle;
            line-height:30;
        }
           .ilove {
            vertical-align:middle;
            line-height:20px;

            text-align:left;
        }
        .hd1
        {
            text-align:center;

            border:1px solid black;
            border-radius:0;

        }
        .mi1
        {
            margin-left:-4px; 
            border-color:black;
            border-radius:0;
            vertical-align:middle;
            text-align:center;
        }
        .dtp
        {
            border-color:black; 
            border-radius:0;
            text-align:center;
        }

        .chosen-container-single .chosen-single{
            height:30px !important;
            border-bottom-left-radius:0px !important;
            border-top-left-radius:0px !important;
        }
    </style>

    <script>
        function allowOnlyNumber(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>

    <script >
        function openModal2(text) {
            $('#myModal2').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal2').modal('show');
        }

        function openModal3(text) {
            $('#myModal3').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal3').modal('show');
        }
    </script>
    <script type="text/javascript">
        function ClearSelectedDate() {
            $find("_ce1").set_selectedDate(null);
            $("[id*=ce1]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
        }

        function ClearSelectedDate2() {
            $find("_ce2").set_selectedDate(null);
            $("[id*=ce2]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
        }

        function ClearSelectedDate3() {
            $find("_ce3").set_selectedDate(null);
            $("[id*=ce3]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
        }

        function ClearSelectedDate4() {
            $find("_ce4").set_selectedDate(null);
            $("[id*=ce4]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
        }

        function ClearSelectedDate5() {
            $find("_ce5").set_selectedDate(null);
            $("[id*=ce5]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
        }
        function ClearSelectedDate6() {
            $find("_ce6").set_selectedDate(null);
            $("[id*=ce6]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
        }
        function ClearSelectedDate7() {
            $find("_ce7").set_selectedDate(null);
            $("[id*=ce7]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
        }
        function ClearSelectedDate8() {
            $find("_ce8").set_selectedDate(null);
            $("[id*=ce8]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
        }
        function ClearSelectedDate9() {
            $find("_ce9").set_selectedDate(null);
            $("[id*=ce9]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
        }
        function ClearSelectedDate10() {
            $find("_ce10").set_selectedDate(null);
            $("[id*=ce10]").val("");
            $(".ajax__calendar_active").removeClass("ajax__calendar_active");
            return false;
        }

</script>
     <script type="text/javascript">
         function StageChange(index) {
             var hfUserTypeID = document.getElementById('<%= hfUserTypeID.ClientID %>');
             if (index == "1") {
                 var val1 = document.getElementById('<%= ddlStage1.ClientID %>').value;
                if (val1 == "1")
                    hfUserTypeID.value = "2";
                else if (val1 == "0")
                    hfUserTypeID.value = "1";
            }

            else if (index == "2") {
                var val2 = document.getElementById('<%= ddlStage2.ClientID %>').value;
                if (val2 == "1")
                    hfUserTypeID.value = "3";
                else if (val2 == "2")
                    hfUserTypeID.value = "1";
            }

            else if (index == "3") {
                var val2 = document.getElementById('<%= ddlStage3.ClientID %>').value;
                if (val2 == "1")
                    hfUserTypeID.value = "4";
                else if (val2 == "2")
                    hfUserTypeID.value = "2";
            }

            else if (index == "4") {
                var val2 = document.getElementById('<%= ddlStage4.ClientID %>').value;
                if (val2 == "1")
                    hfUserTypeID.value = "5";
                else if (val2 == "2")
                    hfUserTypeID.value = "3";
            }

            else if (index == "5") {
                var val2 = document.getElementById('<%= ddlStage5.ClientID %>').value;
                if (val2 == "1")
                    hfUserTypeID.value = "6";
                else if (val2 == "2")
                    hfUserTypeID.value = "4";
            }

            else if (index == "6") {
                var val2 = document.getElementById('<%= ddlStage6.ClientID %>').value;
                if (val2 == "1")
                    hfUserTypeID.value = "7";
                else if (val2 == "2")
                    hfUserTypeID.value = "5";
            }

            else if (index == "7") {
                var val2 = document.getElementById('<%= ddlStage7.ClientID %>').value;
                if (val2 == "1")
                    hfUserTypeID.value = "8";
                else if (val2 == "2")
                    hfUserTypeID.value = "6";
            }

            else if (index == "8") {
                var val2 = document.getElementById('<%= ddlStage8.ClientID %>').value;
                      if (val2 == "1")
                          hfUserTypeID.value = "9";
                      else if (val2 == "2")
                          hfUserTypeID.value = "7";
                  }
}
    </script>
   <script type="text/javascript">
       $('.form_date').datetimepicker({
           weekStart: 1,
           clearBtn: 1,
           autoclose: 1,
           startView: 2,
           minView: 2,
           forceParse: 0
       });
</script>
    <%--<link href="../Styles/Common.css" rel="stylesheet" />--%>
    <%--<link href="../Styles/bootstrap.min.css" rel="stylesheet" />--%>

</asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-xl-12 col-md-offset-0" style="margin-top:-14px">
            <div class="panel panel-info panel-table">
                <div class="panel-heading" style ="background-color :#337ab7; color:white;">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h1 class="panel-title"><b style="font-weight:bold; font-size:20px;">指示書新規作成</b></h1>
                        </div>
                    </div>
                </div>
                <div class="panel-body">                  
                  <div class="row">
                       <div class="table-responsive" >
                                              
                            <table class="table" >
                            <tr>
                                 <td style="border:1px solid white; padding-left:15px" >
                                          <div>
                            <asp:Label runat="server" ID="lblID" Text="No:" Height="30px" Width="100px" CssClass="label-black hd1"></asp:Label>
                            <asp:Label ID="lblFormNo" runat="server" Text="2016-0147" Height="30px" Width="150px" CssClass="label-border hd1"></asp:Label>
                        </div>

                                    </td>
                                    <td style="border:1px solid white " >

                                         <div style="padding-right:15px; float:right"  >
                            <asp:Label runat="server" ID="lblApplyDate" Text="申請日" CssClass="label-black" Height="30px" Width="100px"  ></asp:Label>
                            <div id="Div1" class="input-group date form_date col-md-5 " data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="float:right">
                                  <asp:TextBox runat="server" MaxLength="10" ID="dpApplyDate"  onkeydown = "return DateFormat(this, event.keyCode)" style="line-height:0 !important; padding-top:initial; height:30px; width:150px;  border:1px solid black; border-radius:1.5px; text-align:center;float:right"  ></asp:TextBox>
                                  <span id="Span3" runat="server" class="input-group-addon " style="height:24px; cursor:pointer; "><span id="Span4" runat="server" class="glyphicon glyphicon-calendar"></span></span> 
                            </div>

                        </div>
                                    </td>
                                    </tr>
                                    </table>
                           </div>
                  </div>
                    <div class="row" style="margin-top:10px">

                    <div class ="col col-xs-6 ">
                        <table >
                            <tr>
                                <td style="padding-left:15px;border:1px solid white;">
                                    <div style="padding-left:-15px; margin-left:-15px;float:left"> 
                                        <asp:Label runat="server" ID="lblappclassification" Text="申請区分" Height="30px" Width="100px" CssClass="label-black" style="float:inherit"></asp:Label>    
                                        <div style="float:left" >                 
                                            <asp:DropDownListChosen ID="ddlApplyType" runat="server" Width="150px"
                                              DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                            </asp:DropDownListChosen>
                                        </div> 
                                        <asp:RequiredFieldValidator runat="server" id="reqApplyType" controltovalidate="ddlApplyType" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />
                                </div>
                                </td>
                                <td style="border:1px solid white;padding-left:5px;margin-left:5px;">
                                    <div style="float:left;visibility:hidden">
                                        <asp:Label ID="Label1234" Width="110px" runat="server" Text="カテゴリ" CssClass="label-black" style="" ></asp:Label>
                                    </div>
                                    <div style="float:left; visibility:hidden" >   
                                    <asp:DropDownListChosen ID="Categoryddl" runat="server" Width="130px"
                                        DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                    </asp:DropDownListChosen>
                                    </div>  
                                </td>  
                            </tr>
                         </table>
                    </div>  

                       </div>
                     <div class="row" style="margin-top:10px">
                    <div class ="col col-xs-6" style = "width:800px">
                        <asp:Label runat="server" ID="lblstdate" Text="開始日" Height="30px" Width="100px" CssClass="label-black" style="float:left;"></asp:Label>
                         <div id="Div2" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="float:left; width:120px">
                         <asp:TextBox runat="server" MaxLength="10" ID="dpStartDate" style=" height:30px; width:100px;  border:1px solid black; border-radius:1.5px; text-align:center ;" onkeydown = "return DateFormat(this, event.keyCode)"  ></asp:TextBox>
                         <span id="Span1" runat="server" class="input-group-addon" style="height:24px; cursor:pointer"><span id="Span2" runat="server" class="glyphicon glyphicon-calendar"></span></span> 
                         </div>
                      
                        <b style="width:20px; font-stretch:expanded; margin-left:10px;float:left;margin-top:5px;">~</b>
                             
                        <asp:Label runat="server" ID="lblenddt" Text="終了日" Height="30px" Width="100px" CssClass="label-black" Style="float:left"></asp:Label>
                       
                        
                         <div id="Div3" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="float:left; width:120px; margin-left:-10px">
                        <asp:TextBox runat="server" MaxLength="10" onkeydown = "return DateFormat(this, event.keyCode)" ID="dpEndDate" style=" height:30px; width:100px;  border:1px solid black; border-radius:1.5px; text-align:center ;" ></asp:TextBox>
                       <span id="Span5" runat="server" class="input-group-addon" style="height:24px; cursor:pointer"><span id="Span6" runat="server" class="glyphicon glyphicon-calendar"></span></span> 
                               </div>
                      <%--  <b><asp:Button ID="btnCopy" runat="server" Text="Copy" Width ="50px"  OnClick ="btnCopy_Click" Visible ="false"/></b>--%>
                 </div> 
                        </div> 
                     <div class="row" style="margin-top:10px">
                        <div class="col-lg-5 " style ="width:800px">
                            <asp:Label ID="Label4" Width="100px" runat="server" Text="仕入先" CssClass="label-black" style="float:inherit"></asp:Label>
                            <%--<asp:DropDownList runat="server" ID="ddlSupplier" CssClass="search_ddl" Width ="130px" Height ="30px" style="margin-left:-4px; float:inherit; border:1px solid black; border-radius:0px; text-align:center; vertical-align:middle"></asp:DropDownList>--%>
                            <asp:DropDownListChosen ID="ddlSupplier" runat="server" Width="240px"
                                DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                            </asp:DropDownListChosen>  
                            <asp:RequiredFieldValidator runat="server" id="reqSupplier" controltovalidate="ddlSupplier" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />   
                     
                           <asp:Label ID="Label5" Width="110px" runat="server" Text="ブランド" CssClass="label-black" style="margin-right:-10px" ></asp:Label>
                             <%--<asp:DropDownList runat="server" ID="ddlBrand" CssClass="search_ddl" Width ="130px" Height ="30px" style="border:1px solid black; border-radius:0px; text-align:center; vertical-align:middle; margin-left:-10px; "></asp:DropDownList>--%>  
                            <asp:DropDownListChosen ID="ddlBrand" runat="server" Width="190px"
                                DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                            </asp:DropDownListChosen>  
                             <asp:RequiredFieldValidator runat="server" id="reqbrand" controltovalidate="ddlBrand" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />   
                        </div>
                         </div>
                           <div class="row" style="margin-top:10px">
                        <div class="col-lg-7 ">
                            <asp:Label ID="lblcategory" Width="100px" runat="server" Text="カテゴリ" CssClass="label-black"></asp:Label>
                            <asp:TextBox ID="txtcategory" runat="server" Width ="400px" Height="30px" style="border:1px solid black; border-radius:0px;text-align:initial ; vertical-align:middle;margin-left:-4px;" ></asp:TextBox>
                        </div>
                          </div>   
                    <br/>
                    <%--here start Pink Color--%>
                    <div id="Div4" runat="server" style=" height:440px" class="first_bg">
                        <div class="col-lg-12 " style="text-align:center;left:-10px; " >
                                <p style="background-color:#F27BAB; width:200px; height:30px; line-height:30px; margin-left:5px; margin-top:-15px;"><b> 価格変更について</b></p>
                        </div>
                  
                        <div class="row" style="margin-top:10px">
                            <table>
                            <tr>
                                <td style="padding-left:15px;width:520px;">
                                    <asp:Label ID="Label7" Width="100px" runat="server" Text="対象品番データ" CssClass="label-black"></asp:Label>
                                    <asp:RadioButton runat="server" ID="rdoAttach_Yes" GroupName="Attach" Checked ="true"  />有り
                                    <asp:RadioButton runat="server" ID="rdoAttach_No" GroupName="Attach" /> 無し
                                </td>
                                <td>
                                    <asp:Label ID="Label8" Width="100px" runat="server" Text="MD単位" CssClass="label-black"></asp:Label>
                                    <asp:RadioButton ID="rdbProductNoUnit" runat="server" GroupName ="Unit" Checked  ="true"  />品番単位(全カラー対象)
                                    <asp:RadioButton ID="rdbColorUnit" runat="server" GroupName ="Unit" />カラー単位
                                    <span style="padding-left:10px;">
                                    <asp:Label ID="Label25" Width="100px" runat="server" Text="ＭＤ管理表" CssClass="label-black"></asp:Label>
                                    </span>
                                    <asp:RadioButton ID="rdbManagement_Yes" runat="server" GroupName ="List" Checked ="true"  />要
                                    <asp:RadioButton ID="rdbManagement_No" runat="server" GroupName ="List" />不要
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table  style="margin-left:15px; margin-top:10px; border:5px solid none">
                                        <tr >
                                            <td>
                                                     <asp:FileUpload  ID="upload_input" runat="server" />
                                            </td>
                                            <td>
                                                  <%--<input type="button" onserverclick="upload_Click" value="Upload"  id="upclick"  runat="server"/>--%>
                                                <asp:Button runat="server" ID="btnupload"  OnClick="upload_Click"  Text="Upload" Height="30px" Width="100px"/>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td runat="server" id="wid">
                                                <%--<a  href="#">dffa</a>--%>
                                                <%--<asp:HyperLink runat="server"   ID="link_Down" Text="wewe" ></asp:HyperLink>--%>
                                               <asp:Label runat="server" ID="fail_upload" Visible="true" Text="No File Uploaded" ForeColor="Red" ></asp:Label>
                                            </td>
                                            <td style="padding-top:10px">
                                                <asp:Button runat="server" ID="btndown" OnClick="down_Click" Text="Download" Height="30px" Width="100px" />
                                            </td>
                                        </tr>
                                    </table>
                                    <div runat="server" id="div_up">
                                  
                                              
                                            
                                       
                                             
                                    </div>
                              
                                           
                             

                                    <%--<input runat="server" type="file" name="datafile" size="40"/>--%>


                                </td>
                                <td style="padding-top:10px">
                                    <asp:Label ID="Label26" Width="100px" runat="server" Text="豊中店へ連絡" CssClass="label-black" ></asp:Label>
                                    <asp:RadioButton runat="server" ID="rdbContact_Yes" GroupName="Contact" Checked ="true"/>要
                                    <asp:RadioButton runat="server" ID="rdbContact_No" GroupName="Contact" /> 不要
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left:15px;width:520px;padding-top:10px;">
                                    <asp:Label runat="server" ID="Label9" Text="販売価格" Height="30px" Width="100px" CssClass="label-black pull-left"></asp:Label>
                                    <div id="Div6" runat="server"  class="pull-left"> <uc1:IntegerTextbox runat="server" ID="txtpricechange" instyle="height:30px;border:1px solid black; text-align:initial "/></div>                          
                                    <asp:DropDownListChosen ID="ddlSellingPrice" runat="server" Width="170px"
                                        DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                    </asp:DropDownListChosen> 
                                    <asp:RequiredFieldValidator runat="server" id="reqsellingprice" controltovalidate="ddlSellingPrice" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />   
                                </td>
                                <td style="padding-top:10px;">
                                    <div style="float:left">
                                    <asp:Label ID="Label20" runat="server" Text="特記フラグ" Width="100px" CssClass="label-black" style="padding-right:0px;"></asp:Label>                                   
                                    </div>
                                    <div style="float:left;height:30px;">
                                    <asp:DropDownListChosen ID="ddlSalePriceType" runat="server" Width="170px"
                                        DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                    </asp:DropDownListChosen>
                                    </div>
                                    <%--<asp:DropDownList runat="server" ID="ddlSalePriceType" CssClass="search_ddl" Width ="130px"></asp:DropDownList>--%>
                                    <asp:RequiredFieldValidator runat="server" id="reqsalepricetype" controltovalidate="ddlSalePriceType" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />   
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left:15px;width:520px;padding-top:10px;">
                                    <asp:Label runat="server" ID="Label13" Text="仕入価格" Height="30px" Width="100px" CssClass="label-black pull-left"></asp:Label>
                                    <div id="Div7" runat="server" class="pull-left"><uc1:IntegerTextbox runat="server" ID="txtpurchaseprice" instyle=" height:30px;border:1px solid black; text-align:initial" /></div>
                                    <%--<asp:DropDownList ID="ddlCostUnit" runat="server" CssClass="search_ddl" Width="130px" style="border:1px solid black; height:30px; border-radius:0px; vertical-align:middle; text-align:center  ; margin-left:-4px;"></asp:DropDownList>--%>
                                    <asp:DropDownListChosen ID="ddlCostUnit" runat="server" Width="170px"
                                        DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                    </asp:DropDownListChosen> 
                                    <asp:RequiredFieldValidator runat="server" id="reqcostunit" controltovalidate="ddlCostUnit" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />   
                                </td>
                                <td style="padding-top:10px;">
                                    <div style="float:left;">
                                        <asp:Label ID="Label24" runat="server" Text="在庫フラグ" Width="100px" CssClass="label-black"></asp:Label>
                                    </div>
                                    <%--<asp:DropDownList runat="server" ID="ddlInventoryType" CssClass="search_ddl" Width ="130px" style="border:1px solid black; height:30px; border-radius:0px; vertical-align:middle; text-align:initial ; margin-left:-4px;"></asp:DropDownList>--%>
                                    <div style="float:left">
                                        <asp:DropDownListChosen ID="ddlInventoryType" runat="server" Width="170px"
                                            DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                        </asp:DropDownListChosen>
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" id="reqinventory" controltovalidate="ddlInventoryType" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />                         
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left:15px;width:520px;padding-top:10px;">
                                    <asp:Label runat="server" ID="Label10" Text="価格変更備考" Height="30px" Width="100px" CssClass="label-black" style="display:inline-block;width:100px;height:60px; vertical-align:middle; padding-top:15px"></asp:Label>
                                    <asp:TextBox ID="txtPriceRemark" TextMode="MultiLine" runat="server" Width ="400px" Height="60px" style="border:1px solid black; border-radius:0px; vertical-align:middle; text-align:initial ; margin-left:-4px;"></asp:TextBox>                        
                                </td>
                                <td style="padding-top:10px;">
                                    <asp:Label runat="server" ID="Label11" Text="仕入担当メモ" Height="30px" Width="100px" CssClass="label-black" style="display:inline-block;width:100px;height:60px; vertical-align:middle; padding-top:15px"></asp:Label>
                                    <asp:TextBox ID="txtPurchaseNote" TextMode="MultiLine" runat="server" Width ="400px" Height="60px" style="border:1px solid black;  border-radius:0px; vertical-align:middle; text-align:initial; margin-left:-4px;"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left:15px;width:520px;padding-top:10px;">
                                    <asp:Label runat="server" ID="Label12" Text="商品管理メモ" Height="30px" Width="100px" CssClass="label-black" style="display:inline-block;width:100px;height:60px; vertical-align:middle; padding-top:15px"></asp:Label>
                                    <asp:TextBox ID="txtProductNote" TextMode="MultiLine" runat="server" Width ="400px" Height="60px" style="border:1px solid black;  border-radius:0px; vertical-align:middle; text-align:initial; margin-left:-4px;"></asp:TextBox>
                            
                                </td>
                                <td style="padding-top:10px;">
                                    <asp:Label runat="server" ID="Label14" Text="社長メモ" Height="30px" Width="100px" CssClass="label-black" style="display:inline-block;width:100px;height:60px; vertical-align:middle; padding-top:15px"></asp:Label>
                                    <asp:TextBox ID="txtmemo" runat="server" TextMode="MultiLine" Width ="400px"   Height="60px" style="border:1px solid black;  border-radius:0px; vertical-align:middle; text-align:initial; margin-left:-4px;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        </div>   
                    </div>               
                    <div style ="height:180px;" class="second_bg">
                         <div class="col-lg-12 " style="text-align:center;left:-10px; left:-10px ">
                                <p style="background-color:#3399FF; width:200px; height:30px; line-height:30px; margin-left:5px; margin-top:-15px;"><b> サイト掲載について</b></p>
                        </div>
                    <div class="row" style="padding-top:10px">
                        <div class="col-lg-12 ">                          
                            <asp:Label runat="server" ID="Label15" Text="商品ＵＰ" Height="30px" Width="100px" CssClass="label-black"></asp:Label>
                            <span style="padding-left:30px"></span>
                            <asp:RadioButton ID="rdbProduct_Yes" runat="server" GroupName ="Product" Checked ="true" />要
                            <asp:RadioButton ID="rdbProduct_No" runat="server" GroupName ="Product" />不要
                        </div>
                    </div>
                    <div class="row" style="padding-top:10px">
                        <div class="col-lg-12 ">                          
                            <asp:Label runat="server" ID="Label16" Text="サイトバナー" Height="30px" Width="100px" CssClass="label-black"></asp:Label>
                            <span style="padding-left:30px"></span>
                            <asp:RadioButton ID="rdbBanner_Yes" runat="server" Checked ="true" GroupName ="Banner" />要
                            <asp:RadioButton ID="rdbBanner_No" runat="server" GroupName ="Banner" />不要                       
                            <asp:Label runat="server" ID="Label21" Text="掲載場所" Height="30px" Width="100px" CssClass="label-black" style="margin-left:50px;"></asp:Label>
                            <span style="padding-left:10px"></span>
                            <asp:CheckBox runat="server" ID="chkHot" style="vertical-align:central"/> HOT
                            <asp:CheckBox runat="server" ID="chkSaleBanner" /> SALE（バナー）
                            <asp:CheckBox runat="server" ID="chkSaleText" /> SALE（テキスト）
                            <asp:CheckBox runat="server" ID="chkHeader" /> HEADER
                            <asp:CheckBox runat="server" ID="chkSide" /> SIDE
                        </div>
                          </div>
                     <div style="padding-top:10px; vertical-align:middle">        
                        <div style="float:left">
                            <asp:Label runat="server" ID="Label23" Text="サイト掲載備考" Width="100px" Height ="60px" CssClass="label-black" style="vertical-align:middle; line-height:60px; "></asp:Label>    
                        </div>
                        <div style="float:left">
                            <asp:TextBox runat="server"  ID="txtRemark" Width="700px" Height ="60px" TextMode="MultiLine" CssClass="mtml1" style="vertical-align:middle; line-height:20px;  width:900px;text-align:initial; border:1px solid black "></asp:TextBox>
                        </div>
                     </div>
                </div>
                    <br />
                    <div class="table-responsive" style="z-index:-10000">
                                              
                            <table class="table table-border1" style="z-index:-10000;">
                                <tr>
                                    <td  style="width:auto;" >
                                        <table class="table table-bordered"  >
                                            <tr >
                                                
                                                <td id="Td1" runat="server" style="height:37px; border:1px solid white;">

                                                </td>
                                            </tr> 
                                            <tr >
                                                
                                                <td id="Td2"  runat="server" style="height:37px;  border-left:1px solid white;border-top:1px solid white;border-right:1px solid white;" >
                                                    <br />
                                                </td>
                                            </tr>
                                           <tr>
                                                
                                                <td id="Td3"  runat="server" style="height:37px; text-align:center" >
                                                    チェック

                                                </td>
                                            </tr>
                                            <tr id="Tr1" style="vertical-align:middle;  height:80px; " runat="server">
                                                <td id="Td4" runat="server" >
                                                    <%--<asp:Label ID="lblstage8user" runat="server"></asp:Label>
                                                     <div  class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                        <asp:TextBox runat="server"  ID="dpStage8"   style="height:30px; width:80px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" Enabled="false"></asp:TextBox>
                                                       <div id="Span7" runat="server" class="input-group-addon" style="line-height:0 !important; padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px; border-bottom-left-radius:0px; cursor:pointer;"><div id="Span8" runat="server" class="glyphicon glyphicon-calendar" style="margin-left:0px; font-size:20px; border:1px solid transparent;  margin-top:0px;margin-left:0px; font-size:20px; border:1px solid transparent;  margin-top:0px;" ></div></div> 
                                                     </div>--%>


                                                    <div id="Div1r6" runat="server" style="height:100%;width:100%" align="center">
                                                        <div id="Dirv17"  runat="server" style="width:100%; height:30%"   >
                                                               <asp:Label runat ="server" ID ="lblstage8userID" Visible ="false" ></asp:Label>
                                                                    <asp:Label ID="lblstage8user" runat="server" style="height:30px; width:130px; padding-left:20%; border-color:white; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:Label>

                                                        </div>
                                                         
                                                        <div id="Dirv19" runat="server" style="width:100%; height:30%" >
                                                                     <asp:DropDownList ID="ddlstage8User" Visible ="false"  runat="server"  style="height:30px; width:130px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:DropDownList>
                                                        </div>
                                                     
                                                                 </div>
                                                    
                                                 </td>
                                            </tr>
                                            <tr>
                                                <td>

                                                     <div id="Divr18" runat="server" style="width:100%; " >
                                                                    <div id="Divr1"  class="input-group date form_date col-md-5 boo" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                      <asp:TextBox runat="server" MaxLength="10" ID="dpStage8" onkeydown = "return DateFormat(this, event.keyCode)" style="height:30px; width:80px; text-align:center"  Enabled="false"></asp:TextBox>
                                                      <div id="Divr21" runat="server" class="input-group-addon" style="padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px;border-top-right-radius:4px;border-bottom-right-radius:4px; cursor:pointer;">
                                                          <div id="Div5" runat="server" class="glyphicon glyphicon-calendar" >
                                                          </div>
                                                        </div> 
                                                        </div>
                                                        </div>
                                                </td>

                                            </tr>
                                             <tr>
                                                <td>
                                                    <asp:DropDownList ID="ddlStage8" style="text-align:center" Height="30px" runat="server" Enabled="False" Width ="120px" onchange = "StageChange('8');">
          <asp:ListItem Value= "0" Text="-----選択-----"></asp:ListItem>
           <asp:ListItem Value= "1" >承認</asp:ListItem>
           <asp:ListItem Value= "2" >否認</asp:ListItem>
        </asp:DropDownList><br/>
                                                </td>
                                            </tr>
                                            
                                        </table>

                                    </td>

                                    <td class="col-lg-6">
                                        <table class="table table-bordered" style="height:100%; width:100%">
                                            <tr >
                                                <td colspan="5" style="text-align:center">制作チーム</td>

                                            </tr>
                                            <tr>
                                               
                                                <td   colspan="2" style="text-align:center">サイト反映</td>
                                                <td   colspan="3" style="text-align:center">商品管理</td>
                                            </tr>
                                            <tr >
                                                <td style="text-align:center">バナー作成</td>
                                                <td style="text-align:center">商品UP</td>
                                                <td  style="text-align:center">チェック</td>
                                                <td  style="text-align:center">価格変更</td>
                                                <td style="text-align:center">作業依頼</td>
                                            </tr> 
                                             <tr style="vertical-align:middle;height:80px" >
                                                <td id="Td5"  runat="server">


                                                   <%-- <asp:Label ID="lblstage7user" runat="server"></asp:Label>
                                                    <div id="Div1"  class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                        <asp:TextBox runat="server"  ID="dpStage7"   style="height:30px; width:80px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" Enabled="false"></asp:TextBox>
                                                       <div id="Div2" runat="server" class="input-group-addon" style="line-height:0 !important; padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px; border-bottom-left-radius:0px; cursor:pointer;"><div id="Div3" runat="server" class="glyphicon glyphicon-calendar" style="margin-left:0px; font-size:20px; border:1px solid transparent;  margin-top:0px;margin-left:0px; font-size:20px; border:1px solid transparent;  margin-top:0px;" ></div></div> 
                                                     </div>--%>

                                                    <div id="Divf16" runat="server" style="height:100%;width:100%" align="center">
                                                        <div id="Divf17"  runat="server" style="width:100%; height:30%"   >
                                                             <asp:Label runat ="server" ID ="lblstage7userID" Visible ="false" ></asp:Label>
                                                                    <asp:Label ID="lblstage7user" runat="server" style="height:30px; width:130px; padding-left:20%; border-color:white; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:Label>

                                                        </div>
                                                        <div id="Difv18" runat="server" style="width:100%; height:30%" >
                                                                     <asp:DropDownList ID="ddlstage7User" Visible ="false"  runat="server"  style="height:30px; width:130px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:DropDownList>
                                                        </div>
                                                       
                                                                 </div>

                            
                                                </td>
                                                <td  > <%--<asp:TextBox ID="txtStage6" runat="server"   Enabled="False" TextMode  = "MultiLine" Width="130px"></asp:TextBox>--%>
                                                    <%--<asp:Label ID="lblstage6user" runat="server"></asp:Label>
                                                      <div id="Div4"  class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                        <asp:TextBox runat="server"  ID="dpStage6"   style="height:30px; width:80px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" Enabled="false"></asp:TextBox>
                                                       <div id="Div5" runat="server" class="input-group-addon" style="line-height:0 !important; padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px; border-bottom-left-radius:0px; cursor:pointer;"><div id="Div6" runat="server" class="glyphicon glyphicon-calendar" style="margin-left:0px; font-size:20px; border:1px solid transparent;  margin-top:0px;margin-left:0px; font-size:20px; border:1px solid transparent;  margin-top:0px;" ></div></div> 
                                                     </div>--%>

                                                    <div id="Div1s6" runat="server" style="height:100%;width:100%" align="center">
                                                        <div id="Disv17"  runat="server" style="width:100%; height:30%"   >
                                                              <asp:Label runat ="server" ID ="lblstage6userID" Visible ="false" ></asp:Label>
                                                                    <asp:Label ID="lblstage6user" runat="server" style="height:30px; width:130px; padding-left:20%; border-color:white; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:Label>

                                                        </div>
                                                        <div id="Divs18" runat="server" style="width:100%; height:30%" >
                                                                     <asp:DropDownList ID="ddlstage6User" Visible ="false"  runat="server"  style="height:30px; width:130px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:DropDownList>
                                                        </div>
                                                       
                                                                 </div>
                                                </td>
                                                <td ><%-- <asp:TextBox ID="txtStage5" runat="server"   Enabled="False" TextMode  = "MultiLine" Width="130px"></asp:TextBox>--%>
                                                    <%--<asp:Label ID="lblstage5user" runat="server"></asp:Label>
                                                      <div id="Div7"  class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                        <asp:TextBox runat="server"  ID="dpStage5"   style="height:30px; width:80px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" Enabled="false"></asp:TextBox>
                                                       <div id="Div8" runat="server" class="input-group-addon" style="line-height:0 !important; padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px; border-bottom-left-radius:0px; cursor:pointer;"><div id="Div9" runat="server" class="glyphicon glyphicon-calendar" style="margin-left:0px; font-size:20px; border:1px solid transparent;  margin-top:0px;margin-left:0px; font-size:20px; border:1px solid transparent;  margin-top:0px;" ></div></div> 
                                                     </div>--%>

                                                    <div id="Div16a" runat="server" style="height:100%;width:100%" align="center">
                                                        <div id="Div17a"  runat="server" style="width:100%; height:30%"   >
                                                                <asp:Label runat ="server" ID ="lblstage5userID" Visible ="false" ></asp:Label>
                                                                <asp:Label ID="lblstage5user" runat="server" style="height:30px; width:130px;padding-left:20%; border-color:white; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:Label>

                                                        </div>
                                                        <div id="Div1a8" visible="false" runat="server" style="width:100%; height:30%" >
                                                                     <asp:DropDownList ID="ddlstage5User" runat="server" Enabled ="false"  style="height:30px; width:130px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" >
                                                                        
                                                                     </asp:DropDownList>
                                                        </div>
                                                       
                                                                 </div>
                                                    </td>
                                                <td  ><%-- <asp:TextBox ID="txtStage4" runat="server"   Enabled="False" TextMode  = "MultiLine" Width="130px"></asp:TextBox>--%>
                                                      <%--<asp:Label ID="lblstage4user" runat="server"></asp:Label>
                                                       <div id="Div10"  class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                        <asp:TextBox runat="server"  ID="dpStage4"   style="height:30px; width:80px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" Enabled="false"></asp:TextBox>
                                                       <div id="Div11" runat="server" class="input-group-addon" style="line-height:0 !important; padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px; border-bottom-left-radius:0px; cursor:pointer;"><div id="Div12" runat="server" class="glyphicon glyphicon-calendar" style="margin-left:0px; font-size:20px; border:1px solid transparent;  margin-top:0px;margin-left:0px; font-size:20px; border:1px solid transparent;  margin-top:0px;" ></div></div> 
                                                     </div>--%>
                                                    <div id="Diva" runat="server" style="height:100%;width:100%" align="center">
                                                        <div id="Divb"  runat="server" style="width:100%; height:30%"   >
                                                              <asp:Label runat ="server" ID ="lblstage4userID" Visible ="false" ></asp:Label>
                                                                    <asp:Label ID="lblstage4user" runat="server" style="height:30px; width:130px; padding-left:20%; border-color:white; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:Label>

                                                        </div>
                                                        <div id="Divc" runat="server" style="width:100%; height:30%" >
                                                                     <asp:DropDownList ID="ddlstage4User" Visible ="false"  runat="server"  style="height:30px; width:130px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:DropDownList>
                                                        </div>
                                                      
                                                                 </div>

                                                </td>
                                                <td id="Td6" runat="server" > <%--<asp:TextBox ID="txtStage3" runat="server"   Enabled="False" TextMode  = "MultiLine" Width="130px"></asp:TextBox>--%>
                                                 
                                                    <div id="Div8" runat="server" style="height:100%;width:100%" align="center">
                                                        <div id="Div9"  runat="server" style="width:100%; height:30%"   >
                                                              <asp:Label runat ="server" ID ="lblstage3userID" Visible ="false" ></asp:Label>
                                                                    <asp:Label ID="lblstage3user" runat="server" style="height:30px; width:130px; padding-left:20%; border-color:white; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:Label>

                                                        </div>
                                                        <div id="Div10" runat="server" style="width:100%; height:30%" >
                                                                     <asp:DropDownList ID="ddlstage3User" runat="server" style="height:30px; width:120px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" >
                                                                      
                                                                     </asp:DropDownList>
                                                                    
                                                        </div>
                                                      
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                            <div id="Dfiv19" runat="server" style="width:100%; height:30%" align="center" >
                                                                    <div id="Dfiv1"  class="input-group date form_date col-md-5 boo" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                      <asp:TextBox runat="server" MaxLength="10" ID="dpStage7"  onkeydown = "return DateFormat(this, event.keyCode)"  style="height:30px; width:80px; text-align:center" Enabled="false"></asp:TextBox>
                                                      <div id="Difv21" runat="server" class="input-group-addon" style="padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px;border-top-right-radius:4px;border-bottom-right-radius:4px; cursor:pointer;">
                                                          <div id="Div11" runat="server" class="glyphicon glyphicon-calendar"></div></div> 
                                                                    </div>
                                                        </div>
                                                </td>
                                                <td>
                                                     <div id="Disv19" runat="server" style="width:100%; height:30%" align="center" >
                                                                    <div id="Dsiv4"  class="input-group date form_date col-md-5 boo" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                      <asp:TextBox runat="server" MaxLength="10" onkeydown = "return DateFormat(this, event.keyCode)"  ID="dpStage6" style="height:30px; width:80px; text-align:center" Enabled="false"></asp:TextBox>
                                                      <div id="Divs21" runat="server" class="input-group-addon" style="padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px;border-top-right-radius:4px;border-bottom-right-radius:4px; cursor:pointer;"><div id="Div12" runat="server" class="glyphicon glyphicon-calendar" ></div></div> 
                                                        </div>
                                                        </div>
                                                </td>
                                                <td>
                                                     <div id="Div1a9" runat="server" style="width:100%; height:30%" align="center" >
                                                                    <div id="Diav7"  class="input-group date form_date col-md-5 boo" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                      <asp:TextBox runat="server"  MaxLength="10" onkeydown = "return DateFormat(this, event.keyCode)"  ID="dpStage5"  style="height:30px; width:80px; text-align:center" Enabled="false"></asp:TextBox>
                                                    <div id="Diva21" runat="server" class="input-group-addon" style="padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px;border-top-right-radius:4px;border-bottom-right-radius:4px; cursor:pointer;">
                                                        <div id="Div13" runat="server" class="glyphicon glyphicon-calendar" ></div></div> 
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div id="Divd" runat="server" style="width:100%; height:30%" align="center" >
                                                        <div id="Div20"  class="input-group date form_date col-md-5 boo" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                      <asp:TextBox runat="server" MaxLength="10" onkeydown = "return DateFormat(this, event.keyCode)"  ID="dpStage4"   style="height:30px; width:80px; text-align:center" Enabled="false"></asp:TextBox>
                                                      <div id="Dive" runat="server" class="input-group-addon" style="padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px;border-top-right-radius:4px;border-bottom-right-radius:4px; cursor:pointer;"><div id="Div29" runat="server" class="glyphicon glyphicon-calendar"></div></div> 
                                                                    </div>
                                                        </div>
                                                </td>
                                                <td>  <div id="Div14" runat="server" style="width:100%; height:30%" align="center" >
                                                                    <div id="Div15"  class="input-group date form_date col-md-5 boo" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                      <asp:TextBox runat="server" MaxLength="10" onkeydown = "return DateFormat(this, event.keyCode)" ID="dpStage3" style="height:30px; width:80px; text-align:center" Enabled="false"></asp:TextBox>
                                                      <div id="Div16" runat="server" class="input-group-addon" style="padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px;border-top-right-radius:4px;border-bottom-right-radius:4px; cursor:pointer;">
                                                          <div id="Div17" runat="server" class="glyphicon glyphicon-calendar" ></div></div> 
                                                                    </div>
                                                        </div>

                                                </td>

                                            </tr>
                                            <tr >
                                                <td style="text-align:center">
                                                    <asp:DropDownList ID="ddlStage7" Height="30px" runat="server" style="text-align:center" Width ="120px" Enabled="False" onchange = "StageChange('7');">
                                                     <asp:ListItem Value= "0" Text="-----選択-----"></asp:ListItem>
                                                      <asp:ListItem Value= "1" >承認</asp:ListItem>
                                                      <asp:ListItem Value= "2" >否認</asp:ListItem>
                                                   </asp:DropDownList><br/>
                                                                                           
                                                </td>
                                                
                                                <td style="text-align:center">

                                                     <asp:DropDownList ID="ddlStage6" style="text-align:center" runat="server" Height="30px" Enabled="False" Width="120px" onchange = "StageChange('6');">
           <asp:ListItem Value= "0" Text="-----選択-----"></asp:ListItem>
           <asp:ListItem Value= "1" >承認</asp:ListItem>
           <asp:ListItem Value= "2" >否認</asp:ListItem>
        </asp:DropDownList>  <br/>
                                             </td>
                                            <td  style="text-align:center">

                                                   <asp:DropDownList ID="ddlStage5" style="text-align:center" runat="server" Height="30px" Enabled="False" Width ="120px" onchange = "StageChange('5');">
            <asp:ListItem Value= "0" Text="-----選択-----"></asp:ListItem>
           <asp:ListItem Value= "1" >承認</asp:ListItem>
           <asp:ListItem Value= "2" >否認</asp:ListItem>
        </asp:DropDownList><br/>
                                            </td>
                                                <td  style="text-align:center">
                                                    <asp:DropDownList ID="ddlStage4" style="text-align:center" Height="30px" runat="server" Enabled="False" Width ="120px" onchange = "StageChange('4');">
          <asp:ListItem Value= "0" Text="-----選択-----"></asp:ListItem>
           <asp:ListItem Value= "1" >承認</asp:ListItem>
           <asp:ListItem Value= "2" >否認</asp:ListItem>
        </asp:DropDownList><br />
                                              </td>
                                                <td style="text-align:center">

                                                    <asp:DropDownList ID="ddlStage3" style="text-align:center" runat="server" Enabled="False" Height="30px" Width ="120px" onchange = "StageChange('3');">
          <asp:ListItem Value= "0" Text="-----選択-----"></asp:ListItem>
           <asp:ListItem Value= "1" >承認</asp:ListItem>
           <asp:ListItem Value= "2" >否認</asp:ListItem>
        </asp:DropDownList><br/>
                                            </td>
                                            </tr> 

                                        </table>
                                    </td>


                                    <td class="auto-style1" style="vertical-align:middle; text-align:center; width:80px;">
                                  <%--      <img src="../Images/33443.png" />--%>
                                        <span id="Span7" runat="server" class="glyphicon glyphicon-hand-left" style="font-size:xx-large"></span>
                                    </td>
                                    <td class="col-lg-4">
                                        <table class="table table-bordered" style="height:100%; width:100%">
                                        <tr> <td colspan="2" style="text-align:center;">仕入管理チーム</td></tr>
                                         <tr> <td colspan="2" style="text-align:center">申請</td></tr>
                                          <tr> 
                                              <td style="text-align:center">チェック</td>
                                              <td style="text-align:center">申請者</td>
                                          </tr>
                                          <tr>  
                                              <td style="text-align:center">
                                                 <%-- <asp:TextBox ID="txtStage2" runat="server" Enabled="False" TextMode  = "MultiLine"  width="130px" ></asp:TextBox>--%>
                                                 <%-- <asp:Label ID="lblstage2user" runat="server"></asp:Label>
                                                      <div id="Div16"  class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                        <asp:TextBox runat="server"  ID="dpStage2"   style="height:30px; width:80px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" Enabled="false"></asp:TextBox>
                                                       <div id="Div17" runat="server" class="input-group-addon" style="line-height:0 !important; padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px; border-bottom-left-radius:0px; cursor:pointer;"><div id="Div18" runat="server" class="glyphicon glyphicon-calendar" style="margin-left:0px; font-size:20px; border:1px solid transparent;  margin-top:0px;margin-left:0px; font-size:20px; border:1px solid transparent;  margin-top:0px;" ></div></div> 
                                                     </div>--%>


                                                    <div id="Div22" runat="server" style="height:100%;width:100%" align="center">
                                                        <div id="Div23"  runat="server" style="width:100%; height:30%"   >
                                                              <asp:Label runat ="server" ID ="lblstage2userID" Visible ="false" ></asp:Label>
                                                                    <asp:Label ID="lblstage2user" runat="server" style="height:30px; width:130px;padding-left:20%; border-color:white; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:Label>

                                                        </div>
                                                        <div id="Div24" runat="server" style="width:100%; height:30%" >
                                                                     <asp:DropDownList ID="ddlstage2User" runat="server"  style="height:30px; width:130px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" Visible ="false"  ></asp:DropDownList>
                                                        </div>
                                                       
                                                    </div>




                                              </td>
                                              <td id="Td7" style="text-align:center;height:80px;" runat="server" align="center">
                                               
                                                    <div id="Div18" runat="server" style="height:100%;width:100%; text-align:center" align="center" >
                                                        <div id="Digv17"  runat="server" style="width:100%; height:30%"   >
                                                            <asp:Label runat ="server" ID ="lblstage1userID" Visible ="false" ></asp:Label>
                                                                    <asp:Label ID="lblstage1user" runat="server" style="height:30px; width:130px; padding-left:20%; border-color:white; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:Label>

                                                        </div>
                                                        <div id="Digv18" runat="server" style="width:100%; height:30%;  "  visible="false">
                                                                     <asp:DropDownList ID="ddlstage1User" runat="server"  style="height:30px; width:130px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px; " Visible ="false"  ></asp:DropDownList>
                                                        </div>
                                                       
                                                                 </div>
                                              </td>

                                          </tr>
                                            <tr>
                                                <td>
                                                        <div id="Div25" runat="server" style="width:100%; height:30%; " align="center" >
                                                                    <div id="Div26"  class="input-group date form_date col-md-5 boo" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                      <asp:TextBox runat="server" MaxLength="10" onkeydown = "return DateFormat(this, event.keyCode)" ID="dpStage2" style="height:30px; width:80px; text-align:center" Enabled="false"></asp:TextBox>
                                                      <div id="Div27" runat="server" class="input-group-addon" style="padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px;border-top-right-radius:4px;border-bottom-right-radius:4px; cursor:pointer;">
                                                          <div id="Div28" runat="server" class="glyphicon glyphicon-calendar" ></div></div> 
                                                                    </div>
                                                        </div>

                                                </td>
                                                <td>

                                                     <div id="Divg19" runat="server" style="width:100%; height:30%" align="center" >
                                                                    <div id="Divg20"  class="input-group date form_date col-md-5 boo" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                      <asp:TextBox runat="server" MaxLength="10"  onkeydown = "return DateFormat(this, event.keyCode)" ID="dpStage1"   style="height:30px; width:80px; text-align:center" Enabled="false"></asp:TextBox>
                                                      <div id="Divg21" aria-disabled="true" runat="server"  class="input-group-addon" style="padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px;border-top-right-radius:4px;border-bottom-right-radius:4px; cursor:pointer;">
                                                          <div id="Divqwww29" runat="server" class="glyphicon glyphicon-calendar"></div></div> 
                                                                    </div>
                                                        </div>
                                                </td>
                                            </tr>
                                          <tr> 
                                               <td style="text-align:center">
                                                    <asp:DropDownList ID="ddlStage2" runat="server" Enabled="False" style="text-align:center;" Height="30px" Width ="120px" onchange = "StageChange('2');">
          <asp:ListItem Value= "0" Text="-----選択-----"></asp:ListItem>
           <asp:ListItem Value= "1" >承認</asp:ListItem>
           <asp:ListItem Value= "2" >否認</asp:ListItem>
         </asp:DropDownList><br/>
                                            </td>
                                              <td style="text-align:center">
                                                   <asp:DropDownList ID="ddlStage1" runat="server" style="text-align:center;" Enabled="False" Height="30px" Width ="120px" onchange = "StageChange('1');">
               <asp:ListItem Value= "0" Text="-----選択-----"></asp:ListItem>
               <asp:ListItem Value= "1" >承認</asp:ListItem>
              </asp:DropDownList><br/>
                                            </td>
                                          </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                    </div>     
                </div>
                <footer runat="server" class="footer navbar-fixed-bottom" style="background-color:#222222; height:40px; border-radius:5px; backface-visibility:visible;  " id="footer_btn" >
                   <%--<div class="panel-footer">--%>
                     <div class="col ">
                            <div class="text-center">
                                <button id="btnSave" type="button" class="btn btn-primary" runat ="server" onserverclick ="btnSave_Click" style="margin-top:5px;width:120px" validationgroup ="ControlFrame" >
                                    <span class="glyphicon glyphicon-save"
                                          aria-hidden="true"></span>
                                    <asp:Label ID="lblSave" runat="server" Text= "登録" ></asp:Label>
                                 </button>  
                                <button id="btnCopy" type="button" visible ="false"  class="btn btn-primary" runat ="server" onserverclick ="btnCopy_Click" style="margin-top:5px;width:120px;">
                                    <span class="glyphicon glyphicon-copy"
                                          aria-hidden="true"></span>
                                    <asp:Label ID="lblcopy" runat="server" Text= "コピー"></asp:Label>
                                 </button>                                  
                            </div>
                          </div>
                 <%-- </div>--%>
                    </footer>
              
            </div>
        </div>
    <asp:HiddenField ID="hfUserTypeID" runat="server" />
    <asp:Label runat ="server" ID ="lblcurrentstage" Visible ="false" Text ="1"  ></asp:Label>
    <asp:Label runat ="server" ID ="lblcurrentstage_mail" Visible ="false" Text ="1"  ></asp:Label>
   


    <div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header modal-header-danger">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Wanrning</h4>
      </div>
      <div class="modal-body">
        <p></p>
      </div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
      </div>
    </div>

  </div>
</div>
    <div id="myModal3" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header modal-header-info">
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
    <div id="myModal4" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header modal-header-info">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Information</h4>
      </div>
      <div class="modal-body">
        <p></p>
      </div> 
      <div class="modal-footer">
           <button type="button" runat="server" id="btnConfirmDelete" class="btn btn-default" data-dismiss="modal" onserverclick="btnConfirmDelete_Click">削除</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
      </div>
    </div>

  </div>
</div>
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
        <button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
      </div>
    </div>

  </div>
</div>
    <script type="text/javascript">
        function openModal1(text) {

            $('#myModal4').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal4').modal('show');
        }

</script>
    <script type="text/javascript">
        function openModal(text) {
            $('#myModal').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModal').modal('show');
        }

</script>

    <script src="../Scripts/chosen.jquery.js"></script>
    <%--<script>
      var isopened = false;
$(document).ready(function() {
    
    $('#ContentPlaceHolder1_ddlSellingPrice').chosen();
    
    $('body').on('focus', '.chosen-container-single input', function(){
        if (!$(this).closest('.chosen-container').hasClass('chosen-container-active')){
            $(this).closest('.chosen-container').trigger('mousedown');
            //or use this instead
            //$('#select').trigger('liszt:open');
        }    
    });
});



</script>--%>
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

           var fwo = document.getElementById("<%= dpApplyDate.ClientID %>");
            fwo.onfocusout = function ()
            { myFunction(fwo) };
            var three = document.getElementById("<%= dpStartDate.ClientID %>");
            three.onblur = function ()
            { myFunction(three) };
            var four = document.getElementById("<%= dpEndDate.ClientID %>");
            four.onblur = function ()
            { myFunction(four) };
            var five = document.getElementById("<%= dpStage8.ClientID %>");
            five.onfocusout = function ()
            { myFunction(five) };
            var six = document.getElementById("<%= dpStage7.ClientID %>");
            six.onfocusout = function ()
            { myFunction(six) };
            var seven = document.getElementById("<%= dpStage6.ClientID %>");
            seven.onfocusout = function ()
            { myFunction(seven) };
            var eight = document.getElementById("<%= dpStage5.ClientID %>");
            eight.onfocusout = function ()
            { myFunction(eight) };
            var nine = document.getElementById("<%= dpStage4.ClientID %>");
            nine.onfocusout = function ()
            { myFunction(nine) };
            var ten = document.getElementById("<%= dpStage3.ClientID %>");
            ten.onfocusout = function ()
            { myFunction(ten) };
            var ele = document.getElementById("<%= dpStage2.ClientID %>");
            ele.onfocusout = function ()
            { myFunction(ele) };
            var twel = document.getElementById("<%= dpStage1.ClientID %>");
            twel.onfocusout = function ()
            { myFunction(twel) };
            function myFunction(fwo) {
                var bobo = fwo.value.toString();
                var lastPart1 = bobo.split("/").pop();
                var yy = bobo.split("/")[1];
                var zz = bobo.split("/")[0];
                var x = parseInt(lastPart1, 10);
                var y = parseInt(yy, 10);
                var z = parseInt(zz, 10);
                //(year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
                //if (!(((z % 4 == 0) && (z % 100 != 0)) || (z % 400 == 0))) {
                if (z > 2000 && z < 2100 && y > 0 && y < 13 && x > 0 && x < 32 && (fwo.value.length) > 7 && (fwo.value.length) < 11) {
                    //if (y == 2 && x > 0 && x < 30) {
                    //    fwo.value = "";
                    //}
                    //else {
                    //    fwo.value = "";
                    //}
                    return true;
                }
                else {
                    fwo.value = "";
                }
            }
            //}
        });
      </script>
   <script>
       var isopened = false;
       $(document).ready(function () {

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
        </asp:Content>