# Inheritance (Kalıtım) - Dart

## 📚 İçindekiler
1. [Inheritance Nedir?](#inheritance-nedir)
2. [IS-A İlişkisi](#is-a-i̇lişkisi)
3. [Temel Kavramlar](#temel-kavramlar)
4. [Inheritance Nasıl Kullanılır?](#inheritance-nasıl-kullanılır)
5. [Super Anahtar Kelimesi](#super-anahtar-kelimesi)
6. [Kalıtım Türleri](#kalıtım-türleri)
7. [Gerçek Hayat Örnekleri](#gerçek-hayat-örnekleri)
8. [Inheritance vs Composition](#inheritance-vs-composition)
9. [Avantajları ve Dezavantajları](#avantajları-ve-dezavantajları)
10. [En İyi Uygulamalar](#en-iyi-uygulamalar)

---

## Inheritance Nedir?

**Inheritance (Kalıtım)**, nesne yönelimli programlamada bir sınıfın başka bir sınıfın özelliklerini ve metodlarını miras almasını sağlayan mekanizmadır. Bu sayede kod tekrarı önlenir ve hiyerarşik yapılar oluşturulur.

### Basit Tanım

Bir sınıf (child/derived/sub class), başka bir sınıftan (parent/base/super class) türetilir ve onun tüm özelliklerini ve metodlarını otomatik olarak kazanır.

```dart
// Parent Class (Ebeveyn Sınıf)
class Hayvan {
  String isim;
  
  Hayvan(this.isim);
  
  void sesCikar() {
    print("Hayvan ses çıkarıyor");
  }
}

// Child Class (Çocuk Sınıf) - Hayvan'dan türetilir
class Kedi extends Hayvan {
  Kedi(String isim) : super(isim);  // Constructor
  
  // Kediye özgü metod
  void tirmalan() {
    print("$isim tırmalıyor");
  }
}

void main() {
  Kedi kedi = Kedi("Minnoş");
  kedi.sesCikar();  // Parent class'tan gelen metod
  kedi.tirmalan();  // Kedi'ye özgü metod
}
```

---

## IS-A İlişkisi

Inheritance, **"IS-A" (Türetme/Olma)** ilişkisini temsil eder.

### IS-A vs HAS-A

| IS-A (Inheritance) | HAS-A (Composition) |
|--------------------|---------------------|
|  Türetme ilişkisi  |  Sahiplik ilişkisi  |
|  "Bir çeşididir"   |     "Sahiptir"      |
|  extends kullanır  |     Nesne içerir    |

### IS-A Örnekleri

```dart
// Kedi bir Hayvandır (Kedi IS-A Hayvan) ✅
class Kedi extends Hayvan { }

// Araba bir Araçtır (Araba IS-A Arac) ✅
class Araba extends Arac { }

// Öğrenci bir İnsandır (Ogrenci IS-A Insan) ✅
class Ogrenci extends Insan { }
```

### HAS-A Örnekleri (Composition - Ayrı Konu)

```dart
// Araba bir Motor'a SAHİPTİR (Araba HAS-A Motor)
class Araba {
  Motor motor; // Composition
}
```

---

## Temel Kavramlar

### 1. Parent Class (Ebeveyn Sınıf)

Diğer adları:
- **Base Class** (Temel Sınıf)
- **Super Class** (Üst Sınıf)

Özellikleri:
- Daha genel bir kavramı temsil eder
- Ortak özellikleri ve metodları içerir
- Türetilecek sınıftır

```dart
class Arac {  // Parent Class
  String renk;
  int yil;
  
  Arac(this.renk, this.yil);
}
```

### 2. Child Class (Çocuk Sınıf)

Diğer adları:
- **Derived Class** (Türetilmiş Sınıf)
- **Sub Class** (Alt Sınıf)

Özellikleri:
- Parent class'tan türetilir
- Parent class'ın tüm özelliklerini miras alır
- Kendine özgü özellikler ekleyebilir

```dart
class Araba extends Arac {  // Child Class
  int kapiSayisi;
  
  Araba(String renk, int yil, this.kapiSayisi) : super(renk, yil);
}
```

### 3. extends Anahtar Kelimesi

Dart'ta kalıtım için `extends` kullanılır.

```dart
class ChildClass extends ParentClass {
  // ...
}
```

---

## Inheritance Nasıl Kullanılır?

### 1. Basit Kalıtım (Single Inheritance)

```dart
// Parent Class
class Sekil {
  String renk;
  
  Sekil(this.renk);
  
  void bilgiGoster() {
    print("Renk: $renk");
  }
}

// Child Class
class Daire extends Sekil {
  double yaricap;
  
  Daire(String renk, this.yaricap) : super(renk);
  
  double alanHesapla() {
    return 3.14 * yaricap * yaricap;
  }
}

void main() {
  Daire daire = Daire("Kırmızı", 5.0);
  daire.bilgiGoster();  // Parent class metodu
  print("Alan: ${daire.alanHesapla()}");  // Child class metodu
}
```

### 2. Çok Seviyeli Kalıtım (Multi-level Inheritance)

```dart
// Seviye 1: Grandparent (Büyükbaba)
class Canli {
  void nefesAl() {
    print("Nefes alıyor");
  }
}

// Seviye 2: Parent (Baba)
class Hayvan extends Canli {
  void hareketEt() {
    print("Hareket ediyor");
  }
}

// Seviye 3: Child (Çocuk)
class Kus extends Hayvan {
  void uc() {
    print("Uçuyor");
  }
}

void main() {
  Kus kus = Kus();
  kus.nefesAl();    // Canli'dan gelir
  kus.hareketEt();  // Hayvan'dan gelir
  kus.uc();         // Kus'a aittir
}
```

### 3. Hiyerarşik Kalıtım (Hierarchical Inheritance)

Birden fazla child class, aynı parent class'tan türetilir.

```dart
// Parent Class
class Calisan {
  String ad;
  double maas;
  
  Calisan(this.ad, this.maas);
}

// Child Class 1
class Yazilimci extends Calisan {
  String programlamaDili;
  
  Yazilimci(String ad, double maas, this.programlamaDili) 
    : super(ad, maas);
}

// Child Class 2
class Muhasebeci extends Calisan {
  String sertifika;
  
  Muhasebeci(String ad, double maas, this.sertifika) 
    : super(ad, maas);
}

// Child Class 3
class Mudur extends Calisan {
  int ekipBuyuklugu;
  
  Mudur(String ad, double maas, this.ekipBuyuklugu) 
    : super(ad, maas);
}
```

### 4. Dart'ta Çoklu Kalıtım YOK!

Dart **multiple inheritance** (çoklu kalıtım) desteklemez.

```dart
// ❌ YANLIŞ - Dart'ta çalışmaz!
class UcanBalik extends Balik, Kus {  // HATA!
  // ...
}

// ✅ DOĞRU - Mixin kullanılır (Ayrı bir konu)
mixin UcabilenYetenek {
  void uc() => print("Uçuyor");
}

class UcanBalik extends Balik with UcabilenYetenek {
  // ...
}
```

---

## Super Anahtar Kelimesi

`super` anahtar kelimesi, parent class'a erişmek için kullanılır.

### 1. Parent Class Constructor'ını Çağırma

```dart
class Hayvan {
  String isim;
  int yas;
  
  Hayvan(this.isim, this.yas);
}

class Kopek extends Hayvan {
  String cins;
  
  // super ile parent constructor çağrılır
  Kopek(String isim, int yas, this.cins) : super(isim, yas);
}
```

### 2. Dart 2.17+ Super Parametreler

```dart
class Hayvan {
  String isim;
  int yas;
  
  Hayvan(this.isim, this.yas);
}

class Kopek extends Hayvan {
  String cins;
  
  // Daha kısa yazım
  Kopek(super.isim, super.yas, this.cins);
  
  // Eşdeğeri:
  // Kopek(String isim, int yas, this.cins) : super(isim, yas);
}
```

### 3. Constructor Çağrı Sırası

```dart
class A {
  A() {
    print("1. A constructor");
  }
}

class B extends A {
  B() : super() {
    print("2. B constructor");
  }
}

class C extends B {
  C() : super() {
    print("3. C constructor");
  }
}

void main() {
  C c = C();
  // Çıktı:
  // 1. A constructor
  // 2. B constructor
  // 3. C constructor
}
```

Parent class constructor'ı **HER ZAMAN** önce çalışır!

---

## Kalıtım Türleri

### 1. Single Inheritance (Tek Kalıtım)

Bir child class, tek bir parent class'tan türetilir.

```dart
class A { }
class B extends A { }
```

**Dart Destekler:** ✅

### 2. Multi-level Inheritance (Çok Seviyeli Kalıtım)

Kalıtım zincirleri oluşturulur.

```dart
class A { }
class B extends A { }
class C extends B { }
```

**Dart Destekler:** ✅

### 3. Hierarchical Inheritance (Hiyerarşik Kalıtım)

Birden fazla sınıf, aynı parent'tan türetilir.

```dart
class A { }
class B extends A { }
class C extends A { }
class D extends A { }
```

**Dart Destekler:** ✅

### 4. Multiple Inheritance (Çoklu Kalıtım)

Bir sınıf, birden fazla parent'tan türetilir.

```dart
class A { }
class B { }
class C extends A, B { }  // ❌ Dart'ta YOK!
```

**Dart Destekler:** ❌ (Mixin kullanılır)

### 5. Hybrid Inheritance (Karma Kalıtım)

Multiple + diğer türlerin kombinasyonu.

**Dart Destekler:** ❌ (Mixin ile benzer sonuçlar elde edilir)

---

## Gerçek Hayat Örnekleri

### Örnek 1: Çalışan Yönetim Sistemi

```dart
// Base Class - Tüm çalışanların ortak özellikleri
class Calisan {
  int id;
  String ad;
  String soyad;
  double temelMaas;
  
  Calisan(this.id, this.ad, this.soyad, this.temelMaas);
  
  void bilgiGoster() {
    print("$id - $ad $soyad - Maaş: $temelMaas TL");
  }
  
  double maasHesapla() {
    return temelMaas;
  }
}

// Derived Class 1 - Yazılımcı
class Yazilimci extends Calisan {
  List<String> programlamaDilleri;
  int projeSayisi;
  
  Yazilimci(
    int id,
    String ad,
    String soyad,
    double temelMaas,
    this.programlamaDilleri,
    this.projeSayisi,
  ) : super(id, ad, soyad, temelMaas);
  
  @override
  double maasHesapla() {
    // Proje bazlı prim
    double prim = projeSayisi * 1000;
    return temelMaas + prim;
  }
  
  void kodYaz() {
    print("$ad kod yazıyor...");
  }
}

// Derived Class 2 - Müdür
class Mudur extends Calisan {
  int ekipBuyuklugu;
  String departman;
  
  Mudur(
    int id,
    String ad,
    String soyad,
    double temelMaas,
    this.ekipBuyuklugu,
    this.departman,
  ) : super(id, ad, soyad, temelMaas);
  
  @override
  double maasHesapla() {
    // Ekip büyüklüğüne göre prim
    double prim = ekipBuyuklugu * 500;
    return temelMaas + prim;
  }
  
  void toplantıYap() {
    print("$ad toplantı düzenliyor...");
  }
}

// Derived Class 3 - Stajyer
class Stajyer extends Calisan {
  String universite;
  int stajSuresi; // ay cinsinden
  
  Stajyer(
    int id,
    String ad,
    String soyad,
    double temelMaas,
    this.universite,
    this.stajSuresi,
  ) : super(id, ad, soyad, temelMaas);
  
  @override
  double maasHesapla() {
    // Stajyer için sabit maaş
    return temelMaas;
  }
  
  void egitimAl() {
    print("$ad eğitim alıyor...");
  }
}

void main() {
  Yazilimci dev = Yazilimci(
    1,
    "Ahmet",
    "Yılmaz",
    15000,
    ["Dart", "Flutter", "Python"],
    3,
  );
  
  Mudur manager = Mudur(
    2,
    "Ayşe",
    "Demir",
    25000,
    10,
    "Yazılım",
  );
  
  Stajyer intern = Stajyer(
    3,
    "Mehmet",
    "Kaya",
    5000,
    "İTÜ",
    6,
  );
  
  print("=== ÇALIŞAN BİLGİLERİ ===");
  dev.bilgiGoster();
  print("Toplam Maaş: ${dev.maasHesapla()} TL");
  dev.kodYaz();
  
  print("\n");
  manager.bilgiGoster();
  print("Toplam Maaş: ${manager.maasHesapla()} TL");
  manager.toplantıYap();
  
  print("\n");
  intern.bilgiGoster();
  print("Toplam Maaş: ${intern.maasHesapla()} TL");
  intern.egitimAl();
}
```

### Örnek 2: Banka Hesap Sistemi

```dart
// Base Class
class BankaHesabi {
  String hesapNo;
  String sahip;
  double bakiye;
  
  BankaHesabi(this.hesapNo, this.sahip, this.bakiye);
  
  void paraYatir(double miktar) {
    bakiye += miktar;
    print("$miktar TL yatırıldı. Yeni bakiye: $bakiye TL");
  }
  
  void paraCek(double miktar) {
    if (bakiye >= miktar) {
      bakiye -= miktar;
      print("$miktar TL çekildi. Kalan bakiye: $bakiye TL");
    } else {
      print("Yetersiz bakiye!");
    }
  }
  
  void bakiyeGoster() {
    print("Hesap: $hesapNo | Sahip: $sahip | Bakiye: $bakiye TL");
  }
}

// Derived Class 1 - Vadesiz Hesap
class VadesizHesap extends BankaHesabi {
  double islemUcreti = 2.0;
  
  VadesizHesap(String hesapNo, String sahip, double bakiye)
      : super(hesapNo, sahip, bakiye);
  
  @override
  void paraCek(double miktar) {
    double toplamTutar = miktar + islemUcreti;
    if (bakiye >= toplamTutar) {
      bakiye -= toplamTutar;
      print("$miktar TL + $islemUcreti TL işlem ücreti çekildi.");
      print("Kalan bakiye: $bakiye TL");
    } else {
      print("Yetersiz bakiye! (İşlem ücreti dahil)");
    }
  }
}

// Derived Class 2 - Vadeli Hesap
class VadeliHesap extends BankaHesabi {
  int vadeSuresi; // ay
  double faizOrani;
  DateTime acilisTarihi;
  
  VadeliHesap(
    String hesapNo,
    String sahip,
    double bakiye,
    this.vadeSuresi,
    this.faizOrani,
  )   : acilisTarihi = DateTime.now(),
        super(hesapNo, sahip, bakiye);
  
  @override
  void paraCek(double miktar) {
    DateTime simdi = DateTime.now();
    int gecenAy = simdi.difference(acilisTarihi).inDays ~/ 30;
    
    if (gecenAy < vadeSuresi) {
      print("Vade dolmadan para çekilemez!");
      print("Kalan süre: ${vadeSuresi - gecenAy} ay");
    } else {
      double faiz = bakiye * faizOrani / 100;
      bakiye += faiz;
      print("Vade doldu! Faiz eklendi: $faiz TL");
      super.paraCek(miktar);
    }
  }
  
  double vadeSonuBakiye() {
    double faiz = bakiye * faizOrani / 100;
    return bakiye + faiz;
  }
}

// Derived Class 3 - Kredi Hesabı
class KrediHesabi extends BankaHesabi {
  double krediLimiti;
  double kullanilanKredi = 0;
  
  KrediHesabi(String hesapNo, String sahip, this.krediLimiti)
      : super(hesapNo, sahip, 0);
  
  void krediKullan(double miktar) {
    if (kullanilanKredi + miktar <= krediLimiti) {
      kullanilanKredi += miktar;
      print("$miktar TL kredi kullanıldı.");
      print("Kullanılan: $kullanilanKredi TL / Limit: $krediLimiti TL");
    } else {
      print("Kredi limiti aşıldı!");
    }
  }
  
  void krediOde(double miktar) {
    if (miktar <= kullanilanKredi) {
      kullanilanKredi -= miktar;
      print("$miktar TL kredi ödendi. Kalan borç: $kullanilanKredi TL");
    } else {
      print("Borcunuzdan fazla ödeme yapamazsınız!");
    }
  }
  
  @override
  void bakiyeGoster() {
    print("Hesap: $hesapNo | Sahip: $sahip");
    print("Kredi Limiti: $krediLimiti TL");
    print("Kullanılan: $kullanilanKredi TL");
    print("Kullanılabilir: ${krediLimiti - kullanilanKredi} TL");
  }
}

void main() {
  print("=== BANKA HESAP SİSTEMİ ===\n");
  
  VadesizHesap vadesiz = VadesizHesap("TR001", "Ali Veli", 1000);
  vadesiz.bakiyeGoster();
  vadesiz.paraYatir(500);
  vadesiz.paraCek(200);
  
  print("\n" + "=" * 50 + "\n");
  
  VadeliHesap vadeli = VadeliHesap("TR002", "Ayşe Yılmaz", 10000, 12, 15);
  vadeli.bakiyeGoster();
  print("Vade sonu tahmini bakiye: ${vadeli.vadeSonuBakiye()} TL");
  vadeli.paraCek(5000); // Vade dolmadığı için çekilemez
  
  print("\n" + "=" * 50 + "\n");
  
  KrediHesabi kredi = KrediHesabi("TR003", "Mehmet Demir", 50000);
  kredi.bakiyeGoster();
  kredi.krediKullan(20000);
  kredi.krediOde(5000);
  kredi.bakiyeGoster();
}
```

### Örnek 3: Araç Kiralama Sistemi

```dart
// Base Class
class Arac {
  String plaka;
  String marka;
  String model;
  int yil;
  double gunlukUcret;
  bool kiralikMi = false;
  
  Arac(this.plaka, this.marka, this.model, this.yil, this.gunlukUcret);
  
  void bilgiGoster() {
    print("$marka $model ($yil) - Plaka: $plaka");
    print("Günlük Ücret: $gunlukUcret TL");
    print("Durum: ${kiralikMi ? 'Kiralık' : 'Müsait'}");
  }
  
  double kiralamaUcretiHesapla(int gun) {
    return gunlukUcret * gun;
  }
  
  void kirala() {
    if (!kiralikMi) {
      kiralikMi = true;
      print("$plaka plakalı araç kiralandı.");
    } else {
      print("Bu araç zaten kiralanmış!");
    }
  }
  
  void teslimAl() {
    if (kiralikMi) {
      kiralikMi = false;
      print("$plaka plakalı araç teslim alındı.");
    }
  }
}

// Derived Class 1 - Otomobil
class Otomobil extends Arac {
  int kapiSayisi;
  String yakitTipi;
  bool bagajVarMi;
  
  Otomobil(
    String plaka,
    String marka,
    String model,
    int yil,
    double gunlukUcret,
    this.kapiSayisi,
    this.yakitTipi,
    this.bagajVarMi,
  ) : super(plaka, marka, model, yil, gunlukUcret);
  
  @override
  double kiralamaUcretiHesapla(int gun) {
    double temelUcret = super.kiralamaUcretiHesapla(gun);
    // Bagajlı araçlara ek ücret
    if (bagajVarMi) {
      temelUcret += gun * 50;
    }
    return temelUcret;
  }
}

// Derived Class 2 - Minibüs
class Minibus extends Arac {
  int yolcuKapasitesi;
  bool klimaVarMi;
  
  Minibus(
    String plaka,
    String marka,
    String model,
    int yil,
    double gunlukUcret,
    this.yolcuKapasitesi,
    this.klimaVarMi,
  ) : super(plaka, marka, model, yil, gunlukUcret);
  
  @override
  double kiralamaUcretiHesapla(int gun) {
    double temelUcret = super.kiralamaUcretiHesapla(gun);
    // Yolcu kapasitesine göre ek ücret
    temelUcret += (yolcuKapasitesi - 8) * 20 * gun;
    // Klimaya ek ücret
    if (klimaVarMi) {
      temelUcret += gun * 30;
    }
    return temelUcret;
  }
}

// Derived Class 3 - Kamyonet
class Kamyonet extends Arac {
  double yukKapasitesi; // ton
  bool acikKasaMi;
  
  Kamyonet(
    String plaka,
    String marka,
    String model,
    int yil,
    double gunlukUcret,
    this.yukKapasitesi,
    this.acikKasaMi,
  ) : super(plaka, marka, model, yil, gunlukUcret);
  
  @override
  double kiralamaUcretiHesapla(int gun) {
    double temelUcret = super.kiralamaUcretiHesapla(gun);
    // Yük kapasitesine göre ek ücret
    temelUcret += yukKapasitesi * 100 * gun;
    // Kapalı kasaya ek ücret
    if (!acikKasaMi) {
      temelUcret += gun * 100;
    }
    return temelUcret;
  }
}

void main() {
  print("=== ARAÇ KİRALAMA SİSTEMİ ===\n");
  
  Otomobil oto = Otomobil(
    "34 ABC 123",
    "Toyota",
    "Corolla",
    2023,
    500,
    4,
    "Benzin",
    true,
  );
  
  Minibus minibus = Minibus(
    "06 XYZ 789",
    "Mercedes",
    "Sprinter",
    2022,
    800,
    15,
    true,
  );
  
  Kamyonet kamyonet = Kamyonet(
    "16 DEF 456",
    "Ford",
    "Transit",
    2021,
    600,
    2.5,
    false,
  );
  
  print("--- Otomobil ---");
  oto.bilgiGoster();
  print("7 günlük kiralama: ${oto.kiralamaUcretiHesapla(7)} TL");
  oto.kirala();
  
  print("\n--- Minibüs ---");
  minibus.bilgiGoster();
  print("3 günlük kiralama: ${minibus.kiralamaUcretiHesapla(3)} TL");
  
  print("\n--- Kamyonet ---");
  kamyonet.bilgiGoster();
  print("5 günlük kiralama: ${kamyonet.kiralamaUcretiHesapla(5)} TL");
}
```

---

## Inheritance vs Composition

### Ne Zaman Inheritance?

✅ **Gerçek bir "IS-A" ilişkisi varsa**

```dart
// Köpek bir Hayvandır ✅
class Kopek extends Hayvan { }
```

✅ **Sınıflar arasında doğal hiyerarşi varsa**

```dart
// Canlı → Hayvan → Memeli → Köpek
class Canli { }
class Hayvan extends Canli { }
class Memeli extends Hayvan { }
class Kopek extends Memeli { }
```

✅ **Ortak davranışları paylaşan sınıflar varsa**

```dart
class Calisan {
  void calis() { }
}

class Yazilimci extends Calisan { }
class Mudur extends Calisan { }
```

### Ne Zaman Composition?

✅ **"HAS-A" ilişkisi varsa**

```dart
// Araba bir Motor'a SAHİPTİR ✅
class Araba {
  Motor motor;
}
```

✅ **Daha esnek yapı istiyorsanız**

✅ **Çoklu davranış birleştirmek istiyorsanız**

### Karşılaştırma

| Özellik | Inheritance | Composition |
|---------|------------|-------------|
| İlişki | IS-A | HAS-A |
| Bağımlılık | Sıkı | Gevşek |
| Esneklik | Daha az | Daha fazla |
| Test | Zor | Kolay |
| Değiştirme | Zor | Kolay |

### Genel Kural

> **"Favor Composition Over Inheritance"**
> 
> Eğer ikisi arasında kararsızsan, genellikle Composition tercih edilir.

---

## Avantajları ve Dezavantajları

### ✅ Avantajları

#### 1. Kod Tekrarını Önler (DRY - Don't Repeat Yourself)

```dart
// ❌ Inheritance olmadan
class Kopek {
  String isim;
  int yas;
  void yemekYe() { }
  void hareketEt() { }
  void havla() { }
}

class Kedi {
  String isim;
  int yas;
  void yemekYe() { } // TEKRAR!
  void hareketEt() { } // TEKRAR!
  void miyavla() { }
}

// ✅ Inheritance ile
class Hayvan {
  String isim;
  int yas;
  void yemekYe() { }
  void hareketEt() { }
}

class Kopek extends Hayvan {
  void havla() { }
}

class Kedi extends Hayvan {
  void miyavla() { }
}
```

#### 2. Kod Bakımı Kolaylaşır

Ortak özellikler parent class'ta olduğu için tek yerden değiştirilir.

```dart
class Hayvan {
  void yemekYe() {
    print("Hayvan yemek yiyor"); // Burası değişince
  }
}

class Kopek extends Hayvan { }
class Kedi extends Hayvan { }
// Tüm child class'lar etkilenir
```

#### 3. Hiyerarşik Yapı Sağlar

Gerçek dünyayı daha iyi modeller.

```dart
Canli
  ├── Hayvan
  │     ├── Memeli
  │     │     ├── Kopek
  │     │     └── Kedi
  │     └── Kus
  │           ├── Kartal
  │           └── Guvercinümran
  └── Bitki
        ├── Agac
        └── Cicek
```

#### 4. Kodun Yeniden Kullanılabilirliği Artar

Parent class bir kere yazılır, birçok yerde kullanılır.

### ❌ Dezavantajları

#### 1. Sıkı Bağımlılık (Tight Coupling)

Child class, parent class'a sıkı sıkıya bağlıdır.

```dart
class Hayvan {
  void nefesAl() { }
}

class Balik extends Hayvan {
  // Balıklar solungaçla nefes alır ama parent class akciğer varsayıyor
  // Problem!
}
```

#### 2. Karmaşıklık Artabilir

Derin kalıtım zincirleri anlaşılmayı zorlaştırır.

```dart
// Çok derin kalıtım - Kötü!
class A { }
class B extends A { }
class C extends B { }
class D extends C { }
class E extends D { }
class F extends E { }
// F nedir? Nereden ne miras almış? 🤔
```

#### 3. "Fragile Base Class" Problemi

Parent class'taki değişiklikler, tüm child class'ları etkiler.

```dart
class Parent {
  void metod1() { }
}

class Child extends Parent { }

// Parent'ı değiştirdik
class Parent {
  void metod1(int parametre) { } // Parametre eklendi
}

// Child sınıfı BOZULDU! 💥
```

#### 4. Dart'ta Çoklu Kalıtım Yok

Tek bir parent class'tan türetilebilir.

---

## En İyi Uygulamalar

### 1. Liskov Substitution Principle (LSP)

Child class nesneleri, parent class yerine kullanılabilmeli.

```dart
class Sekil {
  double alanHesapla() => 0;
}

class Kare extends Sekil {
  double kenar;
  Kare(this.kenar);
  
  @override
  double alanHesapla() => kenar * kenar;
}

void alanYazdir(Sekil sekil) {
  print("Alan: ${sekil.alanHesapla()}");
}

void main() {
  Sekil sekil = Sekil();
  Sekil kare = Kare(5); // Kare, Sekil yerine kullanılabilir
  
  alanYazdir(sekil);
  alanYazdir(kare); // Çalışır ✅
}
```

### 2. Derin Kalıtımdan Kaçının

Maximum 3-4 seviye kalıtım kullanın.

```dart
// ❌ Çok derin
class A { }
class B extends A { }
class C extends B { }
class D extends C { }
class E extends D { }

// ✅ Daha iyi
class A { }
class B extends A { }
class C extends B { }
```

### 3. Parent Class İyi Tasarlanmalı

Parent class genel olmalı, child class'lar özelleşmeli.

```dart
// ✅ İyi tasarım
class Arac {          // Genel
  void hareketEt() { }
}

class Araba extends Arac {   // Özel
  void surKlakson() { }
}

// ❌ Kötü tasarım
class Toyota {        // Çok özel
  void hareketEt() { }
}

class Corolla extends Toyota { // Daha da özel
  // ...
}
```

### 4. Constructor'ları Düzgün Çağırın

Her zaman parent constructor'ı çağırın.

```dart
class Parent {
  String isim;
  Parent(this.isim);
}

class Child extends Parent {
  int yas;
  
  // ✅ Doğru
  Child(String isim, this.yas) : super(isim);
  
  // ❌ Yanlış - Parent constructor çağrılmadı
  // Child(this.yas);
}
```

### 5. Abstract Class Kullanımı

Ortak arayüz için abstract class kullanın.

```dart
abstract class Hayvan {
  void sesCikar(); // Alt sınıflar implement etmeli
  
  void yemekYe() {  // Ortak davranış
    print("Hayvan yemek yiyor");
  }
}

class Kopek extends Hayvan {
  @override
  void sesCikar() {
    print("Hav hav!");
  }
}
```

---

## Özet

**Inheritance (Kalıtım)**, nesne yönelimli programlamanın temel taşlarından biridir.

### 🎯 Temel Noktalar:

1. **IS-A İlişkisi**: Türetme ilişkisini temsil eder
2. **extends Kullanımı**: Dart'ta kalıtım için kullanılır
3. **super Anahtar Kelimesi**: Parent class'a erişim sağlar
4. **Kod Tekrarını Önler**: Ortak özellikler merkezi yerden yönetilir
5. **Hiyerarşik Yapı**: Gerçek dünyayı modellemede faydalıdır

### ✅ Ne Zaman Kullanılmalı:

- Gerçek bir "IS-A" ilişkisi varsa
- Sınıflar arasında doğal hiyerarşi varsa
- Ortak davranışları paylaşan sınıflar varsa
- Polymorphism gerektiğinde

### ⚠️ Dikkat Edilmesi Gerekenler:

- Çok derin kalıtımdan kaçının (max 3-4 seviye)
- Dart çoklu kalıtımı desteklemez (mixin kullanın)
- Parent class değişiklikleri child'ları etkiler
- Mümkünse Composition'ı tercih edin ("Favor Composition Over Inheritance")

Inheritance'ı doğru kullandığınızda, kodunuz daha temiz, daha organize ve daha bakımı kolay hale gelir! 🚀

