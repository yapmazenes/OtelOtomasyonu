using OtelOtomasyonu.ORM.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OtelOtomasyonu.ORM.Facade
{
   public class PersonellerORM:ORMBase<Personeller>
    {
       public static Personeller aktifKullanici;
       public Personeller GirisYap(Personeller p)
       {
           SqlDataAdapter adp = new SqlDataAdapter("prc_Personeller_Giris",Tools.Baglanti);
           adp.SelectCommand.CommandType = CommandType.StoredProcedure;
           adp.SelectCommand.Parameters.AddWithValue("kAdi", p.KullaniciAdi);
           adp.SelectCommand.Parameters.AddWithValue("kSifre", p.Sifre);
           DataTable dt = new DataTable();
           adp.Fill(dt);
           if (dt.Rows.Count==0)
               return null;
           else
           {
               Personeller aktif = new Personeller();
               foreach (DataRow dRow in dt.Rows)
               {
                   aktif.Id = (int)dRow["Id"];
                   aktif.Adi = dRow["Adi"].ToString();
                   aktif.Soyadi = dRow["Soyadi"].ToString();
                   aktif.KullaniciAdi = dRow["KullaniciAdi"].ToString();
                   aktif.Sifre = dRow["Sifre"].ToString();
                   aktif.Admin = (bool)dRow["Admin"];
                   aktif.SatisSayisi = int.Parse(dRow["OdaSatisSayisi"].ToString());
                   aktif.SatisFiyati = double.Parse(dRow["ToplamSatisFiyati"].ToString());
                   
               }
               return aktif;
           }
           


       }
    }
}
