using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace SalesPriceChange_DL
{
    public class BaseDL
    {
        protected void AddParameter(SqlCommand cmd, string param, object value)
        {
            if (value is string)
            {
                string str = value as string;
                if (!string.IsNullOrWhiteSpace(str))
                    cmd.Parameters.AddWithValue(param, str.Trim());
                else
                    cmd.Parameters.AddWithValue(param, DBNull.Value);
            }
            else if(value == null)
                cmd.Parameters.AddWithValue(param, DBNull.Value);
            else
            {
                cmd.Parameters.AddWithValue(param, value);
            }
        }
    }
}
