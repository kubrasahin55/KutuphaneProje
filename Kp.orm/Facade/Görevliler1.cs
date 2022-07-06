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
    public class Görevliler1
    {
        public static DataTable Listele()
        {
            SqlDataAdapter adapter = new SqlDataAdapter("GorevliListele", Tools.Baglanti);
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }
        public static bool Sil(Görevliler G_sil) //uretim ennty içindeki class
        {
            SqlCommand sil = new SqlCommand("G_sil", Tools.Baglanti);
            sil.CommandType = CommandType.StoredProcedure;
            sil.Parameters.AddWithValue("GorevliNo", G_sil.GorevliNo);
            return Tools.ExecuteNonQuery(sil);
        }
        public static bool Kaydet(Görevliler GorevliEkle)
        {
            SqlCommand insert = new SqlCommand("GorevliEkle", Tools.Baglanti);
            insert.CommandType = CommandType.StoredProcedure;
            insert.Parameters.AddWithValue("GorevliAdSoyad", GorevliEkle.GorevliAdSoyad);
            insert.Parameters.AddWithValue("DogumTarihi", GorevliEkle.DogumTarihi);
            insert.Parameters.AddWithValue("Cinsiyet", GorevliEkle.Cinsiyet);
            insert.Parameters.AddWithValue("Telefon", GorevliEkle.Telefon);
            insert.Parameters.AddWithValue("Mail", GorevliEkle.Mail);
            insert.Parameters.AddWithValue("Adres", GorevliEkle.Adres);
             return Tools.ExecuteNonQuery(insert);
        }
        public static bool Yenile(Görevliler G_yenile)
        {
            SqlCommand yy = new SqlCommand("G_yenile", Tools.Baglanti);
            yy.CommandType = CommandType.StoredProcedure;
            yy.Parameters.AddWithValue("GorevliNo", G_yenile.GorevliNo);
            yy.Parameters.AddWithValue("GorevliAdSoyad", G_yenile.GorevliAdSoyad);
            yy.Parameters.AddWithValue("DogumTarihi", G_yenile.DogumTarihi);
            yy.Parameters.AddWithValue("Cinsiyet", G_yenile.Cinsiyet);
            yy.Parameters.AddWithValue("Telefon", G_yenile.Telefon);
            yy.Parameters.AddWithValue("Mail", G_yenile.Mail);
            yy.Parameters.AddWithValue("Adres", G_yenile.Adres);
            return Tools.ExecuteNonQuery(yy);

        }
        public static DataTable Ara(Görevliler G_ara)
        {
            SqlCommand ara = new SqlCommand("GorevliAra", Tools.Baglanti);
            ara.CommandType = CommandType.StoredProcedure;
            ara.Parameters.AddWithValue("GorevliAdSoyad", G_ara.GorevliAdSoyad);
            Tools.ExecuteNonQuery(ara);

            SqlDataAdapter adapter = new SqlDataAdapter(ara);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }


    }
}
