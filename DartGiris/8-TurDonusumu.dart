// =============================== Bölüm 8: Tür Dönüşümü (Type Conversion) ===============================

/*
TÜR DÖNÜŞÜMÜ NEDİR?
Tür dönüşümü, bir veri tipini başka bir veri tipine çevirme işlemidir.
Dart'ta farklı veri tipleri arasında dönüşüm yapmak için özel metodlar kullanılır.

DÖNÜŞÜM TÜRLERİ:
1. Sayısaldan Sayısala: int ↔ double
2. Sayısaldan Metne: int/double → String
3. Metinden Sayısala: String → int/double

ÖNEMLİ METODLAR:
- toInt(): double'ı int'e çevirir
- toDouble(): int'i double'a çevirir
- toString(): Sayıyı String'e çevirir
- int.parse(): String'i int'e çevirir
- double.parse(): String'i double'a çevirir

DİKKAT EDİLMESİ GEREKENLER:
- Dönüşüm sırasında veri kaybı olabilir
- Geçersiz String'ler hata verir
- null değerler kontrol edilmelidir
*/

void main() {
  print("=== TÜR DÖNÜŞÜMÜ ÖRNEKLERİ ===\n");

  // ========================= SAYISALDAN SAYISALA DÖNÜŞÜM =========================
  
  print("1. SAYISALDAN SAYISALA DÖNÜŞÜM:");
  
  int tamSayi = 42;
  double ondalikliSayi = 42.73;
  
  // double'ı int'e çevirme (ondalık kısım silinir)
  int sonuc1 = ondalikliSayi.toInt();
  print("Double $ondalikliSayi → Int $sonuc1 (ondalık kısım silindi)");
  
  // int'i double'a çevirme (ondalık kısım eklenir)
  double sonuc2 = tamSayi.toDouble();
  print("Int $tamSayi → Double $sonuc2 (ondalık kısım eklendi)");
  
  // Dikkat: Veri kaybı örneği
  double buyukSayi = 999.999;
  int kucukSayi = buyukSayi.toInt();
  print("Double $buyukSayi → Int $kucukSayi (0.999 kayboldu)");

  // ========================= SAYISALDAN METNE DÖNÜŞÜM =========================
  
  print("\n2. SAYISALDAN METNE DÖNÜŞÜM:");
  
  int sayi1 = 190;
  double sayi2 = 45.67;
  
  // int'i String'e çevirme
  String string1 = sayi1.toString();
  print("Int $sayi1 → String '$string1'");
  
  // double'ı String'e çevirme
  String string2 = sayi2.toString();
  print("Double $sayi2 → String '$string2'");
  
  // String interpolation ile otomatik dönüşüm
  String mesaj = "Sayı: $sayi1, Ondalık: $sayi2";
  print("String interpolation: $mesaj");
  
  // toStringAsFixed() ile ondalık basamak kontrolü
  String formatli = sayi2.toStringAsFixed(2);
  print("Formatlı string: '$formatli' (2 ondalık basamak)");

  // ========================= METİNDEN SAYISALA DÖNÜŞÜM =========================
  
  print("\n3. METİNDEN SAYISALA DÖNÜŞÜM:");
  
  String yazi1 = "123";
  String yazi2 = "324.56";
  
  // String'i int'e çevirme
  int s1 = int.parse(yazi1);
  print("String '$yazi1' → Int $s1");
  
  // String'i double'a çevirme
  double s2 = double.parse(yazi2);
  print("String '$yazi2' → Double $s2");
  
  // ❌ HATA ÖRNEKLERİ (try-catch ile kontrol edilmeli):
  print("\n4. HATA KONTROLÜ:");
  
  try {
    String gecersizYazi = "abc123";
    int gecersizSayi = int.parse(gecersizYazi); // Hata verecek
    print("Bu satır çalışmaz: $gecersizSayi");
  } catch (e) {
    print("❌ Hata: '$e' - Geçersiz sayı formatı");
  }
  
  // tryParse ile güvenli dönüşüm
  String belirsizYazi = "123abc";
  int? guvenliSayi = int.tryParse(belirsizYazi);
  print("tryParse sonucu: $guvenliSayi (null döner çünkü geçersiz)");

  // ========================= GERÇEK HAYAT ÖRNEKLERİ =========================
  
  print("\n5. GERÇEK HAYAT ÖRNEKLERİ:");
  
  // Kullanıcı girişi simülasyonu
  String kullaniciGirisi = "25.5"; // Kullanıcıdan gelen veri
  double yas = double.parse(kullaniciGirisi);
  print("Kullanıcı yaşı: $yas");
  
  // Hesaplama sonucu
  double hesaplama = yas * 2.5;
  String sonucMetni = hesaplama.toStringAsFixed(1);
  print("Hesaplama sonucu: $sonucMetni");
  
  // API'den gelen veri simülasyonu
  String apiYanit = "1000";
  int id = int.parse(apiYanit);
  print("API'den gelen ID: $id");
  
  // Dosya boyutu formatlaması
  int dosyaBoyutu = 1048576; // bytes
  double mbBoyut = dosyaBoyutu / (1024 * 1024);
  String formatliBoyut = mbBoyut.toStringAsFixed(2);
  print("Dosya boyutu: $formatliBoyut MB");

  // ========================= İLERİ DÖNÜŞÜM ÖRNEKLERİ =========================
  
  print("\n6. İLERİ DÖNÜŞÜM ÖRNEKLERİ:");
  
  // bool dönüşümü
  String boolYazi = "true";
  bool boolDegeri = boolYazi.toLowerCase() == "true";
  print("String '$boolYazi' → Bool $boolDegeri");
  
  // Liste elemanlarını dönüştürme
  List<String> sayiListesi = ["1", "2", "3", "4", "5"];
  List<int> intListesi = sayiListesi.map((e) => int.parse(e)).toList();
  print("String listesi: $sayiListesi");
  print("Int listesi: $intListesi");
  
  // Map değerlerini dönüştürme
  Map<String, String> stringMap = {"fiyat": "99.99", "adet": "5"};
  double fiyat = double.parse(stringMap["fiyat"]!);
  int adet = int.parse(stringMap["adet"]!);
  double toplam = fiyat * adet;
  print("Fiyat: $fiyat, Adet: $adet, Toplam: $toplam");

  // ========================= ÖNEMLİ NOTLAR =========================
  
  print("\n7. ÖNEMLİ NOTLAR:");
  print("✅ toInt(): Ondalık kısmı siler");
  print("✅ toDouble(): Ondalık kısmı ekler");
  print("✅ toString(): Sayıyı metne çevirir");
  print("✅ parse(): Metni sayıya çevirir (hata verebilir)");
  print("✅ tryParse(): Güvenli dönüşüm (null döner)");
  print("✅ toStringAsFixed(): Ondalık basamak kontrolü");
}

/*
ÖNEMLİ KURALLAR:

1. GÜVENLİ DÖNÜŞÜM:
   - tryParse() kullanın, parse() yerine
   - null kontrolü yapın
   - try-catch blokları kullanın

2. VERİ KAYBI:
   - double → int dönüşümünde ondalık kısım silinir
   - Büyük sayılar küçük tiplere sığmayabilir

3. PERFORMANS:
   - toString() pahalı bir işlemdir
   - String interpolation daha hızlıdır

4. BEST PRACTICES:
   - Kullanıcı girişlerini her zaman kontrol edin
   - API'den gelen verileri güvenli şekilde dönüştürün
   - Formatlı çıktılar için toStringAsFixed() kullanın
*/
