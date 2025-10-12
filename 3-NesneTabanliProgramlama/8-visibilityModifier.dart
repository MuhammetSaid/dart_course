// ================================ 8- Visibility Modifier (Erişim Belirleyicileri) ================================
/*
 * Bu dosya, Dart dilinde Erişim Belirleyicilerini (Visibility Modifiers) açıklar.
 * 
 * DART'TA ERİŞİM BELİRLEYİCİLERİ:
 * 
 * 1. PUBLIC (Varsayılan)
 *    - Alt çizgi (_) olmadan başlayan isimler
 *    - Her yerden erişilebilir
 *    - Örnek: publicDegisken, metodAdi
 * 
 * 2. PRIVATE (Özel)
 *    - Alt çizgi (_) ile başlayan isimler
 *    - Sadece aynı dosya (library) içinden erişilebilir
 *    - Örnek: _privateDegisken, _gizliMetod
 * 
 * NOT: Dart'ta Java/C# gibi protected, internal gibi keyword'ler YOK!
 * Sadece public ve private (alt çizgi ile) vardır.
 */

// ========================= ÖRNEK 1: Temel Kullanım =========================
class Ornek {
  // PUBLIC - Her yerden erişilebilir
  int publicDegisken = 12;
  String publicIsim = "Açık Değer";

  // PRIVATE - Sadece bu dosya içinden erişilebilir
  int _privateDegisken = 12;
  String _privateIsim = "Gizli Değer";

  // PUBLIC method
  void publicMetod() {
    print("Bu metod herkese açık");
  }

  // PRIVATE method
  void _privateMetod() {
    print("Bu metod sadece bu dosyada kullanılabilir");
  }

  // Public method içinden private'a erişim
  void gosterBilgileri() {
    print("Public: $publicDegisken");
    print("Private: $_privateDegisken"); // Aynı class içinde erişilebilir
    _privateMetod(); // Private metod çağrılabilir
  }
}

// ========================= ÖRNEK 2: Getter ve Setter =========================
class BankaHesabi {
  // Private değişken - Dışarıdan doğrudan erişilemez
  double _bakiye = 0;

  // Public getter - Bakiyeyi okumak için
  double get bakiye => _bakiye;

  // Public method - Kontrollü para yatırma
  void paraYatir(double miktar) {
    if (miktar > 0) {
      _bakiye += miktar;
      print("✓ $miktar TL yatırıldı. Yeni bakiye: $_bakiye TL");
    } else {
      print("❌ Geçersiz miktar!");
    }
  }

  // Public method - Kontrollü para çekme
  void paraCek(double miktar) {
    if (miktar > 0 && miktar <= _bakiye) {
      _bakiye -= miktar;
      print("✓ $miktar TL çekildi. Kalan bakiye: $_bakiye TL");
    } else {
      print("❌ Yetersiz bakiye veya geçersiz miktar!");
    }
  }

  // Private method - İç işlem
  double _faizHesapla() {
    return _bakiye * 0.05; // %5 faiz
  }

  // Public method - Faiz ekle (private metodu kullanır)
  void faizEkle() {
    double faiz = _faizHesapla();
    _bakiye += faiz;
    print("✓ $faiz TL faiz eklendi. Yeni bakiye: $_bakiye TL");
  }
}

// ========================= ÖRNEK 3: Private Constructor =========================
class Singleton {
  // Private static instance
  static Singleton? _instance;

  // Private constructor (dışarıdan new Singleton() yapılamaz)
  Singleton._internal();

  // Public factory constructor
  factory Singleton() {
    _instance ??= Singleton._internal();
    return _instance!;
  }

  void mesajYazdir() {
    print("Singleton instance çalışıyor");
  }
}

// ========================= MAIN FONKSİYONU =========================
void main() {
  print("╔═══════════════════════════════════════════════════════╗");
  print("║    DART VISIBILITY MODIFIER (ERİŞİM BELİRLEYİCİ)    ║");
  print("╚═══════════════════════════════════════════════════════╝\n");

  // ==================== ÖRNEK 1: Temel Kullanım ====================
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 1: Public vs Private");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  Ornek ornek1 = Ornek();

  // ✅ Public'e erişim - Sorunsuz
  print("Public değişken: ${ornek1.publicDegisken}");
  print("Public isim: ${ornek1.publicIsim}");
  ornek1.publicMetod();

  // ✅ Private'a aynı dosyada erişim - Çalışır
  print("\nPrivate değişken (aynı dosyada): ${ornek1._privateDegisken}");
  print("Private isim (aynı dosyada): ${ornek1._privateIsim}");
  ornek1._privateMetod();

  print("\n💡 Not: Private üyeler bu dosyada görülebilir ama");
  print("   başka bir dosyadan import edilirse ERİŞİLEMEZ!\n");

  // Public method ile private'a dolaylı erişim
  ornek1.gosterBilgileri();

  // ==================== ÖRNEK 2: Banka Hesabı ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("💰 ÖRNEK 2: Banka Hesabı (Encapsulation)");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  BankaHesabi hesap = BankaHesabi();

  // ❌ Doğrudan erişim YOK
  // hesap._bakiye = 1000000;  // HATA! Private'a erişilemez (başka dosyada)

  // ✅ Kontrollü erişim VAR
  print("Başlangıç bakiyesi: ${hesap.bakiye} TL\n");

  hesap.paraYatir(1000);
  hesap.paraYatir(500);
  hesap.paraCek(300);
  hesap.paraCek(2000); // Yetersiz bakiye
  hesap.faizEkle();

  print("\n📊 Final Bakiye: ${hesap.bakiye} TL");

  // ==================== ÖRNEK 3: Singleton ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("🔒 ÖRNEK 3: Singleton Pattern (Private Constructor)");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  // ❌ Doğrudan constructor çağrılamaz
  // Singleton s = Singleton._internal();  // HATA! Private constructor

  // ✅ Factory constructor üzerinden
  Singleton s1 = Singleton();
  Singleton s2 = Singleton();

  print("s1 ve s2 aynı instance mı? ${identical(s1, s2)}");
  s1.mesajYazdir();

  // ==================== ÖZET ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📋 ÖZET");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  print("✅ PUBLIC (Varsayılan):");
  print("   - Alt çizgi yok");
  print("   - Her yerden erişilebilir");
  print("   - Örnek: publicDegisken, metodAdi()\n");

  print("🔒 PRIVATE (Alt çizgi ile):");
  print("   - Alt çizgi (_) ile başlar");
  print("   - Sadece aynı dosyada erişilebilir");
  print("   - Örnek: _privateDegisken, _gizliMetod()\n");

  print("💡 Encapsulation için private + getter/setter kullan!");

  print("\n╔═══════════════════════════════════════════════════════╗");
  print("║            PROGRAM BAŞARIYLA TAMAMLANDI              ║");
  print("╚═══════════════════════════════════════════════════════╝");
}
