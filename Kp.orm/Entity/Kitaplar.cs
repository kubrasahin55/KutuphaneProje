using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kp.orm.Entity
{
    public class Kitaplar
    {
        public int KitapNo { get; set; }

        public string KitapAdi { get; set; }
        public string YazarAdi { get; set; }
        public string Tur { get; set; }
        public int KitapSayfaSayisi { get; set; }
        public string KitapBasimYili { get; set; }

        public string KitapYayinEvi { get; set; }

        public int KitapAdet { get; set; }



    }
}
