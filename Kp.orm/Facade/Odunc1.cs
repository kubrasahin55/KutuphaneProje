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
    public class Odunc1
    {
        public static DataTable Listele()
        {
            SqlDataAdapter adapter = new SqlDataAdapter("Odunc_Listele", Tools.Baglanti);
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }
        public static bool Sil(Odunc Odunc_sil) //uretim ennty içindeki class
        {
            SqlCommand sil = new SqlCommand("Odunc_sil", Tools.Baglanti);
            sil.CommandType = CommandType.StoredProcedure;
            sil.Parameters.AddWithValue("OduncNo", Odunc_sil.OduncNo);
            return Tools.ExecuteNonQuery(sil);
        }
        public static bool Kaydet(Odunc Odunc_Ekle)
        {
            SqlCommand insert = new SqlCommand("Odunc_Ekle", Tools.Baglanti);
            insert.CommandType = CommandType.StoredProcedure;
            insert.Parameters.AddWithValue("OgrenciNo", Odunc_Ekle.OgrenciNo);
            insert.Parameters.AddWithValue("KitapNo", Odunc_Ekle.KitapNo);
            insert.Parameters.AddWithValue("VerilisTarihi", Odunc_Ekle.VerilisTarihi);
            insert.Parameters.AddWithValue("TeslimTarihi", Odunc_Ekle.TeslimTarihi);
            insert.Parameters.AddWithValue("GorevliNo", Odunc_Ekle.GorevliNo);
             return Tools.ExecuteNonQuery(insert);
        }
        public static bool Yenile(Odunc Odunc_yenile)
        {
            SqlCommand yy = new SqlCommand("Odunc_yenile", Tools.Baglanti);
            yy.CommandType = CommandType.StoredProcedure;
            yy.Parameters.AddWithValue("OduncNo", Odunc_yenile.OduncNo);
            yy.Parameters.AddWithValue("OgrenciNo", Odunc_yenile.OgrenciNo);
            yy.Parameters.AddWithValue("KitapNo", Odunc_yenile.KitapNo);
            yy.Parameters.AddWithValue("VerilisTarihi", Odunc_yenile.VerilisTarihi);
            yy.Parameters.AddWithValue("TeslimTarihi", Odunc_yenile.TeslimTarihi);
            yy.Parameters.AddWithValue("GorevliNo", Odunc_yenile.GorevliNo);
            return Tools.ExecuteNonQuery(yy);

        }
        public static DataTable Ara(Odunc Odunc_ara)//ogrenciler entity üstüne gelince gözüküyor
        {
            SqlCommand ara = new SqlCommand("OduncAra", Tools.Baglanti);
            ara.CommandType = CommandType.StoredProcedure;
            ara.Parameters.AddWithValue("OgrenciNo", Odunc_ara.OgrenciNo);
            Tools.ExecuteNonQuery(ara);

            SqlDataAdapter adapter = new SqlDataAdapter(ara);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }
    }
}
