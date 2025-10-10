// ================================ 3- Otobüs Analojisi ================================
/*
 * Bu dosya, Dart dilinde Nesne Tabanlı Programlamayı otobüs firması örneğiyle açıklar.
 * 
 * OTOBÜS ANALOJİSİ:
 * - Gerçek hayatta otobüs firmalarının sefer yönetimi vardır
 * - Her otobüsün özellikleri: marka, kapasite, güzergah, fiyat
 * - Her otobüs işlemler yapabilir: bilet sat, sefer ertele, indirim yap
 * 
 * Kullanılan Kavramlar:
 * - Class ve Object
 * - Properties (Özellikler)
 * - Methods (Metodlar)
 * - Validasyon (Doğrulama)
 * - İş mantığı uygulamaları
 */

// ========================= OTOBÜS CLASS TANIMI =========================
/*
 * Otobus class'ı bir otobüs firmasının sefer bilgilerini ve 
 * işlemlerini yönetmek için tasarlanmıştır.
 */
class Otobus {
  // ==================== ÖZELLİKLER (Properties) ====================

  // Otobüs ve Firma Bilgileri
  late String marka; // Otobüs firmasının adı (örn: "Metro Turizm")

  // Sefer Detayları
  late double suresi; // Seferin süresi (saat cinsinden)
  late int km; // Sefer mesafesi (kilometre)

  // Yolcu Bilgileri
  late bool doluMu; // Otobüsün dolu olup olmadığı
  late int yolcuSayisi; // Mevcut yolcu sayısı
  late int yolcuKapasitesi; // Maksimum yolcu kapasitesi (örn: 50 kişi)

  // Fiyat Bilgisi
  late double biletFiyati; // Bilet fiyatı (TL cinsinden)

  // Güzergah Bilgileri
  late String kalkisNoktasi; // Otobüsün kalkış noktası (örn: "Ankara")
  late String varisNoktasi; // Otobüsün varış noktası (örn: "İstanbul")

  // Zaman Bilgileri
  late String seferSaati; // Sefer saati (örn: "10:00")
  late String seferTarihi; // Sefer tarihi (örn: "2025-01-01")

  // Durum Bilgisi
  late bool
  seferDurumu; // Seferin aktif olup olmadığı (true: aktif, false: iptal)

  // ==================== METODLAR (Methods) ====================

  /// Otobüsün tüm bilgilerini ekrana yazdırır
  ///
  /// Bu method, sefer ile ilgili tüm detayları formatlanmış bir şekilde gösterir:
  /// - Firma bilgileri
  /// - Güzergah bilgileri
  /// - Yolcu durumu
  /// - Fiyat bilgisi
  /// - Zaman bilgileri
  void degerleriOku() {
    print(
      "╔═══════════════════════════════════════════════════════════════════╗",
    );
    print("║   Marka: $marka");
    print("║   Süresi: $suresi saat");
    print("║   Km: $km km");
    print("║   Dolu Mu: $doluMu");
    print("║   Yolcu Sayisi: $yolcuSayisi / $yolcuKapasitesi");
    print("║   Yolcu Kapasitesi: $yolcuKapasitesi kişi");
    print("║   Bilet Fiyati: $biletFiyati TL");
    print("║   Kalkis Noktasi: $kalkisNoktasi");
    print("║   Varis Noktasi: $varisNoktasi");
    print("║   Sefer Saati: $seferSaati");
    print("║   Sefer Tarihi: $seferTarihi");
    print("║   Sefer Durumu: ${seferDurumu ? '✅ Aktif' : '❌ İptal'}");
    print(
      "╚═══════════════════════════════════════════════════════════════════╝",
    );
  }

  /// Seferin saatini değiştirir (erteler)
  ///
  /// [yeniSaat]: Seferin yeni kalkış saati (örn: "14:00")
  ///
  /// Bu method, otobüs seferinin saatini değiştirmek için kullanılır.
  /// Hava koşulları, trafik durumu veya operasyonel nedenlerle
  /// sefer saati ertelenebilir.
  ///
  /// Örnek kullanım:
  /// ```dart
  /// otobus.seferiErtele("14:00");
  /// ```
  void seferiErtele(String yeniSaat) {
    // Eski saati koruyalım
    String eskiSaat = seferSaati;

    // Yeni saati ata
    seferSaati = yeniSaat;

    // Bilgilendirme mesajı
    print(
      " 📅 Sefer Ertelendi: $marka seferi $eskiSaat → $yeniSaat olarak değiştirildi.",
    );
    print("    Tarih: $seferTarihi | Güzergah: $kalkisNoktasi - $varisNoktasi");
  }

  /// Seferi iptal eder
  ///
  /// Bu method, otobüs seferini tamamen iptal eder.
  /// İptal edilen seferin durumu 'false' olarak işaretlenir.
  ///
  /// İptal nedenleri:
  /// - Hava koşulları (kar, fırtına)
  /// - Teknik arıza
  /// - Yetersiz yolcu sayısı
  /// - Operasyonel kararlar
  ///
  /// İptal sonrası yolculara bilgilendirme yapılmalı ve
  /// bilet iadesi işlemleri başlatılmalıdır.
  void seferiIptalEt() {
    // Sefer durumunu iptal et
    seferDurumu = false;

    // İptal mesajı
    print("\n 🚫 ═══════════ SEFER İPTAL BİLDİRİMİ ═══════════");
    print(" 🚌 Firma: $marka");
    print(" 📅 Tarih: $seferTarihi");
    print(" 🕐 Saat: $seferSaati");
    print(" 🗺️  Güzergah: $kalkisNoktasi → $varisNoktasi");
    print(" ⚠️  SEFER İPTAL EDİLMİŞTİR!");
    print(" 💳 Bilet iadesi için müşteri hizmetleri ile iletişime geçiniz.");
    print(" ═════════════════════════════════════════════════\n");
  }

  /// Belirtilen sayıda bilet satar
  ///
  /// [yeniYolcuSayisi]: Satılacak bilet sayısı (kaç kişilik)
  ///
  /// Bu method, otobüse yeni yolcu ekler ve kapasite kontrolü yapar.
  ///
  /// Validasyon Kuralları:
  /// - Boş yer kontrolü yapılır
  /// - Kapasite aşılmaz (yolcuKapasitesi - yolcuSayisi)
  /// - Negatif sayıda bilet satılamaz
  ///
  /// Başarılı satış durumunda:
  /// - Yolcu sayısı artırılır
  /// - Kalan yer bilgisi gösterilir
  /// - Otobüs doluysa doluMu = true yapılır
  ///
  /// Örnek kullanım:
  /// ```dart
  /// otobus.biletSat(5); // 5 kişilik bilet sat
  /// ```
  void biletSat(int yeniYolcuSayisi) {
    // Negatif değer kontrolü
    if (yeniYolcuSayisi <= 0) {
      print(" ❌ Hata: Bilet sayısı pozitif olmalıdır!");
      return;
    }

    // Boş yer hesaplama
    int bosYer = yolcuKapasitesi - yolcuSayisi;

    // Kapasite kontrolü: İstenen yolcu sayısı boş yerden fazla mı?
    if (yeniYolcuSayisi > bosYer) {
      // Kapasite yetersiz - bilet satılamaz
      print("\n 🚫 ═══════ BİLET SATILMADI ═══════");
      print(" 🚌 Firma: $marka");
      print(" 📅 Sefer: $seferTarihi - $seferSaati");
      print(" 🗺️  Güzergah: $kalkisNoktasi → $varisNoktasi");
      print(" ❌ Talep: $yeniYolcuSayisi kişilik");
      print(" 💺 Boş Yer: $bosYer kişilik");
      print(" ⚠️  Yetersiz kapasite! İşlem gerçekleştirilemedi.");
      print(" ═════════════════════════════════\n");
    } else {
      // Kapasite yeterli - bilet sat
      yolcuSayisi += yeniYolcuSayisi;
      int kalanYer = yolcuKapasitesi - yolcuSayisi;

      // Otobüs doldu mu kontrol et
      if (kalanYer == 0) {
        doluMu = true;
      }

      // Başarılı satış mesajı
      print("\n 🎫 ═══════ BİLET SATILDI ═══════");
      print(" 🚌 Firma: $marka");
      print(" 📅 Sefer: $seferTarihi - $seferSaati");
      print(" 🗺️  Güzergah: $kalkisNoktasi → $varisNoktasi");
      print(" ✅ Satılan Bilet: $yeniYolcuSayisi kişilik");
      print(" 👥 Toplam Yolcu: $yolcuSayisi / $yolcuKapasitesi");
      print(" 💺 Kalan Yer: $kalanYer kişilik");
      print(" 💰 Toplam Tutar: ${yeniYolcuSayisi * biletFiyati} TL");

      if (doluMu) {
        print(" 🔴 OTOBÜS DOLDU!");
      }

      print(" ════════════════════════════════\n");
    }
  }

  /// Bilet fiyatına indirim uygular
  ///
  /// [indirimOrani]: İndirim oranı (0.0 - 1.0 arası, örn: 0.2 = %20)
  ///
  /// Bu method, mevcut bilet fiyatına indirim uygular.
  ///
  /// İndirim Kuralları:
  /// - İndirim oranı 0 ile 1 arasında olmalıdır
  /// - 0.2 = %20 indirim
  /// - 0.5 = %50 indirim
  /// - 1.0 = %100 indirim (ücretsiz)
  ///
  /// İndirim Türleri:
  /// - Erken rezervasyon indirimi
  /// - Öğrenci indirimi
  /// - Promosyon indirimi
  /// - Toplu bilet indirimi
  ///
  /// Örnek kullanım:
  /// ```dart
  /// otobus.indirimYap(0.2);  // %20 indirim
  /// otobus.indirimYap(0.5);  // %50 indirim
  /// ```
  void indirimYap(double indirimOrani) {
    // Geçersiz indirim kontrolü
    if (indirimOrani <= 0) {
      print("\n ❌ Hata: İndirim oranı 0'dan büyük olmalıdır!");
      return;
    }

    if (indirimOrani > 1) {
      print("\n ❌ Hata: İndirim oranı 1'den (% 100) büyük olamaz!");
      return;
    }

    // Eski fiyatı sakla
    double eskiFiyat = biletFiyati;

    // İndirim hesapla ve uygula
    double indirimTutari = biletFiyati * indirimOrani;
    biletFiyati -= indirimTutari;

    // İndirim yüzdesini hesapla
    int indirimYuzdesi = (indirimOrani * 100).round();

    // Başarılı indirim mesajı
    print("\n 💸 ═══════ İNDİRİM UYGULANIR ═══════");
    print(" 🚌 Firma: $marka");
    print(" 📅 Sefer: $seferTarihi - $seferSaati");
    print(" 🗺️  Güzergah: $kalkisNoktasi → $varisNoktasi");
    print(" 🏷️  İndirim Oranı: %$indirimYuzdesi");
    print(" 💵 Eski Fiyat: $eskiFiyat TL");
    print(" 💰 İndirim Tutarı: $indirimTutari TL");
    print(" ✅ Yeni Fiyat: $biletFiyati TL");
    print(" 🎉 $indirimTutari TL tasarruf ettiniz!");
    print(" ════════════════════════════════════\n");
  }
}

// ========================= MAIN FONKSIYONU =========================
/*
 * Main fonksiyonu, programın başlangıç noktasıdır.
 * Burada Otobus class'ından nesneler oluşturup test ediyoruz.
 */
void main() {
  // Program başlığı
  print(
    "╔═══════════════════════════════════════════════════════════════════╗",
  );
  print(
    "║          DART NESNE TABANLI PROGRAMLAMA - OTOBÜS ANALOJİSİ        ║",
  );
  print(
    "╚═══════════════════════════════════════════════════════════════════╝",
  );

  // ==================== ÖRNEK 1: Otobüs Nesnesi Oluşturma ve İşlemler ====================
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 1: Otobüs Seferi Yönetimi");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // Otobus class'ından bir nesne oluştur
  // Bu nesne, Zafer Turizm firmasının bir seferini temsil ediyor
  var zaferTurizm = Otobus();

  // Otobüs özelliklerine değer atama (Property Assignment)
  // Her özelliğe nokta (.) operatörü ile erişip değer atıyoruz
  zaferTurizm.marka = "Zafer Turizm"; // Firma adı
  zaferTurizm.suresi = 6.5; // 6.5 saatlik sefer
  zaferTurizm.km = 100; // 100 km mesafe (NOT: Muhtemelen 1000 olmalı)
  zaferTurizm.doluMu = false; // Otobüs henüz dolu değil
  zaferTurizm.yolcuSayisi = 31; // Şu an 31 yolcu var
  zaferTurizm.yolcuKapasitesi = 50; // Maksimum 50 kişi alabilir
  zaferTurizm.biletFiyati = 999.99; // Bilet fiyatı 999.99 TL
  zaferTurizm.kalkisNoktasi = "Malatya"; // Nereden kalkıyor
  zaferTurizm.varisNoktasi = "İstanbul"; // Nereye gidiyor
  zaferTurizm.seferSaati = "10:00"; // Saat 10:00'da kalkacak
  zaferTurizm.seferTarihi = "2025-01-01"; // 1 Ocak 2025 tarihinde
  zaferTurizm.seferDurumu = true; // Sefer aktif

  // --- İşlem 1: Mevcut durumu görüntüle ---
  print("\n📋 Başlangıç Durumu:");
  zaferTurizm.degerleriOku();

  // --- İşlem 2: Bilet satışı yap ---
  // 10 kişilik bilet sat (31 + 10 = 41 yolcu olacak)
  print("\n💳 İşlem: 10 Kişilik Bilet Satışı");
  zaferTurizm.biletSat(10);

  // Satış sonrası durumu göster
  print("\n📋 Bilet Satışı Sonrası Durum:");
  zaferTurizm.degerleriOku();

  // --- İşlem 3: İndirim uygula ---
  // %60 indirim yap (0.6 = %60)
  // Dikkat: Bu çok yüksek bir indirim! Normal şartlarda %10-20 arası yapılır
  print("\n🏷️  İşlem: %60 İndirim Uygulanıyor");
  zaferTurizm.indirimYap(0.6);

  // İndirim sonrası durumu göster
  print("\n📋 İndirim Sonrası Durum:");
  zaferTurizm.degerleriOku();

  // Program sonu
  print(
    "\n╔═══════════════════════════════════════════════════════════════════╗",
  );
  print(
    "║                    PROGRAM BAŞARIYLA TAMAMLANDI                   ║",
  );
  print(
    "║                                                                   ║",
  );
  print(
    "║  ÖĞRENİLEN KAVRAMLAR:                                             ║",
  );
  print("║  ✓ Class tanımlama ve nesne oluşturma                             ║");
  print("║  ✓ Property (özellik) kullanımı                                   ║");
  print("║  ✓ Method (metod) kullanımı                                       ║");
  print("║  ✓ İş mantığı ve validasyon                                       ║");
  print("║  ✓ Gerçek dünya problemlerini modelleme                           ║");
  print(
    "╚═══════════════════════════════════════════════════════════════════╝",
  );
}
