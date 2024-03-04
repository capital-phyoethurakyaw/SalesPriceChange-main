<%@ Page Title="Error_Check" Language="C#" AutoEventWireup="true" CodeBehind="Checking_Log.aspx.cs" Inherits="SalesPrice.Checking_Log" MasterPageFile="~/SalePriceMaster.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="background-color:white;padding-bottom:100px;">
    <div align="left" style="padding-top:20px; padding-bottom:10px">
            <asp:Button ID="error_btn" runat="server" Text="Show Errors in Detail" Width="150px" style="background-color:#337AB7" OnClick="error_btn_Click" ForeColor="white"></asp:Button>
        <asp:Button ID="close_btn" runat="server" Text="Close" Width="100px" style="" OnClick="close_Click" Visible="false"></asp:Button>
    </div>
    <div style="background-color:white" runat="server" id="close_error_gv">
    <asp:GridView runat="server" ID="error_gv" OnPageIndexChanging="errorgv_paging" onserverclick="error_btn_Click" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true"  HeaderStyle-ForeColor="White"  
         HeaderStyle-BackColor="#337AB7" PagerSettings-Mode="NumericFirstLast"  style="text-align:center;padding-bottom:100px; " PageSize="5"  >
                        <Columns>                         
                            <asp:TemplateField Visible="false">
                                <HeaderTemplate  >Error_ID</HeaderTemplate>
                                <ItemTemplate >
                                    <asp:Label runat="server" ID="lblID" Text='<%# Bind("ID") %>' CssClass="displaynone" Visible="false"></asp:Label>
                                  </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderTemplate>User_Name</HeaderTemplate>
                                <HeaderStyle CssClass=" text-center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblname" Text='<%# Bind("User_Name") %>' ToolTip='<%# Eval("User_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Error_Message</HeaderTemplate>
                                <HeaderStyle CssClass=" text-center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblmes"  style="overflow-wrap:break-word" Text='<%# Bind("Exception_Message") %>' ToolTip='<%# Eval("Exception_Message") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Error_Type</HeaderTemplate>
                                <HeaderStyle CssClass=" text-center" />
                                <ItemTemplate>                              
                                    <asp:Label runat="server" ID="lbltype" style="overflow-wrap:break-word" Text='<%# Bind("Exception_Type") %>' ToolTip='<%# Eval("Exception_Type") %>'></asp:Label>                                               
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Error_Source</HeaderTemplate>
                                <HeaderStyle CssClass=" text-center" />
                                <ItemTemplate>
                                <asp:Label runat="server" ID="lblsource" style=" overflow-wrap:break-word; margin:0 0; padding:0 0;" Text='<%# Bind("Exception_Source") %>' ToolTip='<%# Eval("Exception_Source") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderTemplate><span  aria-hidden="true">Error at LineNo</span></HeaderTemplate>
                                <HeaderStyle CssClass=" text-center" />
                                 <ItemTemplate>
                                         <asp:Label runat="server" ID="lbl_line_no"  style="overflow-wrap:break-word" Text='<%# Bind("Occurred_Line_No") %>'></asp:Label> 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate><span  aria-hidden="true"> URL_Address</span></HeaderTemplate>
                                <HeaderStyle CssClass=" text-center" />
                                 <ItemTemplate>
                                         <asp:Label  runat="server" ID="lbl_url" style="overflow-wrap:break-word; margin:0 0; padding:0 0 ;" Width="100px" Text='<%# Bind("Error_URL") %>' ToolTip='<%# Eval("Error_URL") %>'></asp:Label> 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate><span  aria-hidden="true">Occurred At</span></HeaderTemplate>
                                <HeaderStyle CssClass=" text-center" />
                                 <ItemTemplate>
                                         <asp:Label runat="server" ID="lbl_date" style="overflow-wrap:break-word; margin:0 0; padding:0 0;" Text='<%# Bind("Occurred_Date_Time") %>' ToolTip='<%# Eval("Occurred_Date_Time") %>'></asp:Label> 
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
        </div>
        <footer class="footer navbar-fixed-bottom" style="background-color:grey; height:40px; border-radius:5px; backface-visibility:visible; padding-bottom:80px; " >
        <div class="panel-footer" style="background-color:#808080">
                    <div class="row" style="background-color:grey">
                        <div class="col " style="background-color:grey">
                            <div>
                                <div class="pull-left">&nbsp;&nbsp;&nbsp;
                                    Go To:
                                        <asp:TextBox Width="35px" runat="server" ID="txtGoto" onkeypress="return isNumber(event)" Height="34px" style="border:1px solid grey; border-radius:4.5px; background-color :#F5F5F5; vertical-align:middle"></asp:TextBox>
                                    <button id="Button3" type="button" class="btn btn-primary" runat="server" onserverclick="btnGoto_Click">
                                        <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
                                    </button>
                                </div>
                                <div class="pull-right">
                                    Total_Count:<asp:Label runat="server" ID="lblerrcount" ForeColor="yellow"  Font-Bold="true" Text="0" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Page Size:
                                <asp:DropDownList runat="server" ID="ddlPageSize" AutoPostBack="true" Height="30px" OnSelectedIndexChanged="error_gv_Indexchanged" Width="50px">
                                    
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                </asp:DropDownList>&nbsp;&nbsp;&nbsp;
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>



        </div>


 </asp:Content>









