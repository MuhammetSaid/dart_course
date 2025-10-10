// =============================== Bölüm 6: Kaçış Karakterleri ve Yorum Satırları ===============================

/*
KAÇIŞ KARAKTERLERİ (ESCAPE CHARACTERS):
String içinde özel karakterleri kullanmak için \ işareti kullanılır.

YORUM SATIRLARI:
- // : Tek satır yorum
- /* */ : Çok satır yorum
- /// : Dokümantasyon yorumu

ÖNEMLİ KAÇIŞ KARAKTERLERİ:
- \" : Çift tırnak
- \n : Yeni satır
- \t : Tab boşluğu
- \\ : Ters slash
*/

void main() {
  // ========== ÇİFT TIRNAK KULLANIMI ==========
  // String içinde çift tırnak kullanmak için \" kullanılır
  String yazi = "Mehmet \"Nasılsın\"";
  print("Çift tırnak örneği: $yazi");

  // ========== YENİ SATIR (\n) ==========
  // \n karakteri ile alt satıra geçilir
  var yazi1 = "Merhaba \nbu Flutter eğitiminde Dart dilini öğreneceğiz";
  print("Yeni satır örneği:");
  print(yazi1);

  // ========== TAB BOŞLUĞU (\t) ==========
  // \t karakteri ile tab boşluğu bırakılır
  var yazi2 = "Merhaba \n\tbu Flutter eğitiminde Dart dilini öğreneceğiz";
  print("\nTab boşluğu örneği:");
  print(yazi2);

  // ========== TERS SLASH (\\) ==========
  // \\ ile ters slash karakteri yazdırılır
  var yazi3 = "Merhaba \n\tbu \\Flutter eğitiminde Dart dilini öğreneceğiz";
  print("\nTers slash örneği:");
  print(yazi3);

  // ========== DİĞER KAÇIŞ KARAKTERLERİ ==========
  print("\n=== DİĞER KAÇIŞ KARAKTERLERİ ===");

  // Tek tırnak
  String tekTirnak = "Bu \'tek tırnak\' örneği";
  print("Tek tırnak: $tekTirnak");

  // Satır sonu ve tab birleşimi
  String formatliMetin = "Ad:\tAhmet\nSoyad:\tYılmaz\nYaş:\t25";
  print("\nFormatlı metin:\n$formatliMetin");

  // Windows dosya yolu (ters slash kullanımı)
  String dosyaYolu = "C:\\Users\\Kullanici\\Desktop\\dosya.txt";
  print("\nDosya yolu: $dosyaYolu");

  // ========== YORUM SATIRI ÖRNEKLERİ ==========

  // Bu tek satır yorum örneğidir
  int sayi = 10; // Satır sonu yorumu
  print ("$sayi");
  /*
    Bu çok satırlı yorum örneğidir.
    Birden fazla satırda açıklama yapabilirsiniz.
    Kodunuzu daha anlaşılır hale getirir.
  */

  /// Bu dokümantasyon yorumu örneğidir
  /// Dart'ta metodlar için kullanılır
  void ornekMetod() {
    print("Örnek metod çalıştı");
  }
  ornekMetod();
}

/*
ÖNEMLİ NOTLAR:
1. Kaçış karakterleri string içinde özel anlam taşır
2. Yorum satırları program çalışmasını etkilemez
3. // tek satır, /* */ çok satır yorum için kullanılır
4. /// dokümantasyon için önerilir
5. Kaçış karakterleri \ ile başlar
*/
