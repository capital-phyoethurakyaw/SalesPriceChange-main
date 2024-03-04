<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BigMap.aspx.cs" Inherits="SalesPrice.BigMap" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title> Pattern Testing</title>
    <%--<script type="text/JavaScript" src="jsDraw2D.js"></script>--%>
    <script src="Scripts/jsDraw2D_Uncompressed.js"></script>
    <script src="Scripts/jsDraw2D.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div id="canvas" style="overflow:hidden;position:relative;width:600px;height:300px;" align="center"></div>
    </form>
<%--    <script type="text/JavaScript">

        //Create jsGraphics object
        var gr = new jsGraphics(document.getElementById("canvas"));

        //Create jsColor object
        var col = new jsColor("blue");

        //Create jsPen object
        var pen = new jsPen(col, 1);

        //Draw a Line between 2 points
        var pt1 = new jsPoint(20, 30);
        var pt2 = new jsPoint(120, 230);
        gr.drawLine(pen, pt1, pt2);

        //Draw filled circle with pt1 as center point and radius 30. 
        gr.fillCircle(col, pt1, 30);

        //You can also code with inline object instantiation like below
        gr.drawLine(pen, new jsPoint(40, 10), new jsPoint(70, 150));

</script>--%>
    <script type="text/javascript">
        var gr = new jsGraphics(document.getElementById("canvas"));
        var redPen = new jsPen(new jsColor("red"), 1);
        var greenPen = new jsPen(new jsColor("green"), 3);
        var bluePen = new jsPen(new jsColor("blue"), 1);
        //gr.hideGrid();
        //var curvePoints = new Array(new jsPoint(28, 35), new jsPoint(52, 16), new jsPoint(177, 38), new jsPoint(149, 85), new jsPoint(57, 92));
        //var bezierPoints = new Array(new jsPoint(-283, 10), new jsPoint(-206, 95), new jsPoint(-24, 90), new jsPoint(-56, 10));
        //var closedCurvePoints = new Array(new jsPoint(-265, -50), new jsPoint(-68, -23), new jsPoint(-114, -50), new jsPoint(-58, -95));
        //var polyPoints = new Array(new jsPoint(160, -50), new jsPoint(190, -80), new jsPoint(240, -15), new jsPoint(260, -67));
        //hideGrid();
        gr.setOrigin(new jsPoint(300, 100));
        gr.setCoordinateSystem("cartecian");
        gr.showGrid(20);
        //hideGrid().gridLines.xAxes.hideGrid();
        //xAxes.showGrid();
        //yAxes.showGrid();
        //showGrid([ 300,300], [false], RGB[0, 0, 0]);
        
        //plotPoints(curvePoints);
        //plotPoints(bezierPoints);

        //gr.drawCurve(bluePen, curvePoints);
        //gr.drawBezier(bluePen, bezierPoints);
        //gr.fillClosedCurve(redPen.color, closedCurvePoints);

        //gr.drawLine(greenPen, new jsPoint(20, -20), new jsPoint(100, -120));
        //gr.drawLine(bluePen, new jsPoint(100, -120), new jsPoint(200, -150));

        gr.drawLine(greenPen, new jsPoint(20, 20), new jsPoint(20, 80));
        gr.drawLine(greenPen, new jsPoint(20, 40), new jsPoint(40, 80));
        gr.drawLine(greenPen, new jsPoint(20, 40), new jsPoint(40, 20));
        gr.drawLine(greenPen, new jsPoint(40, 80), new jsPoint(80, 80));
        gr.drawLine(greenPen, new jsPoint(60, 80), new jsPoint(60, 20));
        gr.drawLine(greenPen, new jsPoint(80, 20), new jsPoint(80, 80));
        gr.drawLine(greenPen, new jsPoint(80, 80), new jsPoint(120, 80));
        gr.drawLine(greenPen, new jsPoint(120, 80), new jsPoint(120, 40));
        gr.drawLine(greenPen, new jsPoint(120, 40), new jsPoint(80, 40));

        //var options = {
        //    scales: {
        //        xAxes: [{
        //            gridLines: {
        //                display: false
        //            }
        //        }],
        //        yAxes: [{
        //            gridLines: {
        //                display: false
        //            }
        //        }]
        //    }
        //}
        //axes: {
        //        xaxis: {
        //            tickOptions: {
        //                    showGridline: false
        //            }
        //        }
        //}
       
        //hideGrid();
        //gr.fillEllipse(new jsColor("aqua"), new jsPoint(100, -55), 50, 30);
        //gr.drawPolygon(redPen, polyPoints);

        //var font = new jsFont("arial", "bold", "12px");

        //gr.drawText("Curve passing through given points.", new jsPoint(200, 80), font, bluePen.color, 90);
        //gr.drawText("Cubic Bezier curve.", new jsPoint(-220, 40), font, bluePen.color, 110);
        //gr.drawText("Filled, closed curve.", new jsPoint(-60, -25), font, bluePen.color, 60);
        //gr.drawText("Basic drawing (line, ellipse, polygon).", new jsPoint(25, -80), font, bluePen.color);

        //plotPoints(closedCurvePoints);

        //function plotPoints(points) {
        //    for (i in points) {
        //        gr.fillRectangle(new jsColor("green"), new jsPoint(points[i].x - 2, points[i].y + 2), 4, 4);
        //    }
        //}
</script>
  <%--  <script type="text/javascript">
        var gr = new jsGraphics(document.getElementById("canvas"));
        var redPen = new jsPen(new jsColor("red"), 1);
        var greenPen = new jsPen(new jsColor("green"), 3);
        var bluePen = new jsPen(new jsColor("blue"), 1);

        var curvePoints = new Array(new jsPoint(28, 35), new jsPoint(52, 16), new jsPoint(177, 38), new jsPoint(149, 85), new jsPoint(57, 92));
        var bezierPoints = new Array(new jsPoint(-283, 10), new jsPoint(-206, 95), new jsPoint(-24, 90), new jsPoint(-56, 10));
        var closedCurvePoints = new Array(new jsPoint(-265, -50), new jsPoint(-68, -23), new jsPoint(-114, -50), new jsPoint(-58, -95));
        var polyPoints = new Array(new jsPoint(160, -50), new jsPoint(190, -80), new jsPoint(240, -15), new jsPoint(260, -67));

        gr.setOrigin(new jsPoint(300, 100));
        gr.setCoordinateSystem("cartecian");
        gr.showGrid(20);

        plotPoints(curvePoints);
        plotPoints(bezierPoints);

        gr.drawCurve(bluePen, curvePoints);
        gr.drawBezier(bluePen, bezierPoints);
        gr.fillClosedCurve(redPen.color, closedCurvePoints);

        gr.drawLine(greenPen, new jsPoint(25, -25), new jsPoint(80, -80));
        gr.fillEllipse(new jsColor("aqua"), new jsPoint(100, -55), 50, 30);
        gr.drawPolygon(redPen, polyPoints);

        var font = new jsFont("arial", "bold", "12px");

        gr.drawText("Curve passing through given points.", new jsPoint(200, 80), font, bluePen.color, 90);
        gr.drawText("Cubic Bezier curve.", new jsPoint(-220, 40), font, bluePen.color, 110);
        gr.drawText("Filled, closed curve.", new jsPoint(-60, -25), font, bluePen.color, 60);
        gr.drawText("Basic drawing (line, ellipse, polygon).", new jsPoint(25, -80), font, bluePen.color);

        plotPoints(closedCurvePoints);

        function plotPoints(points) {
            for (i in points) {
                gr.fillRectangle(new jsColor("green"), new jsPoint(points[i].x - 2, points[i].y + 2), 4, 4);
            }
        }
</script>--%>
</body>
</html>
