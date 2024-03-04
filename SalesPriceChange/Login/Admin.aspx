<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="SalesPrice.Login.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../Styles/bootstrap.min.css" rel="stylesheet"  />
    <link href="../Scripts/bootstrap.min.js" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300" type="text/css" />

    <style>
        .flash {
   animation-name: flash;
    animation-duration: 0.2s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    animation-play-state: running;
}

@keyframes flash {
    from {color: red;}
    to {color: black;}
}
 body{
	margin:0;
	padding:0;
	font-family:"arial",heletica,sans-serif;
	font-size:12px;
    background: #2980b9 url('https://static.tumblr.com/03fbbc566b081016810402488936fbae/pqpk3dn/MRSmlzpj3/tumblr_static_bg3.png') repeat 0 0;
	-webkit-animation: 10s linear 0s normal none infinite animate;
	-moz-animation: 10s linear 0s normal none infinite animate;
	-ms-animation: 10s linear 0s normal none infinite animate;
	-o-animation: 10s linear 0s normal none infinite animate;
	animation: 10s linear 0s normal none infinite animate;
 
}
 
@-webkit-keyframes animate {
	from {background-position:0 0;}
	to {background-position: 500px 0;}
}
 
@-moz-keyframes animate {
	from {background-position:0 0;}
	to {background-position: 500px 0;}
}
 
@-ms-keyframes animate {
	from {background-position:0 0;}
	to {background-position: 500px 0;}
}
 
@-o-keyframes animate {
	from {background-position:0 0;}
	to {background-position: 500px 0;}
}
 
@keyframes animate {
	from {background-position:0 0;}
	to {background-position: 500px 0;}
}
        .panel {
            background:none;
            border-color:none;
            border-color:transparent;
        }
        
    </style>

    <title>Admin-Login</title>
</head>
<body style="color:white" >
   
    <div id="canv">
        <div id="grid" class="container" style="margin-top: 5%;background-size:cover">
            <div class="col-md-4 col-md-offset-4">
        <div class="" style="border-radius:5px;  backface-visibility:visible">
            <div class="panel-heading flash" style="background:none; font-size:x-large; color:brown" align="center">Admin Login</div>
            <div class="panel-body" style="backface-visibility:visible">
            
            <!-- Login Form -->

            <form id="Form1" role="form" runat="server" align="center">
            
            <!-- Username Field -->
                <div class="row">
                    <div class="form-group " align="center">
         
                        <div class="input-group" style="margin-left:10px;">
                            <input class="form-control" style="background-color:whitesmoke" runat="server" id="txtUserID" type="text" name="username" placeholder="Username" required="required"/>
                            <span class="input-group-btn">
                                <label class="btn btn-primary flash"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></label> 
                            </span>
                            <span class="input-group-btn">
                                <asp:RequiredFieldValidator runat="server" id="requserid" controltovalidate="txtUserID" errormessage="*" ForeColor="Red"/>
                            </span>
                        </div>
                    </div>
                </div>
                <!-- Content Field -->
                <div class="row" align="center">
                    <div class="form-group ">
                     
                        <div class="input-group" style="margin-left:10px;">
                            <input class="form-control" style="background-color:whitesmoke" runat="server" id="txtPassword" type="password" name="username" placeholder="Password" required="required"/>
                            <span class="input-group-btn">
                                <label class="btn btn-primary flash"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></label>                        
                            </span>
                        </div>
                    </div>
                </div>
                <!-- Login Button -->
                <div class="row" align="right" style="float:right; ">
                    <div class="form-group col-xs-4" align="right">
                        <button runat="server" id="btnSubmit" onserverclick="Submit_ServerClick" class="btn btn-primary flash" type="submit" style="color:brown">Submit</button>
                        <br />
                        <asp:Label  runat="server" ID="lblErrorMsg" Text="Access Denied" ForeColor="Yellow" Font-Size="50px" style="width:200px" Visible="false"></asp:Label>
                    </div>
                </div>
        
 

        </form>
                       </div>
    </div>
</div>
        </div>
        </div>
</body>
</html>
