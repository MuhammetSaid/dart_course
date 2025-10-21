/*
 * OOP (NESNE TABANLI PROGRAMLAMA) İLE LİST KULLANIMI
 * 
 * Bu dosyada Dart'ta nesne tabanlı programlama ile list kullanımını öğreneceğiz.
 * Özel sınıflar (custom classes) oluşturup bunları listelerde saklayacağız.
 * 
 * Konular:
 * 1. Özel sınıf oluşturma
 * 2. Constructor kullanımı
 * 3. Nesne listesi oluşturma
 * 4. List işlemleri
 * 5. Nesne özelliklerine erişim
 */

// Öğrenci sınıfı tanımlıyoruz
class Ogrenciler {
  int no; // Öğrenci numarası
  String ad; // Öğrenci adı
  String sinif; // Öğrenci sınıfı

  // Constructor: Nesne oluştururken değerleri atar
  Ogrenciler(this.no, this.ad, this.sinif);

  // toString metodu: Nesneyi yazdırırken nasıl görüneceğini belirler
  @override
  String toString() {
    return "Öğrenci No: $no, Ad: $ad, Sınıf: $sinif";
  }
}

void main() {
  print("=== OOP İLE LİST KULLANIMI ===");
  print("");

  // 1. NESNE OLUŞTURMA
  print("1. Öğrenci nesneleri oluşturuluyor...");
  Ogrenciler ogrenci1 = Ogrenciler(12, "Muhammed Said Elsalih", "4");
  var ogrenci2 = Ogrenciler(13, "Ahmet Yılmaz", "5");
  var ogrenci3 = Ogrenciler(14, "Mehmet Kaya", "6");
  var ogrenci4 = Ogrenciler(15, "Ayşe Kıran", "7");

  print("Oluşturulan öğrenciler:");
  print("• $ogrenci1");
  print("• $ogrenci2");
  print("• $ogrenci3");
  print("• $ogrenci4");
  print("");

  // 2. NESNE LİSTESİ OLUŞTURMA
  print("2. Öğrenci listesi oluşturuluyor...");
  List<Ogrenciler> ogrenciler_list = [ogrenci1, ogrenci2, ogrenci3, ogrenci4];
  print("Liste uzunluğu: ${ogrenciler_list.length}");
  print("");

  // 3. LİST ELEMANLARINI GEZME - AD BİLGİSİ
  print("3. Öğrenci adları listeleniyor...");
  print("for-in döngüsü ile:");
  for (var ogrenci in ogrenciler_list) {
    print("• ${ogrenci.ad}");
  }
  print("");

  // 4. LİSTE YENİ ELEMAN EKLEME
  print("4. Yeni öğrenci ekleniyor...");
  Ogrenciler ogrenci5 = Ogrenciler(16, "Fatma Kıran", "8");
  ogrenciler_list.add(ogrenci5);
  print("Yeni öğrenci eklendi: $ogrenci5");
  print("Güncel liste uzunluğu: ${ogrenciler_list.length}");
  print("");

  // 5. LİST ELEMANLARINI GEZME - NUMARA BİLGİSİ
  print("5. Öğrenci numaraları listeleniyor...");
  print("for-in döngüsü ile:");
  for (var ogrenci in ogrenciler_list) {
    print("• Öğrenci No: ${ogrenci.no}");
  }
  print("");

  // 6. DETAYLI BİLGİ GÖSTERİMİ
  print("6. Tüm öğrenci bilgileri detaylı:");
  print("=" * 50);
  for (int i = 0; i < ogrenciler_list.length; i++) {
    var ogrenci = ogrenciler_list[i];
    print("${i + 1}. Öğrenci:");
    print("   No: ${ogrenci.no}");
    print("   Ad: ${ogrenci.ad}");
    print("   Sınıf: ${ogrenci.sinif}");
    print("   " + "-" * 30);
  }
  print("");

  // 7. KOŞULLU FİLTRELEME
  print("7. Belirli sınıftaki öğrenciler:");
  print("5. sınıf ve üzeri öğrenciler:");
  for (var ogrenci in ogrenciler_list) {
    int sinifNo = int.parse(ogrenci.sinif);
    if (sinifNo >= 5) {
      print("• ${ogrenci.ad} (${ogrenci.sinif}. sınıf)");
    }
  }
  print("");

  // 8. FOREACH METODU İLE GEZME
  print("8. forEach metodu ile gezme:");
  ogrenciler_list.forEach((ogrenci) {
    print("• ${ogrenci.no} - ${ogrenci.ad}");
  });
  print("");

  // 9. LİST İŞLEMLERİ
  print("9. Liste işlemleri:");
  print("• İlk öğrenci: ${ogrenciler_list.first.ad}");
  print("• Son öğrenci: ${ogrenciler_list.last.ad}");
  print("• Liste boş mu: ${ogrenciler_list.isEmpty}");
  print("• Liste dolu mu: ${ogrenciler_list.isNotEmpty}");
  print("");

  // 10. NESNE ÖZELLİKLERİNE ERİŞİM
  print("10. Nesne özelliklerine erişim örnekleri:");
  var ilkOgrenci = ogrenciler_list[0];
  print("İlk öğrencinin özellikleri:");
  print("• No: ${ilkOgrenci.no}");
  print("• Ad: ${ilkOgrenci.ad}");
  print("• Sınıf: ${ilkOgrenci.sinif}");
  print("• Ad uzunluğu: ${ilkOgrenci.ad.length} karakter");
  print("");

  print("=== OOP İLE LİST KULLANIMI TAMAMLANDI ===");
  print("Bu örnekte öğrendiklerimiz:");
  print("• Özel sınıf oluşturma");
  print("• Constructor kullanımı");
  print("• Nesne listesi oluşturma");
  print("• List işlemleri");
  print("• Nesne özelliklerine erişim");
  print("• Koşullu filtreleme");
  print("• Farklı döngü türleri");
}
