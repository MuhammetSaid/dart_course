// ========================= Bölüm 2: Print Metodu Kullanımı =========================

/*
PRINT METODU NEDİR?
print() metodu, Dart'ta konsola (terminal/çıktı ekranına) bilgi yazdırmak için kullanılır.
Bu metod, programın çalışması sırasında sonuçları görmemizi sağlar.
Programlama öğrenirken en çok kullanacağınız metodlardan biridir.

PRINT METODUNUN KULLANIM ALANLARI:
- Değişken değerlerini gösterme
- Hesaplama sonuçlarını yazdırma
- Hata mesajları gösterme
- Programın hangi aşamada olduğunu takip etme
- Test amaçlı çıktılar alma
*/

void main() {
  // ========================= Print Metodu Temel Kullanımı =========================

  // ========== Basit Değişken Tanımlama ==========
  int a = 12; // int türünde değişken (tam sayı)
  var b = 14; // var ile değişken (Dart otomatik int olarak algılar)

  // ========== Print Metodunun Farklı Kullanım Şekilleri ==========

  // 1. Sadece değişken değerini yazdırma
  print("a değişkeninin değeri: $a");
  print("b değişkeninin değeri: $b");

  // 2. String interpolation ($) ile değişkenleri metin içinde gösterme
  print("$a + $b = ${a + b}"); // Sonuç: 12 + 14 = 26

  // 3. Daha açıklayıcı çıktı
  print("$a + $b toplama işleminin sonucu: ${a + b}");

  // ========== Diğer Matematik İşlemleri ==========
  print("\n=== MATEMATİK İŞLEMLERİ ===");
  print("Çıkarma: $a - $b = ${a - b}");
  print("Çarpma: $a * $b = ${a * b}");
  print("Bölme: $a / $b = ${a / b}");
  print("Mod (kalan): $a % $b = ${a % b}");

  // ========== String İşlemleri ==========
  String isim = "Ahmet";
  String soyisim = "Yılmaz";

  print("\n=== STRING İŞLEMLERİ ===");
  print("Ad: $isim");
  print("Soyad: $soyisim");
  print("Tam ad: $isim $soyisim");
  print("Karakter sayısı: ${isim.length}");

  // ========== Bool Değerlerle İşlemler ==========
  bool x = true;
  bool y = false;

  print("\n=== BOOLEAN İŞLEMLERİ ===");
  print("x değeri: $x");
  print("y değeri: $y");
  print("x VE y: ${x && y}"); // VE işlemi (AND)
  // print("x VEYA y: ${x || y}"); // VEYA işlemi (OR)

  // ========== Özel Print Kullanımları ==========
  print("\n=== ÖZEL KULLANIMLAR ===");
  print("Satır sonu eklemek için \\n kullanılır:\nBu yeni satırda yazıyor");
  print("Tab boşluğu için \\t kullanılır:\tBu tab boşluğundan sonra");
  print("Tırnak içinde tırnak: \"Merhaba Dünya\"");

  // ========== Çoklu Çıktı Örneği ==========
  print("\n=== ÇOKLU ÇIKTI ÖRNEĞİ ===");
  int sayi1 = 10;
  int sayi2 = 20;
  int sayi3 = 30;

  print("Sayılar: $sayi1, $sayi2, $sayi3");
  print("Toplam: ${sayi1 + sayi2 + sayi3}");
  print("Ortalama: ${(sayi1 + sayi2 + sayi3) / 3}");

  // ========== ÖNEMLİ NOTLAR ==========
  /*
  PRINT METODU KURALLARI:
  
  1. STRING INTERPOLATION ($):
      - Tek değişken: "$degisken"
      - İşlem yapma: "${degisken1 + degisken2}"
      - Metin içinde: "Merhaba $isim, yaşın $yas"
    
  2. ESCAPE KARAKTERLERİ:
      - \n: Yeni satır
      - \t: Tab boşluğu
      - \": Çift tırnak
      - \\: Ters slash
    
  3. FARKLI VERİ TİPLERİ:
      - String: "Metin $degisken"
      - int/double: "Sayı $sayi"
      - bool: "Durum $durum"
    
  4. PERFORMANS:
      - print() metodu her çağrıldığında yeni satır oluşturur
      - Çok fazla print kullanımı programı yavaşlatabilir
      - Debug amaçlı kullanımda sorun yoktur
  */
}
