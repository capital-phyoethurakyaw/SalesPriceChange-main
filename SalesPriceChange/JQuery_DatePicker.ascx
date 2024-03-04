<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JQuery_DatePicker.ascx.cs" Inherits="SalesPrice.JQuery_DatePicker" %>
   <%-- <link href="../Styles/jquery.datepick.css" rel="stylesheet" />--%>
<script src="Scripts/jmjs.js"></script>
    <script src="../Scripts/jquery.plugin.min.js"></script>
    <script src="../Scripts/jquery.datepick.js"></script>
<link href="../TestCalendar/css/redmond.datepick.css" rel="stylesheet" />
<style>
    .form-control
    {
       
    }
</style>
<div class="input-group" style="width:80px; " data-link-field="dtp_input2"   >
<%--<input  class="form_date1"  type="text" id="popupDatepickertest"/>--%>
    <asp:TextBox CssClass="form_date1 " ID="popupDatepickertest" runat="server"  ReadOnly="false"  >
    </asp:TextBox>
  <span runat="server" id="div1" class="input-group-addon " style="cursor:pointer"><span runat="server" class="glyphicon glyphicon-calendar" ID="indiv"></span></span>
</div>

 <script>
     $(function ()
     {
         $('.form_date1').datepick({
             dateFormat: 'yyyy-mm-dd', changeMonth: true, showOnFocus: true, showTrigger: '<button type="button" class="trigger">' +
    '<img src="img/calendar.gif" alt="Popup"></button>'
         });
         //var isitable = '<input type="text" name="idTourDateDetails" id="idTourDateDetails" readonly="readonly" class="form-control clsDatePicker"> <span class="input-group-addon"><i id="calIconTourDateDetails" class="glyphicon glyphicon-th"></i></span>';
         //$("#myModal").find(".input-group").html(isitable);
         //$('#idTourDateDetails').datepicker();
     });
</script>