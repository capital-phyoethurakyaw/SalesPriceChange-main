<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="Users_Entry.aspx.cs" Inherits="SalesPrice.Setting.Users_Entry" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>  

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript" src="../Scripts/jquery-3.2.0.min.js"></script>
        <link href="../Styles/Common.css" rel="stylesheet" /> 
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" type="text/css" />
        <link href="../Styles/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/2.css" rel="stylesheet" />
    <script src="../Scripts/3.js"></script>
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
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="padding-top:10px"></p>
    <%--<div class="container" style="display:none"  >--%>
     <%--<div class="row"  style="margin-top:30px; display:none">
        <div class="col-md-12 col-md-offset-3">
            <div class="panel panel-info panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h1 class="panel-title"><b style="font-weight:bold;  text-shadow: 2px 2px White; font-size:20px;">User Entry</b></h1>
                        </div>
                    </div>
                </div>--%>
     <%-- <div class="panel-body">
                    <div class="container">
                        <div class="row">
                        <div class="col col-xs-6">

                            <asp:Label runat="server" ID="lblUserID" Text="UserID:" Width="100px"></asp:Label>
                            <asp:TextBox runat="server" ID="txtUserID" CssClass="txt" Width="150px" MaxLength ="8"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="reqUserID" controltovalidate="txtUserID" errormessage="*" ForeColor="Red" ValidationGroup = "LoginFrame" />
                           <asp:label ID= "lblinfo" runat="server" text="UserID is already exist" Visible = "false" Forecolor = "red" ></asp:label>
                            <p></p>                        
                            
                            <asp:Label runat="server" ID="lblPassword" Text="Password:" Width="100px"></asp:Label>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="txt" TextMode="Password" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="reqPassword" controltovalidate="txtPassword" errormessage="*" ForeColor="Red" ValidationGroup = "LoginFrame" />
                           
                             <p></p>
                            <asp:Label runat="server" ID="lblStage" Text="<b>STAGE</b>" Width="100px"></asp:Label>
                            <p style="padding-bottom:10px;"></p>
                            <div class="checkbox checkbox-primary">
                                    <asp:CheckBoxList runat="server" CssClass="css-checkbox"  ID="cblUserType"></asp:CheckBoxList>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>--%>
     <%--  <div class="panel-footer">
                    <div class="row">
                        <div class="col col-xs-12">
                            <div class="text-center">
                                <button id="btnSave" type="button" class="btn btn-primary" validationgroup ="LoginFrame"  runat ="server" onserverclick="btnSave_Click"   >
                                    <span class="glyphicon glyphicon-save"
                                          aria-hidden="true"></span>
                                    <asp:Label ID="lblSave" runat="server" Text="Save"></asp:Label>
                                 </button>
                            </div>
                        </div>
                    </div>
                </div>--%>
     <%--      </div>
        </div>
    </div>
</div>--%>
     <%--    <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server">  
        </asp:ToolkitScriptManager>
   
  <div>  
      
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">  
        </asp:ToolkitScriptManager>  
        <br />  
        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" Height="229px" Width="353px">  
            <asp:TabPanel runat="server" HeaderText="Login Form" ID="TabPanel1">  
                <ContentTemplate >  
                    <asp:Label ID="lbllogin" runat="server" Text="Login Here" "True" "True" "True" ForeColor="#660033"></asp:Label>  
                    <table style="width: 100%;" border:"1" runat="server">  
                        <tr>  
                            <td><asp:Label ID="lbluname" runat="server" Text="UserName" "True" ForeColor="#000099"></asp:Label></td>  
                            <td><asp:TextBox ID="tbuname" runat="server"></asp:TextBox></td>  
                        </tr>  
                        <tr>  
                            <td><asp:Label ID="lblpass" runat="server" Text="Password" "True" ForeColor="#000099"></asp:Label></td>  
                            <td><asp:TextBox ID="tbpass" runat="server"></asp:TextBox></td>  
                        </tr>  
                        <tr>  
                            <td> </td>  
                            <td><asp:Button ID="btnSubmit" runat="server" Text="Submit" BackColor="#0099FF" "True" ForeColor="#000099" Height="27px" /></td>  
                        </tr>  
                    </table>   
                </ContentTemplate>  
            </asp:TabPanel>  
            <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Registration Form">  
                <ContentTemplate>  
                    <asp:Label ID="lblRegistration" runat="server" Text="Registration Here" "True" "True" "True" ForeColor="#660033"></asp:Label>  
                    <table style="width: 100%;" border:"1">  
                        <tr>  
                            <td><asp:Label ID="lblUserName" runat="server" Text="UserName" "True" ForeColor="#000099"></asp:Label></td>  
                            <td><asp:TextBox ID="tbUserName" runat="server"></asp:TextBox></td>  
                        </tr>  
                        <tr>  
                            <td><asp:Label ID="Label1" runat="server" Text="Password" "True" ForeColor="#000099"></asp:Label></td>  
                            <td><asp:TextBox ID="tbPassword" runat="server"></asp:TextBox></td>  
                        </tr>  
                        <tr>  
                            <td><asp:Label ID="lblFname" runat="server" Text="FirstName" "True" ForeColor="#000099"></asp:Label></td>  
                            <td><asp:TextBox ID="tbFname" runat="server"></asp:TextBox></td>  
                        </tr>  
                        <tr>  
                            <td><asp:Label ID="lblLastName" runat="server" Text="LastName" "True" ForeColor="#000099"></asp:Label></td>  
                            <td><asp:TextBox ID="tbLastName" runat="server"></asp:TextBox></td>  
                        </tr>  
                        <tr>  
                            <td> </td>  
                            <td><asp:Button ID="Button1" runat="server" Text="Save" BackColor="#0099FF" "True" ForeColor="#000099" Height="27px"/></td>  
                        </tr>  
                    </table>   
                </ContentTemplate>  
            </asp:TabPanel>  
        </asp:TabContainer>  
       </div>  
   --%>


<div id="regContainer" class="container" align="center" style="width:100%;">
      <div class="row vert-offset-top-12" >
      <div class="col-md-12" style="margin-top:1.5%;">
        <div class="panel panel-login panel-info " align="center" style="margin-left:-10%; margin-right:-10%" >
          	<div class="panel-heading  ckmdiv">
                  <div class="row" >
                        <div class="col col-xs-6">
                            <h1 class="panel-title" align="left" ><b style="font-weight:bold;  text-shadow: 2px 2px White; font-size:20px; ">ユーザー作成</b></h1>
                        </div>
                  </div>
	 <%--<div class="row">
							<div class="col-xs-4">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-4">
								<a href="#" id="register-form-link">Register</a>
							</div>
                            <div class="col-xs-4">
								<a href="#" id="comfirmationform-link">Comfirmation</a>
							</div>
						</div>--%>
						<hr/>
			</div>
          	<div class="panel-body" style="background-color:white; background-size:cover; margin-top:5px;">
						<div class="row" align="left">
							<div  style="background:white; height:450px;width:1000px; margin-bottom:11%;">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#menua">ユーザー名</a></li>
    <li><a data-toggle="tab" href="#menub">ユーザー権限登録</a></li>
    <li><a data-toggle="tab" href="#menuc">ユーザーメニュー</a></li>
  </ul>
  
  <div class="tab-content" style="margin-left:5%;">
  <%--  <div id="homea" class="tab-pane fade in active">
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
     
    </div>--%>
    <div id="menua" class="tab-pane  in active">
       			          <div  id="user_account" style="padding-top: 100px;">
                            <asp:Label runat="server" ID="lblUserID"  Text="UserID:" Width="100px" Font-Bold="true" Font-Size="15px"></asp:Label>
                            <asp:TextBox runat="server" ID="txtUserID" CssClass="txt" Width="400px" MaxLength ="8" placeholder="username"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="reqUserID" controltovalidate="txtUserID" errormessage="*" ForeColor="Red" Font-Bold="true" ValidationGroup = "LoginFrame" />
                           <asp:label ID= "lblinfo" runat="server" text="UserID is already exist" Visible = "false" Forecolor = "red" ></asp:label>
                           <br /><br />
                            <asp:Label runat="server" ID="lblPassword" Text="Password:" Width="100px" Font-Bold="true" Font-Size="15px"></asp:Label>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="txt" TextMode="Password" Width="400px" placeholder="password" ></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="reqPassword" controltovalidate="txtPassword" errormessage="*" ForeColor="Red" ValidationGroup = "LoginFrame" />
                          </div>
    </div>

    <div id="menub" class="tab-pane ">
                                     <div id="user_stageSelection" style ="padding-top :0px;">
                         
                            <asp:Label runat="server" ID="lblStage" Width="100px"></asp:Label>
                          
                            <div class="checkbox checkbox-primary">
                                    <asp:CheckBoxList runat="server" CssClass="css-checkbox"  ID="cblUserType"></asp:CheckBoxList>
                            </div>
                                      </div>	

    </div>
    <div id="menuc" class="tab-pane ">
     <div id="usermenu_mode" style ="padding-top:0px;">
        <div class="col-md-12 col-md-offset-0" >
                <div class="panel-body">
                    <div class="container">
                        <div class="row">
                        <div class="col col-xs-6">
                         
                             
                                   
                                    <%--<asp:DropDownList runat="server" ID="ddlmenu" AutoPostBack = "true"  OnSelectedIndexChanged = "Menu_SelectedIndexChanged"  Width="130px" style="display:none;"></asp:DropDownList></h3>
                                   --%>
                                    <asp:TreeView ID="TreeView1" LeafNodeStyle-CssClass="treeview" RootNodeStyle-CssClass="treeview" NodeStyle-CssClass="treeview css-checkbox" runat="server" ShowCheckBoxes="All" style=" margin-top:-30px;">
                                        </asp:TreeView>
                        </div>
                     </div>
                   </div>
                </div>
             </div>
           </div>
        </div>
    </div>
  </div>
</div>
                  <%--<footer class="footer navbar-fixed-bottom">--%>
                             <div style="text-align:center;">
                                <button id="btnSave" type="button" class="btn btn-primary" validationgroup ="LoginFrame"  runat ="server" onserverclick="btnSave_Click"   >
                                    <span class="glyphicon glyphicon-save"
                                          aria-hidden="true"></span>
                                    <asp:Label ID="lblSave" runat="server" Text="登録"></asp:Label>
                                </button>
                             </div>
                      <%--</footer>--%>
			             </div>
                     </div>
                   </div>
                </div>
            </div>
</asp:Content>
