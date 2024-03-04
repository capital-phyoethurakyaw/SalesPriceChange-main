
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SalesPrice.Login.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../Styles/bootstrap.min.css" rel="stylesheet"  />
    <link href="../Scripts/bootstrap.min.js" rel="stylesheet" />
    <title></title>
</head>
<body style="background:url('../Images/maxresdefault.jpg') no-repeat center center fixed; background-size:cover;">
        <div class="container" style="margin-top: 5%;">
            <div class="col-md-4 col-md-offset-4">
        <div class="panel panel-primary" style="border-radius:5px;   box-shadow: 5px 5px 5px grey;">
            <div class="panel-heading">Login</div>
            <div class="panel-body">
            
            <!-- Login Form -->

            <form id="Form1" role="form" runat="server">
            
            <!-- Username Field -->
                <div class="row">
                    <div class="form-group ">
                    <label for="username"><span class="text-danger" style="margin-right:5px;">*</span>Username:</label>
                        <div class="input-group" style="margin-left:10px;">
                            <input class="form-control" runat="server" id="txtUserID" type="text" name="username" placeholder="Username" required="required"/>
                            <span class="input-group-btn">
                                <label class="btn btn-primary"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></label> 
                            </span>
                            <span class="input-group-btn">
                                <asp:RequiredFieldValidator runat="server" id="requserid" controltovalidate="txtUserID" errormessage="*" ForeColor="Red"/>
                            </span>
                        </div>
                    </div>
                </div>
                <!-- Content Field -->
                <div class="row">
                    <div class="form-group ">
                        <label for="password"><span class="text-danger" style="margin-right:5px;">*</span>Password:</label>
                        <div class="input-group" style="margin-left:10px;">
                            <input class="form-control" runat="server" id="txtPassword" type="password" name="username" placeholder="Password" required="required"/>
                            <span class="input-group-btn">
                                <label class="btn btn-primary"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></label>                        
                            </span>
                        </div>
                    </div>
                </div>
                <!-- Login Button -->
                <div class="row">
                    <div class="form-group col-xs-4">
                        <button runat="server" id="btnSubmit" onserverclick="Submit_ServerClick" class="btn btn-primary" type="submit">Submit</button>
                        <asp:Label runat="server" ID="lblErrorMsg" Text="Login Failed" ForeColor="Red" Visible="false"></asp:Label>
                    </div>
                </div>
        
 

        </form>
                       </div>
    </div>
</div>
        </div>
</body>
</html>