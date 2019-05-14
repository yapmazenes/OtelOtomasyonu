using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OtelOtomasyonu.ORM.Entity
{
    public class Personeller : Insan
    {

        public DateTime IseGirisTarihi { get; set; }
        public decimal Maas { get; set; }
        public string KullaniciAdi { get; set; }
        public string Sifre { get; set; }   
        public bool Admin { get; set; }
        public int SatisSayisi { get; set; }
        public double SatisFiyati { get; set; }
    }
}
