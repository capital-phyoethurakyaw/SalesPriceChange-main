using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SalesPriceChange_Common;

namespace SalesPriceChange_DL
{
   public class MDManagement_DL:BaseDL
   {
       public bool MDLined_Delete(string id)
       {
           Connection con = new Connection();
           SqlConnection sqlcon = con.GetConnection();
           SqlCommand cmd = new SqlCommand("MDLined_Delete", sqlcon);
           cmd.CommandType = CommandType.StoredProcedure;
           AddParameter(cmd, "@ID", id);
           try
           {
               cmd.Connection.Open();
               cmd.ExecuteNonQuery();
               return true;
           }
           catch
           { return false;
           }
           finally
           {
               cmd.Connection.Close();
           }
       }

       //new (Khin_Sandar_Thein)

       public bool MD_del_in_up(DataTable dt)
       {
           Connection con = new Connection();

           dt.TableName = "test";
           System.IO.StringWriter writer = new System.IO.StringWriter();
           dt.WriteXml(writer, XmlWriteMode.WriteSchema, false);
           string result = writer.ToString();
           SqlConnection connectionstring = con.GetConnection();
           SqlCommand cmd = new SqlCommand("MD_delup", connectionstring);
           cmd.CommandType = CommandType.StoredProcedure;
           cmd.Parameters.AddWithValue("@xml", SqlDbType.Xml).Value = result;
           try
           {
               cmd.Connection.Open();
               cmd.ExecuteNonQuery();
               cmd.Connection.Close();
               return true;
           }
           catch
           {
               return false;
           }

        


       
       }
       //end


       public bool MDUp_Update(string up_ID, string MDTax_Ex, string MDTax_In, string ddlPro, string rem, string expprocess, string baltaxin,string app_date)
       {
           Connection con = new Connection();
           SqlConnection sqlcon = con.GetConnection();
           SqlCommand cmd = new SqlCommand("MDup_Update", sqlcon);
           cmd.CommandType = CommandType.StoredProcedure;
           cmd.Parameters.AddWithValue("@ID",up_ID);
           cmd.Parameters.AddWithValue("@MDTE",MDTax_Ex );
           cmd.Parameters.AddWithValue("@MDTI", MDTax_In);
           cmd.Parameters.AddWithValue("@process",ddlPro);
           cmd.Parameters.AddWithValue("@Remark", rem);
           cmd.Parameters.AddWithValue("@Expp", expprocess);
           cmd.Parameters.AddWithValue("@BTI", baltaxin);
           //cmd.Parameters.AddWithValue("@app_date", app_date);
           AddParameter(cmd, "@app_Date", app_date);

           try
           {
               cmd.Connection.Open();
               cmd.ExecuteNonQuery();
               return true;
           }
           catch
           { return false; }
           finally
           {
               cmd.Connection.Close();
           }
       }
       public bool MD_Delete(int MD_ID)
       {
           Connection con = new Connection();
           SqlConnection sqlcon = con.GetConnection();
           SqlCommand cmd = new SqlCommand("MD_Delete", sqlcon);
           cmd.CommandType = CommandType.StoredProcedure;
           cmd.Connection.Open();
           cmd.Parameters.AddWithValue("@MD_Management", MD_ID);
           cmd.ExecuteNonQuery();
           cmd.Connection.Close();
           return true;
       }
       public bool MD_Insert(int md, string dp, string pc,int am)
       {
      
           Connection con = new Connection();
           SqlConnection sqlcon = con.GetConnection();
           SqlCommand cmd = new SqlCommand("MD_Insert", sqlcon);
           //string tp;
           //if (!string.IsNullOrWhiteSpace(dp.ToString()))
           //{
           //    //return true;
           //}
           //else
           //{
           //    tp = DBNull.Value.ToString();
           //}
           //string.IsNullOrWhiteSpace(txt.Text) ? "0" : txt.Text;
           cmd.CommandType = CommandType.StoredProcedure;
           cmd.Parameters.AddWithValue("@MD_Management", md);
           if(string.IsNullOrWhiteSpace(dp.ToString()))
            cmd.Parameters.AddWithValue("@Delivery", DBNull.Value);
           else
               cmd.Parameters.AddWithValue("@Delivery", dp.ToString());

           if (string.IsNullOrWhiteSpace(pc.ToString()))
               cmd.Parameters.AddWithValue("@Purchase", DBNull.Value);
           else
               cmd.Parameters.AddWithValue("@Purchase", pc.ToString());

           cmd.Parameters.AddWithValue("@Amount", am);

           //AddParameter(cmd, "@MD_Management", md);
           //AddParameter(cmd, "@Delivery", dp);
           //AddParameter(cmd, "@Purchase", pc);
           //AddParameter(cmd, "@Amount", am);


           sqlcon.Open();
           using (SqlTransaction tran = sqlcon.BeginTransaction())
           {
               try
               {
                   cmd.Transaction = tran;
                   cmd.ExecuteNonQuery();

                   tran.Commit();
                   return true;
               }
               catch
               {
                   tran.Rollback();
                   return false;
               }
               finally
               {
                   cmd.Connection.Close();
               }
           }
       }
       public DataTable MD_Search(MD_Search_Entity mdsearch)
       {
           Connection con = new Connection();
           SqlConnection sqlcon = con.GetConnection();
           SqlCommand cmd = new SqlCommand("MD_Search", sqlcon);
           cmd.CommandType = CommandType.StoredProcedure;
           AddParameter(cmd, "@ApplyNo", mdsearch.form_ID);
           AddParameter(cmd, "@Supplier", mdsearch.vendor_ID);
           AddParameter(cmd, "@Brand", mdsearch.stamp_ID);
           AddParameter(cmd, "@Process", mdsearch.process_ddl);
           AddParameter(cmd, "@Delivery_Start", mdsearch.del_start1);
           AddParameter(cmd, "@Delivery_End", mdsearch.del_end1);
           AddParameter(cmd, "@Purchase_Start", mdsearch.pur_start1);
           AddParameter(cmd, "@Purchase_End", mdsearch.pur_end1);
           AddParameter(cmd, "@tax_accounting", mdsearch.tax_accounting);
           AddParameter(cmd, "@App_Start", mdsearch.Approv_Start);
           AddParameter(cmd, "@App_End", mdsearch.Approv_End);
           AddParameter(cmd, "@Date_S1", mdsearch.Date_S1);
           AddParameter(cmd, "@Date_E1", mdsearch.Date_E1);
           SqlDataAdapter da = new SqlDataAdapter(cmd);
           DataTable dt = new DataTable();
           try
           {

               cmd.Connection.Open();
               da.Fill(dt);
               return dt;
           }
           catch
           { return new DataTable(); }
           finally
           {
               cmd.Connection.Close();
           }
       }
        public DataTable MD_Management_SelectAll()
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("MD_Select_All", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                cmd.Connection.Open();
                da.Fill(dt);
                return dt;
            }
            catch
            { return new DataTable(); }
            finally
            {
                cmd.Connection.Close();
            }
        }


        public DataTable MD_Management_SelectByID(string Instructions_ID)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("MD_Management_SelectByID", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Instructions_ID", Instructions_ID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                cmd.Connection.Open();
                da.Fill(dt);
                return dt;
            }
            catch
            { return new DataTable(); }
            finally
            {
                cmd.Connection.Close();
            }
        }

        public DataTable MD_select(string Ins_ID)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("MDSelectedID", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", Ins_ID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                cmd.Connection.Open();
                da.Fill(dt);
                return dt;
            }
            catch
            { return new DataTable(); }
            finally
            {
                cmd.Connection.Close();
            }
        }
        public DataTable MD_selectg(string Ins_ID)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("InsSelectedID", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", Ins_ID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                cmd.Connection.Open();
                da.Fill(dt);
                return dt;
            }
            catch
            { return new DataTable(); }
            finally
            {
                cmd.Connection.Close();
            }
        }


        private void setParam(SqlCommand cmd, string sqlParam, string value)
        {
            if (!string.IsNullOrWhiteSpace(value))
                cmd.Parameters.AddWithValue(sqlParam, value);
            else cmd.Parameters.AddWithValue(sqlParam, DBNull.Value);
        }

        public bool MDManagement_Update(MDManagement_Entity me)
        {
            Connection con = new Connection();
            SqlConnection sqlcon = con.GetConnection();
            SqlCommand cmd = new SqlCommand("MDManagement_Update", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Instructions_ID", me.Instructions_ID);
            cmd.Parameters.AddWithValue("@MDTaxExclude", me.MDTaxExclude);
            cmd.Parameters.AddWithValue("@MDTaxInclude", me.MDTaxInclude);
            cmd.Parameters.AddWithValue("@Process", me.Process);
            cmd.Parameters.AddWithValue("@Remark", me.Remark);
            cmd.Parameters.AddWithValue("@ExpProcess", me.ExpProcess);
            cmd.Parameters.AddWithValue("@BalTaxInclude", me.BalTaxInclude);


            setParam(cmd, "@Delivery1", me.Delivery1);
            setParam(cmd, "@Delivery2", me.Delivery2);
            setParam(cmd, "@Delivery3", me.Delivery3);
            setParam(cmd, "@Delivery4", me.Delivery4);
            setParam(cmd, "@Delivery5", me.Delivery5);
            setParam(cmd, "@Delivery6", me.Delivery6);
            setParam(cmd, "@Delivery7", me.Delivery7);
            setParam(cmd, "@Delivery8", me.Delivery8);
            setParam(cmd, "@Delivery9", me.Delivery9);
            setParam(cmd, "@Delivery10", me.Delivery10);
            setParam(cmd, "@Delivery11", me.Delivery11);
            setParam(cmd, "@Delivery12", me.Delivery12);
            setParam(cmd, "@Delivery13", me.Delivery13);
            setParam(cmd, "@Delivery14", me.Delivery14);
            setParam(cmd, "@Delivery15", me.Delivery15);
            setParam(cmd, "@Delivery16", me.Delivery16);
            setParam(cmd, "@Delivery17", me.Delivery17);
            setParam(cmd, "@Delivery18", me.Delivery18);
            setParam(cmd, "@Delivery19", me.Delivery19);
            setParam(cmd, "@Delivery20", me.Delivery20);

            setParam(cmd, "@Amount1", me.Amount1.ToString());
            setParam(cmd, "@Amount2", me.Amount2.ToString());
            setParam(cmd, "@Amount3", me.Amount3.ToString());
            setParam(cmd, "@Amount4", me.Amount4.ToString());
            setParam(cmd, "@Amount5", me.Amount5.ToString());
            setParam(cmd, "@Amount6", me.Amount6.ToString());
            setParam(cmd, "@Amount7", me.Amount7.ToString());
            setParam(cmd, "@Amount8", me.Amount8.ToString());
            setParam(cmd, "@Amount9", me.Amount9.ToString());
            setParam(cmd, "@Amount10", me.Amount10.ToString());
            setParam(cmd, "@Amount11", me.Amount11.ToString());
            setParam(cmd, "@Amount12", me.Amount12.ToString());
            setParam(cmd, "@Amount13", me.Amount13.ToString());
            setParam(cmd, "@Amount14", me.Amount14.ToString());
            setParam(cmd, "@Amount15", me.Amount15.ToString());
            setParam(cmd, "@Amount16", me.Amount16.ToString());
            setParam(cmd, "@Amount17", me.Amount17.ToString());
            setParam(cmd, "@Amount18", me.Amount18.ToString());
            setParam(cmd, "@Amount19", me.Amount19.ToString());
            setParam(cmd, "@Amount20", me.Amount20.ToString());

            setParam(cmd, "@Purchase1", me.Purchase1);
            setParam(cmd, "@Purchase2", me.Purchase2);
            setParam(cmd, "@Purchase3", me.Purchase3);
            setParam(cmd, "@Purchase4", me.Purchase4);
            setParam(cmd, "@Purchase5", me.Purchase5);
            setParam(cmd, "@Purchase6", me.Purchase6);
            setParam(cmd, "@Purchase7", me.Purchase7);
            setParam(cmd, "@Purchase8", me.Purchase8);
            setParam(cmd, "@Purchase9", me.Purchase9);
            setParam(cmd, "@Purchase10", me.Purchase10);
            setParam(cmd, "@Purchase11", me.Purchase11);
            setParam(cmd, "@Purchase12", me.Purchase12);
            setParam(cmd, "@Purchase13", me.Purchase13);
            setParam(cmd, "@Purchase14", me.Purchase14);
            setParam(cmd, "@Purchase15", me.Purchase15);
            setParam(cmd, "@Purchase16", me.Purchase16);
            setParam(cmd, "@Purchase17", me.Purchase17);
            setParam(cmd, "@Purchase18", me.Purchase18);
            setParam(cmd, "@Purchase19", me.Purchase19);
            setParam(cmd, "@Purchase20", me.Purchase20);

            cmd.Parameters.AddWithValue("@UpdatedBy", me.UpdatedBy);

            try
            {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            { return false; }
            finally
            {
                cmd.Connection.Close();
            }
        }
    }
}
