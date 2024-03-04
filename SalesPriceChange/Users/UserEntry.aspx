<%@ Page Title="" Language="C#" MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="UserEntry.aspx.cs" Inherits="SalesPrice.Users.UserEntry"  %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>  
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <%--test For Modal Popup--%>
      <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"  rel="stylesheet"/>

   
      <script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>



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
     <%--<script >
         function openModal2(text) {
             $('#myModal2').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
             $('#myModal2').modal('show');
         }



         function openModal3(text) {
             $('#myModal3').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
             $('#myModal3').modal('show');
         }
    </script>--%>
      <script >
          function openModal2(text) {
              $('#myModal2').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
              $('#myModal2').modal('show');
          }

          function openModal3(text) {
              $('#myModal3').find('p').html('<span style="color:#4F2817;">' + text + '</span>');
              $('#myModal3').modal('show');
          }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="padding-top:10px"></p>
<%--<div id="fullscreen_bg" class="fullscreen_bg"/>--%>
<div id="regContainer" class="container" align="center" style="width:100%; height:90%">
      <div  vert-offset-top-12" >
      <div style="margin-top:-43px;margin-left:-1%; margin-right:-1%">
        <div class="panel panel-login panel-info " align="center" >
          	<div class="panel-heading" style ="background-color :#337ab7; color:white;">
                  <div class="row" >
                        <div class="col col-xs-6">
                            <h1 class="panel-title" align="left" ><b style="font-weight:bold; font-size:20px; ">ユーザー作成</b></h1>
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
						<hr>


			</div>
          	<div class="panel-body" style="background-color:white;  margin-top:5px;">
						<div class="row" align="left">
							<div  style="background:white; height:450px;width:1000px;margin-bottom:0%;">
  <ul class="nav nav-tabs">
  <%--  <li class="active"><a data-toggle="pill" href="#homea">Home</a></li>--%>
    <li class="active" runat="server" id="user_hide1"><a data-toggle="tab" href="#menua">ユーザーを作成する</a></li>
    <li runat="server"  id="stag_hide" ><a data-toggle="tab" href="#menub">ユーザ認証登録</a></li>
    <li runat="server" id="men_hide" ><a data-toggle="tab" href="#menuc">ユーザーメニュー</a></li>
  </ul>
  
  <div class="tab-content" style="margin-left:5%;">
  <%--  <div id="homea" class="tab-pane fade in active">
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
     
    </div>--%>
    <div id="menua" class="tab-pane  in active">
      <h3>ユーザーを作成する</h3>
       			          <div id="user_account" style="margin-bottom:1%;" >
                            <asp:Label runat="server" ID="lblUserID"  Text="UserID:" Width="100px" Font-Bold="true" Font-Size="15px"></asp:Label>
                            <asp:TextBox runat="server" ID="txtUserID" CssClass="txt" Width="400px" MaxLength ="8" placeholder="username" ToolTip="Maximum length '8'"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="reqUserID" controltovalidate="txtUserID" errormessage="*" ForeColor="Red" Font-Bold="true" ValidationGroup = "LoginFrame" />
                           <asp:label ID= "lblinfo" runat="server" text="UserID is already exist" Visible = "false" Forecolor = "red" ></asp:label>
                           <br /><br />
                            <asp:Label runat="server" ID="lblPassword" Text="Password:" Width="100px" Font-Bold="true" Font-Size="15px"></asp:Label>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="txt" TextMode="Password" Width="400px" placeholder="password" ></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="reqPassword" controltovalidate="txtPassword" errormessage="*" ForeColor="Red" ValidationGroup = "LoginFrame" />
                        
                      

                         
                                   <br /><br />
                            <asp:Label runat="server" ID="Label123" Text="Email:" Width="100px" Font-Bold="true" Font-Size="15px" Visible="false"></asp:Label>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="txt" TextMode="Email"  Width="400px" placeholder="example@gmail.com" Visible="false"></asp:TextBox>
                            <asp:RequiredFieldValidator Visible="false" runat="server" id="RequiredFieldValidator1" controltovalidate="txtEmail" errormessage="*" ForeColor="Red" ValidationGroup = "LoginFrame" />
                            <asp:RegularExpressionValidator Visible="false" ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                           </div>
    </div>

    <div id="menub" class="tab-pane ">
      <h3>ユーザ認証登録</h3>
                                     <div id="user_stageSelection">
                         
                            <asp:Label runat="server" ID="lblStage" Text="<b>ステージ</b>" Width="100px"></asp:Label>
                          
                            <div class="checkbox checkbox-primary">
                                    <asp:CheckBoxList runat="server" CssClass="css-checkbox"  ID="cblUserType"></asp:CheckBoxList>
                            </div>

                                      </div>	
    </div>
    <div id="menuc" class="tab-pane">
      <h3>ユーザーメニュー</h3>
     <div id="usermenu_mode">
        <div class="col-md-12 col-md-offset-0" >
                <div class="panel-body" style=" width :900px; height :300px; overflow-y:scroll; overflow-x:hidden">
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
                             <div style="text-align:center;" runat="server" id="btn_admin">
                                <button id="btnSave" type="button" class="btn btn-primary" validationgroup ="LoginFrame"  runat ="server" onserverclick="btnSave_Click" causesvalidation="true"   >
                                    <span class="glyphicon glyphicon-save"
                                          aria-hidden="true"></span>
                                    <asp:Label ID="lblSave" runat="server" Text="登録"></asp:Label>
                                </button>
                             </div>
			             </div>
                     </div>
                   </div>
                </div>
            </div>
      
    

     <div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header modal-header-danger">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Wanrning</h4>
      </div>
      <div class="modal-body">
        <p></p>
      </div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
      </div>
    </div>

  </div>
</div>

    
      <div id="myModal3" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header modal-header-info">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Information</h4>
      </div>
      <div class="modal-body">
        <p></p>
      </div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

</asp:Content>
