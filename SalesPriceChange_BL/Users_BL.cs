using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SalesPriceChange_Common;
using SalesPriceChange_DL;

namespace SalesPriceChange_BL
{
    public class Users_BL
    {
        public bool change_offline(string did)
        {
            Users_DL udl = new Users_DL();
            return udl.change_offline(did);
        }
        public bool check_online(string uid)
        {
            Users_DL udl = new Users_DL();
            return udl.check_online(uid);
        }
        public DataTable Users_Select(Users_Entity ue)
        {
            Users_DL udl = new Users_DL();
            return udl.Users_Select(ue);
        }
        public DataTable Users_SelectByStage()
        {
            Users_DL udl = new Users_DL();
            return udl.Users_SelectByStage();
        }
        public DataTable User_Selectbystage6()
        {
            Users_DL udl = new Users_DL();
            return udl.User_SelectByStage6();
        }
        public DataTable UserList_Search(Users_Entity ue, Stage_Entity se)
        {
            Users_DL udl = new Users_DL();
            return udl.UserList_Search(ue, se);

        }
        public DataTable UsersDescription_Select(Users_Entity ue)
        {
            Users_DL udl = new Users_DL();
            return udl.UsersDescription_Select(ue);
        }

        public DataTable checkLogin(Users_Entity ue)
        {
            return Users_Select(ue);
        }
        public DataTable Users_Edit(Users_Entity  ue)
        {
            Users_DL udl = new Users_DL();
            return udl.Users_Select(ue);
        }
        public bool User_Delete(Users_Entity ue,Stage_Entity  ste)
        {
            Users_DL udl = new Users_DL();
            return udl.User_Delete(ue,ste );
        }
        public bool User_Delete(string  id)
        {
            Users_DL udl = new Users_DL();
            return udl.User_Delete(id);
        }
        public bool Users_Insert(Users_Entity ue, Stage_Entity ste,int Updated_By)
        {
            Users_DL udl = new Users_DL();
            return udl.Users_Insert(ue, ste,Updated_By);
        }
        public bool Users_Update(Users_Entity ue,Stage_Entity  ste,int Updated_By)
        {
            Users_DL udl = new Users_DL();
            return udl .Users_Update (ue,ste,Updated_By);
        }
        public bool checkUser(Users_Entity ue)
        {
            Users_DL udl = new Users_DL();
            DataTable dt = udl.Users_Select(ue);
            if (dt.Rows.Count > 0)
                return true;
            return false;
        }
        public bool CheckUpdate(Users_Entity  ue, string ID)
        {
            Users_DL  udl = new Users_DL();
            DataTable dt = udl .Users_Select (ue);
            if (dt.Rows.Count <= 0)
            {
                return true;
            }
            else
            {
                if (ID == dt.Rows[0]["ID"].ToString())
                {
                    return true;
                }
                else { return false; }
            }
        }
        public DataTable entry_hide_filter(Users_Entity ue, string d)
        {
            Users_DL udl = new Users_DL();
            return udl.entry_hide_filter(ue,d);
        }

    }
}
