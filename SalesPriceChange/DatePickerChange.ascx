<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DatePickerChange.ascx.cs" Inherits="SalesPrice.DatePickerChange" %>

<link href="Styles/bootstrap.min.css" rel="stylesheet" />
<link href="Styles/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="Scripts/jquery-1.8.3.min.js"></script>

<div class="input-group date form_date text-left" data-date="" data-date-format="yyyy/mm/dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="float:left; margin-left:1%" >
    <asp:TextBox runat="server" ID="txtStageDate"   style=" border:1px solid #F0F0F0; border-radius:0px;  width:80px;float:left " Enabled="false" BackColor="White"></asp:TextBox>
	<span class="input-group-addon" style="line-height:0 !important; padding-top:initial;  border-radius:1.5px; cursor:pointer; margin-top:-25px; margin-left:88px; width:30px; height:30px; border:1px solid transparent; z-index:2;" >
    <span class="glyphicon glyphicon-calendar"   style="margin-left:-20px; color:#B0A9A9; font-size:20px; border:1px solid transparent;  margin-top:-10px;z-index:-1000000" ></span></span>
</div>


<script type="text/javascript">
    $('.form_date').datetimepicker
        ({
        weekStart: 1,
        clearBtn: 1,
        autoclose: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
</script>