// ================================ 2- Araba Analojisi ================================
/*
 * Bu dosya, Dart dilinde Nesne Tabanlı Programlama (OOP) kavramlarını
 * gerçek dünyadan bir örnekle (Araba) açıklar.
 * 
 * NESNE TABANLI PROGRAMLAMA NEDİR?
 * - Gerçek dünya nesnelerini kod ile modelleme yöntemidir
 * - Her nesne, özelliklere (properties) ve davranışlara (methods) sahiptir
 * - Class: Nesnenin şablonu/taslağı
 * - Object/Instance: Class'tan üretilen somut örnekler
 * 
 * ARABA ANALOJİSİ:
 * - Gerçek hayatta bir araba tasarım planı vardır (Class)
 * - Bu plandan birçok araba üretilebilir (Objects)
 * - Her arabanın özellikleri vardır: marka, renk, hız (Properties)
 * - Her araba işlemler yapabilir: çalıştır, durdur, hızlan (Methods)
 */

// ========================= ÖRNEK 1: Basit Class (Sadece Özellikler) =========================
/*
 * En basit haliyle bir class tanımı
 * Bu class sadece veri tutar, davranış içermez
 */
class ArabaBasit {
  // Özellikler (Properties/Fields)
  // late anahtar kelimesi: Bu özelliklerin daha sonra değer alacağını belirtir
  late String marka; // Arabanın markası (String: metin)
  late int hiz; // Arabanın hızı (int: tam sayı)
  late bool isRunning; // Arabanın çalışıp çalışmadığı (bool: true/false)
  late String renk; // Arabanın rengi
}

// ========================= ÖRNEK 2: Gelişmiş Class (Özellikler + Metodlar) =========================
/*
 * Bu class hem veri tutar hem de işlemler yapabilir
 * Gerçek bir araba gibi çalışır
 */
class Araba {
  // ==================== ÖZELLİKLER (Properties) ====================
  late String marka;
  late int hiz;
  late bool isRunning;
  late String renk;
  late int motor; // Motor hacmi (cc)

  // ==================== METODLAR (Methods) ====================

  /// Arabanın tüm bilgilerini ekrana yazdırır
  void bilgileriGoster() {
    print("\n╔════════════════ ARABA BİLGİLERİ ════════════════╗");
    print("║  Marka          : $marka");
    print("║  Renk           : $renk");
    print("║  Motor Hacmi    : $motor cc");
    print("║  Mevcut Hız     : $hiz km/h");
    print("║  Durum          : ${isRunning ? '🟢 Çalışıyor' : '🔴 Kapalı'}");
    print("╚═════════════════════════════════════════════════╝");
  }

  /// Arabayı çalıştırır
  /// Motor durumu false ise true yapar
  void calistir() {
    if (isRunning) {
      print("⚠️  Uyarı: $marka zaten çalışıyor!");
    } else {
      isRunning = true;
      hiz = 0; // Çalıştırıldığında hız sıfırdan başlar
      print("✓ $marka başarıyla çalıştırıldı! Motor: $motor cc");
    }
  }

  /// Arabayı durdurur
  /// Motor durumu true ise false yapar ve hızı sıfırlar
  void durdur() {
    if (!isRunning) {
      print("⚠️  Uyarı: $marka zaten kapalı!");
    } else {
      isRunning = false;
      hiz = 0;
      print("✓ $marka başarıyla durduruldu.");
    }
  }

  /// Arabanın hızını artırır
  /// [artis]: Hıza eklenecek değer (km/h)
  void hizlan(int artis) {
    if (!isRunning) {
      print("❌ Hata: $marka çalışmıyor! Önce arabayı çalıştırın.");
      return;
    }

    if (artis < 0) {
      print("❌ Hata: Hızlanma değeri negatif olamaz!");
      return;
    }

    int eskiHiz = hiz;
    hiz += artis;

    // Maksimum hız kontrolü
    if (hiz > 250) {
      hiz = 250;
      print("⚠️  Maksimum hıza ulaşıldı! (250 km/h)");
    } else {
      print("🚀 $marka hızlandı: $eskiHiz km/h → $hiz km/h (+$artis km/h)");
    }
  }

  /// Arabanın hızını azaltır
  /// [azalma]: Hızdan çıkarılacak değer (km/h)
  void yavaslat(int azalma) {
    if (!isRunning) {
      print("❌ Hata: $marka çalışmıyor!");
      return;
    }

    if (azalma < 0) {
      print("❌ Hata: Yavaşlama değeri negatif olamaz!");
      return;
    }

    int eskiHiz = hiz;
    hiz -= azalma;

    // Hız sıfırın altına inemez
    if (hiz < 0) {
      hiz = 0;
      print("🛑 $marka durdu: $eskiHiz km/h → 0 km/h");
    } else {
      print("🔻 $marka yavaşladı: $eskiHiz km/h → $hiz km/h (-$azalma km/h)");
    }
  }

  /// Arabayı acil durumda durdurur
  void acilFren() {
    if (!isRunning) {
      print("⚠️  Araba zaten kapalı!");
      return;
    }

    print("🚨 ACİL FREN! $marka $hiz km/h'den aniden durduruluyor!");
    hiz = 0;
    isRunning = false;
    print("✓ Araba güvenli bir şekilde durduruldu.");
  }

  /// Arabanın durumunu kontrol eder
  String durumKontrol() {
    if (!isRunning) {
      return "Araba kapalı";
    } else if (hiz == 0) {
      return "Araba çalışıyor ancak duruyor";
    } else if (hiz < 50) {
      return "Düşük hızda";
    } else if (hiz < 100) {
      return "Orta hızda";
    } else if (hiz < 150) {
      return "Yüksek hızda";
    } else {
      return "Çok yüksek hızda! DİKKAT!";
    }
  }
}

// ========================= ÖRNEK 3: Constructor (Kurucu) Kullanan Class =========================
/*
 * Constructor: Nesne oluşturulurken otomatik çalışan özel bir metoddur
 * Özelliklere başlangıç değeri atamayı kolaylaştırır
 */
class ArabaConstructor {
  String marka;
  String renk;
  int motor;
  int hiz;
  bool isRunning;

  // Constructor: Class ile aynı isimde olmalı
  // this.marka: Bu sınıfın marka özelliğine atama yap
  ArabaConstructor(this.marka, this.renk, this.motor)
    : hiz = 0, // Başlangıçta hız sıfır
      isRunning = false; // Başlangıçta motor kapalı

  void bilgileriGoster() {
    print("🚗 $marka | $renk | $motor cc | Hız: $hiz km/h");
  }
}

// ========================= ÖRNEK 4: Named Constructor ve Named Parameters =========================
/*
 * Named Constructor: Farklı şekillerde nesne oluşturmayı sağlar
 * Named Parameters: Parametrelere isim vererek daha okunabilir kod yazılmasını sağlar
 */
class ArabaGelismis {
  String marka;
  String renk;
  int motor;
  int hiz;
  bool isRunning;

  // Default Constructor
  ArabaGelismis({
    required this.marka, // required: Bu parametre zorunludur
    required this.renk,
    required this.motor,
    this.hiz = 0, // Varsayılan değer
    this.isRunning = false,
  });

  // Named Constructor - Sıfır Kilometre Araba
  ArabaGelismis.sifirKm(String marka, String renk, int motor)
    : this.marka = marka,
      this.renk = renk,
      this.motor = motor,
      this.hiz = 0,
      this.isRunning = false {
    print("✨ Yeni sıfır kilometre $marka üretildi!");
  }

  // Named Constructor - İkinci El Araba
  ArabaGelismis.ikinciEl(String marka, String renk, int motor)
    : this.marka = marka,
      this.renk = renk,
      this.motor = motor,
      this.hiz = 0,
      this.isRunning = false {
    print("📦 İkinci el $marka sisteme eklendi!");
  }

  void bilgileriGoster() {
    print("   → $marka | $renk | $motor cc");
  }
}

// ========================= MAIN FONKSIYONU =========================
void main() {
  print(
    "╔═══════════════════════════════════════════════════════════════════╗",
  );
  print("║          DART NESNE TABANLI PROGRAMLAMA - ARABA ANALOJİSİ         ║");
  print(
    "╚═══════════════════════════════════════════════════════════════════╝\n",
  );

  // ==================== ÖRNEK 1: Basit Class Kullanımı ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 1: Basit Class (Sadece Veri Saklama)");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // Class'tan bir nesne (object/instance) oluşturma
  // var: Dart'ın tip çıkarımı
  // ArabaBasit(): Constructor çağrısı - yeni bir nesne oluşturur
  var bmw = ArabaBasit();

  // Özelliklere değer atama (dot notation kullanarak)
  bmw.marka = "BMW";
  bmw.hiz = 120;
  bmw.isRunning = true;
  bmw.renk = "Kırmızı";

  // Özellikleri okuma
  print("Marka         : ${bmw.marka}");
  print("Hız           : ${bmw.hiz} km/h");
  print("Çalışıyor mu  : ${bmw.isRunning}");
  print("Renk          : ${bmw.renk}");

  // ==================== ÖRNEK 2: Metodlu Class Kullanımı ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 2: Gelişmiş Class (Veri + Davranış)");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // Mercedes nesnesi oluşturma
  var mercedes = Araba();
  mercedes.marka = "Mercedes-Benz";
  mercedes.renk = "Siyah";
  mercedes.motor = 3000;
  mercedes.hiz = 0;
  mercedes.isRunning = false;

  // Metodları kullanma
  mercedes.bilgileriGoster();

  print("\n--- İşlem Başlıyor ---");
  mercedes.calistir(); // Arabayı çalıştır
  mercedes.hizlan(50); // 50 km/h hızlan
  mercedes.hizlan(80); // 80 km/h daha hızlan
  mercedes.bilgileriGoster(); // Güncel durumu göster

  print("\n--- Yavaşlama ---");
  mercedes.yavaslat(40); // 40 km/h yavaşla
  mercedes.bilgileriGoster();

  print("\n--- Durum Kontrolü ---");
  print("📊 Durum: ${mercedes.durumKontrol()}");

  // ==================== ÖRNEK 3: Audi ile Test ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 3: Farklı Bir Araba ile Test");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  var audi = Araba();
  audi.marka = "Audi";
  audi.renk = "Beyaz";
  audi.motor = 2000;
  audi.hiz = 0;
  audi.isRunning = false;

  audi.calistir();
  audi.hizlan(60);
  audi.hizlan(70);
  audi.hizlan(90);
  audi.bilgileriGoster();

  print("\n--- Acil Durum! ---");
  audi.acilFren();
  audi.bilgileriGoster();

  // ==================== ÖRNEK 4: Constructor Kullanımı ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 4: Constructor ile Nesne Oluşturma");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // Constructor ile tek satırda nesne oluşturma ve değer atama
  var toyota = ArabaConstructor("Toyota", "Gri", 1600);
  toyota.bilgileriGoster();

  var honda = ArabaConstructor("Honda", "Mavi", 1800);
  honda.bilgileriGoster();

  // ==================== ÖRNEK 5: Named Constructor ve Parameters ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 5: Named Constructor ve Named Parameters");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // Named Parameters ile oluşturma (parametre sırası önemli değil)
  var ford = ArabaGelismis(marka: "Ford", renk: "Yeşil", motor: 2200);
  ford.bilgileriGoster();

  // Named Constructor kullanımı
  var volkswagenSifir = ArabaGelismis.sifirKm("Volkswagen", "Turuncu", 1400);
  volkswagenSifir.bilgileriGoster();

  var renaultIkinciEl = ArabaGelismis.ikinciEl("Renault", "Pembe", 1200);
  renaultIkinciEl.bilgileriGoster();

  // ==================== ÖRNEK 6: Birden Fazla Nesne ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 6: Aynı Class'tan Birden Fazla Nesne");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("Her nesne bağımsızdır ve kendi değerlerini tutar\n");

  var araba1 = Araba();
  araba1.marka = "Tesla";
  araba1.renk = "Elektrik Mavisi";
  araba1.motor = 0; // Elektrikli
  araba1.isRunning = false;
  araba1.hiz = 0;

  var araba2 = Araba();
  araba2.marka = "Ferrari";
  araba2.renk = "Kırmızı";
  araba2.motor = 6500;
  araba2.isRunning = false;
  araba2.hiz = 0;

  // Her nesne bağımsız çalışır
  araba1.calistir();
  araba1.hizlan(100);

  araba2.calistir();
  araba2.hizlan(200);

  print("\n--- İki Arabanın Karşılaştırması ---");
  araba1.bilgileriGoster();
  araba2.bilgileriGoster();

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
