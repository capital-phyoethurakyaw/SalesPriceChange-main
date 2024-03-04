    <%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="Instructions.aspx.cs" Inherits="SalesPrice.Instructions.Sales_Price_Change" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    <%@ Register Src="~/IntegerTextbox.ascx" TagPrefix="uc1" TagName="IntegerTextbox" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">

    <base target="_parent"/>
    <link id="Link1" rel="icon" href="~/img/now.png"  runat="server" style="width:30px;height:30px; border-radius:10px; "  />
    <script src="../Scripts/chosen.jquery.js"></script>
    <script src="../Scripts/Jquery.js"></script>
    <title runat="server" id="a"> @Page.Title
    </title>
    <%--<link type="text/css" href="../Styles/bootstrap.min.css" rel="stylesheet"  />--%> 
    <link type="text/css" href="../Styles/font-awesome.css" rel="stylesheet" />
    <link type="text/css" href="../Styles/Common.css" rel="stylesheet" /> 
    <link href="<%= Page.ResolveUrl("~/Styles/bootstrap-datetimepicker.min.css")%>"  rel="stylesheet"  />
  <%--  <link href="../Styles/Common.css" rel="stylesheet" /><%--<compilation debug="true" targetFramework="4.0"/>  <%= Page.ResolveUrl("~/Instructions/Instructions.aspx")%>--%>
    <link href="../Styles/chosen.css" rel="stylesheet" />
    <script src="../Scripts/skype_uri.js"></script>
    <style type="text/css">

        #ddlApplyType
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

        @media screen and (max-width: 500px) {
           
        }
        @media (min-width: 1200px) {
            #Textarea1 {
                width:900px;
            }
            .beta1 {
                margin-left:7%;
            }
            .alpha1 {
                margin-top:10px;
            }
             .theta {
                visibility:hidden;
                display:none;
            }
            #ContentPlaceHolder1_txtcategory {
                width:400px;
            }
            .theta1 {
                margin-left:1%;
            }
             input#ContentPlaceHolder1_btndown.cappa {
                /*font-size:10px;*/
                width:100px !important;
            }
             input#ContentPlaceHolder1_btnupload.cappa {
                /*font-size:10px;*/
                width:100px !important;
            }
               i.cappa3 {
                font-size:small;
            }
            
        }
        /*@media screen (max-width:380px) {
                .beta{
                margin-left:-7%;
            }
        }*/

        @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px) {
              .theta1 {
                margin-left:5%;
            }
            span#ContentPlaceHolder1_lblenddt.label-black {
                width:110px !important;

            }

            span#ContentPlaceHolder1_lblApplyDate.label-black {
                width:105px !important;
            }
            span#ContentPlaceHolder1_Label4.label-black {
                width:105px !important;
            }
            .beta2 {
                margin-left:-2%;
            }
            /* Force table to not be like tables anymore */
            /*table, thead, tbody, th, td, tr {
                display: block;
            }*/
       .beta,.bata thead,.beta tbody,.beta th,.beta td,.beta tr {
                display: block;
                border:1px solid white;
                border:none;
            }
        	/* Hide table headers (but not display: none;, for accessibility) */
	.beta thead tr { 
		position: absolute;
		top: -9999px;
        border:none;
		left: -9999px;
	}
	
	.beta tr { border: 1px solid white; }
	
	.beta td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 50%; 
	}
	
	.beta td:before { 
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		padding-right: 10px; 
		white-space: nowrap;
	}
            .beta {
                margin-left:-3%;
            }
	.beta td:nth-of-type(1):before { content: ""; }
	.beta td:nth-of-type(2):before { content: ""; }
      }


        @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px) {
                .alpha,.alpha thead,.alpha tbody,.alpha th,.alpha td,.alpha tr {
                display: block;
                border:1px solid white;
                border:none;
            }
            input#ContentPlaceHolder1_dpStage1 {
                width:100px !important;
            }
              input#ContentPlaceHolder1_dpStage2 {
                width:100px !important;
            }
                input#ContentPlaceHolder1_dpStage3 {
                width:100px !important;
            }
                  input#ContentPlaceHolder1_dpStage4 {
                width:100px !important;
            }
                    input#ContentPlaceHolder1_dpStage5 {
                width:100px !important;
            }
                      input#ContentPlaceHolder1_dpStage6 {
                width:100px !important;
            }
                                input#ContentPlaceHolder1_dpStage7 {
                width:100px !important;
            }
          input#ContentPlaceHolder1_dpStage8 {
                width:100px !important;
            }


        	/* Hide table headers (but not display: none;, for accessibility) */
	.alpha thead tr { 
		position: absolute;
		top: -9999px;
        border:none;
		left: -9999px;
	}
                    .alpha th {
                      padding-top:15px;
                    }
	.alpha tr { border: 1px solid white; }
	
	.alpha td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		/*padding-left: 50%;*/ 
	}
          
	.alpha td:before { 
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		/*padding-right: 10px;*/ 
		white-space: nowrap;
	}
            
	.alpha td:nth-of-type(1):before { content: ""; }
	.alpha td:nth-of-type(2):before { content: ""; }
    .alpha td:nth-of-type(3):before { content: ""; }
      }
        div#ContentPlaceHolder1_ddlSupplier_chosen {
            left:-1%;
        }

        @media screen and (max-width: 760px) {
            .theta {
                clear: both;
                margin-top: 15px;
            }

            input#ContentPlaceHolder1_txtcategory {
                width:150px;
            }
            input#ContentPlaceHolder1_btndown.cappa {
                font-size:10px;
                width:60px !important;
            }
             input#ContentPlaceHolder1_btnupload.cappa {
                font-size:10px;
                width:60px !important;
            }
            .cappa1 {
                width:190px;
                font-size:10px;
            }
            i.cappa3 {
                font-size:6px;
            }
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

    <%--style Sheet For First BG--%>
    <style>
        @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px) {
             .gamma_a,.gamma_a thead,.gamma_a tbody,.gamma_a th,.gamma_a td,.gamma_a tr {
                display: block;
                /*border:1px solid white;*/
                border:none;
            }
        	/* Hide table headers (but not display: none;, for accessibility) */
	.gamma_a thead tr { 
		/*position: absolute;*/
		top: -9999px;
        border:none;
		left: -9999px;
	}
                    .gamma_a th {
                      padding-top:15px;
                    }
	.gamma_a tr { border: none; }
	
	.gamma_a td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: none; 
		/*position: relative;*/
		/*padding-left: 50%;*/ 
	}
          
	.gamma_a td:before { 
		/* Now like a table header */
		/*position: absolute;*/
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		/*padding-right: 10px;*/ 
		white-space: nowrap;
	}
            
	.gamma_a td:nth-of-type(1):before { content: ""; }
	.gamma_a td:nth-of-type(2):before { content: ""; }
            .gamma_b {
                margin-left:5%;
            }
             .phi {
            margin-left:0px !important;
            /*margin-left:-200px;*/
        }
             div.xai {
            margin-left:5%;
            padding-top:3%;
        }
            div#ContentPlaceHolder1_ddlSellingPrice_chosen {
                width:220px !important;
            }
            div#ContentPlaceHolder1_ddlCostUnit_chosen {
                 width:220px !important;
            }
            .zeta {
                width:150px !important;
            }
            .zetamulti {
                margin-top:5% !important;
            }
            div#ContentPlaceHolder1_Div4x {
                height:auto;
                padding-bottom:7% !important;
            }
             .mlcb {
                margin-left:0% !important;
            }
               select#ContentPlaceHolder1_ddlstage3User {
            display:block;
        }
    /*.gam
        ma_a td:nth-of-type(3):before { content: ""; }*/
      }
        
        @media (min-width: 1200px) {
            .zetamulti {
                margin-top:1%;
            }
             .mlcb {
                margin-left:50px;
            }
              span#ContentPlaceHolder1_lblenddt.label-black {
                width:100px !important;

            }
            #ContentPlaceHolder1_txtRemark {
                width:900px;
            }
        }
        div#ContentPlaceHolder1_ddlSalePriceType_chosen {
            left:-1%;
            
        }
        div#ContentPlaceHolder1_ddlInventoryType_chosen {
              left:-1%;
            
        }
        .phi {
            margin-left:100px;
        }
        .xai {
            margin-left:1%;
        }
        .zeta {
            width:400px;
        }
        div#ContentPlaceHolder1_Div4x {
            height:auto;
            padding-bottom:3%;
        }
        body, html, panel {
            overflow-y: scroll;
            overflow-x: hidden;
            padding-top:0.5%;
        }
      
    </style>
    <script type="text/javascript">
        function openModala1(text) {
            $('#myModala1').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModala1').modal('show');
        }
</script>
    <script type="text/javascript">
        function openModala2(text) {
            $('#myModala2').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
            $('#myModala2').modal('show');
        }
</script>


</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
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
       
                     <div class="row beta1" >
                                              
                            <table class="table beta" style="border:none !important; overflow-x:no-display;"  >
                                  <tr>
                                <th style="border:none;">
                                    <%--dsdsd--%>
                                </th>
                                <th style="border:none;">
                                    <%--sdds--%>

                                </th>

                            </tr>
                            <tr>
                                 <td style="border:1px solid white; padding-left:0px" >
                                          <div>
                            <asp:Label runat="server" ID="lblID" Text="No:" Height="30px" Width="100px" CssClass="label-black hd1"></asp:Label>
                            <asp:Label ID="lblFormNo" runat="server" Text="2016-0147" Height="30px" Width="150px" CssClass="label-border hd1"></asp:Label>
                        </div>

                                    </td>
                                    <td style="border:1px solid white " >

                                    <%--     <div style="padding-right:15px; vertical-align:middle; float:left"  >
                            <asp:Label runat="server" ID="lblApplyDate" Text="申請日" CssClass="label-black" Height="30px" Width="100px"  style="float:left" ></asp:Label>
                            <div id="Div1" class="input-group date form_date col-md-5 " data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="float:left">
                                  <asp:TextBox runat="server" MaxLength="10" ID="dpApplyDate"  onkeydown = "return DateFormat(this, event.keyCode)" style="line-height:0 !important; padding-top:initial; height:30px; width:150px;  border:1px solid black; border-radius:1.5px; text-align:center;float:right"  ></asp:TextBox>
                                  <span id="Span3" runat="server" class="input-group-addon " style="height:24px; cursor:pointer; "><span id="Span4" runat="server" class="glyphicon glyphicon-calendar"></span></span> 
                            </div>

                        </div>--%>
                                        <div style="padding-right:0px; vertical-align:middle; float:left; clear:both" class="beta2">
                            <span id="lblApplyDate" class="label-black" style="display:inline-block;height:30px;width:100px;float:left">申請日</span>
                            <div id="Div1" class="input-group date form_date_top  " data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" data-link-format="yyyy-mm-dd" style="float:left">
                                  <asp:TextBox runat="server" type="text"  maxlength="10" id="dpApplyDate" onkeydown="return DateFormat(this, event.keyCode)" style="line-height:0 !important; padding-top:initial; height:30px; width:150px;  border:1px solid black; border-radius:1.5px; text-align:center;float:left"/>
                                  <span runat="server" id="Span3" class="input-group-addon " style="height:30px; cursor:pointer;float:left "><span runat="server" id="Span4" class="glyphicon glyphicon-calendar" style="padding-top:5px; right:5px"></span></span> 
                            </div>

                        </div>
                                    </td>
                                    </tr>
                                    </table>
                           </div>
               
                     <div class="" style="margin-top:10px">

                    <div class =" ">
                      <%--  <table >
                          
                            <tr>
                                <td style="padding-left:15px;border:1px solid white;">--%>
                                    <div style="float:left"  > 
                                      <div style="float:left"><asp:Label runat="server" ID="lblappclassification" Text="申請区分" Height="30px" Width="100px" CssClass="label-black" style="float:none"></asp:Label>    </div>  
                                        <div style="float:left"  >                 
                                            <asp:DropDownListChosen ID="ddlApplyType" style="float:left" runat="server" Width="150px"
                                              DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                            </asp:DropDownListChosen>
                                        </div> 
                                        <asp:RequiredFieldValidator runat="server" id="reqApplyType" controltovalidate="ddlApplyType" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />
                                   </div>
                           <%--     </td>
                                <td style="border:1px solid white;padding-left:5px;margin-left:5px;">--%>
                                    <div style="float:left;visibility:hidden">
                                        <asp:Label ID="Label1234" Width="110px" runat="server" Text="カテゴリ" CssClass="label-black" style="" ></asp:Label>
                                    </div>
                                    <div style="float:left; visibility:hidden" >   
                                    <asp:DropDownListChosen ID="Categoryddl" runat="server" Width="130px"
                                        DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                    </asp:DropDownListChosen>
                                    </div>  
                           <%--     </td>  
                            </tr>
                         </table>--%>
                    </div>  


                        <div style="clear:both"></div>
                       </div>


               <%--     Start Date and end Date--%>


                     <div id="Div2" runat="server"  class="alpha1" >
                    <div >
                        <table class="alpha">
                            <tr>
                            <th>
                                <div id="Div3" runat="server" style="float:left"> <asp:Label runat="server" ID="lblstdate" Text="開始日" Height="30px" Width="100px" CssClass="label-black" style="float:left;"></asp:Label></div>
                      <div id="Div4x" class="input-group date form_date_top col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="float:left; width:120px">
                      <asp:TextBox runat="server" MaxLength="10" ID="dpStartDate" style=" height:30px; width:100px;  border:1px solid black; border-radius:1.5px; text-align:center ;" onkeydown = "return DateFormat(this, event.keyCode)"  ></asp:TextBox>
                      <span id="Span1" runat="server" class="input-group-addon" style="height:24px; cursor:pointer"><span id="Span2" runat="server" class="glyphicon glyphicon-calendar"></span></span> 
                      </div>
                            </th>
                            <th>
                          
                        <b style="width:20px; font-stretch:expanded; margin-left:10px;float:left;margin-top:5px;">~</b>
                              
                            </th>
                                <th>
                                    <div id="Div5" runat="server" style="float:left">
                                     <div id="Div6" runat="server" style="float:left">
                                       <asp:Label runat="server" ID="lblenddt" Text="終了日" Height="30px"  CssClass="label-black" Style="float:left;width:100px"></asp:Label>
                                         </div>  <div  id="Div7" class="input-group date form_date_top col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="float:left; width:120px; margin-left:-10px">
                                        <asp:TextBox runat="server" MaxLength="10" onkeydown = "return DateFormat(this, event.keyCode)" ID="dpEndDate" style=" height:30px; width:100px;  border:1px solid black; border-radius:1.5px; text-align:center ;" ></asp:TextBox>
                                       <span id="Span5" runat="server" class="input-group-addon" style="height:24px; cursor:pointer"><span id="Span6" runat="server" class="glyphicon glyphicon-calendar"></span></span> 
                                               </div>
                                        </div>
                                </th>
                            </tr>
                        <%--    <tr>
                     <th>    
                    
                     </th>
                      <th>
                     </th>
                                <th>
                                    
                                </th>
                                 </tr>--%>
                            </table>
                      <%--  <b><asp:Button ID="btnCopy" runat="server" Text="Copy" Width ="50px"  OnClick ="btnCopy_Click" Visible ="false"/></b>--%>
                 </div> 
                        </div> 


                    <div style="clear:both"></div>



                     <div class="" style="margin-top:10px">
                        <div class="" style ="width:800px">
                            <asp:Label ID="Label4" Width="100px" runat="server" Text="仕入先" CssClass="label-black" style="float:inherit"></asp:Label>
                            <%--<asp:DropDownList runat="server" ID="ddlSupplier" CssClass="search_ddl" Width ="130px" Height ="30px" style="margin-left:-4px; float:inherit; border:1px solid black; border-radius:0px; text-align:center; vertical-align:middle"></asp:DropDownList>--%>
                            <asp:DropDownListChosen ID="ddlSupplier" runat="server" CssClass="gamma" Width="150px"
                                DataPlaceHolder="---選択---" AllowSingleDeselect="true" style="left:-1% !important">                
                            </asp:DropDownListChosen>  
                            <asp:RequiredFieldValidator runat="server" id="reqSupplier" controltovalidate="ddlSupplier" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />   
                     

                            <div id="Div8" class="theta" runat="server" > </div>
                                <div style="float:left">
                           <asp:Label ID="Label5" Width="110px" runat="server" Text="ブランド" CssClass="label-black" style="margin-right:-10px" ></asp:Label>
                                    </div>
                             <%--<asp:DropDownList runat="server" ID="ddlBrand" CssClass="search_ddl" Width ="130px" Height ="30px" style="border:1px solid black; border-radius:0px; text-align:center; vertical-align:middle; margin-left:-10px; "></asp:DropDownList>--%>  
                          <div style="float:left"> <asp:DropDownListChosen ID="ddlBrand" runat="server" Width="150px"
                                DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                            </asp:DropDownListChosen>  
                             <asp:RequiredFieldValidator runat="server" id="reqbrand" controltovalidate="ddlBrand" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />   
                       </div> 
                            </div>
                         </div>

                      <div id="Div9" runat="server" style="clear:both"></div>

                           <div class="" style="margin-top:10px">
                        <div class=" ">
                            <asp:Label ID="lblcategory" Width="100px" runat="server" Text="カテゴリ" CssClass="label-black"></asp:Label>
                            <asp:TextBox ID="txtcategory" runat="server" Height="30px" style="border:1px solid black; border-radius:0px;text-align:initial ; vertical-align:middle;margin-left:-4px;" ></asp:TextBox>
                        </div>
                          </div>   


                      <div id="Div10" runat="server" style="clear:both"></div>


                    <br/>
                    <%--here start Pink Color--%>
                    <div id="Div11" runat="server" style=" height:auto" class="first_bg">
                        <div class="col-lg-12 " style="text-align:center;left:-10px; " >
                                <p style="background-color:#F27BAB; width:200px; height:30px; line-height:30px; margin-left:5px; margin-top:-15px;"><b> 価格変更について</b></p>
                        </div>
                  
                        <div class="row" style="margin-top:10px">
                     <%--       <table>
                            <tr>
                                <td style="padding-left:15px;width:520px;">--%>
                            <%--<div>--%>
                            <div class="theta1" >
                                    <asp:Label ID="Label7" Width="100px" runat="server" Text="対象品番データ" CssClass="label-black"></asp:Label>
                                    <asp:RadioButton runat="server" ID="rdoAttach_Yes" GroupName="Attach" Checked ="true"  />有り
                                    <asp:RadioButton runat="server" ID="rdoAttach_No" GroupName="Attach" /> 無し
                            <div class="theta" > </div>
                                <%--</div>--%>
                               <%-- </td>
                                <td>--%>
                                    <asp:Label ID="Label8" Width="100px" runat="server" Text="MD単位" CssClass="label-black"></asp:Label>
                                    <asp:RadioButton ID="rdbProductNoUnit" runat="server" GroupName ="Unit" Checked  ="true"  />品番単位<i class="cappa3" >(全カラー対象) </i>
                                <%--(全カラー対象)--%>
                             <div class="theta" > </div>
                                    <asp:RadioButton ID="rdbColorUnit" runat="server" GroupName ="Unit" />カラー単位


                                 <div class="theta" > </div>
                                    <span style="padding-left:0px;">
                                    <asp:Label ID="Label25" Width="100px" runat="server" Text="ＭＤ管理表" CssClass="label-black"></asp:Label>
                                    </span>
                                    <asp:RadioButton ID="rdbManagement_Yes" runat="server" GroupName ="List" Checked ="true"  />要
                                    <asp:RadioButton ID="rdbManagement_No" runat="server" GroupName ="List" />不要
                            <%--    </td>
                            </tr>--%>
                                </div> 
                         <%--   <table>
                            <tr>
                                <td>--%>
                                    <table  style="margin-left:15px; margin-top:10px; border:5px solid none">
                                        <tr >
                                            <td>
                                                     <asp:FileUpload  CssClass="cappa1"  ID="upload_input" runat="server" />
                                            </td>
                                            <td>
                                                  <%--<input type="button" onserverclick="upload_Click" value="Upload"  id="upclick"  runat="server"/>--%>
                                                <asp:Button runat="server" ID="btnupload"   CssClass="cappa" OnClick="upload_Click"  Text="Upload" Height="30px" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td runat="server" id="wid">
                                                <%--<a  href="#">dffa</a>--%>
                                                <%--<asp:HyperLink runat="server"   ID="link_Down" Text="wewe" ></asp:HyperLink>--%>
                                               <asp:Label runat="server" ID="fail_upload" CssClass="cappa1" Visible="true"  Text="No File Uploaded" ForeColor="Red" ></asp:Label>
                                            </td>
                                            <td style="padding-top:10px">
                                                <asp:Button runat="server" CssClass="cappa" ID="btndown" OnClick="down_Click"  Text="Download" Height="30px"/>
                                            </td>
                                        </tr>
                                    </table>
                                 
                                  
                                              
                                            
                                        
                                     <%--    <div runat="server" id="div_up">       
                                    </div>--%>
                              
                                     <table class="gamma_a">
                            <tr>
                                <th style="width:520px;" >      
                             

                                    <%--<input runat="server" type="file" name="datafile" size="40"/>--%>


                                </th>
                                <th style="padding-top:10px">

                           <div style="float:left" class="gamma_b" >
                                    <asp:Label ID="Label26" Width="100px" runat="server" Text="豊中店へ連絡" CssClass="label-black" Visible="false"></asp:Label>
                                    <asp:RadioButton runat="server" ID="rdbContact_Yes" GroupName="Contact" Visible="false" /><%--要--%>
                                    <asp:RadioButton runat="server" ID="rdbContact_No" GroupName="Contact" Checked ="true" Visible="false"/> <%--不要--%>
                                          </div>
                                </th>
                            </tr>
                                         </table>


                            <div style="clear:both"></div>
                           
                         <%--       <td style="padding-left:15px;width:520px;padding-top:10px;">--%>
                            <div style="float:left;margin-top:1%" class="xai" >
                           
                                    <asp:Label runat="server" ID="Label9" Text="販売価格" Height="30px" Width="100px" CssClass="label-black pull-left"></asp:Label>
                                    <div id="Div12" runat="server"  class="pull-left"> <uc1:IntegerTextbox runat="server" ID="txtpricechange" instyle="height:30px;border:1px solid black; text-align:initial "/></div>                          
                                    <asp:DropDownListChosen ID="ddlSellingPrice" runat="server" Width="170px"
                                        DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                    </asp:DropDownListChosen> 
                                    <asp:RequiredFieldValidator runat="server" id="reqsellingprice" controltovalidate="ddlSellingPrice" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />   
                  
                                   <%--     </td>
                                <td style="padding-top:10px;">--%>
                          
                                <div class="theta"></div>
                                    <asp:Label ID="Label20" runat="server" Text="特記フラグ" Width="100px" CssClass="label-black phi" style="padding-right:0px;"></asp:Label>                                   
                                 
                                  
                                    <asp:DropDownListChosen ID="ddlSalePriceType" runat="server" Width="170px"
                                        DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                    </asp:DropDownListChosen>
                                    
                                    <%--<asp:DropDownList runat="server" ID="ddlSalePriceType" CssClass="search_ddl" Width ="130px"></asp:DropDownList>--%>
                                    <asp:RequiredFieldValidator runat="server" id="reqsalepricetype" controltovalidate="ddlSalePriceType" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />   
                                <%--</td>--%>

                          
                                </div>
                            <br />
                            <br />
                            <div style="clear:both"> </div>
                            <%-- <table>

                            <tr>
                            </tr>
                            <tr>--%>
                                <%--<td style="padding-left:15px;width:520px;padding-top:10px;">--%>


                               <div style="float:left;margin-top:1%" class="xai" >
                                    <asp:Label runat="server" ID="Label13" Text="仕入価格" Height="30px" Width="100px" CssClass="label-black pull-left"></asp:Label>
                                    <div id="Div13x" runat="server" class="pull-left"><%--<uc1:IntegerTextbox runat="server" ID="txtpurchaseprice" instyle=" height:30px;border:1px solid black; text-align:initial" />--%>
                              <asp:TextBox ID="txtpurchaseprice"  runat="server" style=" height:30px;width:120px;border:1px solid black; text-align:initial" onkeypress="return validateFloatKeyPress(this,event);" > </asp:TextBox>
                                     </div>
                                    <%--<asp:DropDownList ID="ddlCostUnit" runat="server" CssClass="search_ddl" Width="130px" style="border:1px solid black; height:30px; border-radius:0px; vertical-align:middle; text-align:center  ; margin-left:-4px;"></asp:DropDownList>--%>
                                    <asp:DropDownListChosen ID="ddlCostUnit" runat="server" Width="170px"
                                        DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                    </asp:DropDownListChosen> 
                                    <asp:RequiredFieldValidator runat="server" id="reqcostunit" controltovalidate="ddlCostUnit" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />   
                           <%--     </td>
                                <td style="padding-top:10px;">--%>

                                   <div class="theta"></div>
                                    <%--<div style="float:left;">--%>
                                        <asp:Label ID="Label24" runat="server" Text="在庫フラグ" Width="100px" CssClass="label-black phi"></asp:Label>
                                    <%--</div>--%>
                                    <%--<asp:DropDownList runat="server" ID="ddlInventoryType" CssClass="search_ddl" Width ="130px" style="border:1px solid black; height:30px; border-radius:0px; vertical-align:middle; text-align:initial ; margin-left:-4px;"></asp:DropDownList>--%>
                                    <%--<div style="float:left">--%>
                                        <asp:DropDownListChosen ID="ddlInventoryType" runat="server" Width="170px"
                                            DataPlaceHolder="---選択---" AllowSingleDeselect="true">                
                                        </asp:DropDownListChosen>
                                    <%--</div>--%>
                                    <asp:RequiredFieldValidator runat="server" id="reqinventory" controltovalidate="ddlInventoryType" errormessage="*" ForeColor="Red" ValidationGroup="ControlFrame" />                         
                 
                            </div>
                            
                               <%--      </td>
                            </tr>
                            <tr>--%>
                            <br />
                            <br />
                            <div style="clear:both"></div> 
                           <%--  <table>

                            <tr>
                                <td style="padding-left:15px;width:520px;padding-top:10px;">--%>
                            <div style="float:left;margin-top:1%" class="xai">
                                <div>
                                    <asp:Label runat="server" ID="Label10" Text="価格変更備考" Height="30px" Width="100px" CssClass="label-black" style="display:inline-block;width:100px;height:60px; vertical-align:middle; padding-top:15px"></asp:Label>
                                    <asp:TextBox ID="txtPriceRemark" TextMode="MultiLine" runat="server" CssClass="zeta"  Height="60px" style="border:1px solid black; border-radius:0px; vertical-align:middle; text-align:initial ; margin-left:-4px;"></asp:TextBox>                        
                                <%--</td>
                                <td style="padding-top:10px;">--%>
                                     <div class="theta"></div>
                                    <asp:Label runat="server" ID="Label11" Text="仕入担当メモ" Height="30px" Width="100px" CssClass="label-black" style="display:inline-block;width:100px;height:60px; vertical-align:middle; padding-top:15px"></asp:Label>
                                    <asp:TextBox ID="txtPurchaseNote" TextMode="MultiLine" runat="server" CssClass="zeta"  Height="60px" style="border:1px solid black;  border-radius:0px; vertical-align:middle; text-align:initial; margin-left:-4px;"></asp:TextBox>
                         
                                         </div>
                                   <%--    </td>
                            </tr>
                           
                            <tr>
                                <td style="padding-left:15px;width:520px;padding-top:10px;">--%>
                                <div class="zetamulti">
                                    <asp:Label runat="server" ID="Label12" Text="商品管理メモ" Height="30px" Width="100px" CssClass="label-black" style="display:inline-block;width:100px;height:60px; vertical-align:middle; padding-top:15px"></asp:Label>
                                    <asp:TextBox ID="txtProductNote" TextMode="MultiLine" CssClass="zeta" runat="server" Height="60px" style="border:1px solid black;  border-radius:0px; vertical-align:middle; text-align:initial; margin-left:-4px;"></asp:TextBox>
                             <div class="theta"></div>
                             <%--   </td>
                                <td style="padding-top:10px;">--%>
                                    <asp:Label runat="server" ID="Label14" Text="社長メモ" Height="30px" Width="100px" CssClass="label-black" style="display:inline-block;width:100px;height:60px; vertical-align:middle; padding-top:15px"></asp:Label>
                                    <asp:TextBox ID="txtmemo" runat="server" TextMode="MultiLine" CssClass="zeta"   Height="60px" style="border:1px solid black;  border-radius:0px; vertical-align:middle; text-align:initial; margin-left:-4px;"></asp:TextBox>
                           <%--     </td>
                            </tr>
                        </table>--%>
                                    </div>
                                </div>
                         
                        </div>   
                    </div>         
                      
                      
                      <div style="clear:both"></div>      
                    <div style ="height:auto;margin-top:5%" class="second_bg">
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
                             <div class="theta"></div>
                                              
                            <asp:Label runat="server" ID="Label21" Text="掲載場所" Height="30px" Width="100px" CssClass="label-black mlcb" ></asp:Label>
                            <span style="padding-left:10px"></span>
                            <asp:CheckBox runat="server" ID="chkHot" style="vertical-align:central"/> HOT
                            <asp:CheckBox runat="server" ID="chkSaleBanner" /> SALE（バナー）

                               <div class="theta"></div>
                            <asp:CheckBox runat="server" ID="chkSaleText" /> SALE（テキスト）

                          
                            <asp:CheckBox runat="server" ID="chkHeader" /> HEADER
                            <asp:CheckBox runat="server" ID="chkSide" /> SIDE
                        </div>
                          </div>
                     <div style="padding-top:10px;  vertical-align:middle" class="input-group">        
                        <div style="float:left">
                            <asp:Label runat="server" ID="Label23" Text="サイト掲載備考" Width="100px" Height ="60px" CssClass="label-black" style="vertical-align:middle; line-height:60px; "></asp:Label>    
                        </div>
                         <div id="Div19" runat="server" class="input-group">
                         <asp:TextBox runat="server" id="txtRemark" TextMode="MultiLine"  class="form-control" style="height:60px;max-height:60px;min-height:60px;max-width:900px " aria-label="With textarea"></asp:TextBox>
                        
                    </div>
                      <%--  <div style="float:left">
                            <asp:TextBox runat="server"  ID="txtRemark"  Height ="60px" TextMode="MultiLine" CssClass="mtml1" style="vertical-align:middle; line-height:20px;  width:900px;text-align:initial; border:1px solid black "></asp:TextBox>
                        </div>--%>
                     </div>
                        <div style="clear:both"></div>
                    
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
                                                          <div id="Div14" runat="server" class="glyphicon glyphicon-calendar" >
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
                                                 
                                                    <div id="Div15" runat="server" style="height:100%;width:100%" align="center">
                                                        <div id="Div16"  runat="server" style="width:100%; height:30%"   >
                                                              <asp:Label runat ="server" ID ="lblstage3userID" Visible ="false" ></asp:Label>
                                                                    <asp:Label ID="lblstage3user" runat="server" style="height:30px; width:130px; padding-left:20%; border-color:white; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:Label>

                                                        </div>
                                                        <div id="Div17" runat="server" style="width:100%; height:30%" >
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
                                                          <div id="Div18" runat="server" class="glyphicon glyphicon-calendar"></div></div> 
                                                                    </div>
                                                        </div>
                                                </td>
                                                <td>
                                                     <div id="Disv19" runat="server" style="width:100%; height:30%" align="center" >
                                                                    <div id="Dsiv4"  class="input-group date form_date col-md-5 boo" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                      <asp:TextBox runat="server" MaxLength="10" onkeydown = "return DateFormat(this, event.keyCode)"  ID="dpStage6" style="height:30px; width:80px; text-align:center" Enabled="false"></asp:TextBox>
                                                      <div id="Divs21" runat="server" class="input-group-addon" style="padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px;border-top-right-radius:4px;border-bottom-right-radius:4px; cursor:pointer;"><div id="Div20x" runat="server" class="glyphicon glyphicon-calendar" ></div></div> 
                                                        </div>
                                                        </div>
                                                </td>
                                                <td>
                                                     <div id="Div1a9" runat="server" style="width:100%; height:30%" align="center" >
                                                                    <div id="Diav7"  class="input-group date form_date col-md-5 boo" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                      <asp:TextBox runat="server"  MaxLength="10" onkeydown = "return DateFormat(this, event.keyCode)"  ID="dpStage5"  style="height:30px; width:80px; text-align:center" Enabled="false"></asp:TextBox>
                                                    <div id="Diva21" runat="server" class="input-group-addon" style="padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px;border-top-right-radius:4px;border-bottom-right-radius:4px; cursor:pointer;">
                                                        <div id="Div21" runat="server" class="glyphicon glyphicon-calendar" ></div></div> 
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
                                                <td>  <div id="Div4" runat="server" style="width:100%; height:30%" align="center" >
                                                                    <div id="Div13"  class="input-group date form_date col-md-5 boo" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" >
                                                      <asp:TextBox runat="server" MaxLength="10" onkeydown = "return DateFormat(this, event.keyCode)" ID="dpStage3" style="height:30px; width:80px; text-align:center" Enabled="false"></asp:TextBox>
                                                      <div id="Div25x" runat="server" class="input-group-addon" style="padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px;border-top-right-radius:4px;border-bottom-right-radius:4px; cursor:pointer;">
                                                          <div id="Div26x" runat="server" class="glyphicon glyphicon-calendar" ></div></div> 
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


                                                    <div id="Div27" runat="server" style="height:100%;width:100%" align="center">
                                                        <div id="Div28"  runat="server" style="width:100%; height:30%"   >
                                                              <asp:Label runat ="server" ID ="lblstage2userID" Visible ="false" ></asp:Label>
                                                                    <asp:Label ID="lblstage2user" runat="server" style="height:30px; width:130px;padding-left:20%; border-color:white; border-top-right-radius:0px; border-bottom-right-radius:0px;" ></asp:Label>

                                                        </div>
                                                        <div id="Div30" runat="server" style="width:100%; height:30%" >
                                                                     <asp:DropDownList ID="ddlstage2User" runat="server"  style="height:30px; width:130px; text-align:center; border-top-right-radius:0px; border-bottom-right-radius:0px;" Visible ="false"  ></asp:DropDownList>
                                                        </div>
                                                       
                                                    </div>




                                              </td>
                                              <td id="Td7" style="text-align:center;height:80px;" runat="server" align="center">
                                               
                                                    <div id="Div31" runat="server" style="height:100%;width:100%; text-align:center" align="center" >
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
                                                      <div id="Div34" runat="server" class="input-group-addon" style="padding-top:initial;  border:1px solid #C4C4C4; border-radius:1.5px; cursor:pointer;border-top-left-radius:0px;border-top-right-radius:4px;border-bottom-right-radius:4px; cursor:pointer;">
                                                          <div id="Div35" runat="server" class="glyphicon glyphicon-calendar" ></div></div> 
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
                <footer runat="server" class="footer navbar-fixed-bottom header_dashboard" style="background-color:#222222; height:40px; border-radius:5px; backface-visibility:visible;  " id="footer_btn" >
                   <%--<div class="panel-footer">--%>
                     <div class="col ">
                            <div class="text-center">
                                <button id="btnSave" type="button" class="btn btn-primary" runat ="server" onserverclick ="btnSave_Click"   style="margin-top:5px;width:120px" validationgroup ="ControlFrame" >
                                    <span class="glyphicon glyphicon-save"
                                          aria-hidden="true"></span>
                                    <asp:Label ID="lblSave" runat="server" Text= "登録" ></asp:Label>
                                 </button>  
                                <button id="btnCopy" type="button" visible ="false"  class="btn btn-primary" runat ="server" onserverclick ="btnCopy_Click"  style="margin-top:5px;width:120px;">
                                    <span class="glyphicon glyphicon-copy"
                                          aria-hidden="true"></span>
                                    <asp:Label ID="lblcopy" runat="server" Text= "コピー"></asp:Label>
                                 </button> 
                                       <button runat="server" id="delete_bycreater" onserverclick="delete_bycreater_Click" visible="false" class="btn btn-primary" style="margin-top:5px;width:120px;">
                                    <span class="glyphicon glyphicon-remove"></span>
                                    <asp:Label ID="Label1" runat="server" Text= "削除"></asp:Label>
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
           <button type="button" runat="server" id="btnConfirmDelete" class="btn btn-default" data-dismiss="modal" onserverclick="btnConfirmDelete_Click" >削除</button>
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
           today: 1,
           pickerPosition: "top-left"


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
           pickerPosition: "bottom-left"


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

    <script>


        function validateFloatKeyPress(el, evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode;
            var number = el.value.split('.');
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            //just one dot (thanks ddlab)
            if (number.length > 1 && charCode == 46) {
                return false;
            }
            //get the carat position
            var caratPos = getSelectionStart(el);
            var dotPos = el.value.indexOf(".");
            if (caratPos > dotPos && dotPos > -1 && (number[1].length > 1)) {
                return false;
            }
            return true;
        }


       
        function getSelectionStart(o) {
            if (o.createTextRange) {
                var r = document.selection.createRange().duplicate()
                r.moveEnd('character', o.value.length)
                if (r.text == '') return o.value.length
                return o.value.lastIndexOf(r.text)
            } else return o.selectionStart
        }




      
        //function isFloatNumber(el, evt) {

        

        //    var charCode = (evt.which) ? evt.which : event.keyCode;
        //    var number = el.value.split('.');
        //    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
        //        return false;
        //    }
        //    //just one dot (thanks ddlab)
        //    if (number.length > 1 && charCode == 46) {
        //        return false;
        //    }
        //    //get the carat position
        //    var caratPos = getSelectionStart(el);
        //    var dotPos = el.value.indexOf(".");
          
            
        //    if (caratPos > dotPos && dotPos > -1 && (number[1].length > 1)) {
        //        return false;
        //    }

        //        var t = el.value;
        //        el.value = (t.indexOf(".") >= 0) ? (t.substr(0, t.indexOf(".")) + t.substr(t.indexOf("."), 3)) : t;


        //        return true;
       

          
        //}

      
    
   

    </script>


<div id="myModala1" class="modal fade" role="dialog">
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
<div id="myModala2" class="modal fade" role="dialog">
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
        <button type="button" runat="server" id="Button1" class="btn btn-default" data-dismiss="modal" onserverclick="userConfirmDelete_Click">削除</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
      </div>
    </div>

  </div>
</div>

 
    <%--Adding this function Because of Uncatching this event onclick noti icon of masterpage //only in this page//. The coding script below have to be writtened. This worked in page like About page and other isolated form on click funtion of this--%> 
<%--    <script>
        $("#toblock").click(function (e) {
            $(this).addClass("open").siblings().removeClass("open");
        });
    </script>--%>


<%--    <script type="text/javascript" src="<%= Page.ResolveClientUrl("../Scripts/jquery-3.2.0.min.js") %>"></script> 
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("../Scripts/bootstrap.min.js") %>"></script> 
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("../Scripts/bootstrap-hover-dropdown.js") %>"></script> 
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("../Scripts/bootstrap-datetimepicker.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("../Scripts/bootstrap-datetimepicker.fr.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("../Scripts/Scripts/jquery-1.8.3.min.js") %>"></script>--%>
</asp:Content>

