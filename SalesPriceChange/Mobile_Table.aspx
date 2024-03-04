<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SalePriceMaster.Master" CodeBehind="Mobile_Table.aspx.cs" Inherits="SalesPrice.Mobile_Table" %>
<asp:Content ID="heada" ContentPlaceHolderID="head" runat="server">



    <meta name="viewport" content="width = device-width, initial-scale = 1.0, minimum-scale = 1.0, maximum-scale = 1.0, user-scalable = no" />
</asp:Content>
<asp:Content ID="haedb" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



      <asp:GridView ID="GridView1" CssClass="footable" runat="server" AutoGenerateColumns="false"
        Style="max-width: 500px">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Customer Id" />
            <asp:BoundField DataField="Name" HeaderText="Customer Name" />
            <asp:BoundField DataField="Country" HeaderText="Country" />
            <asp:BoundField DataField="Salary" HeaderText="Salary" />
        </Columns>
    </asp:GridView>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=GridView1]').footable();
        });
    </script>

</asp:Content>
