<%@ Page Title="" Language="C#"  MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="User_Menu.aspx.cs" Inherits="SalesPrice.Users.User_Menu" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link href="../Styles/style.css" rel="stylesheet" type="text/css"  />
    <link href="../Styles/button.css" rel="stylesheet" />
<script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    function OnTreeClick(evt) {
        var src = window.event != window.undefined ? window.event.srcElement : evt.target;
        var isChkBoxClick = (src.tagName.toLowerCase() == "input" && src.type == "checkbox");
        if (isChkBoxClick) {
            var parentTable = GetParentByTagName("table", src);
            var nxtSibling = parentTable.nextSibling;
            //check if nxt sibling is not null & is an element node
            if (nxtSibling && nxtSibling.nodeType == 1) {
                if (nxtSibling.tagName.toLowerCase() == "div") //if node has children
                {
                    //check or uncheck children at all levels
                    CheckUncheckChildren(parentTable.nextSibling, src.checked);
                }
            }
            //check or uncheck parents at all levels
            CheckUncheckParents(src, src.checked);
        }
    }

    function CheckUncheckChildren(childContainer, check) {
        var childChkBoxes = childContainer.getElementsByTagName("input");
        var childChkBoxCount = childChkBoxes.length;
        for (var i = 0; i < childChkBoxCount; i++) {
            childChkBoxes[i].checked = check;
        }
    }

    function CheckUncheckParents(srcChild, check) {
        var parentDiv = GetParentByTagName("div", srcChild);
        var parentNodeTable = parentDiv.previousSibling;
        if (parentNodeTable) {
            var checkUncheckSwitch;
            if (check) //checkbox checked
            {
                var isAllSiblingsChecked = AreAllSiblingsChecked(srcChild);
                if (isAllSiblingsChecked)
                    checkUncheckSwitch = true;
                else
                    return; //do not need to check parent if any(one or more) child not checked
            }
            else //checkbox unchecked
            {
                var isAllSiblingsChecked = AreAllSiblingsChecked(srcChild);
                if (isAllSiblingsChecked)
                    checkUncheckSwitch = true;
                else checkUncheckSwitch = false;
            }

            var inpElemsInParentTable = parentNodeTable.getElementsByTagName("input");
            if (inpElemsInParentTable.length > 0) {
                var parentNodeChkBox = inpElemsInParentTable[0];
                parentNodeChkBox.checked = checkUncheckSwitch;
                //do the same recursively
                CheckUncheckParents(parentNodeChkBox, checkUncheckSwitch);
            }
        }
    }

    function AreAllSiblingsChecked(chkBox) {
        var parentDiv = GetParentByTagName("div", chkBox);
        var childCount = parentDiv.childNodes.length;
        for (var i = 0; i < childCount; i++) {
            if (parentDiv.childNodes[i].nodeType == 1) {
                //check if the child node is an element node
                if (parentDiv.childNodes[i].tagName.toLowerCase() == "table") {
                    var prevChkBox = parentDiv.childNodes[i].getElementsByTagName("input")[0];
                    //if any of sibling nodes are not checked, return false
                    if (prevChkBox.checked) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    //utility function to get the container of an element by tagname
    function GetParentByTagName(parentTagName, childElementObj) {
        var parent = childElementObj.parentNode;
        while (parent.tagName.toLowerCase() != parentTagName.toLowerCase()) {
            parent = parent.parentNode;
        }
        return parent;
    }

  
</script>
<style type="text/css">
    a:link
    {
        color:Black;
    }
</style>
   
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <div style="margin-left:30%; margin-right:30% ;text-align:center; padding:3%; height:450px; box-shadow:0px 0px 5px gray; margin-top:5%;">


<asp:UpdatePanel ID="udmenu" UpdateMode="Conditional" runat="server">
<ContentTemplate>
<h3 style="text-align:center;" >Menu Mode</h3>
<div id="Div1" style="width:100%; text-align:center " runat="server" visible="true">

         <h3 style="color:black" runat="server" class="ddl">User Name:<asp:DropDownList runat="server" ID="ddlmenu" AutoPostBack = "true"  OnSelectedIndexChanged = "Menu_SelectedIndexChanged"  Width="320px" Height="40px" ></asp:DropDownList></h3>
          
        </div>

<div style="margin-left:0%; margin-right:0% ;text-align:center; padding:0%; ">


<asp:TreeView ID="TreeView1" runat="server" ShowCheckBoxes="All">
</asp:TreeView>
   </div>
 
 </ContentTemplate>
    </asp:UpdatePanel>
   
<asp:button id="btnUpdate" runat="server" text="Update"  CssClass="myButton"/>

<cc1:modalpopupextender id="ModalPopupExtender1" runat="server" 
	targetcontrolid="btnUpdate" popupcontrolid="Panel1" 
	popupdraghandlecontrolid="PopupHeader"
	backgroundcssclass="modalBackground">
</cc1:modalpopupextender>

<asp:panel id="Panel1" style="display: none" runat="server" >
	<div class="modalPopup">
                <div class="PopupHeader" id="PopupHeader">
                    Information</div>
                    <hr style="border-bottom: 2px dashed gray; "/>
                <div class="PopupBody">
                    <p>
                        <asp:Label ID="lblpop1" runat="server" Text= "Update Successfully"></asp:Label></p>
                </div>
                <div class="Controls">
                    &nbsp; &nbsp;<asp:Button ID="btnok" runat="server" Text="OK" OnClick ="btnok_click" CssClass="left" ValidationGroup = "LoginFrame"/>  &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; 
		</div>
        </div>
</asp:panel>

        <%--<asp:ImageButton ID="btnSave" ImageUrl="~/Images/save_button.png" runat="server"  />--%>
       
      </div>
</asp:Content>



