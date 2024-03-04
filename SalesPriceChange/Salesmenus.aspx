<%@ Page Title="SalesMenus" Language="C#"  MasterPageFile="~/SalePrice.Master" AutoEventWireup="true" CodeBehind="Salesmenus.aspx.cs" Inherits="SalesPriceChange.Salesmenus" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="head">
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

<style>
    a:link
    {
        color:Black;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
<div id="Div1" style="width:100%; text-align:center " runat="server" visible="true">
         
         <h3 id="H1" style="color:black" runat="server" class="ddl">User Name:<asp:DropDownList runat="server" ID="ddlmenu"  AutoPostBack = "true" Width="320px" Height="40px" ></asp:DropDownList></h3>
        </div>

<div style="margin-left:30%; margin-right:30% ;text-align:center; padding:3%; height:450px; box-shadow:0px 0px 5px gray;">
<h3 style="text-align:center; padding-top:-10px;" >Menu Mode</h3>

<asp:TreeView ID="TreeView2" runat="server" ShowCheckBoxes="All"  ClientIDMode="Static" ExpandDepth="3">
 <Nodes>

    <asp:TreeNode Text="One" NavigateUrl="javascript:void(0)"/>
                

      <asp:TreeNode Text="Two" NavigateUrl="javascript:void(0)" >
     

    </asp:TreeNode>

  </Nodes>
    <%--<HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />--%>
    <%--<NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
        NodeSpacing="0px" VerticalPadding="2px"></NodeStyle>--%>
  <%--  <ParentNodeStyle Font-Bold="true" />
    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
        VerticalPadding="0px" />--%>
</asp:TreeView>
    

    <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images/save_button.png" runat="server" />
</div>
 

<%--<script type="text/javascript">
function GetSelectedNode() {
    var treeViewData = window["<%=TreeView1.ClientID%>" + "_Data"];
    if (treeViewData.selectedNodeID.value != "") {
        var selectedNode = document.getElementById(treeViewData.selectedNodeID.value);
        var value = selectedNode.href.substring(selectedNode.href.indexOf(",") + 3, selectedNode.href.length - 2);
        var text = selectedNode.innerHTML;
        alert("Text: " + text + "\r\n" + "Value: " + value);
    } else {
        alert("No node selected.")
    }
    return false;
}
</script>--%>



</asp:Content>