using Newtonsoft.Json;
using SalesPriceChange_DL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SalesPriceChange_Common;


namespace SalesPrice
{
    public partial class Retrieving_Users : System.Web.UI.Page
    {
        public static string connectionString = ConfigurationManager.ConnectionStrings["SalePriceChangeDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string str = DataTableToJSONWithStringBuilder(GetUser());
            str.Replace("},{", (Environment.NewLine).ToString());
            //str.Remove('},{');
            //str.(",").join(Environment.NewLine);
            Response.Write(str);
        }

        public string DataTableToJSONWithStringBuilder(DataTable table)
        {
            //int i =table.Rows.Count;
            //int j=table.Columns.Count;
            foreach (DataRow row in table.Rows)
            {
                foreach (DataColumn column in table.Columns)
                {
                    //string eee = string.Empty;
                    //string ddd = column.ToString();
                    //if (ddd.ToString().Length > 15)
                    //{
                    //    Crypto cry = new Crypto();
                    //    string decry_key = "SPC123";
                    //    eee = cry.Decrypt(ddd.ToString(), decry_key);

                    //    row.SetField(column, eee);
                    //}
                
                    //table.Rows[][]=1;

                }
              
                    //if (row["Name"].ToString() == "Som")
                    //    row.SetField("Name", "AnotherName");
                
            }

            for (int i = table.Rows.Count - 1; i >= 0; i--)
            {
                string eee = string.Empty;
                DataRow dr = table.Rows[i];
                if (dr["password"].ToString().Length > 15)
                {
                    Crypto cry = new Crypto();
                    string decry_key = "SPC123";
                    eee = cry.Decrypt(dr["password"].ToString(), decry_key);
                    dr.SetField("password", eee);
                }
            }
        
     
           


            string JSONString = string.Empty;
            if (table.Rows.Count > 0)
            {
                JSONString = JsonConvert.SerializeObject(table);
            }
            return JSONString;
        }

        public DataTable GetUser()
        {
            try
            {


                SqlConnection con = new SqlConnection(connectionString);
                DataTable dtb = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter("SP_Get_UserInfo_By_Json", con);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Connection.Open();
                sda.Fill(dtb);
                sda.SelectCommand.Connection.Close();
                return dtb;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}