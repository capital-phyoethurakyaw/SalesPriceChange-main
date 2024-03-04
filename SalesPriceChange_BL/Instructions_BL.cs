using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using SalesPriceChange_DL;

namespace SalesPriceChange_BL
{
    public class Instructions_BL
    {
        public bool update_theme(string theme,string userID)
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.update_theme(theme,userID);
        }
        public bool change_delete(string id_send)
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.change_delete(id_send);
        }
        public bool delete_Ufile(string fn)
        {
            Instruction_DL udl = new Instruction_DL();
            return udl.delete_Ufile(fn);
        }
        public DataTable retrieve_file(string fno)
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.retrieve_file(fno);
        }
        public bool Instructions_Save(Instructions_Entity ie)
        {
            Instruction_DL idl = new Instruction_DL ();
            return idl .Instructions_Insert (ie);
        }

        public string Instructions_GetFormID()
        {
            Instruction_DL idl = new Instruction_DL();
            DataTable dt = idl.Instructions_GetFormID();
            string result = string.Empty;
            if (dt.Rows.Count > 0)
            {
                string temp = dt.Rows[0]["FormNo"].ToString();
                if (string.IsNullOrWhiteSpace(temp))
                    return ("S" + DateTime.Now.Year.ToString() + "-00001");
                else
                {
                    string[] strarr = temp.Split('-');
                    return ("S" + strarr[0] + "-" + (Convert.ToInt32(strarr[1]) + 1).ToString("D5"));
                }
            }
            else
                return ("S" + DateTime.Now.Year.ToString() + "-00001");
        }
        public string Instruction_GetApplyNo()
        {
            Instruction_DL scdl = new Instruction_DL();
            DataTable dt = scdl.Instruction_GetApplyNo();
            string result = string.Empty;
            if (dt.Rows.Count > 0)
            {
                string temp = dt.Rows[0]["ApplyNo"].ToString();
                if (string.IsNullOrWhiteSpace(temp))
                    return ("H" + DateTime.Now.Year.ToString() + "-00001");
                else
                {
                    string[] strarr = temp.Split('-');
                    return ("H"+ strarr[0] + "-" + (Convert.ToInt32(strarr[1]) + 1).ToString("D5"));
                }
            }
            else
                return ("H" + DateTime.Now.Year.ToString() + "-00001");
        }
        public DataTable Instruction_SelectAll()
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.Instruction_SelectAll();
        }
       
        public DataTable Instruction_Info(Instructions_Entity ie)
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.Instruction_Info(ie);
        }
        public DataTable Dashboard_Info()
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.Dashboard_Info();
        }

        public DataTable Dashboard_UserInfo(string id)
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.Dashboard_UserInfo(id);
        }
        public bool CheckFormNo(Instructions_Entity ie)
        {
            Instruction_DL idl = new Instruction_DL();
            DataTable dt = idl.InstructionsFormNo_Select(ie);
            if (dt.Rows.Count > 0)
                return true;
            return false;
        }
        public DataTable Instruction_NotiList(Users_Entity ue)
        {
            Instruction_DL idl = new Instruction_DL();
            DataTable dt = idl.Instruction_NotiList(ue);
            return dt;
        }
        public bool Instruction_Update(Instructions_Entity  ie)
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.Instruction_Update(ie);
        }
        public DataTable Instruction_Edit(Instructions_Entity ie)
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.Instruction_Edit(ie);
        }
        public DataTable Instruction_Search(Instructions_Entity ie)
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.Instruction_Search(ie);
        }

        public DataTable Instruction_Access(Instructions_Entity ie)
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.Instruction_Access(ie);
        }
        public DataTable Instruction_Copy(Instructions_Entity ie)
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.Instruction_Copy(ie);
        }
        public DataTable Instruction_Email(string crt)
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.Instruction_Email(crt);
        }
        public DataTable Instruction_retrieve(string crt)
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.Instruction_retrieve(crt);
        }
        public bool Instructions_Upload(string id, string fname, string fpath, string formno)
        {
            Instruction_DL idl = new Instruction_DL();
            return idl.Instructions_Upload(id,fname,fpath, formno);
        }
    }
}
