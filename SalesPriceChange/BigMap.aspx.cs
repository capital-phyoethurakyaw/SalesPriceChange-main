using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace SalesPrice
{
    public partial class BigMap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Bitmap bitmap = new Bitmap(200, 200);
         Graphics   graphics = Graphics.FromImage(bitmap);
            graphics.DrawLine(new Pen(Color.Black), 0, 0, 200, 200);

        }
    }
}