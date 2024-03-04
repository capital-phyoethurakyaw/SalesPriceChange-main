<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard3.aspx.cs" Inherits="SalesPrice.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <%-- <link href="Styles/Common.css" rel="stylesheet" />--%>
    <style>
    td.lvtemp {
    background-color:#F5F5F5;
    padding-left:3%;
    border-radius:10px;
   -moz-box-shadow:    inset 2px 2px 10px green;
   -webkit-box-shadow: inset 0 0 10px #000000;
   box-shadow:         inset 4px 4px 10px #000000;
}
    .link:hover{
      text-decoration:none;
    color:blueviolet;
    font-weight:bold;
    font-size:16px;
    font-style:italic;
    text-shadow:1px .5px 2px green;
    cursor:pointer;
   
    }
    table.lvp1
    {
    border-collapse:separate;
    border-spacing:20px;
    }
    .link:visited
    {
    color:green;

    }
   
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row" style="background-color:white; background-size:cover;">
        <div class="col-lg-12 col-md-offset-0">
            <div class="">

     <div class="panel-heading" style="background-color:#D9EDF7">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h1 class="panel-title"><b style="font-weight:bold; font-size:20px; text-shadow: 2px 2px White;">ダッシュボード</b></h1>
                        </div>
                    </div>
                </div>
    <div class ="" align="center" style="background-color:white; background-size:cover ">
          
        <div class="form-group" style="border:0px groove white;">


            
                         
        
        <div class="table-responsive " style="margin-left:2%; margin-right:2%; background-color:white; margin-bottom:-2%;" align="center">
    <asp:ListView ID ="InstructionList"   runat ="server"  DataKeyNames ="ID" SelectedIndex="0" GroupItemCount ="3" OnPreRender="Instruction_PreRender" OnItemDataBound ="Instruction_Itemdatabound">
        <LayoutTemplate>
            <table class="lvp1" align="right">
                 <tr id ="groupPlaceholder" runat ="server" style="background-color:blue;">
                 </tr>
            </table>
         </LayoutTemplate>

        <GroupTemplate >
            <tr style ="width :200px;">
                <td id="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>

        <ItemTemplate>
            <div align="right"  >
           
                   <td style ="width:450px; border:10px solid #F5F5F5; box-shadow:2px 2px 4px grey; border-spacing:20px;  border-radius:25px;" class="lvtemp" >
                      <div class="bdleft"></div>
                        <asp:Label runat="server" ID="lblID" Text ='<%# Eval("ID") %>' Visible ="false" /><br /></b> 
                       
                       <asp:Label ID="lblform" runat="server" Text="申請番号:" Width ="80px"></asp:Label>
                     <%--  <asp:Label runat="server" ID="lblformno" Text ='<%# Eval("FormNo") %>'/><br />
                     <%--  <asp:LinkButton ID="lblFormNo" runat="server" Text ='<%# Eval("FormNo") %>' OnClick ="btnFormno_Click"/><br/>--%>
                       <asp:HyperLink ID="lblFormNo" runat="server" CssClass="link" Text ='<%# Eval("FormNo") %>'></asp:HyperLink><br/>
                 

                       <asp:Label ID="lblstage" runat="server" Text="現段階:" Width ="80px"></asp:Label>
                       <asp:Label runat="server" ID="lblstage1" Text ='<%# Eval("CurrentStage") %>'/><br />

                       <asp:Label ID="lbldate" runat="server" Text="開始日:" Width ="80px"></asp:Label>
                       <asp:Label runat="server" ID="lblstartdate" Text ='<%# Eval("StartDate") %>'/><br />

                       <asp:Label ID="lblend" runat="server" Text="終了日:" Width ="80px"></asp:Label>
                       <asp:Label runat="server" ID="lblEnddate" Text ='<%# Eval("EndDate") %>'/><br />

                       <asp:Label ID="lbls" runat="server" Text="仕入先:" Width ="80px"></asp:Label>
                       <asp:Label runat="server" ID="lblsupplier" Text ='<%# Eval("Supplier") %>'/><br />

                       <asp:Label ID="Label2" runat="server" Text="ブランド:" Width ="80px"></asp:Label>
                       <asp:Label runat="server" ID="lblbrand" Text ='<%# Eval("Brand") %>'/><br />

                       <asp:Label ID="Label3" runat="server" Text="申請区分:" Width ="80px"></asp:Label>
                       <asp:Label runat="server" ID="lblApply" Text ='<%# Eval("ApplyType") %>'/><br />

                       <asp:Label ID="Label4" runat="server" Text="ＭＤ管理表:" Width ="80px"></asp:Label>
                       <asp:Label runat="server" ID="lblmanagement" Text ='<%# Eval("MD_Management") %>'/><br />

                       <asp:Label ID="Label5" runat="server" Text="完了:" Width ="80px"></asp:Label>
                       <asp:Label runat="server" ID="lblfinish" Text ='<%# Eval("IsFinished") %>'/><br/>
                        
                   </td>
                </div>
                
        </ItemTemplate>
    </asp:ListView>
            </div>
        <br/>
                <div class="row"  >
                    <div class="col " align="center">

                    <div class ="text-left" style="margin-left:4%">
            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="InstructionList" PageSize="6"  >
                    <Fields>
                        <%--<asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                            ShowNextPageButton="false"  PreviousPageText="<<"  ButtonCssClass="first_class" />--%>
                        <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="numeric_button" CurrentPageLabelCssClass="cpage"  />
                        <%--<asp:NextPreviousPagerField ButtonType="Button" ShowNextPageButton="true" ButtonCssClass="last_class" ShowLastPageButton="false" ShowPreviousPageButton = "false"  NextPageText=">>" />--%>
                    </Fields>
            </asp:DataPager>
                     <%--      <asp:DataPager runat="server" PageSize="5" ID="DataPager2">  
                        <Fields>  
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>  
                            <asp:NumericPagerField></asp:NumericPagerField>  
                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>  
                        </Fields>  
             </asp:DataPager> --%>
                        </div>
                        </div>
                    </div>
                </div>
     
        </div>
             </div>
        </div>
    </div>
   <%-- <script type="text/javascript">
    
        
        $(document).ready(function () {
            alert(document.getElementById('<%=Master.FindControl("lblNoti").ClientID %>');

        });

    </script>--%>
</asp:Content>
