# Enumeration (Enum) - Dart

## 📚 İçindekiler
1. [Enumeration Nedir?](#enumeration-nedir)
2. [Neden Enumeration Kullanılır?](#neden-enumeration-kullanılır)
3. [Enum Nasıl Tanımlanır?](#enum-nasıl-tanımlanır)
4. [Enum Kullanım Örnekleri](#enum-kullanım-örnekleri)
5. [Enum Özellikleri ve Metotları](#enum-özellikleri-ve-metotları)
6. [Switch-Case ile Kullanımı](#switch-case-ile-kullanımı)
7. [Gelişmiş Enum Özellikleri](#gelişmiş-enum-özellikleri)
8. [Avantajları ve Dezavantajları](#avantajları-ve-dezavantajları)
9. [En İyi Uygulamalar](#en-iyi-uygulamalar)

---

## Enumeration Nedir?

**Enumeration** (kısaca **Enum**), belirli bir değer kümesini temsil eden özel bir veri tipidir. Enum'lar, programlamada sabit değerleri daha anlamlı ve tip güvenli bir şekilde kullanmamızı sağlar.

### Temel Tanım
```dart
enum Gunler {
  Pazartesi,
  Sali,
  Carsamba,
  Persembe,
  Cuma,
  Cumartesi,
  Pazar
}
```

Yukarıdaki örnekte, `Gunler` adında bir enum tanımladık ve bu enum sadece 7 gün değerini içerebilir. Başka bir değer kabul etmez.

---

## Neden Enumeration Kullanılır?

### 1. **Kodun Okunabilirliği Artar**
```dart
// ❌ Enum kullanmadan
void siparisDurumu(int durum) {
  if (durum == 1) {
    print("Sipariş hazırlanıyor");
  } else if (durum == 2) {
    print("Sipariş kargoda");
  }
}

// ✅ Enum kullanarak
enum SiparisDurumu { Hazirlaniyor, Kargoda, Teslim }

void siparisDurumu(SiparisDurumu durum) {
  switch (durum) {
    case SiparisDurumu.Hazirlaniyor:
      print("Sipariş hazırlanıyor");
      break;
    case SiparisDurumu.Kargoda:
      print("Sipariş kargoda");
      break;
    case SiparisDurumu.Teslim:
      print("Sipariş teslim edildi");
      break;
  }
}
```

### 2. **Tip Güvenliği Sağlar**
Enum kullandığınızda, sadece tanımlı değerleri kullanabilirsiniz. Bu, hata yapma olasılığını büyük ölçüde azaltır.

```dart
enum TrafikIsigi { Kirmizi, Sari, Yesil }

void isikDurumu(TrafikIsigi isik) {
  // Sadece Kirmizi, Sari veya Yesil değerleri kabul edilir
  // Başka bir değer gönderilemez
}
```

### 3. **Kod Bakımı Kolaylaşır**
Değerler merkezi bir yerde tanımlıdır, değişiklik yapmak kolaydır.

### 4. **IDE Desteği**
IDE'ler enum değerlerini otomatik tamamlama (autocomplete) ile önerir.

---

## Enum Nasıl Tanımlanır?

### Basit Enum Tanımı
```dart
enum Renkler {
  Kirmizi,
  Mavi,
  Yesil,
  Sari,
  Beyaz,
  Siyah
}
```

### Enum Kullanımı
```dart
void main() {
  // Enum değerlerine nokta notasyonu ile erişilir
  Renkler secilenRenk = Renkler.Kirmizi;
  
  print(secilenRenk); // Çıktı: Renkler.Kirmizi
  print(secilenRenk.name); // Çıktı: Kirmizi
}
```

---

## Enum Kullanım Örnekleri

### Örnek 1: Mevsimler
```dart
enum Mevsim { Ilkbahar, Yaz, Sonbahar, Kis }

void mevsimOzellikleri(Mevsim mevsim) {
  switch (mevsim) {
    case Mevsim.Ilkbahar:
      print("Çiçekler açar, hava ısınır.");
      break;
    case Mevsim.Yaz:
      print("Sıcak günler, tatil zamanı.");
      break;
    case Mevsim.Sonbahar:
      print("Yapraklar dökülür, hava serinler.");
      break;
    case Mevsim.Kis:
      print("Kar yağar, hava soğuktur.");
      break;
  }
}

void main() {
  mevsimOzellikleri(Mevsim.Yaz);
}
```

### Örnek 2: Kullanıcı Rolleri
```dart
enum KullaniciRolu { Admin, Moderator, Kullanici, Misafir }

void yetkiKontrol(KullaniciRolu rol) {
  switch (rol) {
    case KullaniciRolu.Admin:
      print("Tüm yetkilere sahipsiniz.");
      break;
    case KullaniciRolu.Moderator:
      print("Orta seviye yetkilere sahipsiniz.");
      break;
    case KullaniciRolu.Kullanici:
      print("Standart kullanıcı yetkileriniz var.");
      break;
    case KullaniciRolu.Misafir:
      print("Sınırlı erişiminiz var.");
      break;
  }
}
```

### Örnek 3: Ödeme Yöntemleri
```dart
enum OdemeYontemi { KrediKarti, BankaHavalesi, Nakit, Kripto }

void odemeYap(double tutar, OdemeYontemi yontem) {
  print("${tutar} TL ödeme yapılıyor...");
  
  switch (yontem) {
    case OdemeYontemi.KrediKarti:
      print("Kredi kartı ile ödeme işleniyor.");
      break;
    case OdemeYontemi.BankaHavalesi:
      print("Banka havalesi bekleniyor.");
      break;
    case OdemeYontemi.Nakit:
      print("Nakit ödeme alındı.");
      break;
    case OdemeYontemi.Kripto:
      print("Kripto para transferi bekleniyor.");
      break;
  }
}

void main() {
  odemeYap(500.0, OdemeYontemi.KrediKarti);
}
```

---

## Enum Özellikleri ve Metotları

### 1. `.name` Özelliği
Enum değerinin string karşılığını döndürür.

```dart
enum Hayvan { Kedi, Kopek, Kus }

void main() {
  Hayvan seciliHayvan = Hayvan.Kedi;
  print(seciliHayvan.name); // Çıktı: Kedi
}
```

### 2. `.index` Özelliği
Enum değerinin index numarasını döndürür (0'dan başlar).

```dart
enum Hayvan { Kedi, Kopek, Kus }

void main() {
  print(Hayvan.Kedi.index);  // Çıktı: 0
  print(Hayvan.Kopek.index); // Çıktı: 1
  print(Hayvan.Kus.index);   // Çıktı: 2
}
```

### 3. `.values` Özelliği
Enum'daki tüm değerleri liste olarak döndürür.

```dart
enum Hayvan { Kedi, Kopek, Kus }

void main() {
  print(Hayvan.values); // Çıktı: [Hayvan.Kedi, Hayvan.Kopek, Hayvan.Kus]
  
  // Tüm değerleri döngü ile yazdırma
  for (var hayvan in Hayvan.values) {
    print("${hayvan.name} - Index: ${hayvan.index}");
  }
}
```

### 4. Enum Değerini String'den Bulma
```dart
enum Hayvan { Kedi, Kopek, Kus }

void main() {
  String arananHayvan = "Kopek";
  
  Hayvan? bulunan = Hayvan.values.firstWhere(
    (h) => h.name == arananHayvan,
    orElse: () => Hayvan.Kedi // Varsayılan değer
  );
  
  print(bulunan); // Çıktı: Hayvan.Kopek
}
```

---

## Switch-Case ile Kullanımı

Enum'lar switch-case yapısı ile mükemmel uyum sağlar. Dart, switch-case'de tüm enum değerlerinin kontrol edilmesini önerir.

```dart
enum Notlar { AA, BA, BB, CB, CC, DC, DD, FD, FF }

String notDegerlendirmesi(Notlar not) {
  switch (not) {
    case Notlar.AA:
    case Notlar.BA:
      return "Mükemmel! Çok başarılısınız.";
    case Notlar.BB:
    case Notlar.CB:
      return "İyi! Başarılı bir performans.";
    case Notlar.CC:
    case Notlar.DC:
      return "Orta. Daha fazla çalışmalısınız.";
    case Notlar.DD:
      return "Geçer not. Ancak gelişme gerekli.";
    case Notlar.FD:
    case Notlar.FF:
      return "Kaldınız. Dersi tekrar almalısınız.";
  }
}

void main() {
  print(notDegerlendirmesi(Notlar.AA));
  print(notDegerlendirmesi(Notlar.FF));
}
```

---

## Gelişmiş Enum Özellikleri

### Dart 2.17+ Enhanced Enums (Geliştirilmiş Enum'lar)

Dart 2.17 ve sonrasında enum'lar çok daha güçlü hale geldi. Artık enum'lara özellikler (properties) ve metotlar ekleyebilirsiniz.

```dart
enum Gezegen {
  Merkur(yaricap: 2439.7, kutle: 3.303e23),
  Venus(yaricap: 6051.8, kutle: 4.867e24),
  Dunya(yaricap: 6371.0, kutle: 5.972e24),
  Mars(yaricap: 3389.5, kutle: 6.417e23),
  Jupiter(yaricap: 69911, kutle: 1.898e27),
  Saturn(yaricap: 58232, kutle: 5.683e26),
  Uranus(yaricap: 25362, kutle: 8.681e25),
  Neptun(yaricap: 24622, kutle: 1.024e26);

  const Gezegen({required this.yaricap, required this.kutle});

  final double yaricap; // km cinsinden
  final double kutle;   // kg cinsinden

  // Metot ekleme
  double yuzeyAlani() {
    return 4 * 3.14159 * yaricap * yaricap;
  }
}

void main() {
  print("Dünya'nın yarıçapı: ${Gezegen.Dunya.yaricap} km");
  print("Mars'ın kütlesi: ${Gezegen.Mars.kutle} kg");
  print("Jüpiter'in yüzey alanı: ${Gezegen.Jupiter.yuzeyAlani()} km²");
}
```

### Enum'larda Constructor Kullanımı

```dart
enum KahveBoyutu {
  Kucuk(fiyat: 15, ml: 200),
  Orta(fiyat: 20, ml: 350),
  Buyuk(fiyat: 25, ml: 500);

  const KahveBoyutu({required this.fiyat, required this.ml});

  final int fiyat;
  final int ml;

  // Getter metot
  String get bilgi => "$name: $ml ml - $fiyat TL";
  
  // Normal metot
  bool ekonomikMi() => ml / fiyat > 15;
}

void main() {
  print(KahveBoyutu.Orta.bilgi);
  print("Büyük boy ekonomik mi? ${KahveBoyutu.Buyuk.ekonomikMi()}");
  
  // Tüm boyutları listele
  for (var boyut in KahveBoyutu.values) {
    print(boyut.bilgi);
  }
}
```

### Enum'larda Interface ve Mixin Kullanımı

```dart
mixin FiyatHesaplama {
  int get fiyat;
  
  double kdvliFiyat() => fiyat * 1.18;
  double indirimli(double oran) => fiyat * (1 - oran);
}

enum Urun with FiyatHesaplama {
  Telefon(fiyat: 10000),
  Bilgisayar(fiyat: 15000),
  Tablet(fiyat: 5000);

  const Urun({required this.fiyat});

  @override
  final int fiyat;
}

void main() {
  print("Telefon KDV'li fiyat: ${Urun.Telefon.kdvliFiyat()} TL");
  print("Bilgisayar %20 indirimli: ${Urun.Bilgisayar.indirimli(0.20)} TL");
}
```

---

## Avantajları ve Dezavantajları

### ✅ Avantajları

1. **Tip Güvenliği**: Yanlış değer atanmasını engeller
2. **Kod Okunabilirliği**: Kodun anlaşılması kolaylaşır
3. **Bakım Kolaylığı**: Merkezi tanım, değişiklikleri kolaylaştırır
4. **IDE Desteği**: Otomatik tamamlama ve hata kontrolü
5. **Dokümantasyon**: Enum adı ve değerleri kendi kendini belgeler
6. **Switch-Case Uyumu**: Eksik case kontrolü yapar
7. **Refactoring Güvenliği**: Değişiklikler tüm projeye yansır

### ❌ Dezavantajları

1. **Sınırlı Esneklik**: Sadece tanımlı değerler kullanılabilir
2. **Veritabanı Entegrasyonu**: String/int dönüşümleri gerekebilir
3. **Dinamik Değerler**: Runtime'da yeni değer eklenemez

---

## En İyi Uygulamalar

### 1. Anlamlı İsimler Kullanın
```dart
// ❌ Kötü
enum S { A, B, C }

// ✅ İyi
enum SiparisDurumu { Onayda, Hazirlaniyor, Kargoda, TeslimEdildi }
```

### 2. PascalCase Kullanın
```dart
// ✅ Enum adı PascalCase
enum KullaniciTipi { Admin, Kullanici, Misafir }

// ✅ Enum değerleri de PascalCase
enum Renk { KoyuKirmizi, AcikMavi, MatSiyah }
```

### 3. Switch-Case'de Tüm Durumları Kontrol Edin
```dart
enum Durum { Aktif, Pasif, Beklemede }

void durumKontrol(Durum durum) {
  switch (durum) {
    case Durum.Aktif:
      print("Aktif");
      break;
    case Durum.Pasif:
      print("Pasif");
      break;
    case Durum.Beklemede:
      print("Beklemede");
      break;
    // Tüm durumlar kontrol edildi
  }
}
```

### 4. Karmaşık Durumlar İçin Enhanced Enum Kullanın
```dart
enum HttpDurum {
  Basarili(kod: 200, mesaj: "OK"),
  OlusturulduŞ(kod: 201, mesaj: "Created"),
  BulunamadiŞ(kod: 404, mesaj: "Not Found"),
  SunucuHatasi(kod: 500, mesaj: "Internal Server Error");

  const HttpDurum({required this.kod, required this.mesaj});

  final int kod;
  final String mesaj;
}
```

### 5. Enum'ları Ayrı Dosyalarda Tanımlayın
Büyük projelerde enum'ları ayrı dosyalarda tutun:
```
lib/
  enums/
    kullanici_tipi.dart
    siparis_durumu.dart
    odeme_yontemi.dart
```

### 6. Dokümantasyon Ekleyin
```dart
/// Kullanıcının sistemdeki rolünü belirtir
enum KullaniciRolu {
  /// Tüm yetkilere sahip yönetici
  Admin,
  
  /// İçerik yönetimi yapabilen moderatör
  Moderator,
  
  /// Standart kullanıcı
  Kullanici
}
```

---

## Özet

Enumeration (Enum), Dart programlamada sabit değer kümelerini temsil etmek için kullanılan güçlü bir araçtır. Kodun okunabilirliğini artırır, tip güvenliği sağlar ve hata yapma olasılığını azaltır.

**Temel Özellikler:**
- Sabit değer kümeleri için kullanılır
- Tip güvenliği sağlar
- Switch-case ile mükemmel uyum sağlar
- `.name`, `.index`, `.values` özellikleri vardır
- Dart 2.17+ ile properties ve metotlar eklenebilir

**Ne Zaman Kullanılmalı:**
- Sabit, sınırlı değer kümeleri olduğunda
- Durum yönetimi gerektiğinde
- Tip güvenliği önemli olduğunda
- Kod okunabilirliği artırılmak istendiğinde

Enumeration'ları doğru kullandığınızda, kodunuz daha temiz, daha güvenli ve daha bakımı kolay hale gelir! 🚀

