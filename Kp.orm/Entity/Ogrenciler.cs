using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kp.orm.Entity
{
    public class Ogrenciler
    {
        public int OgrNo { get; set; } //tablodaki sütunlaar
        public string OgrAdSoyad { get; set; }
        public string DogumTarihi { get; set; }
        public string Cinsiyet { get; set; }

        public string Telefon { get; set; }

        public string Mail { get; set; }

        public string Adres { get; set; }
    }
}
