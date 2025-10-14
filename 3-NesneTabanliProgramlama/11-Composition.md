# Composition (Bileşim) - Dart

## 📚 İçindekiler
1. [Composition Nedir?](#composition-nedir)
2. [Composition vs Inheritance](#composition-vs-inheritance)
3. [Has-A İlişkisi](#has-a-i̇lişkisi)
4. [Composition Nasıl Uygulanır?](#composition-nasıl-uygulanır)
5. [Gerçek Hayat Örnekleri](#gerçek-hayat-örnekleri)
6. [Composition Türleri](#composition-türleri)
7. [Avantajları ve Dezavantajları](#avantajları-ve-dezavantajları)
8. [Composition vs Aggregation](#composition-vs-aggregation)
9. [En İyi Uygulamalar](#en-iyi-uygulamalar)
10. [Karmaşık Composition Örnekleri](#karmaşık-composition-örnekleri)

---

## Composition Nedir?

**Composition (Bileşim)**, nesne yönelimli programlamada bir sınıfın başka sınıfların örneklerini içermesi durumudur. Bu, **"Has-A" (Sahip Olma)** ilişkisini temsil eder.

### Basit Tanım
Bir araba motordan, tekerleklerden ve direksiyondan **oluşur** (composed of). Bu bir composition ilişkisidir.

```dart
class Motor {
  String tip;
  int guc;
  
  Motor(this.tip, this.guc);
}

class Araba {
  String marka;
  Motor motor; // COMPOSITION: Araba bir Motor'a sahiptir
  
  Araba(this.marka, this.motor);
}

void main() {
  Motor motor = Motor("Benzinli", 150);
  Araba araba = Araba("Toyota", motor);
}
```

### Temel Mantık
- **Inheritance (Kalıtım)**: "IS-A" ilişkisi → Köpek bir Hayvandır (Dog IS-A Animal)
- **Composition (Bileşim)**: "HAS-A" ilişkisi → Araba bir Motor'a sahiptir (Car HAS-A Engine)

---

## Composition vs Inheritance

### Inheritance (Kalıtım)
```dart
// IS-A ilişkisi
class Hayvan {
  void yemekYe() => print("Hayvan yemek yiyor");
}

class Kedi extends Hayvan {
  void miyavla() => print("Miyav!");
}
// Kedi bir Hayvandır (Kedi IS-A Hayvan)
```

### Composition (Bileşim)
```dart
// HAS-A ilişkisi
class Beyin {
  void dusun() => print("Düşünüyor...");
}

class Insan {
  Beyin beyin; // Insan bir Beyin'e sahiptir
  
  Insan(this.beyin);
  
  void dusun() => beyin.dusun();
}
// İnsan bir Beyin'e sahiptir (Insan HAS-A Beyin)
```

### Karşılaştırma Tablosu

| Özellik | Inheritance | Composition |
|---------|------------|-------------|
| İlişki Tipi | IS-A (Türetme) | HAS-A (Sahiplik) |
| Bağımlılık | Sıkı bağımlılık | Gevşek bağımlılık |
| Esneklik | Daha az esnek | Daha esnek |
| Yeniden Kullanım | Sınırlı | Yüksek |
| Test Edilebilirlik | Zor | Kolay |
| Karmaşıklık | Artar | Azalır |
| Değiştirilebilirlik | Zor | Kolay |

### Ne Zaman Hangisi?

#### Inheritance Kullan:
- Gerçek bir "is-a" ilişkisi varsa
- Ortak davranışları paylaşan sınıflar için
- Polymorphism gerektiğinde

```dart
class Sekil {
  void ciz() {}
}

class Daire extends Sekil {
  @override
  void ciz() => print("Daire çiziliyor");
}
// Daire bir Şekildir - DOĞRU
```

#### Composition Kullan:
- "has-a" ilişkisi varsa
- Daha esnek tasarım istediğinizde
- Çoklu davranış birleştirmek istediğinizde
- Kod tekrarını önlemek için

```dart
class Tekerlek {}
class Motor {}

class Araba {
  Tekerlek tekerlek;
  Motor motor;
  // Araba tekerlek ve motora SAHİPTİR - DOĞRU
}
```

---

## Has-A İlişkisi

Has-A ilişkisi, bir nesnenin başka nesnelere sahip olduğunu ifade eder.

### Temel Örnekler

```dart
// Ev bir Kapı'ya sahiptir
class Kapi {
  String renk;
  String malzeme;
  
  Kapi(this.renk, this.malzeme);
}

class Ev {
  String adres;
  Kapi kapi; // HAS-A: Ev bir Kapı'ya sahiptir
  
  Ev(this.adres, this.kapi);
}
```

```dart
// Bilgisayar bir İşlemci'ye sahiptir
class Islemci {
  String marka;
  int cekirdekSayisi;
  
  Islemci(this.marka, this.cekirdekSayisi);
}

class Bilgisayar {
  Islemci islemci; // HAS-A: Bilgisayar bir İşlemci'ye sahiptir
  
  Bilgisayar(this.islemci);
}
```

### Çoklu Has-A İlişkileri

Bir sınıf birden fazla başka sınıfa sahip olabilir:

```dart
class Koltuk {
  String malzeme;
  Koltuk(this.malzeme);
}

class Direksiyon {
  String tip;
  Direksiyon(this.tip);
}

class Motor {
  int guc;
  Motor(this.guc);
}

class Araba {
  Koltuk koltuk;       // HAS-A
  Direksiyon direksiyon; // HAS-A
  Motor motor;         // HAS-A
  
  Araba(this.koltuk, this.direksiyon, this.motor);
}
```

---

## Composition Nasıl Uygulanır?

### 1. Basit Composition

```dart
class Pil {
  int seviye = 100;
  
  void kullan() {
    if (seviye > 0) {
      seviye -= 10;
      print("Pil seviyesi: $seviye%");
    }
  }
}

class Telefon {
  String marka;
  Pil pil; // Composition
  
  Telefon(this.marka, this.pil);
  
  void kullan() {
    print("$marka telefon kullanılıyor");
    pil.kullan();
  }
}

void main() {
  Pil pil = Pil();
  Telefon telefon = Telefon("iPhone", pil);
  
  telefon.kullan();
  telefon.kullan();
}
```

### 2. Constructor İçinde Nesne Oluşturma

```dart
class Kamera {
  int megapiksel;
  
  Kamera(this.megapiksel);
  
  void fotoCek() => print("$megapiksel MP fotoğraf çekildi");
}

class Telefon {
  String marka;
  Kamera kamera;
  
  // Constructor içinde composition
  Telefon(this.marka, int megapiksel) 
    : kamera = Kamera(megapiksel);
  
  void fotoCek() => kamera.fotoCek();
}

void main() {
  Telefon telefon = Telefon("Samsung", 48);
  telefon.fotoCek();
}
```

### 3. Nullable Composition

```dart
class GPS {
  String konum = "İstanbul";
  
  String konumAl() => konum;
}

class Telefon {
  String marka;
  GPS? gps; // Nullable - telefonda GPS olmayabilir
  
  Telefon(this.marka, [this.gps]);
  
  void konumGoster() {
    if (gps != null) {
      print("Konum: ${gps!.konumAl()}");
    } else {
      print("GPS bulunmuyor");
    }
  }
}

void main() {
  Telefon telefon1 = Telefon("Nokia"); // GPS'siz
  Telefon telefon2 = Telefon("iPhone", GPS()); // GPS'li
  
  telefon1.konumGoster(); // GPS bulunmuyor
  telefon2.konumGoster(); // Konum: İstanbul
}
```

### 4. Liste ile Composition

```dart
class Ogrenci {
  String ad;
  int no;
  
  Ogrenci(this.ad, this.no);
}

class Sinif {
  String sinifAdi;
  List<Ogrenci> ogrenciler; // Composition: Liste olarak
  
  Sinif(this.sinifAdi, this.ogrenciler);
  
  void ogrencileriListele() {
    print("$sinifAdi sınıfındaki öğrenciler:");
    for (var ogrenci in ogrenciler) {
      print("${ogrenci.no} - ${ogrenci.ad}");
    }
  }
  
  void ogrenciEkle(Ogrenci ogrenci) {
    ogrenciler.add(ogrenci);
  }
}

void main() {
  Sinif sinif = Sinif("10-A", [
    Ogrenci("Ali", 1),
    Ogrenci("Ayşe", 2),
  ]);
  
  sinif.ogrencileriListele();
  sinif.ogrenciEkle(Ogrenci("Mehmet", 3));
  sinif.ogrencileriListele();
}
```

---

## Gerçek Hayat Örnekleri

### Örnek 1: E-Ticaret Sistemi

```dart
class Adres {
  String il;
  String ilce;
  String detay;
  
  Adres(this.il, this.ilce, this.detay);
  
  @override
  String toString() => "$detay, $ilce/$il";
}

class KrediKarti {
  String kartNo;
  String sonKullanma;
  
  KrediKarti(this.kartNo, this.sonKullanma);
  
  bool odemeYap(double tutar) {
    print("$tutar TL ödeme yapıldı (Kart: ${kartNo.substring(0, 4)}...)");
    return true;
  }
}

class Urun {
  String ad;
  double fiyat;
  
  Urun(this.ad, this.fiyat);
}

class SepetItem {
  Urun urun;
  int adet;
  
  SepetItem(this.urun, this.adet);
  
  double toplamFiyat() => urun.fiyat * adet;
}

class Sepet {
  List<SepetItem> items = [];
  
  void urunEkle(Urun urun, int adet) {
    items.add(SepetItem(urun, adet));
  }
  
  double toplam() {
    double toplam = 0;
    for (var item in items) {
      toplam += item.toplamFiyat();
    }
    return toplam;
  }
}

class Musteri {
  String ad;
  String email;
  Adres adres;           // Composition
  KrediKarti? krediKarti; // Composition (nullable)
  Sepet sepet;           // Composition
  
  Musteri(this.ad, this.email, this.adres) 
    : sepet = Sepet();
  
  void kartEkle(KrediKarti kart) {
    krediKarti = kart;
  }
  
  void alisverisYap() {
    if (krediKarti == null) {
      print("Lütfen kredi kartı ekleyin!");
      return;
    }
    
    double tutar = sepet.toplam();
    print("\n=== ALIŞVERİŞ ÖZETİ ===");
    print("Müşteri: $ad");
    print("Adres: $adres");
    print("Toplam: $tutar TL");
    
    if (krediKarti!.odemeYap(tutar)) {
      print("Sipariş başarıyla tamamlandı!");
    }
  }
}

void main() {
  // Adres oluştur
  Adres adres = Adres("İstanbul", "Kadıköy", "Moda Mahallesi No:15");
  
  // Müşteri oluştur
  Musteri musteri = Musteri("Ahmet Yılmaz", "ahmet@email.com", adres);
  
  // Kredi kartı ekle
  musteri.kartEkle(KrediKarti("1234567890123456", "12/25"));
  
  // Ürünleri sepete ekle
  musteri.sepet.urunEkle(Urun("Laptop", 15000), 1);
  musteri.sepet.urunEkle(Urun("Mouse", 200), 2);
  musteri.sepet.urunEkle(Urun("Klavye", 500), 1);
  
  // Alışverişi tamamla
  musteri.alisverisYap();
}
```

### Örnek 2: Oyun Karakteri

```dart
class Silah {
  String ad;
  int hasar;
  int mermi;
  
  Silah(this.ad, this.hasar, this.mermi);
  
  void ates() {
    if (mermi > 0) {
      mermi--;
      print("$ad ile ateş edildi! Hasar: $hasar (Kalan mermi: $mermi)");
    } else {
      print("Mermi bitti!");
    }
  }
}

class Zirh {
  String tip;
  int dayaniklilik;
  
  Zirh(this.tip, this.dayaniklilik);
  
  int hasariAzalt(int hasar) {
    int azaltilan = (hasar * dayaniklilik / 100).round();
    return hasar - azaltilan;
  }
}

class Can {
  int maksimum;
  int mevcut;
  
  Can(this.maksimum) : mevcut = maksimum;
  
  void hasarAl(int hasar) {
    mevcut -= hasar;
    if (mevcut < 0) mevcut = 0;
    print("Can: $mevcut/$maksimum");
  }
  
  void iyiles(int miktar) {
    mevcut += miktar;
    if (mevcut > maksimum) mevcut = maksimum;
    print("İyileşti! Can: $mevcut/$maksimum");
  }
  
  bool hayattaMi() => mevcut > 0;
}

class Karakter {
  String ad;
  Can can;           // Composition
  Silah? silah;      // Composition (nullable)
  Zirh? zirh;        // Composition (nullable)
  
  Karakter(this.ad, int maxCan) : can = Can(maxCan);
  
  void silahKusanSilahKusan(Silah yeniSilah) {
    silah = yeniSilah;
    print("$ad $yeniSilah.ad kuşandı!");
  }
  
  void zirhGiy(Zirh yeniZirh) {
    zirh = yeniZirh;
    print("$ad $yeniZirh.tip giydi!");
  }
  
  void saldir() {
    if (silah == null) {
      print("$ad silahsız!");
      return;
    }
    silah!.ates();
  }
  
  void hasarAl(int hasar) {
    int gercekHasar = hasar;
    
    if (zirh != null) {
      gercekHasar = zirh!.hasariAzalt(hasar);
      print("Zırh $hasar hasarı $gercekHasar'a düşürdü!");
    }
    
    can.hasarAl(gercekHasar);
    
    if (!can.hayattaMi()) {
      print("$ad öldü!");
    }
  }
}

void main() {
  // Karakter oluştur
  Karakter oyuncu = Karakter("Savaşçı", 100);
  
  // Silah ve zırh kuşan
  oyuncu.silahKusanSilahKusan(Silah("Kılıç", 25, 10));
  oyuncu.zirhGiy(Zirh("Demir Zırh", 30));
  
  // Saldır
  oyuncu.saldir();
  oyuncu.saldir();
  
  // Hasar al
  oyuncu.hasarAl(50);
  oyuncu.hasarAl(30);
}
```

### Örnek 3: Şirket Yönetim Sistemi

```dart
class Departman {
  String ad;
  String konum;
  List<String> gorevler;
  
  Departman(this.ad, this.konum, this.gorevler);
  
  void bilgiYazdir() {
    print("Departman: $ad");
    print("Konum: $konum");
    print("Görevler: ${gorevler.join(', ')}");
  }
}

class Maas {
  double temelMaas;
  double prim;
  double kesintiler;
  
  Maas(this.temelMaas, {this.prim = 0, this.kesintiler = 0});
  
  double netMaas() => temelMaas + prim - kesintiler;
  
  void bilgiYazdir() {
    print("Temel Maaş: $temelMaas TL");
    print("Prim: $prim TL");
    print("Kesintiler: $kesintiler TL");
    print("Net Maaş: ${netMaas()} TL");
  }
}

class IletisimBilgisi {
  String email;
  String telefon;
  String? dahili;
  
  IletisimBilgisi(this.email, this.telefon, [this.dahili]);
  
  void bilgiYazdir() {
    print("Email: $email");
    print("Telefon: $telefon");
    if (dahili != null) print("Dahili: $dahili");
  }
}

class Calisan {
  int id;
  String ad;
  String soyad;
  Departman departman;         // Composition
  Maas maas;                   // Composition
  IletisimBilgisi iletisim;    // Composition
  
  Calisan(
    this.id,
    this.ad,
    this.soyad,
    this.departman,
    this.maas,
    this.iletisim,
  );
  
  String get tamAd => "$ad $soyad";
  
  void profilYazdir() {
    print("\n" + "=" * 50);
    print("ÇALIŞAN PROFİLİ");
    print("=" * 50);
    print("ID: $id");
    print("Ad Soyad: $tamAd");
    print("\n--- Departman Bilgileri ---");
    departman.bilgiYazdir();
    print("\n--- Maaş Bilgileri ---");
    maas.bilgiYazdir();
    print("\n--- İletişim Bilgileri ---");
    iletisim.bilgiYazdir();
    print("=" * 50);
  }
  
  void zamYap(double yuzde) {
    double eskiMaas = maas.netMaas();
    maas.temelMaas += maas.temelMaas * yuzde / 100;
    double yeniMaas = maas.netMaas();
    print("$tamAd'ın maaşına %$yuzde zam yapıldı!");
    print("Eski maaş: $eskiMaas TL → Yeni maaş: $yeniMaas TL");
  }
  
  void primVer(double miktar) {
    maas.prim += miktar;
    print("$tamAd'a $miktar TL prim verildi!");
  }
}

void main() {
  // Departman oluştur
  Departman yazilim = Departman(
    "Yazılım Geliştirme",
    "İstanbul Ofis - 3. Kat",
    ["Kod geliştirme", "Test", "Dokümantasyon"]
  );
  
  // Maaş bilgisi oluştur
  Maas maas = Maas(15000, prim: 2000, kesintiler: 1500);
  
  // İletişim bilgisi oluştur
  IletisimBilgisi iletisim = IletisimBilgisi(
    "mehmet.yilmaz@sirket.com",
    "0532 123 45 67",
    "1234"
  );
  
  // Çalışan oluştur (Composition ile tüm bilgiler bir araya gelir)
  Calisan calisan = Calisan(
    1001,
    "Mehmet",
    "Yılmaz",
    yazilim,
    maas,
    iletisim,
  );
  
  // Profil yazdır
  calisan.profilYazdir();
  
  // İşlemler yap
  print("\n");
  calisan.zamYap(10);
  calisan.primVer(1000);
  
  print("\n");
  calisan.profilYazdir();
}
```

---

## Composition Türleri

### 1. Strong Composition (Güçlü Bileşim)

Bileşen nesne, ana nesnenin bir parçasıdır ve ondan bağımsız yaşayamaz.

```dart
class Kalp {
  void at() => print("Kalp atıyor");
}

class Insan {
  final Kalp kalp = Kalp(); // Constructor içinde oluşturuluyor
  
  Insan() {
    print("İnsan doğdu, kalbi atmaya başladı");
  }
}

void main() {
  Insan insan = Insan();
  // Kalp nesnesi İnsan ile birlikte yaratıldı
  // İnsan yok olunca kalp de yok olur
}
```

### 2. Weak Composition (Zayıf Bileşim / Aggregation)

Bileşen nesne, ana nesneden bağımsız olarak yaşayabilir.

```dart
class Ogrenci {
  String ad;
  Ogrenci(this.ad);
}

class Sinif {
  List<Ogrenci> ogrenciler;
  
  Sinif(this.ogrenciler); // Dışarıdan alınıyor
}

void main() {
  Ogrenci ogrenci1 = Ogrenci("Ali");
  Ogrenci ogrenci2 = Ogrenci("Ayşe");
  
  Sinif sinif = Sinif([ogrenci1, ogrenci2]);
  // Sınıf yok olsa da öğrenciler hala var
}
```

### 3. Multiple Composition (Çoklu Bileşim)

Bir sınıf birden fazla sınıfı içerir.

```dart
class Ekran {
  String boyut;
  Ekran(this.boyut);
}

class Klavye {
  String tip;
  Klavye(this.tip);
}

class Touchpad {
  bool aktif = true;
  Touchpad();
}

class Laptop {
  Ekran ekran;       // Composition 1
  Klavye klavye;     // Composition 2
  Touchpad touchpad; // Composition 3
  
  Laptop(this.ekran, this.klavye, this.touchpad);
}
```

---

## Avantajları ve Dezavantajları

### ✅ Avantajları

#### 1. Esneklik ve Modülerlik
```dart
// Motor değiştirilebilir
class Araba {
  Motor motor;
  
  void motorDegistir(Motor yeniMotor) {
    motor = yeniMotor;
  }
}
```

#### 2. Kod Tekrarını Önler
```dart
// Adres sınıfı birçok yerde kullanılabilir
class Adres { /* ... */ }

class Musteri {
  Adres adres; // Yeniden kullanım
}

class Sirket {
  Adres adres; // Yeniden kullanım
}

class Depo {
  Adres adres; // Yeniden kullanım
}
```

#### 3. Test Edilebilirlik
```dart
// Mock nesneler ile test kolay
class VeriTabani {
  void kaydet() => print("Veritabanına kaydedildi");
}

class Kullanici {
  VeriTabani db;
  
  Kullanici(this.db); // Dependency Injection
  
  void kaydet() => db.kaydet();
}

// Test sırasında mock DB kullanılabilir
void main() {
  var mockDB = MockVeriTabani();
  var kullanici = Kullanici(mockDB);
}
```

#### 4. Gevşek Bağımlılık (Loose Coupling)
```dart
// Sınıflar birbirinden bağımsız
class Logger {
  void log(String mesaj) => print("[LOG] $mesaj");
}

class Servis {
  Logger logger;
  
  Servis(this.logger);
  
  void islem() {
    logger.log("İşlem başladı");
    // ...
    logger.log("İşlem bitti");
  }
}
```

#### 5. Çoklu Davranış Birleştirme
```dart
// Inheritance'da tek ebeveyn sınıf
// Composition'da istediğin kadar sınıf
class UcanYetenek {
  void uc() => print("Uçuyor");
}

class YuzenYetenek {
  void yuz() => print("Yüzüyor");
}

class Supe class SuperKahraman {
  UcanYetenek ucma;
  YuzenYetenek yuzme;
  
  SuperKahraman(this.ucma, this.yuzme);
}
```

### ❌ Dezavantajları

#### 1. Daha Fazla Kod
```dart
// Inheritance
class Araba extends Tasit {
  void sur() => super.hareketEt();
}

// Composition (daha fazla kod)
class Araba {
  Tasit tasit;
  
  Araba(this.tasit);
  
  void sur() => tasit.hareketEt();
}
```

#### 2. Karmaşıklık Artabilir
```dart
// Çok fazla composition karmaşık hale gelebilir
class Sistem {
  ModulA modulA;
  ModulB modulB;
  ModulC modulC;
  ModulD modulD;
  // ...
}
```

#### 3. Nesne Zinciri Uzayabilir
```dart
// Uzun nesne zincirleri
kullanici.sirket.adres.sehir.ulke.kita.ad
```

---

## Composition vs Aggregation

### Composition (Güçlü İlişki)
- Parça, bütünün bir parçasıdır
- Bütün yok olunca, parça da yok olur
- Yaşam döngüsü bağımlıdır

```dart
class Kalp {
  void at() => print("Kalp atıyor");
}

class Insan {
  final Kalp _kalp = Kalp(); // İnsan oluşunca kalp de oluşur
  
  void yasam() => _kalp.at();
}
// İnsan öldüğünde kalp de yok olur - COMPOSITION
```

### Aggregation (Zayıf İlişki)
- Parça, bütünden bağımsız yaşayabilir
- Bütün yok olsa da parça yaşar
- Yaşam döngüsü bağımsızdır

```dart
class Ogrenci {
  String ad;
  Ogrenci(this.ad);
}

class Universite {
  List<Ogrenci> ogrenciler;
  
  Universite(this.ogrenciler); // Öğrenciler dışarıdan gelir
}
// Üniversite kapansa da öğrenciler var olmaya devam eder - AGGREGATION
```

### Karşılaştırma

```dart
// COMPOSITION: Motor arabanın bir parçası
class Araba {
  final Motor _motor = Motor(); // Araba ile birlikte yaratılır
}

// AGGREGATION: Sürücü arabadan bağımsız
class Araba {
  Surucu? surucu; // Dışarıdan atanır, arabadan bağımsız
  
  void surucuAta(Surucu s) => surucu = s;
  void surucuCikar() => surucu = null;
}
```

---

## En İyi Uygulamalar

### 1. "Favor Composition Over Inheritance" Prensibi

```dart
// ❌ Kötü: Inheritance ile
class UcanAraba extends Araba, Ucak { // Dart multiple inheritance desteklemez!
  // Problem!
}

// ✅ İyi: Composition ile
class UcanAraba {
  Araba araba;
  Ucak ucak;
  
  UcanAraba(this.araba, this.ucak);
  
  void sur() => araba.sur();
  void uc() => ucak.uc();
}
```

### 2. Dependency Injection Kullan

```dart
// ✅ İyi: Bağımlılıkları dışarıdan al
class Servis {
  final VeriTabani db;
  final Logger logger;
  
  Servis(this.db, this.logger); // Constructor injection
}

// ❌ Kötü: İçeride oluşturma
class Servis {
  final VeriTabani db = VeriTabani(); // Sıkı bağımlılık
}
```

### 3. Interface/Abstract Class Kullan

```dart
abstract class VeriTabani {
  void kaydet(String veri);
}

class MySQLDB implements VeriTabani {
  @override
  void kaydet(String veri) => print("MySQL'e kaydedildi");
}

class MongoDBDB implements VeriTabani {
  @override
  void kaydet(String veri) => print("MongoDB'ye kaydedildi");
}

class Servis {
  VeriTabani db; // Interface kullan, implementation değil
  
  Servis(this.db);
}

void main() {
  // İstediğin implementasyonu kullan
  Servis servis1 = Servis(MySQLDB());
  Servis servis2 = Servis(MongoDBDB());
}
```

### 4. Null Safety Kullan

```dart
class Telefon {
  GPS? gps; // Opsiyonel bileşen
  
  void konumAl() {
    // Null check
    if (gps != null) {
      print(gps!.konum);
    }
    
    // Ya da null-aware operator
    gps?.konumAl();
  }
}
```

### 5. Immutability Tercih Et

```dart
class Motor {
  final String tip;
  final int guc;
  
  const Motor(this.tip, this.guc); // Immutable
}

class Araba {
  final String marka;
  final Motor motor;
  
  const Araba(this.marka, this.motor); // Immutable
}
```

### 6. Single Responsibility Principle

```dart
// ✅ Her sınıf tek bir sorumluluğa sahip
class Adres {
  // Sadece adres bilgisi
}

class Telefon {
  // Sadece telefon bilgisi
}

class Musteri {
  Adres adres;
  Telefon telefon;
  // Müşteri bilgileri
}
```

---

## Karmaşık Composition Örnekleri

### Örnek: Sosyal Medya Uygulaması

```dart
class Kullanici {
  String kullaniciAdi;
  String email;
  
  Kullanici(this.kullaniciAdi, this.email);
}

class Yorum {
  Kullanici yazar;
  String icerik;
  DateTime tarih;
  
  Yorum(this.yazar, this.icerik) : tarih = DateTime.now();
  
  void goster() {
    print("${yazar.kullaniciAdi}: $icerik (${tarih.day}/${tarih.month}/${tarih.year})");
  }
}

class Begeni {
  Kullanici kullanici;
  DateTime tarih;
  
  Begeni(this.kullanici) : tarih = DateTime.now();
}

class Gorselist {
  String url;
  String aciklama;
  
  Gorsel(this.url, this.aciklama);
}

class Gonderi {
  Kullanici yazar;
  String icerik;
  DateTime tarih;
  List<Gorsel> gorseller;      // Composition: Görseller
  List<Begeni> begeniler;      // Composition: Beğeniler
  List<Yorum> yorumlar;        // Composition: Yorumlar
  
  Gonderi(this.yazar, this.icerik, [List<Gorsel>? gorseller])
    : tarih = DateTime.now(),
      gorseller = gorseller ?? [],
      begeniler = [],
      yorumlar = [];
  
  void gorselEkle(Gorsel gorsel) {
    gorseller.add(gorsel);
  }
  
  void begen(Kullanici kullanici) {
    // Daha önce beğenmiş mi kontrol et
    bool zatenBegenmis = begeniler.any((b) => b.kullanici == kullanici);
    
    if (!zatenBegenmis) {
      begeniler.add(Begeni(kullanici));
      print("${kullanici.kullaniciAdi} gönderiyi beğendi!");
    } else {
      print("${kullanici.kullaniciAdi} zaten beğenmiş!");
    }
  }
  
  void yorumYap(Kullanici kullanici, String icerik) {
    yorumlar.add(Yorum(kullanici, icerik));
    print("${kullanici.kullaniciAdi} yorum yaptı!");
  }
  
  void goster() {
    print("\n" + "=" * 60);
    print("Yazan: ${yazar.kullaniciAdi} (${tarih.day}/${tarih.month}/${tarih.year})");
    print("-" * 60);
    print(icerik);
    
    if (gorseller.isNotEmpty) {
      print("\n📷 Görseller:");
      for (var gorsel in gorseller) {
        print("  - ${gorsel.url} (${gorsel.aciklama})");
      }
    }
    
    print("\n👍 ${begeniler.length} beğeni");
    print("💬 ${yorumlar.length} yorum");
    
    if (yorumlar.isNotEmpty) {
      print("\n--- Yorumlar ---");
      for (var yorum in yorumlar) {
        yorum.goster();
      }
    }
    print("=" * 60);
  }
}

void main() {
  // Kullanıcılar oluştur
  Kullanici ahmet = Kullanici("ahmetyilmaz", "ahmet@email.com");
  Kullanici ayse = Kullanici("aysedemir", "ayse@email.com");
  Kullanici mehmet = Kullanici("mehmetkaya", "mehmet@email.com");
  
  // Gönderi oluştur
  Gonderi gonderi = Gonderi(
    ahmet,
    "Bugün harika bir gün geçirdim! 🌞"
  );
  
  // Görseller ekle
  gonderi.gorselEkle(Gorsel("foto1.jpg", "Sabah kahvaltısı"));
  gonderi.gorselEkle(Gorsel("foto2.jpg", "Gün batımı"));
  
  // Beğeniler
  gonderi.begen(ayse);
  gonderi.begen(mehmet);
  gonderi.begen(ayse); // Tekrar beğeni denemesi
  
  // Yorumlar
  gonderi.yorumYap(ayse, "Çok güzel! 😍");
  gonderi.yorumYap(mehmet, "Harika görünüyor! 👏");
  gonderi.yorumYap(ahmet, "Teşekkürler arkadaşlar! 🙏");
  
  // Gönderiyi göster
  gonderi.goster();
}
```

---

## Özet

**Composition (Bileşim)**, nesne yönelimli programlamanın en güçlü ve esnek tasarım prensiplerindendir.

### 🎯 Temel Noktalar:

1. **Has-A İlişkisi**: Bir nesne başka nesnelere sahiptir
2. **Inheritance'tan Farklı**: IS-A değil, HAS-A
3. **Esneklik**: Runtime'da değiştirilebilir
4. **Modülerlik**: Bağımsız sınıflar, yeniden kullanılabilir
5. **Test Edilebilirlik**: Mock nesneler ile kolay test

### ✅ Ne Zaman Kullanılmalı:

- "Has-a" ilişkisi olduğunda
- Çoklu davranış gerektiğinde
- Esnek tasarım istediğinizde
- Kod tekrarını önlemek için
- Test edilebilir kod yazmak için

### 📌 Unutma:

> **"Favor Composition Over Inheritance"**
> 
> Mümkün olduğunca kalıtım yerine bileşimi tercih et!

Composition'ı doğru kullandığınızda, kodunuz daha temiz, daha esnek ve daha bakımı kolay hale gelir! 🚀

