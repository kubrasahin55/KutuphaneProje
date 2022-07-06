using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Kp.orm
{
   public class Tools
    {
        private static SqlConnection baglanti = new SqlConnection(ConfigurationManager.ConnectionStrings["Kütüphane"].ConnectionString);

        public static SqlConnection Baglanti
        {
            get { return baglanti; }
            set { baglanti = value; }
        }
        public static bool ExecuteNonQuery(SqlCommand komut) //static old. zaman nesne üretmeden erişim sağlıyoruz.
        {
            try
            {
                if (komut.Connection.State != ConnectionState.Open) //açık değilse bağlantı
                    komut.Connection.Open(); //bağlantıyı aç.
                return komut.ExecuteNonQuery() > 0;

            }
            catch
            {
                return false;
            }
            finally
            {
                if (komut.Connection.State != ConnectionState.Closed) //işem bittikten sonra bağlantı kapalı mı kontrıl et.
                    komut.Connection.Close(); //baglantiyi kapat.
            }

        }
    }
}
