
<%@ Page Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="dpicker.aspx.cs" Inherits="SalesPrice.Users.dpicker" %>
<%@ Register Src="~/JQuery_DatePicker.ascx" TagPrefix="uc5" TagName="JQuery_DatePicker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link href="http://localhost:38563/TestCalendar/css/jquery.datepick.css" rel="stylesheet" />
    <script src="http://localhost:38563/TestCalendar/js/jquery.plugin.min.js"></script>
    <script src="http://localhost:38563/TestCalendar/js/jquery.datepick.js"></script>
       </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>jQuery Datepicker</h1>
    <uc5:JQuery_DatePicker runat="server" ID="JQuery_DatePicker1" />


<p>This page demonstrates the very basics of the
	<a href="http://keith-wood.name/datepick.html">jQuery Datepicker plugin</a>.
	It contains the minimum requirements for using the plugin and
	can be used as the basis for your own experimentation.</p>
<p>For more detail see the <a href="http://keith-wood.name/datepickRef.html">documentation reference</a> page.</p>
<p>A popup datepicker <input type="text" id="popupDatepicker1"></p>
<p>Or inline</p>
<div id="inlineDatepicker1"></div>
	<dl>
		<dt>Github</dt><dd><a href="https://github.com/kbwood/datepick">https://github.com/kbwood/datepick</a></dd>
		<dt>Bower</dt><dd>kbw-datepick</dd>
	</dl>
<script>
    $(function () {
        $('#popupDatepicker').datepick();
        $('#inlineDatepicker').datepick({ onSelect: showDate });
    });

    function showDate(date) {
        alert('The date chosen is ' + date);
    }
</script>
    </asp:Content>
 