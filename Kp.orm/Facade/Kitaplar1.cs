using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kp.orm.Entity;
using System.Data;
using System.Data.SqlClient;

namespace Kp.orm.Facade
{
    public class Kitaplar1
    {
        public static DataTable Listele()
        {
            SqlDataAdapter adapter = new SqlDataAdapter("KitapListele", Tools.Baglanti);
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }
        public static bool Sil(Kitaplar Kitap_sil) //uretim ennty içindeki class
        {
            SqlCommand sil = new SqlCommand("Kitap_sil", Tools.Baglanti);
            sil.CommandType = CommandType.StoredProcedure;
            sil.Parameters.AddWithValue("KitapNo", Kitap_sil.KitapNo);
            return Tools.ExecuteNonQuery(sil);
        }
        public static bool Kaydet(Kitaplar KitapEkle)
        {
            SqlCommand insert = new SqlCommand("KitapEkle", Tools.Baglanti);
            insert.CommandType = CommandType.StoredProcedure;
            insert.Parameters.AddWithValue("KitapAdi", KitapEkle.KitapAdi);
            insert.Parameters.AddWithValue("YazarAdi", KitapEkle.YazarAdi);
            insert.Parameters.AddWithValue("Tur", KitapEkle.Tur);
            insert.Parameters.AddWithValue("KitapSayfaSayisi", KitapEkle.KitapSayfaSayisi);
            insert.Parameters.AddWithValue("KitapBasimYili", KitapEkle.KitapBasimYili);
            insert.Parameters.AddWithValue("KitapYayinEvi", KitapEkle.KitapYayinEvi);
            insert.Parameters.AddWithValue("KitapAdet", KitapEkle.KitapAdet);

            return Tools.ExecuteNonQuery(insert);
        }
        public static bool Yenile(Kitaplar Kitap_yenile)
        {
            SqlCommand yy = new SqlCommand("Kitap_yenile", Tools.Baglanti);
            yy.CommandType = CommandType.StoredProcedure;
            yy.Parameters.AddWithValue("KitapNo", Kitap_yenile.KitapNo);
            yy.Parameters.AddWithValue("KitapAdi", Kitap_yenile.KitapAdi);
            yy.Parameters.AddWithValue("YazarAdi", Kitap_yenile.YazarAdi);
            yy.Parameters.AddWithValue("Tur", Kitap_yenile.Tur);
            yy.Parameters.AddWithValue("KitapSayfaSayisi", Kitap_yenile.KitapSayfaSayisi);
            yy.Parameters.AddWithValue("KitapBasimYili", Kitap_yenile.KitapBasimYili);
            yy.Parameters.AddWithValue("KitapYayinEvi", Kitap_yenile.KitapYayinEvi);
            yy.Parameters.AddWithValue("KitapAdet", Kitap_yenile.KitapAdet);
            return Tools.ExecuteNonQuery(yy);

        }
        public static DataTable Ara(Kitaplar K_ara)//ogrenciler entity üstüne gelince gözüküyor
        {
            SqlCommand ara = new SqlCommand("KitapAra", Tools.Baglanti);
            ara.CommandType = CommandType.StoredProcedure;
            ara.Parameters.AddWithValue("KitapAdi", K_ara.KitapAdi);
            Tools.ExecuteNonQuery(ara);

            SqlDataAdapter adapter = new SqlDataAdapter(ara);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }
    }
}
