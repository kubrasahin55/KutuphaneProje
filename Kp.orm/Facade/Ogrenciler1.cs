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
    public class Ogrenciler1
    {
        public static DataTable Listele()
        {
            SqlDataAdapter adapter = new SqlDataAdapter("OgrenciListele", Tools.Baglanti);
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }
        public static bool Sil(Ogrenciler Ogrenci_sil) //uretim ennty içindeki class
        {
            SqlCommand sil = new SqlCommand("Ogrenci_sil", Tools.Baglanti);
            sil.CommandType = CommandType.StoredProcedure;
            sil.Parameters.AddWithValue("UretimNo", Ogrenci_sil.OgrNo);
            return Tools.ExecuteNonQuery(sil);
        }
        public static bool Kaydet(Ogrenciler OgrenciEkle)
        {
            SqlCommand insert = new SqlCommand("OgrenciEkle", Tools.Baglanti);
            insert.CommandType = CommandType.StoredProcedure;
            insert.Parameters.AddWithValue("OgrAdSoyad", OgrenciEkle.OgrAdSoyad);
            insert.Parameters.AddWithValue("DogumTarihi", OgrenciEkle.DogumTarihi);
            insert.Parameters.AddWithValue("Cinsiyet", OgrenciEkle.Cinsiyet);
            insert.Parameters.AddWithValue("Telefon", OgrenciEkle.Telefon);
            insert.Parameters.AddWithValue("Mail", OgrenciEkle.Mail);
            insert.Parameters.AddWithValue("Adres", OgrenciEkle.Adres);
           return Tools.ExecuteNonQuery(insert);
        }
        public static bool Yenile(Ogrenciler Ogrenci_yenile)
        {
            SqlCommand yy = new SqlCommand("Ogrenci_yenile", Tools.Baglanti);
            yy.CommandType = CommandType.StoredProcedure;
            yy.Parameters.AddWithValue("OgrNo", Ogrenci_yenile.OgrNo);
            yy.Parameters.AddWithValue("OgrAdSoyad", Ogrenci_yenile.OgrAdSoyad);
            yy.Parameters.AddWithValue("DogumTarihi", Ogrenci_yenile.DogumTarihi);
            yy.Parameters.AddWithValue("Cinsiyet", Ogrenci_yenile.Cinsiyet);
            yy.Parameters.AddWithValue("Telefon", Ogrenci_yenile.Telefon);
            yy.Parameters.AddWithValue("Mail",  Ogrenci_yenile.Mail);
            yy.Parameters.AddWithValue("Adres", Ogrenci_yenile.Adres);
            return Tools.ExecuteNonQuery(yy);

        }
        public static DataTable Ara(Ogrenciler Ogrenc_ara)
        {
            SqlCommand ara = new SqlCommand("OgrenciAra", Tools.Baglanti);
            ara.CommandType = CommandType.StoredProcedure;
            ara.Parameters.AddWithValue("OgrAdSoyad", Ogrenc_ara.OgrAdSoyad);
            Tools.ExecuteNonQuery(ara);

            SqlDataAdapter adapter = new SqlDataAdapter(ara);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }
    }
}
