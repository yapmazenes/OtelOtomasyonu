using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Reflection;

namespace OtelOtomasyonu.ORM
{
    public static class Tools
    {   //Singelton Pattern=
        //Tanımlamış olduğum property i getirmek istediğimde tanımlanmışsa new lemeden getir.Tanımlanmadıysa new'liyerek getir
        private static SqlConnection baglanti;

        public static SqlConnection Baglanti
        {
            get
            {
                if (baglanti == null)
                    baglanti = new SqlConnection(ConfigurationManager.ConnectionStrings["LocalBaglanti"].ConnectionString);
                return baglanti;
            }
        }

        public static bool ExecuteNonQuery(SqlCommand cmd)
        {
            try
            {
                if (cmd.Connection.State == ConnectionState.Closed)

                    cmd.Connection.Open();

                int kntrl = cmd.ExecuteNonQuery();
                return kntrl > 0 ? true : false;
            }
            catch (Exception)
            {
                return false;
            }

            finally
            {
                if (cmd.Connection.State == ConnectionState.Open)
                    cmd.Connection.Close();
            }


        }
        public static void PropertyInfo<T>(SqlCommand cmd, KomutTip kmt, T entity)
        {
            PropertyInfo[] pInfo = typeof(T).GetProperties();
            foreach (var Pitem in pInfo)
            {
                string name = Pitem.Name;
                object getValue=Pitem.GetValue(entity);
                if ((KomutTip.Insert == kmt && (name.ToLower() == "ıd" || name.ToLower() == "id") || name=="SatisTarihi"))
                    continue;
                else if (KomutTip.Delete == kmt && !((name.ToLower() == "ıd" || name.ToLower() == "id")))
                    continue;
                cmd.Parameters.AddWithValue("@" + name, getValue);
            }
        }

    }
}
