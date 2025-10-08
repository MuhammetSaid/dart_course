// ========================= 5- Switch Çalışması =========================
/* 
 * Bu dosya, Dart dilinde switch-case yapısını gösterir.
 * Switch-case, birden fazla if-else if yapısı yerine daha temiz ve okunabilir bir alternatiftir.
 * Bir değişkenin belirli değerlerle karşılaştırılması gerektiğinde kullanılır.
 */

void main() {
  // ========================= Örnek 1: Basit Switch Kullanımı =========================
  // Switch yapısı, bir değişkenin değerini birden fazla durum (case) ile karşılaştırır.
  // Hangi case eşleşirse, o bloktaki kodlar çalışır.

  int x = 5;

  print("--- Örnek 1: Sayı Kontrolü ---");
  switch (x) {
    case 1:
      {
        // x değeri 1 ise bu blok çalışır
        print("Girdiğiniz Sayı 1'e Eşittir");
        break; // break komutu, switch bloğundan çıkmayı sağlar
      }
    case 2:
      {
        // x değeri 2 ise bu blok çalışır
        print("Girdiğiniz Sayı 2'ye Eşittir");
        break;
      }
    case 3:
      {
        print("Girdiğiniz Sayı 3'e Eşittir");
        break;
      }
    case 4:
      {
        print("Girdiğiniz Sayı 4'e Eşittir");
        break;
      }
    case 5:
      {
        print("Girdiğiniz Sayı 5'e Eşittir");
        break;
      }
    default:
      {
        // Hiçbir case eşleşmezse default bloğu çalışır
        // Default kullanımı isteğe bağlıdır
        print("Girdiğiniz Sayı 1-5 Arasında Değil");
      }
  }

  // ========================= Örnek 2: String ile Switch Kullanımı =========================
  // Switch yapısı sadece sayılarla değil, String değerlerle de kullanılabilir

  print("\n--- Örnek 2: Gün İsimleri ---");
  String gun = "Pazartesi";

  switch (gun) {
    case "Pazartesi":
      print("Haftanın ilk günü");
      print("Yeni bir başlangıç!");
      break;

    case "Salı":
      print("Haftanın ikinci günü");
      break;

    case "Çarşamba":
      print("Haftanın ortası");
      break;

    case "Perşembe":
      print("Haftanın dördüncü günü");
      break;

    case "Cuma":
      print("Haftanın beşinci günü");
      print("Hafta sonuna yaklaştık!");
      break;

    case "Cumartesi":
    case "Pazar":
      // Birden fazla case aynı kodu çalıştırabilir
      // Bu durumda break kullanmadan alt case'e geçiş yapılır
      print("Hafta sonu - Tatil günü!");
      break;

    default:
      print("Geçersiz gün ismi");
  }

  // ========================= Örnek 3: Not Hesaplama Sistemi =========================
  // Switch ile basit bir not derecelendirme sistemi

  print("\n--- Örnek 3: Not Sistemi ---");
  String notHarfi = "B";

  switch (notHarfi) {
    case "A":
      print("Mükemmel! (90-100)");
      print("Tebrikler, başarılı bir performans!");
      break;

    case "B":
      print("İyi! (80-89)");
      print("Güzel bir çalışma!");
      break;

    case "C":
      print("Orta! (70-79)");
      print("Daha iyi yapabilirsin!");
      break;

    case "D":
      print("Geçer! (60-69)");
      print("Daha fazla çalışmalısın!");
      break;

    case "F":
      print("Başarısız! (0-59)");
      print("Maalesef kaldın!");
      break;

    default:
      print("Geçersiz not harfi!");
      print("Lütfen A, B, C, D veya F giriniz.");
  }

  // ========================= Örnek 4: Mevsim Kontrolü =========================
  print("\n--- Örnek 4: Mevsimler ---");
  int ay = 7; // Temmuz

  switch (ay) {
    case 12:
    case 1:
    case 2:
      print("Kış Mevsimi ❄️");
      print("Aylar: Aralık, Ocak, Şubat");
      break;

    case 3:
    case 4:
    case 5:
      print("İlkbahar Mevsimi 🌸");
      print("Aylar: Mart, Nisan, Mayıs");
      break;

    case 6:
    case 7:
    case 8:
      print("Yaz Mevsimi ☀️");
      print("Aylar: Haziran, Temmuz, Ağustos");
      break;

    case 9:
    case 10:
    case 11:
      print("Sonbahar Mevsimi 🍂");
      print("Aylar: Eylül, Ekim, Kasım");
      break;

    default:
      print("Geçersiz ay numarası! (1-12 arası olmalı)");
  }

  // ========================= Örnek 5: Basit Hesap Makinesi =========================
  print("\n--- Örnek 5: Hesap Makinesi ---");
  double sayi1 = 10;
  double sayi2 = 5;
  String islem = "+";

  switch (islem) {
    case "+":
      print("$sayi1 + $sayi2 = ${sayi1 + sayi2}");
      break;

    case "-":
      print("$sayi1 - $sayi2 = ${sayi1 - sayi2}");
      break;

    case "*":
      print("$sayi1 * $sayi2 = ${sayi1 * sayi2}");
      break;

    case "/":
      if (sayi2 != 0) {
        print("$sayi1 / $sayi2 = ${sayi1 / sayi2}");
      } else {
        print("Hata: Sıfıra bölme yapılamaz!");
      }
      break;

    default:
      print("Geçersiz işlem! (+, -, *, / kullanınız)");
  }

  // ========================= Switch vs If-Else Karşılaştırması =========================
  /*
   * SWITCH KULLANIMI AVANTAJLARI:
   * 1. Daha temiz ve okunabilir kod
   * 2. Birden fazla değer karşılaştırması için ideal
   * 3. Performans açısından daha hızlı (bazı durumlarda)
   * 
   * IF-ELSE KULLANIMI GEREKTİĞİ DURUMLAR:
   * 1. Karmaşık koşullar (>, <, >=, <=, vb.)
   * 2. Mantıksal operatörler (&&, ||) gerektiğinde
   * 3. Farklı veri tiplerini karşılaştırırken
   */
}
