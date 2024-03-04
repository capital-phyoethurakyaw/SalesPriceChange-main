<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DatePicker.ascx.cs" Inherits="SalesPrice.DatePicker" %>
<link href="Styles/bootstrap.min.css" rel="stylesheet" />
<link href="Styles/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="Scripts/jquery-1.8.3.min.js"></script>
<div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy/mm/dd" data-link-field="dtp_input2" runat="server" data-link-format="yyyy-mm-dd" id="outdiv" >
    <asp:TextBox runat="server"  ID="txtDate"></asp:TextBox>
 <div runat="server" id="div1" class="input-group-addon" style="line-height:0 !important; padding-top:initial;  border:1px solid black; border-radius:1.5px; cursor:pointer">
     <div id="indiv" runat="server" class="glyphicon glyphicon-calendar"></div></div>
</div>

<script type="text/javascript">
    $('#<%= txtDate.ClientID %>').datetimepicker({
        weekStart: 1,
        clearBtn: 1,
        autoclose: 1,
        startView: 2, 
        minView: 2,
        forceParse: 0
    });
</script>