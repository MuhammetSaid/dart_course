// ================================ 7- Constructor Kullanımı ================================
/*
 * Bu dosya, Dart dilinde Constructor (Yapıcı Metod) kullanımını açıklar.
 * 
 * CONSTRUCTOR NEDİR?
 * - Class'tan nesne oluşturulurken otomatik çalışan özel bir metoddur
 * - Class ile aynı isme sahiptir
 * - Nesneye başlangıç değerleri atamak için kullanılır
 * - Return type'ı yoktur (void bile yazılmaz)
 * 
 * CONSTRUCTOR ÇEŞİTLERİ:
 * 1. Default Constructor (Varsayılan)
 * 2. Parametreli Constructor
 * 3. Named Constructor
 * 4. Factory Constructor
 * 
 * Bu dosyada ilk 2 çeşit anlatılmaktadır.
 */

// ========================= ÖRNEK 1: Positional Parameters Constructor =========================
/*
 * Positional Parameters: Parametrelerin sırası önemlidir
 * Parametreler sırayla verilmelidir, yer değiştirilemez
 */
class Ogrenci {
  // Özellikler (Properties)
  late String ad; // Öğrencinin adı
  late String no; // Öğrenci numarası
  late int yas; // Öğrencinin yaşı

  // Constructor (Positional Parameters)
  // this.ad → "bu class'ın ad özelliğine parametre değerini ata" anlamına gelir
  Ogrenci(this.ad, this.no, this.yas);

  // Method: Değerleri string olarak döndürür
  String degerleriYaz() {
    return "Ad: $ad, No: $no, Yaş: $yas";
  }
}

// ========================= ÖRNEK 2: Named Parameters Constructor =========================
/*
 * Named Parameters: Parametreler isme göre verilir
 * Sıra önemli değildir, daha okunabilir kod sağlar
 * {required this.ad} → Bu parametre zorunludur
 */
class Ogrenci2 {
  // Özellikler (Properties)
  String ad; // Öğrencinin adı
  int yas; // Öğrencinin yaşı

  // Constructor (Named Parameters)
  // required: Bu parametrelerin mutlaka verilmesi gerekir
  // Named parameters süslü parantez {} içinde tanımlanır
  Ogrenci2({required this.ad, required this.yas});

  // Method: Değerleri string olarak döndürür
  String degerleriYaz() {
    return "Ad: $ad, Yaş: $yas";
  }
}

// ========================= ÖRNEK 3: Karışık Constructor =========================
/*
 * Hem positional hem named parameters birlikte kullanılabilir
 */
class Ogrenci3 {
  String ad;
  String soyad;
  int yas;
  String? sinif; // Opsiyonel alan (nullable)

  // Karışık Constructor
  // Positional parametreler önce, named parametreler sonra gelir
  Ogrenci3(this.ad, this.soyad, {required this.yas, this.sinif});

  String degerleriYaz() {
    String sinifBilgisi = sinif != null ? ", Sınıf: $sinif" : "";
    return "Ad: $ad $soyad, Yaş: $yas$sinifBilgisi";
  }
}

// ========================= ÖRNEK 4: Constructor Body ile =========================
/*
 * Constructor içinde ekstra işlemler yapılabilir
 */
class Ogrenci4 {
  String ad;
  String soyad;
  late String tamIsim; // Constructor'da hesaplanacak
  int yas;

  // Constructor body
  Ogrenci4(this.ad, this.soyad, this.yas) {
    // Constructor içinde ekstra işlemler
    tamIsim = "$ad $soyad";
    print("✓ Yeni öğrenci oluşturuldu: $tamIsim");
  }

  String degerleriYaz() {
    return "Tam İsim: $tamIsim, Yaş: $yas";
  }
}

// ========================= ÖRNEK 5: Default Değerli Constructor =========================
/*
 * Named parameters'a varsayılan değer verilebilir
 */
class Ogrenci5 {
  String ad;
  int yas;
  String bolum;

  // Default değerli constructor
  // bolum parametresi verilmezse "Belirtilmemiş" olarak atanır
  Ogrenci5({required this.ad, required this.yas, this.bolum = "Belirtilmemiş"});

  String degerleriYaz() {
    return "Ad: $ad, Yaş: $yas, Bölüm: $bolum";
  }
}

// ========================= MAIN FONKSİYONU =========================
void main() {
  print(
    "╔═══════════════════════════════════════════════════════════════════╗",
  );
  print("║         DART CONSTRUCTOR (YAPICI) KULLANIMI - ÖRNEKLER           ║");
  print(
    "╚═══════════════════════════════════════════════════════════════════╝\n",
  );

  // ==================== ÖRNEK 1: Positional Parameters ====================
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 1: Positional Parameters Constructor");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("Parametreler sırayla verilir, sıra önemlidir!\n");

  // Nesne oluşturma (Object Creation)
  // Sıra: ad, no, yas
  Ogrenci ogrenci1 = Ogrenci("Muhammed", "838383838383", 22);
  Ogrenci ogrenci2 = Ogrenci("Ahmet", "1234567890", 20);

  print("Öğrenci 1: ${ogrenci1.degerleriYaz()}");
  print("Öğrenci 2: ${ogrenci2.degerleriYaz()}");

  // ❌ YANLIŞ KULLANIM - Sıra değiştirilirse hata olur veya yanlış atama yapılır
  // Ogrenci yanlisOrnek = Ogrenci(22, "Muhammed", "838383838383"); // HATA!

  // ==================== ÖRNEK 2: Named Parameters ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 2: Named Parameters Constructor");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("Parametreler isimle verilir, sıra önemli değildir!\n");

  // Named parameters ile nesne oluşturma
  // Parametre isimleri belirtilir
  Ogrenci2 ogrenci3 = Ogrenci2(ad: "Muhammed", yas: 22);
  Ogrenci2 ogrenci4 = Ogrenci2(yas: 20, ad: "Ahmet"); // Sıra farklı olabilir!

  print("Öğrenci 3: ${ogrenci3.degerleriYaz()}");
  print("Öğrenci 4: ${ogrenci4.degerleriYaz()}");

  // ✅ Avantaj: Okunabilirlik ve esneklik
  print("\n✅ Named Parameters Avantajları:");
  print("   - Parametreler daha okunabilir");
  print("   - Sıra önemli değil");
  print("   - Kod daha anlaşılır");

  // ==================== ÖRNEK 3: Karışık Kullanım ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 3: Karışık (Positional + Named) Constructor");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  // Positional parametreler önce, named parametreler sonra
  Ogrenci3 ogrenci5 = Ogrenci3("Ali", "Yılmaz", yas: 21, sinif: "10-A");
  Ogrenci3 ogrenci6 = Ogrenci3("Ayşe", "Demir", yas: 19); // sınıf opsiyonel

  print("Öğrenci 5: ${ogrenci5.degerleriYaz()}");
  print("Öğrenci 6: ${ogrenci6.degerleriYaz()}");

  // ==================== ÖRNEK 4: Constructor Body ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 4: Constructor Body ile Ekstra İşlemler");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  // Constructor çalıştığında mesaj yazdıracak
  Ogrenci4 ogrenci7 = Ogrenci4("Mehmet", "Kaya", 23);
  print(ogrenci7.degerleriYaz());

  // ==================== ÖRNEK 5: Default Değerler ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 5: Default Değerli Constructor");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  // Bölüm belirtilmeden oluşturma
  Ogrenci5 ogrenci8 = Ogrenci5(ad: "Fatma", yas: 20);
  print("Öğrenci 8: ${ogrenci8.degerleriYaz()}");

  // Bölüm belirtilerek oluşturma
  Ogrenci5 ogrenci9 = Ogrenci5(
    ad: "Zeynep",
    yas: 21,
    bolum: "Bilgisayar Mühendisliği",
  );
  print("Öğrenci 9: ${ogrenci9.degerleriYaz()}");

  // ==================== KARŞILAŞTIRMA ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📊 POSITIONAL vs NAMED PARAMETERS");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  print("Positional Parameters:");
  print("✅ Kısa yazım");
  print("✅ Az parametrede pratik");
  print("❌ Sıra önemli");
  print("❌ Çok parametrede karışık\n");

  print("Named Parameters:");
  print("✅ Okunabilir");
  print("✅ Sıra önemsiz");
  print("✅ Çok parametrede ideal");
  print("✅ Optional parametreler kolay");
  print("❌ Biraz daha uzun yazım\n");

  // ==================== ÖNERİLER ====================
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("💡 CONSTRUCTOR KULLANIM ÖNERİLERİ");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  print("1. 2-3 parametreye kadar → Positional kullan");
  print("2. 4+ parametrede → Named kullan");
  print("3. Opsiyonel alanlar → Named + nullable veya default");
  print("4. required ile zorunlu alanları belirt");
  print("5. Constructor body'de validasyon yapabilirsin");

  print(
    "\n╔═══════════════════════════════════════════════════════════════════╗",
  );
  print(
    "║                    PROGRAM BAŞARIYLA TAMAMLANDI                   ║",
  );
  print(
    "╚═══════════════════════════════════════════════════════════════════╝",
  );
}
