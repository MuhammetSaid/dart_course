# Polymorphism (Çok Biçimlilik) - Dart

## 📚 İçindekiler
1. [Polymorphism Nedir?](#polymorphism-nedir)
2. [Polymorphism Türleri](#polymorphism-türleri)
3. [Runtime Polymorphism](#runtime-polymorphism)
4. [Polymorphism Nasıl Çalışır?](#polymorphism-nasıl-çalışır)
5. [Tip Kontrolü ve Dönüşüm](#tip-kontrolü-ve-dönüşüm)
6. [Gerçek Hayat Örnekleri](#gerçek-hayat-örnekleri)
7. [Polymorphism'in Avantajları](#polymorphismin-avantajları)
8. [Design Patterns ile Polymorphism](#design-patterns-ile-polymorphism)
9. [En İyi Uygulamalar](#en-i̇yi-uygulamalar)
10. [Sık Yapılan Hatalar](#sık-yapılan-hatalar)

---

## Polymorphism Nedir?

**Polymorphism (Çok Biçimlilik)**, nesne yönelimli programlamanın en güçlü özelliklerinden biridir. Aynı arayüzü kullanarak farklı davranışlar sergileyebilme yeteneğidir.

### Kelime Anlamı

- **Poly** = Çok
- **Morph** = Şekil/Biçim
- **Polymorphism** = Çok Biçimlilik

### Basit Tanım

Bir parent class referansı kullanarak, farklı child class nesnelerini tutabilme ve her birinin kendi özel davranışını sergilemesini sağlama yeteneğidir.

```dart
// Parent class referansı
Hayvan hayvan1 = Kedi();
Hayvan hayvan2 = Kopek();
Hayvan hayvan3 = Kus();

// Aynı metod çağrısı, farklı davranışlar
hayvan1.sesCikar(); // Miyav!
hayvan2.sesCikar(); // Hav hav!
hayvan3.sesCikar(); // Cik cik!
```

### Temel Prensip

> **"Tek arayüz, çok uygulama"**
> 
> Bir metod çağrısı yaparsınız ama hangi nesneye ait olduğuna göre farklı davranır.

---

## Polymorphism Türleri

### 1. Compile-Time Polymorphism (Derleme Zamanı)

**Method Overloading** ile sağlanır. Aynı isimli ama farklı parametreli metodlar.

```dart
// ❌ Dart'ta YOK! Dart method overloading'i desteklemez
class Matematik {
  int topla(int a, int b) { return a + b; }
  double topla(double a, double b) { return a + b; } // HATA!
}
```

**Dart'ta Alternatif:** Optional/Named Parameters

```dart
class Matematik {
  num topla(num a, num b, [num? c]) {
    return c != null ? a + b + c : a + b;
  }
}
```

### 2. Runtime Polymorphism (Çalışma Zamanı)

**Method Overriding** ile sağlanır. Parent class metodunun child class'ta yeniden tanımlanması.

```dart
// ✅ Dart'ta VAR!
class Hayvan {
  void sesCikar() {
    print("Hayvan sesi");
  }
}

class Kedi extends Hayvan {
  @override
  void sesCikar() {
    print("Miyav!");
  }
}

class Kopek extends Hayvan {
  @override
  void sesCikar() {
    print("Hav hav!");
  }
}

void main() {
  Hayvan h1 = Kedi();
  Hayvan h2 = Kopek();
  
  h1.sesCikar(); // Runtime'da Kedi'nin metodu çalışır
  h2.sesCikar(); // Runtime'da Kopek'in metodu çalışır
}
```

---

## Runtime Polymorphism

Runtime Polymorphism, Dart'ta en yaygın kullanılan polymorphism türüdür.

### Nasıl Çalışır?

1. Parent class bir metod tanımlar
2. Child class'lar bu metodu override eder
3. Runtime'da (program çalışırken) hangi nesne çağrıldıysa onun metodu çalışır

```dart
class Sekil {
  double alanHesapla() {
    return 0;
  }
}

class Kare extends Sekil {
  double kenar;
  Kare(this.kenar);
  
  @override
  double alanHesapla() {
    return kenar * kenar;
  }
}

class Daire extends Sekil {
  double yaricap;
  Daire(this.yaricap);
  
  @override
  double alanHesapla() {
    return 3.14 * yaricap * yaricap;
  }
}

void main() {
  // Polymorphism: Parent class referansı
  Sekil s1 = Kare(5);
  Sekil s2 = Daire(3);
  
  print(s1.alanHesapla()); // 25 - Kare'nin metodu
  print(s2.alanHesapla()); // 28.26 - Daire'nin metodu
}
```

### Avantajları

1. **Esneklik:** Yeni şekiller eklemek kolay
2. **Kod Tekrarı Önleme:** Ortak kod parent class'ta
3. **Bakım Kolaylığı:** Değişiklikler merkezden yapılır

---

## Polymorphism Nasıl Çalışır?

### 1. Upcasting (Yukarı Tip Dönüşümü)

Child class nesnesini parent class tipine dönüştürme - **Otomatiktir**.

```dart
class Hayvan {
  void yemekYe() => print("Hayvan yemek yiyor");
}

class Kedi extends Hayvan {
  void miyavla() => print("Miyav!");
}

void main() {
  // Upcasting - Otomatik
  Hayvan hayvan = Kedi(); // Kedi → Hayvan (Otomatik)
  
  hayvan.yemekYe(); // ✅ Çalışır
  // hayvan.miyavla(); // ❌ HATA! Hayvan'da miyavla yok
}
```

### 2. Downcasting (Aşağı Tip Dönüşümü)

Parent class referansını child class tipine dönüştürme - **Manuel gerekir**.

```dart
void main() {
  Hayvan hayvan = Kedi();
  
  // Downcasting - Manuel (as kullan)
  if (hayvan is Kedi) {
    Kedi kedi = hayvan as Kedi; // Hayvan → Kedi (Manuel)
    kedi.miyavla(); // ✅ Artık Kedi metodlarına erişebiliriz
  }
}
```

### 3. Dynamic Binding (Dinamik Bağlama)

Hangi metodun çalışacağı **runtime'da** belirlenir.

```dart
void sesTest(Hayvan hayvan) {
  hayvan.sesCikar(); // Runtime'da hangi hayvan olduğuna göre ses çıkar
}

void main() {
  sesTest(Kedi());  // Miyav!
  sesTest(Kopek()); // Hav hav!
  sesTest(Kus());   // Cik cik!
}
```

---

## Tip Kontrolü ve Dönüşüm

### is Operatörü (Tip Kontrolü)

Bir nesnenin belirli bir tipten olup olmadığını kontrol eder.

```dart
Hayvan hayvan = Kedi();

if (hayvan is Kedi) {
  print("Bu bir kedidir"); // ✅ Çalışır
}

if (hayvan is Kopek) {
  print("Bu bir köpektir"); // ❌ Çalışmaz
}

if (hayvan is Hayvan) {
  print("Bu bir hayvandır"); // ✅ Çalışır (Kedi bir Hayvandır)
}
```

### as Operatörü (Tip Dönüşümü)

Bir nesneyi başka bir tipe dönüştürür (cast).

```dart
Hayvan hayvan = Kedi();

// Güvenli dönüşüm
if (hayvan is Kedi) {
  Kedi kedi = hayvan as Kedi;
  kedi.miyavla(); // ✅ Çalışır
}

// Güvensiz dönüşüm - HATA riski!
Kopek kopek = hayvan as Kopek; // ❌ Runtime HATA!
```

### is! Operatörü (Negatif Kontrol)

```dart
if (hayvan is! Kopek) {
  print("Bu bir köpek DEĞİLdir"); // ✅ Çalışır
}
```

### Güvenli Dönüşüm Örneği

```dart
void hayvanIslemleri(Hayvan hayvan) {
  hayvan.yemekYe(); // Her hayvan yemek yer
  
  // Kediye özgü işlemler
  if (hayvan is Kedi) {
    Kedi kedi = hayvan as Kedi;
    kedi.miyavla();
  }
  
  // Köpeğe özgü işlemler
  if (hayvan is Kopek) {
    Kopek kopek = hayvan as Kopek;
    kopek.havla();
  }
}
```

---

## Gerçek Hayat Örnekleri

### Örnek 1: Ödeme Sistemi

```dart
// Base Class
abstract class Odeme {
  double tutar;
  String islemNo;
  
  Odeme(this.tutar, this.islemNo);
  
  // Abstract metod - Her ödeme yöntemi implement etmeli
  void odemeYap();
  
  // Ortak metod
  void makbuzYazdir() {
    print("İşlem No: $islemNo");
    print("Tutar: $tutar TL");
  }
  
  double komisyonHesapla();
}

// Kredi Kartı Ödeme
class KrediKartiOdeme extends Odeme {
  String kartNo;
  String cvv;
  
  KrediKartiOdeme(double tutar, String islemNo, this.kartNo, this.cvv)
      : super(tutar, islemNo);
  
  @override
  void odemeYap() {
    print("💳 Kredi Kartı ile Ödeme");
    print("Kart doğrulanıyor...");
    print("Kart: ${kartNo.substring(0, 4)}****");
    print("$tutar TL ödeme alındı");
    makbuzYazdir();
  }
  
  @override
  double komisyonHesapla() {
    return tutar * 0.025; // %2.5 komisyon
  }
}

// Banka Havalesi
class BankaHavalesi extends Odeme {
  String ibanNo;
  String bankaAdi;
  
  BankaHavalesi(double tutar, String islemNo, this.ibanNo, this.bankaAdi)
      : super(tutar, islemNo);
  
  @override
  void odemeYap() {
    print("🏦 Banka Havalesi");
    print("Banka: $bankaAdi");
    print("IBAN: ${ibanNo.substring(0, 6)}****");
    print("Havale işlemi başlatıldı: $tutar TL");
    makbuzYazdir();
  }
  
  @override
  double komisyonHesapla() {
    return 5.0; // Sabit 5 TL
  }
}

// Dijital Cüzdan
class DijitalCuzdan extends Odeme {
  String cüzdanId;
  String provider;
  
  DijitalCuzdan(double tutar, String islemNo, this.cüzdanId, this.provider)
      : super(tutar, islemNo);
  
  @override
  void odemeYap() {
    print("📱 Dijital Cüzdan ($provider)");
    print("Cüzdan ID: $cüzdanId");
    print("Anlık ödeme: $tutar TL");
    makbuzYazdir();
  }
  
  @override
  double komisyonHesapla() {
    return tutar > 100 ? 0 : 1.0; // 100 TL üzeri komisyonsuz
  }
}

// Polymorphism Kullanımı
class OdemeSistemi {
  // Polymorphic metod - Her ödeme tipini kabul eder
  void odemeIslemi(Odeme odeme) {
    print("\n" + "=" * 50);
    odeme.odemeYap();
    double komisyon = odeme.komisyonHesapla();
    print("Komisyon: $komisyon TL");
    print("Toplam: ${odeme.tutar + komisyon} TL");
    print("=" * 50);
  }
  
  // Toplu ödeme işleme
  void topluOdeme(List<Odeme> odemeler) {
    print("\n🔄 Toplu Ödeme İşlemi Başlatılıyor...\n");
    
    double toplam = 0;
    for (Odeme odeme in odemeler) {
      odeme.odemeYap();
      toplam += odeme.tutar + odeme.komisyonHesapla();
      print("");
    }
    
    print("💰 Genel Toplam: $toplam TL");
  }
}

void main() {
  OdemeSistemi sistem = OdemeSistemi();
  
  // Farklı ödeme yöntemleri
  Odeme odeme1 = KrediKartiOdeme(500, "TRX001", "1234567890123456", "123");
  Odeme odeme2 = BankaHavalesi(1000, "TRX002", "TR330006100519786457841326", "İş Bankası");
  Odeme odeme3 = DijitalCuzdan(150, "TRX003", "wallet123", "PayPal");
  
  // Polymorphism: Aynı metod, farklı ödeme tipleri
  sistem.odemeIslemi(odeme1);
  sistem.odemeIslemi(odeme2);
  sistem.odemeIslemi(odeme3);
  
  // Liste ile polymorphism
  List<Odeme> odemeler = [odeme1, odeme2, odeme3];
  sistem.topluOdeme(odemeler);
}
```

### Örnek 2: Bildirim Sistemi

```dart
// Base Class
abstract class Bildirim {
  String baslik;
  String mesaj;
  String alici;
  DateTime olusturmaTarihi;
  
  Bildirim(this.baslik, this.mesaj, this.alici)
      : olusturmaTarihi = DateTime.now();
  
  // Abstract metod
  void gonder();
  
  // Ortak metodlar
  void logKaydet() {
    print("[LOG] ${olusturmaTarihi.toString()}: $baslik - $alici");
  }
  
  String durumBilgisi();
}

// Email Bildirimi
class EmailBildirim extends Bildirim {
  String emailAdresi;
  List<String> ekler;
  
  EmailBildirim(String baslik, String mesaj, this.emailAdresi, [this.ekler = const []])
      : super(baslik, mesaj, emailAdresi);
  
  @override
  void gonder() {
    print("\n📧 E-POSTA GÖNDERİLİYOR");
    print("Alıcı: $emailAdresi");
    print("Konu: $baslik");
    print("Mesaj: $mesaj");
    if (ekler.isNotEmpty) {
      print("Ekler: ${ekler.join(', ')}");
    }
    logKaydet();
    print("✅ E-posta gönderildi!");
  }
  
  @override
  String durumBilgisi() => "E-posta kuyruğunda";
}

// SMS Bildirimi
class SmsBildirim extends Bildirim {
  String telefonNo;
  
  SmsBildirim(String baslik, String mesaj, this.telefonNo)
      : super(baslik, mesaj, telefonNo);
  
  @override
  void gonder() {
    print("\n📱 SMS GÖNDERİLİYOR");
    print("Telefon: $telefonNo");
    
    // SMS karakter sınırı
    String smsMetni = mesaj.length > 160 
        ? mesaj.substring(0, 157) + "..." 
        : mesaj;
    
    print("Mesaj: $smsMetni");
    logKaydet();
    print("✅ SMS gönderildi!");
  }
  
  @override
  String durumBilgisi() => "SMS operatöre iletildi";
}

// Push Notification
class PushBildirim extends Bildirim {
  String kullaniciId;
  String iconUrl;
  Map<String, dynamic> data;
  
  PushBildirim(
    String baslik,
    String mesaj,
    this.kullaniciId,
    this.iconUrl,
    [this.data = const {}]
  ) : super(baslik, mesaj, kullaniciId);
  
  @override
  void gonder() {
    print("\n🔔 PUSH BİLDİRİM GÖNDERİLİYOR");
    print("Kullanıcı ID: $kullaniciId");
    print("Başlık: $baslik");
    print("Mesaj: $mesaj");
    print("İkon: $iconUrl");
    if (data.isNotEmpty) {
      print("Ek Veri: $data");
    }
    logKaydet();
    print("✅ Push bildirim iletildi!");
  }
  
  @override
  String durumBilgisi() => "Push bildirimi kullanıcı cihazında";
}

// Bildirim Yöneticisi
class BildirimYoneticisi {
  List<Bildirim> bildirimKuyrugu = [];
  
  void bildirimEkle(Bildirim bildirim) {
    bildirimKuyrugu.add(bildirim);
    print("➕ Bildirim kuyruğa eklendi: ${bildirim.baslik}");
  }
  
  // Polymorphic metod - Her bildirim tipini işler
  void tumBildirimleriGonder() {
    print("\n🚀 TÜM BİLDİRİMLER GÖNDERİLİYOR...\n");
    print("Kuyrukta ${bildirimKuyrugu.length} bildirim var");
    
    for (Bildirim bildirim in bildirimKuyrugu) {
      print("\nDurum: ${bildirim.durumBilgisi()}");
      bildirim.gonder(); // Polymorphism: Her bildirim kendi metodunu çalıştırır
    }
    
    bildirimKuyrugu.clear();
    print("\n✅ Tüm bildirimler gönderildi!");
  }
  
  // Sadece belirli tip bildirimleri gönder
  void tipeBagliBildirimGonder<T extends Bildirim>() {
    for (Bildirim bildirim in bildirimKuyrugu) {
      if (bildirim is T) {
        bildirim.gonder();
      }
    }
  }
}

void main() {
  BildirimYoneticisi yonetici = BildirimYoneticisi();
  
  // Farklı bildirim tipleri oluştur
  yonetici.bildirimEkle(
    EmailBildirim(
      "Hoş Geldiniz",
      "Sistemimize hoş geldiniz! Hesabınız başarıyla oluşturuldu.",
      "kullanici@email.com",
      ["hosgeldin.pdf", "kullanim_kilavuzu.pdf"],
    ),
  );
  
  yonetici.bildirimEkle(
    SmsBildirim(
      "Doğrulama",
      "Doğrulama kodunuz: 123456. Bu kodu kimseyle paylaşmayın.",
      "+90 532 123 45 67",
    ),
  );
  
  yonetici.bildirimEkle(
    PushBildirim(
      "Yeni Mesaj",
      "Ahmet size bir mesaj gönderdi",
      "user_789",
      "https://icon.com/message.png",
      {"sender": "Ahmet", "messageId": "msg_123"},
    ),
  );
  
  // Polymorphism ile tüm bildirimleri gönder
  yonetici.tumBildirimleriGonder();
}
```

### Örnek 3: Araç Kiralama Sistemi

```dart
// Base Class
abstract class Arac {
  String plaka;
  String marka;
  String model;
  int yil;
  double gunlukFiyat;
  bool kiralandıMi = false;
  
  Arac(this.plaka, this.marka, this.model, this.yil, this.gunlukFiyat);
  
  // Abstract metodlar
  double kiralamaUcretiHesapla(int gun);
  String aracTipi();
  
  // Ortak metodlar
  void bilgiGoster() {
    print("$marka $model ($yil) - Plaka: $plaka");
    print("Günlük Fiyat: $gunlukFiyat TL");
    print("Durum: ${kiralandıMi ? 'Kirada' : 'Müsait'}");
    print("Araç Tipi: ${aracTipi()}");
  }
  
  void kirala() {
    if (!kiralandıMi) {
      kiralandıMi = true;
      print("✅ $plaka plakalı araç kiralandı");
    } else {
      print("❌ Bu araç zaten kirada!");
    }
  }
  
  void teslimAl() {
    if (kiralandıMi) {
      kiralandıMi = false;
      print("✅ $plaka plakalı araç teslim alındı");
    }
  }
}

// Otomobil
class Otomobil extends Arac {
  int yolcuKapasitesi;
  String yakitTipi;
  bool bagajVarMi;
  
  Otomobil(
    String plaka,
    String marka,
    String model,
    int yil,
    double gunlukFiyat,
    this.yolcuKapasitesi,
    this.yakitTipi,
    this.bagajVarMi,
  ) : super(plaka, marka, model, yil, gunlukFiyat);
  
  @override
  double kiralamaUcretiHesapla(int gun) {
    double toplam = gunlukFiyat * gun;
    if (bagajVarMi) toplam += gun * 20; // Bagaj ücreti
    if (yakitTipi == "Dizel") toplam += gun * 10; // Dizel ek ücreti
    return toplam;
  }
  
  @override
  String aracTipi() => "Otomobil ($yolcuKapasitesi kişilik)";
}

// Minibüs
class Minibus extends Arac {
  int yolcuKapasitesi;
  bool klimaVarMi;
  
  Minibus(
    String plaka,
    String marka,
    String model,
    int yil,
    double gunlukFiyat,
    this.yolcuKapasitesi,
    this.klimaVarMi,
  ) : super(plaka, marka, model, yil, gunlukFiyat);
  
  @override
  double kiralamaUcretiHesapla(int gun) {
    double toplam = gunlukFiyat * gun;
    toplam += (yolcuKapasitesi - 8) * 15 * gun; // Kapasite ücreti
    if (klimaVarMi) toplam += gun * 25;
    return toplam;
  }
  
  @override
  String aracTipi() => "Minibüs ($yolcuKapasitesi kişilik)";
}

// Kamyonet
class Kamyonet extends Arac {
  double yukKapasitesi; // ton
  bool acikKasaMi;
  
  Kamyonet(
    String plaka,
    String marka,
    String model,
    int yil,
    double gunlukFiyat,
    this.yukKapasitesi,
    this.acikKasaMi,
  ) : super(plaka, marka, model, yil, gunlukFiyat);
  
  @override
  double kiralamaUcretiHesapla(int gun) {
    double toplam = gunlukFiyat * gun;
    toplam += yukKapasitesi * 50 * gun; // Kapasite ücreti
    if (!acikKasaMi) toplam += gun * 30; // Kapalı kasa
    return toplam;
  }
  
  @override
  String aracTipi() => "Kamyonet (${yukKapasitesi} ton)";
}

// Araç Kiralama Şirketi
class AracKiralamaFirmasi {
  String firmaAdi;
  List<Arac> aracFilo = [];
  
  AracKiralamaFirmasi(this.firmaAdi);
  
  void aracEkle(Arac arac) {
    aracFilo.add(arac);
    print("✅ ${arac.plaka} filoya eklendi");
  }
  
  // Polymorphic metod - Her araç tipini işler
  void aracKirala(Arac arac, int gun) {
    print("\n" + "=" * 60);
    print("$firmaAdi - KİRALAMA İŞLEMİ");
    print("=" * 60);
    
    arac.bilgiGoster();
    double ucret = arac.kiralamaUcretiHesapla(gun);
    
    print("\nKiralama Süresi: $gun gün");
    print("Toplam Ücret: $ucret TL");
    
    arac.kirala();
    print("=" * 60);
  }
  
  void musaitAraclariListele() {
    print("\n📋 MÜSAİT ARAÇLAR:");
    for (Arac arac in aracFilo) {
      if (!arac.kiralandıMi) {
        print("\n${arac.plaka} - ${arac.marka} ${arac.model}");
        print("Tip: ${arac.aracTipi()}");
        print("Günlük: ${arac.gunlukFiyat} TL");
      }
    }
  }
  
  // Tip bazlı listeleme
  void aracTipinegöreListele<T extends Arac>() {
    print("\n📋 ${T.toString()} TİPİNDEKİ ARAÇLAR:");
    for (Arac arac in aracFilo) {
      if (arac is T) {
        arac.bilgiGoster();
        print("");
      }
    }
  }
}

void main() {
  AracKiralamaFirmasi firma = AracKiralamaFirmasi("Hızlı Kiralama A.Ş.");
  
  // Farklı araç tipleri ekle
  firma.aracEkle(Otomobil("34 ABC 123", "Toyota", "Corolla", 2023, 350, 5, "Benzin", true));
  firma.aracEkle(Otomobil("06 XYZ 789", "Renault", "Clio", 2022, 300, 5, "Dizel", false));
  firma.aracEkle(Minibus("16 DEF 456", "Mercedes", "Sprinter", 2021, 600, 15, true));
  firma.aracEkle(Kamyonet("35 GHI 789", "Ford", "Transit", 2020, 400, 2.5, false));
  
  // Polymorphism ile kiralama
  firma.aracKirala(firma.aracFilo[0], 3); // Otomobil
  firma.aracKirala(firma.aracFilo[2], 5); // Minibüs
  
  // Müsait araçları listele
  firma.musaitAraclariListele();
}
```

---

## Polymorphism'in Avantajları

### 1. Kod Tekrarını Önler

```dart
// ❌ Polymorphism olmadan
void kediSesCikar(Kedi kedi) {
  kedi.sesCikar();
}

void kopekSesCikar(Kopek kopek) {
  kopek.sesCikar();
}

void kusSesCikar(Kus kus) {
  kus.sesCikar();
}

// ✅ Polymorphism ile
void hayvanSesCikar(Hayvan hayvan) {
  hayvan.sesCikar(); // Tek metod, tüm hayvanlar için
}
```

### 2. Genişletilebilirlik

Yeni tipler eklemek mevcut kodu bozmaz.

```dart
// Yeni bir hayvan eklendiğinde
class Kurbaga extends Hayvan {
  @override
  void sesCikar() {
    print("Vrak vrak!");
  }
}

// hayvanSesCikar metodu değişmeden yeni tip ile çalışır!
hayvanSesCikar(Kurbaga());
```

### 3. Bakım Kolaylığı

Değişiklikler parent class'ta yapılır.

```dart
class Hayvan {
  DateTime olusturmaTarihi = DateTime.now();
  
  void bilgiGoster() {
    print("Oluşturma: $olusturmaTarihi");
  }
}

// Tüm child class'lar otomatik olarak bu özelliği alır
```

### 4. Test Edilebilirlik

Mock nesneler kolayca oluşturulabilir.

```dart
// Test için mock hayvan
class MockHayvan extends Hayvan {
  @override
  void sesCikar() {
    print("Test sesi");
  }
}
```

### 5. Loose Coupling (Gevşek Bağımlılık)

Sınıflar arası bağımlılık azalır.

```dart
class HayvanBakicisi {
  void hayvanBesleme(Hayvan hayvan) {
    // Hangi hayvan olduğunu bilmeme gerek yok
    hayvan.yemekYe();
  }
}
```

---

## Design Patterns ile Polymorphism

### 1. Strategy Pattern

```dart
// Strategy interface
abstract class OdemeStratejisi {
  void odemeYap(double tutar);
}

// Concrete strategies
class KrediKartiStratejisi implements OdemcStratejisi {
  @override
  void odemeYap(double tutar) {
    print("Kredi kartı ile $tutar TL ödendi");
  }
}

class NakitStratejisi implements OdemeStratejisi {
  @override
  void odemeYap(double tutar) {
    print("Nakit olarak $tutar TL ödendi");
  }
}

// Context
class SepetOdeme {
  OdemeStratejisi strateji;
  
  SepetOdeme(this.strateji);
  
  void odemeYap(double tutar) {
    strateji.odemeYap(tutar); // Polymorphism
  }
}

void main() {
  SepetOdeme sepet1 = SepetOdeme(KrediKartiStratejisi());
  sepet1.odemeYap(100);
  
  SepetOdeme sepet2 = SepetOdeme(NakitStratejisi());
  sepet2.odemeYap(50);
}
```

### 2. Factory Pattern

```dart
abstract class Hayvan {
  void sesCikar();
}

class HayvanFactory {
  static Hayvan hayvanOlustur(String tip) {
    switch (tip) {
      case 'kedi':
        return Kedi();
      case 'kopek':
        return Kopek();
      case 'kus':
        return Kus();
      default:
        throw Exception("Bilinmeyen hayvan tipi");
    }
  }
}

void main() {
  List<String> tipler = ['kedi', 'kopek', 'kus'];
  
  for (String tip in tipler) {
    Hayvan hayvan = HayvanFactory.hayvanOlustur(tip);
    hayvan.sesCikar(); // Polymorphism
  }
}
```

---

## En İyi Uygulamalar

### 1. Liskov Substitution Principle

Child class, parent class yerine kullanılabilmeli.

```dart
// ✅ İyi - LSP uyumlu
class Kare extends Sekil {
  @override
  double alanHesapla() {
    return kenar * kenar; // Mantıklı davranış
  }
}

void sekilIslemleri(Sekil sekil) {
  double alan = sekil.alanHesapla(); // Her Sekil için çalışır
}
```

### 2. Program to Interface

Concrete class yerine interface/abstract class kullanın.

```dart
// ✅ İyi
void hayvanBesleme(Hayvan hayvan) {
  hayvan.yemekYe();
}

// ❌ Kötü
void kediBesleme(Kedi kedi) {
  kedi.yemekYe();
}
```

### 3. Dependency Injection

Bağımlılıkları dışarıdan alın.

```dart
class HayvanBarinagi {
  List<Hayvan> hayvanlar;
  
  HayvanBarinagi(this.hayvanlar); // DI
  
  void tumHayvanlariCalistir() {
    for (Hayvan h in hayvanlar) {
      h.sesCikar(); // Polymorphism
    }
  }
}
```

### 4. Favor Composition Over Inheritance

Bazı durumlarda composition tercih edilmeli.

```dart
// Inheritance
class UcanKus extends Kus {
  void uc() { }
}

// Composition - Daha esnek
class Kus {
  UcmaYeteneği? ucmaYeteneği;
  
  void ucmayaCalis() {
    ucmaYeteneği?.uc();
  }
}
```

---

## Sık Yapılan Hatalar

### 1. Downcasting Fazla Kullanmak

```dart
// ❌ Kötü - Çok fazla downcasting
void hayvanIslemleri(Hayvan hayvan) {
  if (hayvan is Kedi) {
    (hayvan as Kedi).miyavla();
  } else if (hayvan is Kopek) {
    (hayvan as Kopek).havla();
  }
  // ... daha fazla tip kontrolü
}

// ✅ İyi - Polymorphism kullan
void hayvanIslemleri(Hayvan hayvan) {
  hayvan.sesCikar(); // Her hayvan kendi sesini çıkarır
}
```

### 2. LSP İhlali

```dart
// ❌ Kötü - LSP ihlali
class Dikdörtgen {
  int genislik, yukseklik;
  
  void setBoyutlar(int g, int y) {
    genislik = g;
    yukseklik = y;
  }
  
  int alanHesapla() => genislik * yukseklik;
}

class Kare extends Dikdörtgen {
  @override
  void setBoyutlar(int g, int y) {
    genislik = yukseklik = g; // Beklenmeyen davranış!
  }
}
```

### 3. Gereksiz Inheritance

```dart
// ❌ Kötü - Gereksiz kalıtım
class Araba extends Motor {
  // Araba bir Motor DEĞİLDİR!
}

// ✅ İyi - Composition
class Araba {
  Motor motor; // Araba bir Motor'a SAHİPTİR
}
```

---

## Özet

**Polymorphism (Çok Biçimlilik)**, nesne yönelimli programlamanın en güçlü özelliklerinden biridir.

### 🎯 Temel Noktalar:

1. **Tanım**: Aynı arayüz, farklı davranışlar
2. **Dart**: Runtime polymorphism (method overriding)
3. **Upcasting**: Otomatik (Child → Parent)
4. **Downcasting**: Manuel (Parent → Child, is ve as)
5. **Faydalar**: Esneklik, genişletilebilirlik, bakım kolaylığı

### ✅ Ne Zaman Kullanılmalı:

- Farklı tiplerle aynı işlemi yapmak istediğinizde
- Kodun yeniden kullanılabilir olmasını istediğinizde
- Sistemi genişletilebilir yapmak istediğinizde
- Loose coupling (gevşek bağımlılık) istediğinizde

### ⚠️ Dikkat Edilmesi Gerekenler:

- Liskov Substitution Principle'a uyun
- Gereksiz downcasting yapmayın
- Program to interface, not implementation
- Composition over inheritance prensibini unutmayın

Polymorphism'i doğru kullandığınızda, kodunuz daha esnek, genişletilebilir ve bakımı kolay hale gelir! 🚀

