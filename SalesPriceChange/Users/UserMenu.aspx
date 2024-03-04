<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="UserMenu.aspx.cs" Inherits="SalesPrice.Users.UserMenu" %>

<%@ Register Src="~/JQuery_DatePicker.ascx" TagPrefix="uc1" TagName="JQuery_DatePicker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <%--  <script type="text/javascript" src="../Scripts/jquery-3.2.0.min.js"></script> --%>
        <link href="../Styles/Common.css" rel="stylesheet" />

        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/bootstrap-theme.css" rel="stylesheet" />
    <link href="../Styles/bootstrap-theme.min.css" rel="stylesheet" />
    <%--<script src="../Scripts/jquery-1.8.3.min.js"></script>--%>

   <%-- Start Jlink--%>
    <link href="../Styles/jquery.datepick.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../Scripts/jquery.plugin.min.js"></script>
    <script src="../Scripts/jquery.datepick.js"></script>
    <a href="../img/">../img/</a>

    
<%--                        <script>
                            $(function (date) {
                                alert("the date Chosen IS" + date);
                                $('#popupDatepicker').datepick();
                                $('#inlineDatepicker').datepick({ onSelect: showDate });
                                alert("the date Chosen IS" + date);
                            });

                            function showDate(date) {
                                alert('The date chosen is ' + date);
                            }
                           
                        </script>--%>


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
        function OnTreeClick(evt) {
            var src = window.event != window.undefined ? window.event.srcElement : evt.target;
            var isChkBoxClick = (src.tagName.toLowerCase() == "input" && src.type == "checkbox");
            if (isChkBoxClick) {
                var parentTable = GetParentByTagName("table", src);
                var nxtSibling = parentTable.nextSibling;
                //check if nxt sibling is not null & is an element node
                if (nxtSibling && nxtSibling.nodeType == 1) {
                    if (nxtSibling.tagName.toLowerCase() == "div") //if node has children
                    {
                        //check or uncheck children at all levels
                        CheckUncheckChildren(parentTable.nextSibling, src.checked);
                    }
                }
                //check or uncheck parents at all levels
                CheckUncheckParents(src, src.checked);
            }
        }

        function CheckUncheckChildren(childContainer, check) {
            var childChkBoxes = childContainer.getElementsByTagName("input");
            var childChkBoxCount = childChkBoxes.length;
            for (var i = 0; i < childChkBoxCount; i++) {
                childChkBoxes[i].checked = check;
            }
        }

        function CheckUncheckParents(srcChild, check) {
            var parentDiv = GetParentByTagName("div", srcChild);
            var parentNodeTable = parentDiv.previousSibling;
            if (parentNodeTable) {
                var checkUncheckSwitch;
                if (check) //checkbox checked
                {
                    var isAllSiblingsChecked = AreAllSiblingsChecked(srcChild);
                    if (isAllSiblingsChecked)
                        checkUncheckSwitch = true;
                    else
                        return; //do not need to check parent if any(one or more) child not checked
                }
                else //checkbox unchecked
                {
                    var isAllSiblingsChecked = AreAllSiblingsChecked(srcChild);
                    if (isAllSiblingsChecked)
                        checkUncheckSwitch = true;
                    else checkUncheckSwitch = false;
                }

                var inpElemsInParentTable = parentNodeTable.getElementsByTagName("input");
                if (inpElemsInParentTable.length > 0)
                {
                    var parentNodeChkBox = inpElemsInParentTable[0];
                    parentNodeChkBox.checked = checkUncheckSwitch;
                    //do the same recursively
                    CheckUncheckParents(parentNodeChkBox, checkUncheckSwitch);
                }
            }
        }

        function AreAllSiblingsChecked(chkBox) {
            var parentDiv = GetParentByTagName("div", chkBox);
            var childCount = parentDiv.childNodes.length;
            for (var i = 0; i < childCount; i++)
            {
                if (parentDiv.childNodes[i].nodeType == 1)
                {
                    //check if the child node is an element node
                    if (parentDiv.childNodes[i].tagName.toLowerCase() == "table")
                    {
                        var prevChkBox = parentDiv.childNodes[i].getElementsByTagName("input")[0];
                        //if any of sibling nodes are not checked, return false
                        if (prevChkBox.checked)
                        {
                            return true;
                        }
                    }
                }
            }
            return false;
        }

        //utility function to get the container of an element by tagname
        function GetParentByTagName(parentTagName, childElementObj) {
            var parent = childElementObj.parentNode;
            while (parent.tagName.toLowerCase() != parentTagName.toLowerCase()) {
                parent = parent.parentNode;
            }
            return parent;
        }


</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="padding-top:10px"></p>

    <div class="container">
        <div class="row">
        <div class="col-md-12 col-md-offset-0">
            <div class="panel panel-info panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h1 class="panel-title"><b style="font-weight:bold;  text-shadow: 2px 2px White; font-size:20px;">User Menu</b></h1>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="container">

                      <%--  start Test Calendar--%>

    <div class="container">
    <form action="" class="form-horizontal"  role="form">
        <fieldset>
            <legend>Test</legend>
			<div class="form-group">
                <label for="dtp_input2" class="col-md-2 control-label">Date Picking</label>
                <div class="input-group date form_date col-md-5" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" type="text" value="" readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
            </div>
        </fieldset>
    </form>
</div>



<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
    $('.form_date').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn: 1,
        clearBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('.form_time').datetimepicker({
        language: 'fr',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });
</script>

                     <%--   End--%>

                          <div   class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy//mm/dd" data-link-field="dpDelivery" runat="server" data-link-format="yyyy-mm-dd" style="float:left; width:170px">
                                  <asp:TextBox runat="server" ID="dpApplyDate" onkeypress="return isNumber(event)"   style="line-height:0 !important; padding-top:initial; height:30px; width:150px;  border:1px solid black; border-radius:1.5px; text-align:center;"  ></asp:TextBox>
                                  <span id="Span3" runat="server" class="input-group-addon" style="height:24px; cursor:pointer"><span id="Span4" runat="server" class="glyphicon glyphicon-calendar"></span></span> 
                          </div>

                         <asp:CompareValidator ID="CompareValidator1" runat="server" 
                         ControlToValidate="dpApplyDate" ErrorMessage="***"  Style=" margin-left:0px; z-index:1000000000; color:red; font-weight:bold;" Placeholder="ErrorMessage"
                         Operator="DataTypeCheck" Type="Date">
                         </asp:CompareValidator>

                       
<%--                         <asp:RegularExpressionValidator ID="dateValRegex" runat="server" ControlToValidate="dpApplyDate" ErrorMessage="Please Enter a valid date in the format (yyyy/mm/dd/)" 
                        ValidationExpression="^(19|20)\d\d$[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])"></asp:RegularExpressionValidator>--%>

                        
                           <%--     <asp:RegularExpressionValidator ID="regexpName" runat="server"     
                                ErrorMessage="This expression does not validate." 
                                ControlToValidate="dpApplyDate"     
                                ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" />--%>
                        <%--<asp:RangeValidator ID ="rvDate" runat ="server" ControlToValidate="dpApplyDate" ErrorMessage="Invalid Date" Type="Date" MinimumValue="1900/01/01/" MaximumValue="2100/01/01" Display="Dynamic"></asp:RangeValidator>--%>


                       <%-- <asp:CustomValidator Runat="server" ControlToValidate="dpApplyDate" EnableClientScript="False" ErrorMessage="Invalid DateTime Format"
ID="Customvalidator1" ClientValidationFunction="ValidateTextBox1" OnServerValidate="CustomValidaorMethod"></asp:CustomValidator>
<%--                     --%>   <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="dpApplyDate" ErrorMessage="Date was in incorrect format" OnServerValidate="CustomValidator1_ServerValidate" />--%>

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
        showTrigger: '#calImg'



    });

</script>
<script type="text/javascript">
     function isNumber(evt) {
         evt = (evt) ? evt : window.event;
         var charCode = (evt.which) ? evt.which : evt.keyCode;
         //alert(charCode);
         if (charCode > 31 && (charCode < 47 || charCode > 57) && charCode != 47)
        {
       
             return false;
         }
         else
       
         return true;
     }
</script>



                       <%-- start Jquery--%>
  
       

                        <link href="css/jquery.datepick.css" rel="stylesheet">
    
    <link href="css/jquery.datepick.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/jquery.plugin.min.js"></script>
<script src="js/jquery.datepick.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link href="http://localhost:38563/TestCalendar/css/jquery.datepick.css" rel="stylesheet" />
    <script src="http://localhost:38563/TestCalendar/js/jquery.plugin.min.js"></script>
    <script src="http://localhost:38563/TestCalendar/js/jquery.datepick.js"></script>
<script>
    $(function () {

        $('.form-date1').datepick();

    });

</script>

                        <div class="row">
                        <div class="col col-xs-6">
                            <asp:UpdatePanel ID="udmenu" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    User Name:
                                    <asp:DropDownList runat="server" ID="ddlmenu" AutoPostBack = "true"  OnSelectedIndexChanged = "Menu_SelectedIndexChanged"  Width="130px" ></asp:DropDownList></h3>
                                    <p>
                                        <asp:TreeView ID="TreeView1" LeafNodeStyle-CssClass="treeview" RootNodeStyle-CssClass="treeview" NodeStyle-CssClass="treeview css-checkbox" runat="server" ShowCheckBoxes="All">
                                        </asp:TreeView>
                                    </p>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col col-xs-12">
                            <div class="text-center">
                                <button id="btnUpdate" type="button" class="btn btn-primary"  runat ="server" onserverclick="btnUpdate_click"   >
                                    <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                    <asp:Label runat="server" Text="Update"></asp:Label>
                                 </button>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>
