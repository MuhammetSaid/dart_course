// ========================= Bölüm 3: Değişken Oluşturma Çeşitleri =========================

/*
DART'TA DEĞİŞKEN OLUŞTURMANIN FARKLI YÖNTEMLERİ

1. var KEYWORD'U:
   - Tür otomatik belirlenir (Type Inference)
   - İlk atanan değere göre tür belirlenir
   - Sonradan farklı türde değer atanamaz

2. TÜR BELİRTİLEREK:
   - int, double, String, bool gibi türler açıkça belirtilir
   - Daha güvenli ve net kod yazımı
   - IDE daha iyi yardım sağlar

3. ÇOKLU DEĞİŞKEN TANIMLAMA:
   - Virgülle ayırarak birden fazla değişken tanımlanabilir
   - Aynı satırda farklı türlerde değişkenler oluşturulabilir
*/

void main() {
  // ========================= Değişken Oluşturma Çeşitleri =========================

  // ========== ÖRNEK 1: var vs Tür Belirtme Karşılaştırması ==========
  var sayi = 10; // Dart otomatik olarak int türünde algılar
  int numara = 20; // Açıkça int türünde belirtildi

  print("var ile oluşturulan sayi: $sayi (türü: int)");
  print("int ile oluşturulan numara: $numara (türü: int)");

  // Her ikisi de aynı işlevi görür, ama int kullanımı daha net ve güvenlidir



  // ========== ÖRNEK 2: Değişken Değerlerini Değiştirme ==========
  var fiyat = 12.99; // Dart otomatik olarak double türünde algılar
  double ucret = 23.99; // Açıkça double türünde belirtildi

  print("İlk fiyat değerleri:");
  print("Fiyat: $fiyat");
  print("Ücret: $ucret");

  // Değişkenlerin değerlerini değiştirme (aynı türde olmalı)
  fiyat = 67.99; // ✅ Doğru: double değer atandı
  ucret = 10.45; // ✅ Doğru: double değer atandı

  print("\nDeğiştirilmiş fiyat değerleri:");
  print("Fiyat: $fiyat");
  print("Ücret: $ucret");

  // ========== ÖRNEK 3: Matematik İşlemleri ve toString() Metodu ==========
  var sayi1 = 14;
  var sayi2 = 21;

  // Toplama işlemi
  var toplam = sayi1 + sayi2;

  // toString() metodu: Sayıyı String'e çevirir
  // "+" operatörü ile String birleştirme
  print("Toplam: " + toplam.toString());

  // String interpolation ile aynı sonuç (daha kolay yöntem)
  print("Toplam (string interpolation): $toplam");

  // Çarpma işlemi
  int carpma = sayi1 * sayi2;
  print("Çarpma: ${carpma}");

  // toString() vs String Interpolation karşılaştırması
  print("toString() ile: " + toplam.toString());
  print("String interpolation ile: $toplam");
  // İkisi de aynı sonucu verir, ama $ kullanımı daha pratik

  // ========== ÖRNEK 4: Değişken Tanımlama ve Sonradan Değer Atama ==========
  // Değişkenleri önce tanımlayıp, sonra değer atayabiliriz

  var sonuc1; // ❗ DİKKAT: var ile değer atamadan tanımlama
  int sonuc2; // ❗ DİKKAT: int ile değer atamadan tanımlama

  // Sonradan değer atama
  sonuc1 = 333; // Dart bu değişkeni int olarak algılar
  sonuc2 = 555; // Zaten int türünde tanımlandı

  print("sonuc1: $sonuc1");
  print("sonuc2: $sonuc2");

  // ÖNEMLİ: Değer atamadan tanımlanan değişkenler
  // var sonuc1; -> Bu değişken "dynamic" türünde olur
  // int sonuc2; -> Bu değişken "int?" (nullable int) olur

  // ========== ÖRNEK 5: Çoklu Değişken Tanımlama ==========
  // Virgülle ayırarak birden fazla değişken tanımlanabilir

  // var ile çoklu tanımlama (hepsi dynamic türünde olur)
  var s1, s2, s3;
  s1 = 10; // int değer atandı
  s2 = 20; // int değer atandı
  s3 = 30; // int değer atandı

  print("Çoklu var değişkenleri: $s1, $s2, $s3");

  // Aynı türde birden fazla değişken tanımlama
  int k1 = 40, k2 = 50; // Her ikisi de int türünde
  print("Çoklu int değişkenleri: k1 = $k1, k2 = $k2");

  // Farklı türlerde çoklu tanımlama (önerilmez, karmaşıklık yaratır)
  var a = 10, b = "merhaba", c = true;
  print("Farklı türler: a=$a, b=$b, c=$c");

  // ========== ÖRNEK 6: var Tür Sabitliği ==========
  var num = 41; // Dart bu değişkeni int olarak algılar

  // Aynı türde değer atama - ✅ Doğru
  num = 30;
  print("num değeri: $num");

  // Farklı türde değer atama - ❌ HATA!
  // num = "34";  // Bu satır hata verir çünkü num int türünde

  // ÇÖZÜM: Eğer farklı türlerde değer atamak istiyorsak dynamic kullanmalıyız
  dynamic esnekDegisken = 41; // İlk değer int
  esnekDegisken = "34"; // String değer atandı - ✅ Çalışır
  esnekDegisken = true; // bool değer atandı - ✅ Çalışır
  print("esnekDegisken: $esnekDegisken");

  // ========== ÖNEMLİ NOTLAR VE ÖNERİLER ==========
  /*
  1. DEĞİŞKEN TANIMLAMA YÖNTEMLERİ:
     ✅ ÖNERİLEN: int sayi = 10; (tür belirtilerek)
     ✅ KABUL EDİLEBİLİR: var sayi = 10; (değer ile birlikte)
     ❌ ÖNERİLMEZ: var sayi; (değer atamadan)
     
  2. ÇOKLU TANIMLAMA:
     ✅ int a = 1, b = 2; (aynı türde)
     ❌ var a, b; (farklı türlerde olabilir, karmaşıklık yaratır)
     
  3. TÜR SABİTLİĞİ:
     - var ile tanımlanan değişkenlerin türü ilk değere göre belirlenir
     - Sonradan farklı türde değer atanamaz
     - Eğer farklı türlerde değer atamak istiyorsanız dynamic kullanın
     
  4. toString() vs STRING INTERPOLATION:
     - toString(): "Sonuç: " + sayi.toString()
     - String interpolation: "Sonuç: $sayi" (daha kolay ve okunabilir)
  */
}
