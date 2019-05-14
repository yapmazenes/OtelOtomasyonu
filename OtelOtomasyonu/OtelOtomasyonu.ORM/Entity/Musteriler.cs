using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OtelOtomasyonu.ORM.Entity
{
    public class Musteriler :Insan
    {
        public string SirketAdi { get; set; }
        public MedeniDurumTip MedeniDurum { get; set; }
    }
    public enum MedeniDurumTip
    {
        Bekar = 1,
        Evli = 2
    }
    public enum Cinsiyet
    {
        Kadın = 1,
        Erkek = 2
    }
}
