// ================================ 9- Static Değişken ve Metod ================================
/*
 * Bu dosya, Dart dilinde Static (Statik) değişken ve metodları açıklar.
 * 
 * STATIC NEDİR?
 * - Class'a ait olan ama nesneye bağlı olmayan üyelerdir
 * - Nesne oluşturmadan doğrudan class üzerinden erişilir
 * - Bellekte tek bir kopyası bulunur (tüm nesneler paylaşır)
 * - Class adı ile çağrılır: ClassName.staticMember
 * 
 * STATIC KULLANIM ALANLARI:
 * 1. Sabitler (Constants) - Math.PI, Colors.red
 * 2. Utility fonksiyonlar - Math.max(), DateTime.now()
 * 3. Sayaçlar - Kaç nesne oluşturuldu?
 * 4. Singleton pattern - Tek instance
 * 5. Factory methods - Nesne üretimi
 * 
 * STATIC vs NON-STATIC:
 * Static:    Class'a aittir, nesneye değil
 * Non-static: Nesneye aittir, her nesne için ayrı
 */

// ========================= ÖRNEK 1: Temel Static Kullanımı =========================
class StaticOrnek {
  // Static değişkenler - Class'a ait
  static int sayi1 = 129;
  static int sayi2 = 71;
  static String mesaj = "Merhaba Static!";

  // Static method - Nesne oluşturmadan çağrılır
  static int topla(int x, int y) {
    return x + y;
  }

  static int carp(int x, int y) {
    return x * y;
  }

  // Static method içinde static değişken kullanımı
  static void bilgiYazdir() {
    print("Static sayi1: $sayi1");
    print("Static sayi2: $sayi2");
    print("Static mesaj: $mesaj");
  }
}

// ========================= ÖRNEK 2: Static Sayaç =========================
class Ogrenci {
  // Static sayaç - Kaç öğrenci oluşturuldu?
  static int _ogrenciSayisi = 0;

  // Non-static (instance) değişkenler - Her öğrenci için farklı
  String ad;
  int yas;
  late int ogrenciNo; // Constructor'da atanacak

  // Constructor - Her nesne oluşturulduğunda sayacı artır
  Ogrenci(this.ad, this.yas) {
    _ogrenciSayisi++; // Static sayaç artırılır
    ogrenciNo = _ogrenciSayisi; // Her öğrenciye numara ver
    print("✓ Öğrenci oluşturuldu: $ad (No: $ogrenciNo)");
  }

  // Static method - Toplam öğrenci sayısını döndür
  static int get toplamOgrenci => _ogrenciSayisi;

  // Non-static method - Bu öğrencinin bilgilerini yazdır
  void bilgiYazdir() {
    print("Ad: $ad, Yaş: $yas, No: $ogrenciNo");
  }

  // Static method - Genel bilgi
  static void istatistikGoster() {
    print("═══════════════════════════════════");
    print("Toplam Öğrenci Sayısı: $_ogrenciSayisi");
    print("═══════════════════════════════════");
  }
}

// ========================= ÖRNEK 3: Matematiksel Utility Class =========================
class Matematik {
  // Static sabitler
  static const double PI = 3.14159;
  static const double E = 2.71828;

  // Private constructor - Bu class'tan nesne oluşturulamaz
  Matematik._(); // Utility class olduğu için

  // Static utility metodlar
  static double daireAlan(double yaricap) {
    return PI * yaricap * yaricap;
  }

  static double daireCevre(double yaricap) {
    return 2 * PI * yaricap;
  }

  static int faktoriyel(int n) {
    if (n <= 1) return 1;
    return n * faktoriyel(n - 1);
  }

  static int enBuyuk(int a, int b) {
    return a > b ? a : b;
  }

  static int enKucuk(int a, int b) {
    return a < b ? a : b;
  }

  static double mutlakDeger(double sayi) {
    return sayi < 0 ? -sayi : sayi;
  }
}

// ========================= ÖRNEK 4: Singleton Pattern =========================
class VeriTabani {
  // Static private instance - Tek bir örnek
  static VeriTabani? _instance;

  // Private constructor
  VeriTabani._internal() {
    print("🔗 Veritabanı bağlantısı oluşturuldu");
  }

  // Static factory method - Her zaman aynı instance'ı döndürür
  static VeriTabani getInstance() {
    _instance ??= VeriTabani._internal();
    return _instance!;
  }

  // Instance method
  void sorguCalistir(String sorgu) {
    print("📊 Sorgu çalıştırılıyor: $sorgu");
  }
}

// ========================= ÖRNEK 5: Ayarlar Class'ı =========================
class Ayarlar {
  // Static değişkenler - Uygulama genelinde paylaşılır
  static String dil = "Türkçe";
  static String tema = "Açık";
  static bool bildirimler = true;
  static int fontBoyutu = 14;

  // Static method - Ayarları göster
  static void ayarlariGoster() {
    print("\n⚙️  UYGULAMA AYARLARI:");
    print("   Dil: $dil");
    print("   Tema: $tema");
    print("   Bildirimler: ${bildirimler ? 'Açık' : 'Kapalı'}");
    print("   Font Boyutu: $fontBoyutu");
  }

  // Static method - Ayarları sıfırla
  static void sifirla() {
    dil = "Türkçe";
    tema = "Açık";
    bildirimler = true;
    fontBoyutu = 14;
    print("✓ Ayarlar varsayılana döndürüldü");
  }
}

// ========================= ÖRNEK 6: Static vs Non-Static Karşılaştırma =========================
class Kisi {
  // Static değişken - TÜM kişiler paylaşır
  static int toplamKisi = 0;
  static String ulke = "Türkiye";

  // Non-static değişkenler - Her kişi için FARKLI
  String ad;
  int yas;

  Kisi(this.ad, this.yas) {
    toplamKisi++; // Static sayaç artırılır
  }

  // Static method - Nesne oluşturmadan çağrılır
  static void toplamKisiSayisi() {
    print("Toplam kişi: $toplamKisi");
    // print(ad);  // ❌ HATA! Static method'da non-static değişken kullanılamaz
  }

  // Non-static method - Nesne üzerinden çağrılır
  void kendiniTanit() {
    print("Ben $ad, $yas yaşındayım, $ulke'de yaşıyorum");
    // ✅ Non-static method'da hem static hem non-static kullanılabilir
    print("Toplam kişi sayısı: $toplamKisi");
  }
}

// ========================= MAIN FONKSİYONU =========================
void main() {
  print("╔═══════════════════════════════════════════════════════╗");
  print("║        DART STATIC DEĞİŞKEN VE METOD KULLANIMI        ║");
  print("╚═══════════════════════════════════════════════════════╝\n");

  // ==================== ÖRNEK 1: Temel Static Kullanımı ====================
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 1: Temel Static Kullanımı");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  // Static değişkenlere erişim - Nesne oluşturmadan
  print("Static sayi1: ${StaticOrnek.sayi1}");
  print("Static sayi2: ${StaticOrnek.sayi2}");
  print("Toplam: ${StaticOrnek.sayi1 + StaticOrnek.sayi2}");

  // Static method çağırma
  print("\nStatic topla(420, 232) = ${StaticOrnek.topla(420, 232)}");
  print("Static carp(15, 8) = ${StaticOrnek.carp(15, 8)}");

  // Static method ile bilgi yazdırma
  print("");
  StaticOrnek.bilgiYazdir();

  // ==================== ÖRNEK 2: Static Sayaç ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📊 ÖRNEK 2: Static Sayaç (Öğrenci Takibi)");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  print("Başlangıç: ${Ogrenci.toplamOgrenci} öğrenci\n");

  // Öğrenci nesneleri oluştur
  Ogrenci ogr1 = Ogrenci("Ahmet", 20);
  Ogrenci ogr2 = Ogrenci("Mehmet", 22);
  Ogrenci ogr3 = Ogrenci("Ayşe", 21);
  Ogrenci ogr4 = Ogrenci("Fatma", 19);

  print("\nÖğrenci Bilgileri:");
  ogr1.bilgiYazdir();
  ogr2.bilgiYazdir();
  ogr3.bilgiYazdir();
  ogr4.bilgiYazdir();

  print("");
  Ogrenci.istatistikGoster();

  // ==================== ÖRNEK 3: Matematiksel Utility ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("🧮 ÖRNEK 3: Matematik Utility Class");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  // Static sabitler
  print("PI = ${Matematik.PI}");
  print("E = ${Matematik.E}\n");

  // Static metodlar - Nesne oluşturmadan
  double yaricap = 5;
  print("Daire (r=$yaricap):");
  print("  Alan: ${Matematik.daireAlan(yaricap)}");
  print("  Çevre: ${Matematik.daireCevre(yaricap)}\n");

  print("Faktöriyel:");
  print("  5! = ${Matematik.faktoriyel(5)}");
  print("  3! = ${Matematik.faktoriyel(3)}\n");

  print("Karşılaştırma:");
  print("  max(15, 23) = ${Matematik.enBuyuk(15, 23)}");
  print("  min(15, 23) = ${Matematik.enKucuk(15, 23)}\n");

  print("Mutlak değer:");
  print("  |-42| = ${Matematik.mutlakDeger(-42)}");

  // ❌ Nesne oluşturulamaz
  // var mat = Matematik();  // HATA! Private constructor

  // ==================== ÖRNEK 4: Singleton Pattern ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("🔒 ÖRNEK 4: Singleton Pattern (Tek Instance)");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  // İlk erişim - Yeni instance oluşturulur
  VeriTabani db1 = VeriTabani.getInstance();
  db1.sorguCalistir("SELECT * FROM users");

  // İkinci erişim - Aynı instance döner
  VeriTabani db2 = VeriTabani.getInstance();
  db2.sorguCalistir("SELECT * FROM products");

  // Aynı instance mı kontrol et
  print("\ndb1 ve db2 aynı instance mı? ${identical(db1, db2)}");

  // ==================== ÖRNEK 5: Ayarlar ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("⚙️  ÖRNEK 5: Uygulama Ayarları (Static State)");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  Ayarlar.ayarlariGoster();

  print("\n📝 Ayarlar değiştiriliyor...");
  Ayarlar.dil = "English";
  Ayarlar.tema = "Koyu";
  Ayarlar.bildirimler = false;
  Ayarlar.fontBoyutu = 16;

  Ayarlar.ayarlariGoster();

  print("\n🔄 Ayarlar sıfırlanıyor...");
  Ayarlar.sifirla();
  Ayarlar.ayarlariGoster();

  // ==================== ÖRNEK 6: Static vs Non-Static ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("🔄 ÖRNEK 6: Static vs Non-Static Karşılaştırma");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  // Static değişkene erişim - Nesne oluşturmadan
  print("Başlangıç - Ülke: ${Kisi.ulke}");
  print("Başlangıç - Toplam kişi: ${Kisi.toplamKisi}\n");

  // Kişi nesneleri oluştur
  Kisi kisi1 = Kisi("Ali", 30);
  Kisi kisi2 = Kisi("Veli", 25);
  Kisi kisi3 = Kisi("Ayşe", 28);

  print("");
  kisi1.kendiniTanit();
  kisi2.kendiniTanit();
  kisi3.kendiniTanit();

  print("");
  Kisi.toplamKisiSayisi();

  // Static değişken değiştirme - TÜM nesneleri etkiler
  print("\n🌍 Ülke değiştiriliyor...");
  Kisi.ulke = "Almanya";

  print("");
  kisi1.kendiniTanit(); // Yeni ülke ile
  kisi2.kendiniTanit(); // Yeni ülke ile

  // ==================== ÖZET ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📋 ÖZET: STATIC vs NON-STATIC");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  print("STATIC:");
  print("  ✅ Class'a aittir, nesneye değil");
  print("  ✅ ClassName.member ile erişilir");
  print("  ✅ Bellekte tek kopya");
  print("  ✅ Tüm nesneler paylaşır");
  print("  ✅ Utility fonksiyonlar için ideal\n");

  print("NON-STATIC:");
  print("  ✅ Nesneye aittir");
  print("  ✅ object.member ile erişilir");
  print("  ✅ Her nesne için ayrı kopya");
  print("  ✅ Nesne davranışları için\n");

  print("KULLANIM ALANLARI:");
  print("  📌 Sabitler → static const");
  print("  📌 Utility metodlar → static method");
  print("  📌 Sayaçlar → static değişken");
  print("  📌 Singleton → static instance");
  print("  📌 Factory → static factory method");

  print("\n╔═══════════════════════════════════════════════════════╗");
  print("║            PROGRAM BAŞARIYLA TAMAMLANDI              ║");
  print("╚═══════════════════════════════════════════════════════╝");
}
