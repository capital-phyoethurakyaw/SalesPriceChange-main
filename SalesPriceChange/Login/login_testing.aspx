<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_testing.aspx.cs" Inherits="SalesPrice.Login.login_testing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" / ></script>
   
      <style>
          /*
look at the weird glitch on the 6th button. something to do with color vs background-color. or did i fuck up?
*/

*, *:before, *:after {
   -moz-box-sizing: border-box; 
  -webkit-box-sizing: border-box; 
  box-sizing: border-box;
}
body {
  font-family:'Helvetica', sans-serif; 
}


/* Button 0 */


.button-wrap {
  width: 160px;
  margin: 40px auto 0;
  cursor: pointer;
}
.button-bg {
  width: 100%;
  height: 100%;
  background-color: #000;
  border-radius: 40px;
  padding: 3px;
  color:#fff;
  transition:all 0.2s ease;
}
.button-switch {
  position:relative;
  left:0px;
  width: 74px;
  height: 74px;
  border:solid 22px;
  border-radius: 36px;
  transition:all 0.2s ease;
}
.button-active .button-switch { left:80px; }
.button-on, 
.button-off {
  position:absolute; 
  transition:all 0.2s ease;
  padding-top:15px;
  font-size:2.4em;
  font-weight:bold;
}
.button-on { margin-left:110px; }
.button-off { margin-left:30px; color:#dd2222; }
.button-active .button-off { color:#fff; }
.button-active .button-on { color:#22dd22; }
.button-active .button-bg { background-color:#000; }


/* BUTTON 1 */

/* BUTTON 4 */


.four .button-wrap {
  width: 100px;
  margin: 40px auto 0;
  cursor: pointer;
}
.four .button-bg {
  width: 100%;
  height: 100%;
  background-color: #bb2222;
  border-radius: 40px;
  padding: 3px;
  color:#fff;
  transition:all 0.2s ease;
}
.four .button-switch {
  position:relative;
  left:0px;
  width: 44px;
  height: 44px;
  border:solid 13px;
  background-color:#fff;
  border-radius: 36px;
  transition:all 0.2s ease;
}
.four .button-active .button-switch { left:50px; }
.four .button-in, 
.four .button-out {
  position:absolute; 
  transition:all 0.2s ease;
  padding-top:15px;
  font-size:0.8em;
  text-transform:uppercase;
  font-weight:bold;
}
.four .button-in { margin-left:76px; }
.four .button-out { margin-left:18px; }
.four .button-active .button-out {  }
.four .button-active .button-in {  }
.four .button-active .button-bg { background-color:#22bb22; }


      </style>
</head>
<body >
    <div class="four">
  <div class="button-wrap">
    <div class="button-bg">
      <div class="button-out"></div>
      <div class="button-in"></div>
      <div class="button-switch"></div>
    </div>
  </div>
</div>

    <script>
        $('.button-wrap').on("click", function () {
            $(this).toggleClass('button-active');
        });
   </script>
</body>
</html>
