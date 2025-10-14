# Override (Geçersiz Kılma) - Dart

## 📚 İçindekiler
1. [Override Nedir?](#override-nedir)
2. [Neden Override Kullanılır?](#neden-override-kullanılır)
3. [@override Annotation](#override-annotation)
4. [Override Kuralları](#override-kuralları)
5. [Override Türleri](#override-türleri)
6. [super Anahtar Kelimesi ile Override](#super-anahtar-kelimesi-ile-override)
7. [Gerçek Hayat Örnekleri](#gerçek-hayat-örnekleri)
8. [Override vs Overload](#override-vs-overload)
9. [En İyi Uygulamalar](#en-i̇yi-uygulamalar)
10. [Sık Yapılan Hatalar](#sık-yapılan-hatalar)

---

## Override Nedir?

**Override (Geçersiz Kılma)**, kalıtım (inheritance) ilişkisinde child class'ın, parent class'tan miras aldığı bir metodu kendi ihtiyacına göre yeniden tanımlamasıdır.

### Basit Tanım

Parent class'ta tanımlı bir metodu, child class'ta aynı isim ve imza ile yeniden yazarak, metodun davranışını değiştirme işlemidir.

```dart
// Parent Class
class Hayvan {
  void sesCikar() {
    print("Hayvan ses çıkarıyor");
  }
}

// Child Class
class Kedi extends Hayvan {
  @override
  void sesCikar() {
    print("Miyav!"); // Parent metodun davranışı değiştirildi
  }
}

void main() {
  Hayvan hayvan = Hayvan();
  hayvan.sesCikar(); // Çıktı: Hayvan ses çıkarıyor
  
  Kedi kedi = Kedi();
  kedi.sesCikar(); // Çıktı: Miyav! (Override edilmiş)
}
```

### Temel Mantık

1. Parent class genel bir davranış tanımlar
2. Child class bu davranışı kendine uyarlar
3. Aynı metod ismi, farklı davranışlar

---

## Neden Override Kullanılır?

### 1. Davranışı Özelleştirme

Her child class, parent class'ın genel davranışını kendi ihtiyacına göre değiştirebilir.

```dart
class Sekil {
  double alanHesapla() {
    return 0; // Genel bir değer
  }
}

class Kare extends Sekil {
  double kenar;
  Kare(this.kenar);
  
  @override
  double alanHesapla() {
    return kenar * kenar; // Kare'ye özgü hesaplama
  }
}

class Daire extends Sekil {
  double yaricap;
  Daire(this.yaricap);
  
  @override
  double alanHesapla() {
    return 3.14 * yaricap * yaricap; // Daire'ye özgü hesaplama
  }
}
```

### 2. Kod Tekrarını Önleme

Parent class'taki ortak kod kullanılır, sadece farklı olan kısım override edilir.

```dart
class Arac {
  String marka;
  Arac(this.marka);
  
  void bilgiGoster() {
    print("Marka: $marka");
  }
  
  void hareketEt() {
    print("Araç hareket ediyor");
  }
}

class Araba extends Arac {
  Araba(String marka) : super(marka);
  
  // Sadece farklı olan metod override edilir
  @override
  void hareketEt() {
    print("Araba karayolunda gidiyor");
  }
  
  // bilgiGoster metodu override edilmedi, parent'tan kullanılıyor
}
```

### 3. Tip Güvenliği

Parent class tipi ile çalışırken, runtime'da doğru child class metodu çalışır.

```dart
void sesTest(Hayvan hayvan) {
  hayvan.sesCikar(); // Hangi hayvan olursa olsun, doğru ses çıkar
}

void main() {
  sesTest(Kedi());  // Miyav!
  sesTest(Kopek()); // Hav hav!
}
```

### 4. Genişletilebilirlik

Yeni child class'lar eklemek kolay, mevcut kod değişmez.

```dart
// Yeni bir hayvan eklemek
class Kus extends Hayvan {
  @override
  void sesCikar() {
    print("Cik cik!");
  }
}
// Mevcut kodda değişiklik yapmadan yeni davranış eklendi
```

---

## @override Annotation

`@override` annotation'ı, bir metodun parent class'taki bir metodu override ettiğini belirtir.

### Zorunlu mu?

**HAYIR**, `@override` yazmadan da override yapabilirsiniz.

```dart
// @override olmadan da çalışır
class Kedi extends Hayvan {
  void sesCikar() {  // Yine de override eder
    print("Miyav!");
  }
}
```

### Neden Kullanılmalı?

#### 1. Güvenlik - Hata Yakalama

```dart
class Hayvan {
  void sesCikar() {
    print("Ses");
  }
}

class Kedi extends Hayvan {
  @override
  void sesCikart() {  // ❌ HATA! Metod ismi yanlış
    print("Miyav!");
  }
}
```

Derleyici hata verir:
> "sesCikart' doesn't override an inherited method"

`@override` olmasaydı, yeni bir metod olarak kabul edilirdi ve hata yakalanmazdı.

#### 2. İmza Kontrolü

```dart
class Hayvan {
  void sesCikar() {
    print("Ses");
  }
}

class Kedi extends Hayvan {
  @override
  void sesCikar(String ses) {  // ❌ HATA! Parametre farklı
    print(ses);
  }
}
```

Derleyici hata verir çünkü imza (signature) farklı.

#### 3. Parent Class Değişikliklerini Yakalar

```dart
// Önce
class Hayvan {
  void sesCikar() { }
}

class Kedi extends Hayvan {
  @override
  void sesCikar() { }  // ✅ Çalışıyor
}

// Sonra - Parent class'ta metod adı değiştirildi
class Hayvan {
  void sesYap() { }  // Metod adı değişti
}

class Kedi extends Hayvan {
  @override
  void sesCikar() { }  // ❌ HATA! Override edilecek metod yok
}
```

`@override` olmasaydı, kod sessizce çalışır ama yanlış davranırdı.

#### 4. Okunabilirlik

```dart
class Kedi extends Hayvan {
  @override  // Bu satır: "Bu metod parent'tan gelir ve değiştirilmiştir"
  void sesCikar() {
    print("Miyav!");
  }
  
  void tirmala() {  // Bu yeni bir metod
    print("Tırmalıyor");
  }
}
```

Kod okuyan kişi hemen anlıyor:
- `sesCikar()` → Override edilmiş metod
- `tirmala()` → Yeni metod

### En İyi Uygulama

✅ **HER ZAMAN `@override` kullanın!**

```dart
class Kedi extends Hayvan {
  @override  // ✅ İyi
  void sesCikar() {
    print("Miyav!");
  }
}
```

---

## Override Kuralları

### 1. Metod İsmi Aynı Olmalı

```dart
class Parent {
  void metod1() { }
}

class Child extends Parent {
  @override
  void metod1() { }  // ✅ Aynı isim
  
  @override
  void metod2() { }  // ❌ Parent'ta yok
}
```

### 2. Parametre Sayısı ve Tipleri Aynı Olmalı

```dart
class Parent {
  void hesapla(int a, int b) { }
}

class Child extends Parent {
  @override
  void hesapla(int a, int b) { }  // ✅ Aynı parametreler
  
  @override
  void hesapla(int a) { }  // ❌ Parametre sayısı farklı
  
  @override
  void hesapla(double a, double b) { }  // ❌ Tip farklı
}
```

### 3. Dönüş Tipi Aynı Olmalı (veya Covariant)

```dart
class Parent {
  num hesapla() => 0;
}

class Child extends Parent {
  @override
  num hesapla() => 10;  // ✅ Aynı tip
  
  @override
  int hesapla() => 10;  // ✅ Alt tip (covariant) - int, num'un alt tipi
  
  @override
  String hesapla() => "10";  // ❌ Farklı tip
}
```

### 4. Erişim Belirleyici Daha Kısıtlayıcı Olamaz

Dart'ta tüm metodlar varsayılan olarak public'tir. Private metodlar (`_` ile başlayan) override edilemez.

```dart
class Parent {
  void publicMethod() { }
  void _privateMethod() { }
}

class Child extends Parent {
  @override
  void publicMethod() { }  // ✅ Çalışır
  
  @override
  void _privateMethod() { }  // ❌ Private metodlar override edilemez
}
```

### 5. Static Metodlar Override Edilemez

```dart
class Parent {
  static void staticMethod() { }
}

class Child extends Parent {
  @override
  static void staticMethod() { }  // ❌ Static metodlar override edilemez
}
```

---

## Override Türleri

### 1. Tam Override (Complete Override)

Parent metodun tamamı değiştirilir.

```dart
class Hesap {
  double faizHesapla(double anapara) {
    return anapara * 0.05; // %5 faiz
  }
}

class OzelHesap extends Hesap {
  @override
  double faizHesapla(double anapara) {
    return anapara * 0.10; // %10 faiz - Tamamen farklı
  }
}
```

### 2. Kısmi Override (Partial Override)

Parent metodun davranışı genişletilir veya değiştirilir ama tamamen değişmez.

```dart
class Hayvan {
  void bilgiGoster() {
    print("Bu bir hayvandır");
  }
}

class Kedi extends Hayvan {
  String renk;
  Kedi(this.renk);
  
  @override
  void bilgiGoster() {
    super.bilgiGoster(); // Parent metodu çağır
    print("Rengi: $renk"); // Ek bilgi ekle
  }
}
```

### 3. Koşullu Override

Belirli koşullarda farklı davranır.

```dart
class Calisan {
  double maasHesapla(int calismaGunu) {
    return calismaGunu * 100.0;
  }
}

class UstDuzeyCalisan extends Calisan {
  @override
  double maasHesapla(int calismaGunu) {
    if (calismaGunu > 20) {
      // Fazla çalışma primi
      return (calismaGunu * 100.0) + 500;
    }
    return super.maasHesapla(calismaGunu);
  }
}
```

---

## super Anahtar Kelimesi ile Override

`super` kelimesi, parent class'ın metodunu çağırmak için kullanılır.

### 1. Parent Metodunu Çağırma

```dart
class Arac {
  void bilgiGoster() {
    print("Bu bir araçtır");
  }
}

class Araba extends Arac {
  String model;
  Araba(this.model);
  
  @override
  void bilgiGoster() {
    super.bilgiGoster(); // Parent metodunu çağır
    print("Model: $model"); // Ek bilgi ekle
  }
}

void main() {
  Araba araba = Araba("Corolla");
  araba.bilgiGoster();
  // Çıktı:
  // Bu bir araçtır
  // Model: Corolla
}
```

### 2. Parent Metodunun Sonucunu Kullanma

```dart
class Matematik {
  int topla(int a, int b) {
    return a + b;
  }
}

class GelismisMatematik extends Matematik {
  @override
  int topla(int a, int b) {
    int sonuc = super.topla(a, b); // Parent metodun sonucu
    print("Toplama işlemi yapıldı: $a + $b = $sonuc");
    return sonuc;
  }
}
```

### 3. Parent Metodunu Genişletme

```dart
class Dosya {
  void kaydet() {
    print("Dosya kaydediliyor...");
  }
}

class ResimDosyasi extends Dosya {
  @override
  void kaydet() {
    print("Resim optimize ediliyor...");
    super.kaydet(); // Parent'ın kaydetme mantığını kullan
    print("Thumbnail oluşturuluyor...");
  }
}

void main() {
  ResimDosyasi resim = ResimDosyasi();
  resim.kaydet();
  // Çıktı:
  // Resim optimize ediliyor...
  // Dosya kaydediliyor...
  // Thumbnail oluşturuluyor...
}
```

### 4. super Kullanmadan Override

Bazen parent metodunu hiç çağırmayız.

```dart
class GenelHesap {
  double kdvHesapla(double fiyat) {
    return fiyat * 0.18; // %18 KDV
  }
}

class IhracatHesap extends GenelHesap {
  @override
  double kdvHesapla(double fiyat) {
    return 0; // İhracatta KDV yok - Parent metodu çağrılmıyor
  }
}
```

---

## Gerçek Hayat Örnekleri

### Örnek 1: Ödeme Sistemi

```dart
// Base Class
class Odeme {
  double tutar;
  
  Odeme(this.tutar);
  
  void odemeYap() {
    print("$tutar TL ödeme yapılıyor...");
  }
  
  String odemeYontemi() {
    return "Genel Ödeme";
  }
  
  double komisyonHesapla() {
    return 0;
  }
}

// Kredi Kartı Ödemesi
class KrediKartiOdeme extends Odeme {
  String kartNo;
  
  KrediKartiOdeme(double tutar, this.kartNo) : super(tutar);
  
  @override
  void odemeYap() {
    print("Kredi kartı bilgileri kontrol ediliyor...");
    super.odemeYap(); // Parent'ın ödeme mantığını kullan
    print("Kart: ${kartNo.substring(0, 4)}****");
    print("Ödeme başarılı!");
  }
  
  @override
  String odemeYontemi() {
    return "Kredi Kartı";
  }
  
  @override
  double komisyonHesapla() {
    return tutar * 0.02; // %2 komisyon
  }
}

// Banka Havalesi
class BankaHavalesi extends Odeme {
  String ibanNo;
  
  BankaHavalesi(double tutar, this.ibanNo) : super(tutar);
  
  @override
  void odemeYap() {
    print("IBAN doğrulanıyor...");
    super.odemeYap();
    print("IBAN: ${ibanNo.substring(0, 4)}****");
    print("Havale işlemi başlatıldı.");
  }
  
  @override
  String odemeYontemi() {
    return "Banka Havalesi";
  }
  
  @override
  double komisyonHesapla() {
    return 5.0; // Sabit 5 TL komisyon
  }
}

// Dijital Cüzdan
class DijitalCuzdan extends Odeme {
  String cüzdanId;
  
  DijitalCuzdan(double tutar, this.cüzdanId) : super(tutar);
  
  @override
  void odemeYap() {
    print("Dijital cüzdan bakiyesi kontrol ediliyor...");
    super.odemeYap();
    print("Cüzdan ID: $cüzdanId");
    print("Anlık ödeme tamamlandı!");
  }
  
  @override
  String odemeYontemi() {
    return "Dijital Cüzdan";
  }
  
  @override
  double komisyonHesapla() {
    if (tutar > 100) {
      return 0; // 100 TL üzeri komisyonsuz
    }
    return 1.0; // 1 TL komisyon
  }
}

void main() {
  print("=== ÖDEME SİSTEMİ ===\n");
  
  List<Odeme> odemeler = [
    KrediKartiOdeme(500, "1234567890123456"),
    BankaHavalesi(1000, "TR330006100519786457841326"),
    DijitalCuzdan(150, "dijital123"),
  ];
  
  for (Odeme odeme in odemeler) {
    print("Ödeme Yöntemi: ${odeme.odemeYontemi()}");
    print("Tutar: ${odeme.tutar} TL");
    print("Komisyon: ${odeme.komisyonHesapla()} TL");
    print("Toplam: ${odeme.tutar + odeme.komisyonHesapla()} TL");
    print("");
    odeme.odemeYap();
    print("-" * 50);
    print("");
  }
}
```

### Örnek 2: Bildirim Sistemi

```dart
// Base Class
class Bildirim {
  String mesaj;
  String alici;
  
  Bildirim(this.mesaj, this.alici);
  
  void gonder() {
    print("Bildirim gönderiliyor...");
  }
  
  String durumBilgisi() {
    return "Gönderim bekliyor";
  }
}

// E-posta Bildirimi
class EmailBildirim extends Bildirim {
  String konu;
  
  EmailBildirim(String mesaj, String alici, this.konu) 
    : super(mesaj, alici);
  
  @override
  void gonder() {
    print("📧 E-POSTA GÖNDERİLİYOR");
    print("Alıcı: $alici");
    print("Konu: $konu");
    print("Mesaj: $mesaj");
    super.gonder();
    print("E-posta başarıyla gönderildi!");
  }
  
  @override
  String durumBilgisi() {
    return "E-posta kuyruğunda";
  }
}

// SMS Bildirimi
class SmsBildirim extends Bildirim {
  SmsBildirim(String mesaj, String alici) : super(mesaj, alici);
  
  @override
  void gonder() {
    print("📱 SMS GÖNDERİLİYOR");
    
    // SMS karakter sınırı kontrolü
    if (mesaj.length > 160) {
      print("⚠️ Mesaj 160 karakterden uzun, kısaltılıyor...");
      String kisaMesaj = mesaj.substring(0, 157) + "...";
      print("Alıcı: $alici");
      print("Mesaj: $kisaMesaj");
    } else {
      print("Alıcı: $alici");
      print("Mesaj: $mesaj");
    }
    
    super.gonder();
    print("SMS gönderildi!");
  }
  
  @override
  String durumBilgisi() {
    return "SMS operatöre iletildi";
  }
}

// Push Notification
class PushBildirim extends Bildirim {
  String baslik;
  String iconUrl;
  
  PushBildirim(String mesaj, String alici, this.baslik, this.iconUrl) 
    : super(mesaj, alici);
  
  @override
  void gonder() {
    print("🔔 PUSH BİLDİRİM GÖNDERİLİYOR");
    print("Kullanıcı ID: $alici");
    print("Başlık: $baslik");
    print("Mesaj: $mesaj");
    print("İkon: $iconUrl");
    super.gonder();
    print("Push bildirim kullanıcı cihazına ulaştı!");
  }
  
  @override
  String durumBilgisi() {
    return "Push bildirimi iletildi";
  }
}

void main() {
  print("=== BİLDİRİM SİSTEMİ ===\n");
  
  EmailBildirim email = EmailBildirim(
    "Siparişiniz kargoya verildi",
    "musteri@email.com",
    "Sipariş Güncelleme",
  );
  
  SmsBildirim sms = SmsBildirim(
    "Doğrulama kodunuz: 123456",
    "+90 532 123 45 67",
  );
  
  PushBildirim push = PushBildirim(
    "Yeni mesajınız var!",
    "user_789",
    "Mesaj Bildirimi",
    "https://icon.com/message.png",
  );
  
  print("1. E-posta Bildirimi:");
  print("Durum: ${email.durumBilgisi()}");
  email.gonder();
  print("\n" + "=" * 60 + "\n");
  
  print("2. SMS Bildirimi:");
  print("Durum: ${sms.durumBilgisi()}");
  sms.gonder();
  print("\n" + "=" * 60 + "\n");
  
  print("3. Push Bildirimi:");
  print("Durum: ${push.durumBilgisi()}");
  push.gonder();
}
```

### Örnek 3: Dosya İşlemleri

```dart
// Base Class
class Dosya {
  String dosyaAdi;
  int boyut; // byte cinsinden
  
  Dosya(this.dosyaAdi, this.boyut);
  
  void ac() {
    print("$dosyaAdi açılıyor...");
  }
  
  void kaydet() {
    print("$dosyaAdi kaydediliyor...");
  }
  
  String bilgiVer() {
    return "Dosya: $dosyaAdi, Boyut: $boyut byte";
  }
  
  double boyutMB() {
    return boyut / 1024 / 1024;
  }
}

// Resim Dosyası
class ResimDosyasi extends Dosya {
  int genislik;
  int yukseklik;
  String format; // jpg, png, etc.
  
  ResimDosyasi(
    String dosyaAdi,
    int boyut,
    this.genislik,
    this.yukseklik,
    this.format,
  ) : super(dosyaAdi, boyut);
  
  @override
  void ac() {
    print("🖼️ Resim görüntüleyici açılıyor...");
    super.ac();
    print("Çözünürlük: ${genislik}x$yukseklik");
  }
  
  @override
  void kaydet() {
    print("Resim optimize ediliyor...");
    if (format == 'jpg') {
      print("JPEG sıkıştırma uygulanıyor...");
    }
    super.kaydet();
    print("Thumbnail oluşturuluyor...");
    print("Resim kaydedildi!");
  }
  
  @override
  String bilgiVer() {
    return "${super.bilgiVer()}, Çözünürlük: ${genislik}x$yukseklik, Format: $format";
  }
}

// Video Dosyası
class VideoDosyasi extends Dosya {
  int sureDakika;
  String codec;
  int fps;
  
  VideoDosyasi(
    String dosyaAdi,
    int boyut,
    this.sureDakika,
    this.codec,
    this.fps,
  ) : super(dosyaAdi, boyut);
  
  @override
  void ac() {
    print("🎬 Video oynatıcı başlatılıyor...");
    print("Codec kontrol ediliyor: $codec");
    super.ac();
    print("Video oynatılmaya hazır!");
  }
  
  @override
  void kaydet() {
    print("Video render ediliyor...");
    print("$fps FPS ile işleniyor...");
    super.kaydet();
    print("Metadata yazılıyor...");
    print("Video kaydedildi!");
  }
  
  @override
  String bilgiVer() {
    return "${super.bilgiVer()}, Süre: $sureDakika dk, Codec: $codec, FPS: $fps";
  }
}

// Metin Dosyası
class MetinDosyasi extends Dosya {
  String encoding;
  int satirSayisi;
  
  MetinDosyasi(
    String dosyaAdi,
    int boyut,
    this.encoding,
    this.satirSayisi,
  ) : super(dosyaAdi, boyut);
  
  @override
  void ac() {
    print("📝 Metin editörü açılıyor...");
    print("Encoding: $encoding");
    super.ac();
    print("$satirSayisi satır yüklendi.");
  }
  
  @override
  void kaydet() {
    print("Syntax kontrol ediliyor...");
    super.kaydet();
    print("Yedek kopyası oluşturuluyor...");
    print("Metin dosyası kaydedildi!");
  }
  
  @override
  String bilgiVer() {
    return "${super.bilgiVer()}, Encoding: $encoding, Satır: $satirSayisi";
  }
}

void main() {
  print("=== DOSYA İŞLEMLERİ SİSTEMİ ===\n");
  
  ResimDosyasi resim = ResimDosyasi(
    "tatil_fotografi.jpg",
    2048000, // 2 MB
    1920,
    1080,
    "jpg",
  );
  
  VideoDosyasi video = VideoDosyasi(
    "sunum_videosu.mp4",
    52428800, // 50 MB
    5,
    "H.264",
    30,
  );
  
  MetinDosyasi metin = MetinDosyasi(
    "notlar.txt",
    4096, // 4 KB
    "UTF-8",
    150,
  );
  
  List<Dosya> dosyalar = [resim, video, metin];
  
  for (Dosya dosya in dosyalar) {
    print(dosya.bilgiVer());
    print("Boyut: ${dosya.boyutMB().toStringAsFixed(2)} MB");
    print("");
    dosya.ac();
    print("");
    dosya.kaydet();
    print("\n" + "=" * 60 + "\n");
  }
}
```

---

## Override vs Overload

### Override (Dart'ta var)

Aynı isimli metodu, child class'ta yeniden tanımlama.

```dart
class Parent {
  void yaz(String mesaj) {
    print("Parent: $mesaj");
  }
}

class Child extends Parent {
  @override
  void yaz(String mesaj) {  // OVERRIDE
    print("Child: $mesaj");
  }
}
```

### Overload (Dart'ta YOK!)

Aynı isimli ama farklı parametreli metodlar tanımlama.

```dart
// ❌ Dart'ta çalışmaz!
class Matematik {
  int topla(int a, int b) {
    return a + b;
  }
  
  double topla(double a, double b) {  // ❌ HATA! Overload yok
    return a + b;
  }
}
```

#### Dart'ta Alternatif: Optional Parameters

```dart
// ✅ Dart'ta böyle yapılır
class Matematik {
  num topla(num a, num b) {
    return a + b;
  }
}

void main() {
  Matematik m = Matematik();
  print(m.topla(5, 3));       // int
  print(m.topla(5.5, 3.2));   // double
}
```

veya Named Constructors:

```dart
class Nokta {
  double x, y;
  
  Nokta(this.x, this.y);
  
  // Named constructor
  Nokta.origin() : x = 0, y = 0;
  
  // Başka bir named constructor
  Nokta.fromPolar(double r, double theta)
    : x = r * cos(theta),
      y = r * sin(theta);
}
```

---

## En İyi Uygulamalar

### 1. Her Zaman @override Kullanın

```dart
// ✅ İyi
class Kedi extends Hayvan {
  @override
  void ses() {
    print("Miyav!");
  }
}

// ❌ Kötü - Hata yakalama şansı kaçırılır
class Kedi extends Hayvan {
  void ses() {
    print("Miyav!");
  }
}
```

### 2. super Kullanımını Düşünün

Parent class'ın mantığını tekrar kullanmak varsa:

```dart
// ✅ İyi - Parent mantığı yeniden kullanılıyor
@override
void kaydet() {
  validate(); // Child'a özgü
  super.kaydet(); // Parent'ın kaydetme mantığı
  log(); // Child'a özgü
}

// ❌ Kötü - Parent mantığı tekrarlanıyor
@override
void kaydet() {
  validate();
  // Parent'ın kaydetme kodunu kopyala-yapıştır
  log();
}
```

### 3. Liskov Substitution Principle

Child class, parent class yerine kullanılabilmeli.

```dart
// ✅ İyi
class Kare extends Sekil {
  @override
  double alanHesapla() {
    return kenar * kenar; // Mantıklı bir alan hesabı
  }
}

void alanYazdir(Sekil sekil) {
  print(sekil.alanHesapla()); // Her Sekil için çalışır
}
```

### 4. Davranışı Değiştirmeyin, Genişletin

```dart
// ✅ İyi - Davranış genişletiliyor
@override
void kullaniciEkle(String ad) {
  super.kullaniciEkle(ad);
  emailGonder(ad); // Ek davranış
}

// ❌ Kötü - Tamamen farklı davranış
@override
void kullaniciEkle(String ad) {
  kullaniciSil(ad); // Parent'ın amacına aykırı!
}
```

### 5. Dokümantasyon Ekleyin

```dart
/// Kedi için özel ses metodu.
/// 
/// Parent class'ın genel ses metodunu override eder.
/// Kedilere özgü "Miyav!" sesi çıkarır.
@override
void ses() {
  print("Miyav!");
}
```

---

## Sık Yapılan Hatalar

### 1. @override Unutmak

```dart
class Kedi extends Hayvan {
  void sesCikart() {  // ❌ Metod ismi yanlış ama fark edilmiyor
    print("Miyav!");
  }
}
```

**Çözüm:** Her zaman `@override` kullanın.

### 2. Metod İmzasını Değiştirmek

```dart
class Parent {
  void islem(int sayi) { }
}

class Child extends Parent {
  @override
  void islem(String metin) { }  // ❌ Parametre tipi farklı
}
```

**Çözüm:** İmza tamhamen aynı olmalı.

### 3. super Kullanmayı Unutmak

```dart
class Child extends Parent {
  @override
  void kaydet() {
    // Parent'ın önemli mantığı atlanıyor!
    print("Kaydedildi");
  }
}
```

**Çözüm:** Parent'ın mantığı gerekiyorsa `super` kullanın.

### 4. Static Metodu Override Etmeye Çalışmak

```dart
class Parent {
  static void metod() { }
}

class Child extends Parent {
  @override  // ❌ Static metodlar override edilemez
  static void metod() { }
}
```

**Çözüm:** Static metodlar override edilemez, instance metod kullanın.

### 5. Private Metodu Override Etmek

```dart
class Parent {
  void _privateMethod() { }
}

class Child extends Parent {
  @override
  void _privateMethod() { }  // ❌ Çalışmaz, farklı metod
}
```

**Çözüm:** Private metodlar (`_` ile başlayan) override edilemez.

---

## Özet

**Override (Geçersiz Kılma)**, kalıtımda child class'ın parent class metodlarını özelleştirmesini sağlar.

### 🎯 Temel Noktalar:

1. **Amaç**: Parent class davranışını child class için özelleştirmek
2. **@override**: Zorunlu değil ama MUTLAKA kullanılmalı
3. **Kurallar**: Aynı isim, aynı imza, aynı/alt dönüş tipi
4. **super**: Parent metodunu çağırmak için kullanılır
5. **Overload Yok**: Dart'ta method overloading yok

### ✅ Ne Zaman Kullanılmalı:

- Parent class'ın genel davranışını özelleştirmek istediğinizde
- Her child class farklı davranış sergilemeli
- Polymorphism kullanacaksanız
- Kod tekrarını önlemek için

### ⚠️ Dikkat Edilmesi Gerekenler:

- Her zaman `@override` annotation kullanın
- Metod imzasını (isim, parametreler, dönüş tipi) değiştirmeyin
- Parent class mantığı gerekiyorsa `super` kullanın
- Liskov Substitution Principle'ı ihlal etmeyin
- Static ve private metodlar override edilemez

Override'ı doğru kullandığınızda, kodunuz daha esnek, bakımı kolay ve genişletilebilir olur! 🚀

