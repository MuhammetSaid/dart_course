// ========================= Bölüm 2: Değişken ve Veri Tipleri =========================

/*
DART'TA DEĞİŞKEN NEDİR?
Değişken, bilgisayar belleğinde veri saklamak için kullanılan bir kavramdır.
Değişkenler, programın çalışması sırasında değerleri saklar ve bu değerleri
istediğimiz zaman okuyabilir, değiştirebilir veya kullanabiliriz.

DEĞİŞKEN OLUŞTURMA KURALI:
Değişken Türü + Değişken Adı = Değer;
*/

void main() {
  // ========================= 1- Değişken Oluşturma =========================

  // Dart'ta 4 temel veri tipi vardır: String, int, double, bool
  // Her veri tipinin farklı amaçları ve kullanım alanları vardır

  // ========== int (Integer - Tamsayı) ==========
  // Pozitif veya negatif tam sayıları saklar (ondalık kısım yok)
  int yas = 20; // 20 yaşında olduğumuzu belirtir
  print("Yaşım: $yas"); // String interpolation ile değeri yazdırır

  // ========== String (Metin) ==========
  // Harfler, sayılar, özel karakterler içeren metin verilerini saklar
  String ad = "Muhammed Said"; // Çift tırnak içinde metin yazılır
  print("Adım: $ad"); // Değişken değerini konsola yazdırır

  // ========== bool (Boolean - Mantıksal) ==========
  // Sadece iki değer alabilir: true (doğru) veya false (yanlış)
  bool bekar = true; // Evli olmadığımızı belirtir
  print("Bekar mıyım: $bekar"); // true değerini yazdırır

  // ========== double (Ondalıklı Sayı) ==========
  // Ondalıklı sayıları saklar (virgülden sonra rakamlar olabilir)
  double boy = 1.89; // 1.89 metre boyumuz olduğunu belirtir
  print("Boyum: $boy metre"); // Ondalıklı değeri yazdırır

  // ========== var (Değişken Türü Otomatik Belirleme) ==========
  // var keyword'u kullanıldığında Dart, değişkenin türünü atanan değere göre otomatik belirler
  // Bu özelliğe "Type Inference" (Tür Çıkarımı) denir

  var soyad = "Elsalih"; // Dart bu değişkeni String olarak algılar
  var kilo = 76.4; // Dart bu değişkeni double olarak algılar
  var mezun = false; // Dart bu değişkeni bool olarak algılar
  var sinif = 4; // Dart bu değişkeni int olarak algılar

  print("Soyadım: $soyad");
  print("Kilo: $kilo kg");
  print("Mezun mu: $mezun");
  print("Sınıf: $sinif");

  // ========== GERÇEK HAYAT ÖRNEĞİ: E-TİCARET SİTESİ ==========
  // Bir e-ticaret sitesinde ürün bilgilerini saklamak için değişkenler oluşturalım
  // Bu örnek, değişkenlerin gerçek hayatta nasıl kullanıldığını gösterir

  // Ürün kimlik numarası (benzersiz olmalı)
  int urun_id = 3416; // int: Tam sayı çünkü ID'ler tam sayı olur

  // Ürün adı (metin)
  String urun_adi = "Kol Saati"; // String: Ürün adı metin olduğu için

  // Stoktaki ürün adedi (tam sayı)
  int urun_adet = 100; // int: Adet sayısı her zaman tam sayıdır

  // Ürün fiyatı (ondalıklı)
  double urun_fiyat = 149.99; // double: Fiyatlar genelde ondalıklı olur

  // Tedarikçi firma adı (metin)
  String urun_tedarik = "Rolex"; // String: Şirket adı metin olduğu için

  // String Interpolation ($) kullanarak değişkenleri metin içinde gösterme
  // Bu yöntem, değişken değerlerini daha okunabilir şekilde yazdırır
  print(
    "Ürün Bilgileri:\n" +
        "ID: $urun_id\n" +
        "Adı: $urun_adi\n" +
        "Adet: $urun_adet\n" +
        "Fiyat: $urun_fiyat TL\n" +
        "Tedarikçi: $urun_tedarik",
  );

  // ========== ÖNEMLİ NOTLAR ==========
  /*
  1. DEĞİŞKEN ADI KURALLARI:
     - Türkçe karakter kullanabilirsiniz (yas, ad, soyad gibi)
     - Rakamla başlayamaz (1yas ❌, yas1 ✅)
     - Özel karakterler kullanamaz (@, #, $ gibi)
     - Boşluk kullanamaz (urun adi ❌, urun_adi ✅)
     
  2. DEĞİŞKEN TÜRLERİ:
     - int: Tam sayılar (1, 2, 100, -5)
     - double: Ondalıklı sayılar (1.5, 3.14, 99.99)
     - String: Metin ("Merhaba", "123", "a@b.com")
     - bool: Mantıksal değerler (true, false)
     
  3. var KEYWORD'U:
     - Dart otomatik olarak türü belirler
     - Kod yazımını hızlandırır
     - Ama türü belirtmek daha güvenlidir
     
  4. STRING INTERPOLATION ($):
     - Değişkenleri metin içinde göstermek için kullanılır
     - "Merhaba $ad" şeklinde kullanılır
     - Daha okunabilir kod yazmanızı sağlar
  */
}
