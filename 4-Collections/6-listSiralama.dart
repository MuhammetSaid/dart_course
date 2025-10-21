/*
 * LİST SIRALAMA (SORTING) KONUSU
 * 
 * Bu dosyada Dart'ta list sıralama işlemlerini öğreneceğiz.
 * List sıralama, elemanları belirli bir kriterlere göre düzenleme işlemidir.
 * 
 * Ana Konular:
 * 1. sort() metodu kullanımı
 * 2. Comparator fonksiyonları
 * 3. Farklı sıralama kriterleri
 * 4. Ters sıralama
 * 5. Çoklu kriter sıralama
 */

// Öğrenci sınıfı - Sıralama örnekleri için kullanacağız
class Ogrenciler {
  int no; // Öğrenci numarası - sayısal sıralama için
  String ad; // Öğrenci adı - alfabetik sıralama için
  String sinif; // Öğrenci sınıfı - string sıralama için

  // Constructor: Nesne oluştururken değerleri atar
  Ogrenciler(this.no, this.ad, this.sinif);

  // toString metodu: Nesneyi yazdırırken nasıl görüneceğini belirler
  @override
  String toString() {
    return "Öğrenci No: $no, Ad: $ad, Sınıf: $sinif";
  }
}

void main() {
  print("=== LİST SIRALAMA KONUSU ===");
  print("");

  // Öğrenci listesi oluşturuyoruz - Sıralama örnekleri için
  List<Ogrenciler> ogrenciler_list = [
    Ogrenciler(12, "Muhammed Said Elsalih", "4"),
    Ogrenciler(13, "Ahmet Yılmaz", "5"),
    Ogrenciler(14, "Mehmet Kaya", "6"),
    Ogrenciler(15, "Ayşe Kıran", "7"),
    Ogrenciler(16, "Zeynep Kıran", "8"),
  ];

  print("Orijinal liste:");
  for (var ogrenci in ogrenciler_list) {
    print(ogrenci);
  }
  print("");

  // 1. NUMARA SIRALAMA (Küçükten Büyüğe)
  print("=== 1. NUMARA SIRALAMA (Küçükten Büyüğe) ===");
  print("sort() metodu ile numaraya göre sıralama yapıyoruz.");
  print("compareTo() metodu: a.compareTo(b)");
  print("- Eğer a < b ise: negatif değer döner");
  print("- Eğer a = b ise: 0 döner");
  print("- Eğer a > b ise: pozitif değer döner");
  print("");

  // sort() metodu: Liste elemanlarını sıralar
  // (a, b) => a.no.compareTo(b.no): Küçükten büyüğe sıralama
  ogrenciler_list.sort((a, b) => a.no.compareTo(b.no));

  print("Numaraya göre sıralanmış liste:");
  for (var i in ogrenciler_list) {
    print(i);
  }
  print("");

  print("\n" + "=" * 50);
  print("=== 2. SINIF SIRALAMA (Alfabetik) ===");
  print("Comparator kullanarak sınıfa göre sıralama yapıyoruz.");
  print("Comparator<Ogrenciler>: Öğrenci türünde karşılaştırma fonksiyonu");
  print("");

  // Comparator tanımlama: Sınıfa göre sıralama
  Comparator<Ogrenciler> siralama1 = (a, b) => a.sinif.compareTo(b.sinif);

  // sort() metoduna comparator veriyoruz
  ogrenciler_list.sort(siralama1);

  print("Sınıfa göre sıralanmış liste:");
  for (var i in ogrenciler_list) {
    print(i);
  }
  print("");

  print("\n" + "=" * 50);
  print("=== 3. SINIF TERS SIRALAMA (Büyükten Küçüğe) ===");
  print("Ters sıralama için parametreleri yer değiştiriyoruz.");
  print("(b, a) => a.sinif.compareTo(b.sinif): Ters sıralama");
  print("");

  // Ters sıralama: Parametreleri yer değiştiriyoruz
  Comparator<Ogrenciler> siralama2 = (b, a) => a.sinif.compareTo(b.sinif);

  // Ters sıralama uyguluyoruz
  ogrenciler_list.sort(siralama2);

  print("Sınıfa göre ters sıralanmış liste:");
  for (var i in ogrenciler_list) {
    print(i);
  }
  print("");

  print("\n" + "=" * 50);
  print("=== 4. AD SIRALAMA (Alfabetik) ===");
  print("Ad alanına göre alfabetik sıralama yapıyoruz.");
  print("String karşılaştırması: a.ad.compareTo(b.ad)");
  print("");

  // Ad sıralama: Alfabetik sıralama
  Comparator<Ogrenciler> siralama3 = (a, b) => a.ad.compareTo(b.ad);

  // Ad sıralama uyguluyoruz
  ogrenciler_list.sort(siralama3);

  print("Ada göre sıralanmış liste:");
  for (var i in ogrenciler_list) {
    print(i);
  }
  print("");

  print("\n" + "=" * 50);
  print("=== SIRALAMA KONUSU ÖZET ===");
  print("Öğrendiklerimiz:");
  print("• sort() metodu: Liste elemanlarını sıralar");
  print("• compareTo() metodu: İki değeri karşılaştırır");
  print("• Comparator: Karşılaştırma fonksiyonu tanımlar");
  print("• Ters sıralama: Parametreleri yer değiştirerek");
  print("• Farklı kriterler: Numara, ad, sınıf gibi");
  print("");
  print("Sıralama türleri:");
  print("• Sayısal sıralama: int değerler için");
  print("• Alfabetik sıralama: String değerler için");
  print("• Ters sıralama: Büyükten küçüğe");
  print("• Çoklu kriter: Birden fazla alana göre");
}
