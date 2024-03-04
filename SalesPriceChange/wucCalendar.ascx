<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wucCalendar.ascx.cs" Inherits="SalesPrice.wucCalendar" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/jquery-3.2.0.min.js") %>"></script> 
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/bootstrap.min.js") %>"></script> 
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/bootstrap-hover-dropdown.js") %>"></script> 
    <link type="text/css" href="~/Styles/bootstrap.min.css" rel="stylesheet" /> 
    <link type="text/css" href="~/Styles/Common.css" rel="stylesheet" /> 
    <script type="text/javascript">
            function ClearSelectedDate() {
                $find("_Calendar11").set_selectedDate(null);
                $("[id*=CalendarExtender11]").val("");
                $(".ajax__calendar_active").removeClass("ajax__calendar_active");
                return false;
            }
    </script>
    <script type="text/javascript">
        $(".form_datetime").datetimepicker({
            format: "dd MM yyyy - hh:ii",
            autoclose: true,
            todayBtn: true,
            startDate: "2013-02-14 10:00",
            minuteStep: 10
        });
    </script> 
<%--<script>
    function allowOnlyNumber(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
    </script>  --%> 

<asp:TextBox ID="txtApplyDate" runat="server" Width="130px" contentEditable="false" onkeypress="return false"></asp:TextBox>
<cc1:CalendarExtender  ID="CalendarExtender11" BehaviorID="_Calendar11" PopupButtonID="imgPopup" TargetControlID="txtApplyDate"  runat="server"  Format="yyyy/MM/dd"> </cc1:CalendarExtender>
<span id="imgPopup" style="font-size:20px;cursor:pointer; vertical-align:middle;" class="glyphicon glyphicon-calendar"></span>
<span id="cd1" style="font-size:20px;cursor:pointer; vertical-align:middle " class="glyphicon glyphicon-remove" onclick="return ClearSelectedDate();" ></span>