# 🚗 Dart Nesne Tabanlı Programlama - Araba Analojisi

## 📚 İçindekiler
1. [Nesne Tabanlı Programlama Nedir?](#nesne-tabanlı-programlama-nedir)
2. [Temel Kavramlar](#temel-kavramlar)
3. [Class (Sınıf) Nedir?](#class-sınıf-nedir)
4. [Object (Nesne) Nedir?](#object-nesne-nedir)
5. [Araba Analojisi ile Öğrenme](#araba-analojisi-ile-öğrenme)
6. [Properties (Özellikler)](#properties-özellikler)
7. [Methods (Metodlar)](#methods-metodlar)
8. [Constructor (Kurucu)](#constructor-kurucu)
9. [Pratik Örnekler](#pratik-örnekler)
10. [Sık Yapılan Hatalar](#sık-yapılan-hatalar)
11. [Best Practices](#best-practices)

---

## 🎯 Nesne Tabanlı Programlama Nedir?

**Nesne Tabanlı Programlama (Object-Oriented Programming - OOP)**, gerçek dünya nesnelerini yazılımda modelleme yaklaşımıdır.

### 🌍 Gerçek Dünya Analojisi

Gerçek hayatta etrafımızda birçok nesne vardır:
- 🚗 Arabalar
- 📱 Telefonlar
- 🏠 Evler
- 👤 İnsanlar

Her nesnenin:
- **Özellikleri** (Properties) vardır: Renk, boyut, ağırlık vb.
- **Davranışları** (Methods) vardır: Hareket etme, çalışma, konuşma vb.

OOP, bu mantığı programlamaya taşır.

---

## 🔑 Temel Kavramlar

### 1. Class (Sınıf) - Şablon/Taslak
Class, bir nesnenin **taslağıdır** veya **şablonudur**.

**Analoji:** 
- Bir arabanın tasarım planı
- Bir evin mimari projesi
- Bir telefonun üretim şeması

```dart
// Class tanımı - bu bir şablondur
class Araba {
  String marka;
  int hiz;
  String renk;
}
```

### 2. Object (Nesne) - Somut Örnek
Object, class'tan üretilen **gerçek, kullanılabilir örnektir**.

**Analoji:**
- Tasarım planından üretilen gerçek araba
- Projeden inşa edilen gerçek ev
- Şemadan üretilen gerçek telefon

```dart
// Class'tan nesne oluşturma
var bmw = Araba();        // bmw bir nesnedir
var mercedes = Araba();   // mercedes başka bir nesnedir
var audi = Araba();       // audi başka bir nesnedir
```

### 3. Instance (Örnek)
Object ve Instance aynı anlamdadır. Bir class'tan oluşturulan her nesneye "instance" denir.

---

## 🏗️ Class (Sınıf) Nedir?

Class, nesnelerin **blueprint'i** (taslağı) dır. İki ana bileşeni vardır:

### 1. Properties (Özellikler) - Veri
Nesnenin sahip olduğu bilgilerdir.

### 2. Methods (Metodlar) - Davranış
Nesnenin yapabildiği işlemlerdir.

### Syntax (Sözdizimi)

```dart
class SinifAdi {
  // Properties (Özellikler)
  TipAdi ozellik1;
  TipAdi ozellik2;
  
  // Methods (Metodlar)
  void metodAdi() {
    // İşlemler
  }
}
```

---

## 🚗 Araba Analojisi ile Öğrenme

### Neden Araba Analojisi?

Araba, OOP kavramlarını anlamak için **mükemmel bir örnektir** çünkü:

1. ✅ Herkes arabayı bilir
2. ✅ Özellikleri açıktır (renk, marka, hız)
3. ✅ Davranışları bellidir (çalıştır, durdur, hızlan)
4. ✅ Birden fazla araba olabilir (farklı nesneler)

### 🏭 Araba Fabrikası Metaforu

```
┌─────────────────────────┐
│   ARABA CLASS'I         │  ← Tasarım Planı (Blueprint)
│   ─────────────         │
│   Özellikler:           │
│   - Marka               │
│   - Renk                │
│   - Hız                 │
│                         │
│   Metodlar:             │
│   - çalıştır()          │
│   - durdur()            │
│   - hızlan()            │
└─────────────────────────┘
            │
            │ new Araba()
            │
     ┌──────┴──────┬──────────┬──────────┐
     │             │          │          │
┌────▼───┐   ┌────▼───┐ ┌────▼───┐ ┌────▼───┐
│  BMW   │   │Mercedes│ │  Audi  │ │ Toyota │
│ Kırmızı│   │ Siyah  │ │ Beyaz  │ │  Mavi  │
│ 120 km │   │ 150 km │ │ 100 km │ │  80 km │
└────────┘   └────────┘ └────────┘ └────────┘
    ↑            ↑           ↑          ↑
  Nesne       Nesne      Nesne      Nesne
```

Her araba:
- Aynı **şablondan** (class) üretilmiştir
- **Kendi değerlerine** sahiptir
- **Bağımsız** çalışır
- **Aynı metodları** kullanabilir

---

## 📊 Properties (Özellikler)

Properties, bir nesnenin **verilerini** saklar.

### Özellik Türleri

```dart
class Araba {
  // String (Metin) tipinde özellik
  late String marka;
  late String renk;
  
  // int (Tam Sayı) tipinde özellik
  late int hiz;
  late int motor;
  
  // bool (Doğru/Yanlış) tipinde özellik
  late bool isRunning;
  
  // double (Ondalıklı Sayı) tipinde özellik
  late double yakit;
}
```

### `late` Anahtar Kelimesi

**Ne işe yarar?**
- Dart'a "Bu değişken daha sonra değer alacak" der
- Null safety (null güvenliği) için kullanılır

**Ne zaman kullanılır?**
- Değişken tanımlanırken değer verilmeyecekse
- Değer daha sonra (genellikle constructor dışında) atanacaksa

```dart
// ❌ HATA: Değer atanmamış
class Araba {
  String marka;  // ERROR: Başlangıç değeri yok
}

// ✅ DOĞRU: late kullanımı
class Araba {
  late String marka;  // Daha sonra değer alacak
}

// ✅ DOĞRU: Başlangıç değeri verme
class Araba {
  String marka = "Bilinmiyor";  // Varsayılan değer
}

// ✅ DOĞRU: Nullable yapma
class Araba {
  String? marka;  // null olabilir
}
```

### Özelliklere Erişim

```dart
var bmw = Araba();

// Değer atama (set)
bmw.marka = "BMW";
bmw.hiz = 120;

// Değer okuma (get)
print(bmw.marka);  // Output: BMW
print(bmw.hiz);    // Output: 120
```

---

## ⚙️ Methods (Metodlar)

Methods, bir nesnenin **yapabildiği işlemlerdir**.

### Method Syntax

```dart
class Araba {
  late String marka;
  late int hiz;
  late bool isRunning;
  
  // Void method (değer döndürmeyen)
  void calistir() {
    isRunning = true;
    print("Araba çalıştırıldı");
  }
  
  // Return method (değer döndüren)
  int hizGetir() {
    return hiz;
  }
  
  // Parametreli method
  void hizlan(int artis) {
    hiz += artis;
  }
}
```

### Method Türleri

#### 1. Void Methods (Değer Döndürmeyen)
```dart
void bilgileriGoster() {
  print("Marka: $marka");
  print("Hız: $hiz");
}
```

#### 2. Return Methods (Değer Döndüren)
```dart
String durumGetir() {
  if (isRunning) {
    return "Çalışıyor";
  } else {
    return "Kapalı";
  }
}

// Kullanım
String durum = araba.durumGetir();
print(durum);  // Output: Çalışıyor
```

#### 3. Parametreli Methods
```dart
void hizlan(int artis) {
  hiz += artis;
}

// Kullanım
araba.hizlan(50);  // Hızı 50 artır
```

#### 4. Çoklu Parametreli Methods
```dart
void ayarla(String yeniMarka, String yeniRenk, int yeniMotor) {
  marka = yeniMarka;
  renk = yeniRenk;
  motor = yeniMotor;
}

// Kullanım
araba.ayarla("BMW", "Kırmızı", 3000);
```

### Method İsimlendirme Kuralları

✅ **DOĞRU:**
```dart
void calistir()
void hizlan()
void bilgileriGoster()
void durumKontrolEt()
```

❌ **YANLIŞ:**
```dart
void Calistir()        // Büyük harfle başlamaz
void hizlan_araba()    // Alt çizgi kullanma (camelCase kullan)
void x()               // Anlamlı isim kullan
```

---

## 🏗️ Constructor (Kurucu)

Constructor, **nesne oluşturulurken otomatik çalışan** özel bir metoddur.

### Neden Constructor Kullanırız?

- ✅ Özelliklere **başlangıç değeri** atamak için
- ✅ Nesne oluşturmayı **kolaylaştırmak** için
- ✅ **Zorunlu parametreler** belirlemek için
- ✅ **Validasyon** (doğrulama) yapmak için

### 1. Default Constructor

```dart
class Araba {
  late String marka;
  late int hiz;
  
  // Constructor
  Araba() {
    marka = "Bilinmiyor";
    hiz = 0;
  }
}

// Kullanım
var araba = Araba();  // marka="Bilinmiyor", hiz=0
```

### 2. Parametreli Constructor

```dart
class Araba {
  String marka;
  int hiz;
  
  // Parametreli constructor
  Araba(this.marka, this.hiz);
}

// Kullanım
var bmw = Araba("BMW", 120);
```

**`this` Anahtar Kelimesi:**
- `this.marka` = Bu sınıfın marka özelliği
- Parametre ile özelliği ayırt eder

### 3. Named Parameters (İsimlendirilmiş Parametreler)

```dart
class Araba {
  String marka;
  String renk;
  int motor;
  
  // Named parameters
  Araba({
    required this.marka,    // Zorunlu
    required this.renk,     // Zorunlu
    this.motor = 1600,      // Opsiyonel, varsayılan değer
  });
}

// Kullanım - parametre sırası önemli değil!
var araba1 = Araba(
  marka: "BMW",
  renk: "Kırmızı",
);

var araba2 = Araba(
  renk: "Siyah",      // Sıra farklı
  marka: "Mercedes",
  motor: 3000,
);
```

**`required` Anahtar Kelimesi:**
- Parametre zorunludur
- Eksik bırakılırsa hata verir

### 4. Named Constructor

Bir class'ın **birden fazla constructor'ı** olabilir.

```dart
class Araba {
  String marka;
  String durum;
  
  // Default constructor
  Araba(this.marka, this.durum);
  
  // Named constructor - Sıfır KM
  Araba.sifirKm(this.marka) : durum = "Sıfır Kilometre" {
    print("Yeni araba üretildi!");
  }
  
  // Named constructor - İkinci El
  Araba.ikinciEl(this.marka) : durum = "İkinci El" {
    print("İkinci el araba eklendi!");
  }
}

// Kullanım
var araba1 = Araba.sifirKm("BMW");
var araba2 = Araba.ikinciEl("Mercedes");
```

### 5. Initializer List

Constructor gövdesinden **önce** değer atama:

```dart
class Araba {
  String marka;
  int hiz;
  bool isRunning;
  
  Araba(this.marka) 
    : hiz = 0,           // Önce bu çalışır
      isRunning = false  // Sonra bu çalışır
  {
    // En son constructor gövdesi çalışır
    print("$marka oluşturuldu");
  }
}
```

---

## 💡 Pratik Örnekler

### Örnek 1: Basit Araba Class'ı

```dart
class Araba {
  late String marka;
  late String renk;
  late int hiz;
}

void main() {
  // Nesne oluşturma
  var bmw = Araba();
  
  // Değer atama
  bmw.marka = "BMW";
  bmw.renk = "Kırmızı";
  bmw.hiz = 120;
  
  // Değer okuma
  print("${bmw.marka} - ${bmw.renk} - ${bmw.hiz} km/h");
}
```

**Çıktı:**
```
BMW - Kırmızı - 120 km/h
```

### Örnek 2: Metodlu Araba Class'ı

```dart
class Araba {
  late String marka;
  late int hiz;
  late bool isRunning;
  
  void calistir() {
    isRunning = true;
    hiz = 0;
    print("$marka çalıştırıldı!");
  }
  
  void hizlan(int artis) {
    if (isRunning) {
      hiz += artis;
      print("Yeni hız: $hiz km/h");
    } else {
      print("Önce arabayı çalıştırın!");
    }
  }
  
  void durdur() {
    isRunning = false;
    hiz = 0;
    print("$marka durduruldu.");
  }
}

void main() {
  var mercedes = Araba();
  mercedes.marka = "Mercedes";
  
  mercedes.calistir();     // Mercedes çalıştırıldı!
  mercedes.hizlan(50);     // Yeni hız: 50 km/h
  mercedes.hizlan(30);     // Yeni hız: 80 km/h
  mercedes.durdur();       // Mercedes durduruldu.
}
```

### Örnek 3: Constructor ile Araba

```dart
class Araba {
  String marka;
  String renk;
  int motor;
  
  // Constructor
  Araba(this.marka, this.renk, this.motor);
  
  void bilgileriGoster() {
    print("$marka | $renk | $motor cc");
  }
}

void main() {
  var araba1 = Araba("BMW", "Kırmızı", 3000);
  var araba2 = Araba("Audi", "Siyah", 2500);
  
  araba1.bilgileriGoster();  // BMW | Kırmızı | 3000 cc
  araba2.bilgileriGoster();  // Audi | Siyah | 2500 cc
}
```

### Örnek 4: Birden Fazla Nesne

```dart
void main() {
  // Aynı class'tan 3 farklı nesne
  var araba1 = Araba();
  araba1.marka = "Tesla";
  araba1.hiz = 100;
  
  var araba2 = Araba();
  araba2.marka = "Ferrari";
  araba2.hiz = 200;
  
  var araba3 = Araba();
  araba3.marka = "Toyota";
  araba3.hiz = 80;
  
  // Her nesne bağımsızdır
  print(araba1.marka);  // Tesla
  print(araba2.marka);  // Ferrari
  print(araba3.marka);  // Toyota
}
```

---

## ⚠️ Sık Yapılan Hatalar

### Hata 1: Değer Atamayı Unutmak

```dart
❌ YANLIŞ:
class Araba {
  String marka;  // ERROR: Non-nullable field must be initialized
}

✅ DOĞRU:
class Araba {
  late String marka;  // Daha sonra değer alacak
}
// VEYA
class Araba {
  String marka = "";  // Başlangıç değeri
}
// VEYA
class Araba {
  String? marka;  // Nullable
}
```

### Hata 2: this Kullanmayı Unutmak

```dart
❌ YANLIŞ:
class Araba {
  String marka;
  
  Araba(String marka) {
    marka = marka;  // Karışık! Hangisi parametre hangisi özellik?
  }
}

✅ DOĞRU:
class Araba {
  String marka;
  
  Araba(this.marka);  // Açık ve net
}
```

### Hata 3: Constructor İsmini Yanlış Yazmak

```dart
❌ YANLIŞ:
class Araba {
  String marka;
  
  araba(this.marka);  // Küçük harfle başlıyor, HATA!
}

✅ DOĞRU:
class Araba {
  String marka;
  
  Araba(this.marka);  // Class ile aynı isim
}
```

### Hata 4: Method İçinde Özelliği Unutmak

```dart
❌ YANLIŞ:
class Araba {
  late int hiz;
  
  void hizlan(int artis) {
    hiz = hiz + artis;  // Okunabilir değil
  }
}

✅ DOĞRU:
class Araba {
  late int hiz;
  
  void hizlan(int artis) {
    hiz += artis;  // Daha temiz
  }
}

✅ DAHA İYİ:
class Araba {
  late int hiz;
  
  void hizlan(int artis) {
    this.hiz += artis;  // Açık ve net (this isteğe bağlı ama açık)
  }
}
```

---

## ✨ Best Practices (En İyi Uygulamalar)

### 1. İsimlendirme Kuralları

```dart
✅ Class isimleri PascalCase:
class ArabaMotoru { }
class KullaniciProfili { }

✅ Özellik ve method isimleri camelCase:
String arabaMarkasi;
void hizlanmaYap();

✅ Anlamlı isimler kullan:
String marka;           // İYİ
String m;               // KÖTÜ

✅ Boolean'lar için is, has, can kullan:
bool isRunning;
bool hasEngine;
bool canMove;
```

### 2. Encapsulation (Kapsülleme) Hazırlığı

Şimdilik public ama ileride private yapabiliriz:

```dart
class Araba {
  // Public (herkes erişebilir)
  late String marka;
  
  // İleride private olabilir (sadece class içinden erişilir)
  // String _marka;  // Alt çizgi = private
}
```

### 3. Method Organizasyonu

```dart
class Araba {
  // 1. Önce özellikler
  late String marka;
  late int hiz;
  
  // 2. Sonra constructor
  Araba(this.marka, this.hiz);
  
  // 3. Sonra public metodlar
  void calistir() { }
  void durdur() { }
  
  // 4. En sonda private metodlar (varsa)
  void _icselIslem() { }
}
```

### 4. Validasyon (Doğrulama) Eklemek

```dart
class Araba {
  late int hiz;
  
  void hizlan(int artis) {
    // Validasyon
    if (artis < 0) {
      print("Hız artışı negatif olamaz!");
      return;
    }
    
    hiz += artis;
    
    // Maksimum kontrol
    if (hiz > 250) {
      hiz = 250;
      print("Maksimum hıza ulaşıldı!");
    }
  }
}
```

### 5. Dokümantasyon Yorumları

```dart
/// Araba sınıfı, bir aracı temsil eder.
/// 
/// Bu sınıf arabanın temel özelliklerini ve
/// davranışlarını içerir.
class Araba {
  /// Arabanın markası
  late String marka;
  
  /// Arabanın mevcut hızı (km/h)
  late int hiz;
  
  /// Arabayı çalıştırır.
  /// 
  /// Motor durumunu true yapar ve hızı sıfırlar.
  void calistir() {
    // Implementasyon
  }
}
```

---

## 🎯 Özet

### Class ve Object

```
Class = Taslak/Şablon
Object = Taslaktan üretilen gerçek örnek
```

### Temel Bileşenler

1. **Properties (Özellikler)**
   - Nesnenin verileri
   - `late`, varsayılan değer veya `?` kullan

2. **Methods (Metodlar)**
   - Nesnenin davranışları
   - void veya return type olabilir
   - Parametreli olabilir

3. **Constructor (Kurucu)**
   - Nesne oluşturulurken çalışır
   - Başlangıç değerleri atar
   - Class ile aynı isimde olmalı

### Araba Analojisi Özeti

| Gerçek Dünya | Programlama |
|--------------|-------------|
| Araba tasarım planı | Class |
| Üretilen gerçek araba | Object |
| Renk, marka, hız | Properties |
| Çalıştır, durdur, hızlan | Methods |
| Fabrikada üretim | Constructor |
| Her araba bağımsızdır | Her object bağımsızdır |

---

## 📝 Alıştırmalar

### Alıştırma 1: Telefon Class'ı
Bir `Telefon` class'ı oluşturun:
- Özellikler: marka, model, batarya
- Metodlar: ac(), kapat(), sarjEt()

### Alıştırma 2: Öğrenci Class'ı
Bir `Ogrenci` class'ı oluşturun:
- Özellikler: ad, soyad, numara, notOrtalamasi
- Metodlar: bilgileriGoster(), gectiMi()

### Alıştırma 3: Banka Hesabı
Bir `BankaHesabi` class'ı oluşturun:
- Özellikler: hesapNo, bakiye, sahipAdi
- Metodlar: paraYatir(), paraCek(), bakiyeGoster()

---

## 🔗 İleri Seviye Konular (İleride Öğrenilecek)

Bu dokümanda temel OOP kavramlarını öğrendiniz. İlerleyen konular:

1. **Inheritance (Kalıtım)** - Bir class'ın başka bir class'tan özellik alması
2. **Polymorphism (Çok Biçimlilik)** - Aynı metodun farklı davranışlar göstermesi
3. **Encapsulation (Kapsülleme)** - Verileri gizleme ve koruma
4. **Abstraction (Soyutlama)** - Karmaşıklığı gizleme
5. **Interface** - Sözleşme tanımlama
6. **Mixin** - Davranış paylaşımı
7. **Getter & Setter** - Özellik erişim kontrolü
8. **Static** - Sınıf seviyesinde özellik/metod
9. **Factory Constructor** - Özel nesne üretimi

---

## 📚 Kaynaklar

- [Dart Official Documentation](https://dart.dev/guides/language/language-tour#classes)
- [Dart OOP Tutorial](https://dart.dev/guides/language/language-tour)
- [DartPad - Online Dart Editor](https://dartpad.dev/)

---

## ✅ Kontrol Listesi

Bu konuyu anladığınızdan emin olmak için:

- [ ] Class ve Object arasındaki farkı açıklayabiliyorum
- [ ] Basit bir class tanımlayabiliyorum
- [ ] Property ekleyebiliyorum
- [ ] Method yazabiliyorum
- [ ] Constructor kullanabiliyorum
- [ ] Bir class'tan birden fazla nesne oluşturabiliyorum
- [ ] Her nesnenin bağımsız olduğunu anlıyorum
- [ ] Araba analojisini başkasına anlatabilirim

---

**🎉 Tebrikler!** Dart'ta Nesne Tabanlı Programlamanın temellerini öğrendiniz!

Şimdi `2-ArabaAnalojisi.dart` dosyasını çalıştırarak örnekleri inceleyebilirsiniz.

```bash
dart run 3-NesneTabanliProgramlama/2-ArabaAnalojisi.dart
```

