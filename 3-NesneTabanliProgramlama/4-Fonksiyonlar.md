# 🔧 Dart Fonksiyonlar (Functions) - Kapsamlı Rehber

## 📚 İçindekiler
1. [Fonksiyon Nedir?](#fonksiyon-nedir)
2. [Fonksiyon Türleri](#fonksiyon-türleri)
3. [Void Fonksiyonlar](#void-fonksiyonlar)
4. [Return Fonksiyonlar](#return-fonksiyonlar)
5. [Parametreli Fonksiyonlar](#parametreli-fonksiyonlar)
6. [Optional Parameters (Opsiyonel Parametreler)](#optional-parameters)
7. [Named Parameters (İsimli Parametreler)](#named-parameters)
8. [Arrow Functions (Ok Fonksiyonları)](#arrow-functions)
9. [Anonymous Functions (Anonim Fonksiyonlar)](#anonymous-functions)
10. [Higher-Order Functions](#higher-order-functions)
11. [Recursive Functions (Özyinelemeli)](#recursive-functions)
12. [Best Practices](#best-practices)
13. [Sık Yapılan Hatalar](#sık-yapılan-hatalar)

---

## 🤔 Fonksiyon Nedir?

### Tanım

**Fonksiyon**, belirli bir görevi yerine getirmek için yazılmış **yeniden kullanılabilir kod bloklarıdır**.

### Gerçek Hayat Analojisi

Fonksiyonları bir makine gibi düşünün:

```
┌─────────────────────────────────┐
│      📦 FONKSİYON MAKİNESİ      │
│                                 │
│   Girdi (Input)                 │
│      ↓                          │
│   [İşlem/Mantık]                │
│      ↓                          │
│   Çıktı (Output)                │
└─────────────────────────────────┘
```

**Örnek:** Kahve Makinesi
```
Girdi: Su + Kahve + Şeker
İşlem: Karıştır + Isıt
Çıktı: Hazır Kahve ☕
```

**Kod Olarak:**
```dart
String kahveYap(String su, String kahve, int seker) {
  // İşlem
  return "☕ Hazır Kahve ($seker şeker)";
}
```

### Neden Fonksiyon Kullanırız?

#### ❌ Fonksiyonsuz Kod (Kötü)

```dart
void main() {
  // Aynı kodu 3 kez yazdık!
  print("Merhaba Ahmet!");
  print("Nasılsın?");
  print("─────────────");
  
  print("Merhaba Mehmet!");
  print("Nasılsın?");
  print("─────────────");
  
  print("Merhaba Ayşe!");
  print("Nasılsın?");
  print("─────────────");
}
```

#### ✅ Fonksiyonlu Kod (İyi)

```dart
void selamla(String isim) {
  print("Merhaba $isim!");
  print("Nasılsın?");
  print("─────────────");
}

void main() {
  selamla("Ahmet");
  selamla("Mehmet");
  selamla("Ayşe");
}
```

### Fonksiyon Avantajları

| Avantaj | Açıklama |
|---------|----------|
| 🔄 **Yeniden Kullanılabilirlik** | Aynı kod tekrar tekrar kullanılır |
| 📖 **Okunabilirlik** | Kod daha anlaşılır ve düzenli |
| 🔧 **Bakım Kolaylığı** | Değişiklik tek yerden yapılır |
| 🧪 **Test Edilebilirlik** | Her fonksiyon ayrı test edilir |
| 🎯 **Modülerlik** | Kod küçük parçalara bölünür |
| 🐛 **Hata Azaltma** | Tek bir yerde düzeltme yapılır |

---

## 🎯 Fonksiyon Türleri

Dart'ta fonksiyonlar çeşitli şekillerde kategorize edilebilir:

```
DART FONKSİYON TÜRLERİ
│
├─ 1. Dönüş Tipine Göre
│  ├─ Void Fonksiyonlar (değer döndürmez)
│  └─ Return Fonksiyonlar (değer döndürür)
│
├─ 2. Parametre Tipine Göre
│  ├─ Parametresiz
│  ├─ Positional Parameters
│  ├─ Named Parameters
│  └─ Optional Parameters
│
├─ 3. Tanım Şekline Göre
│  ├─ Normal Fonksiyonlar
│  ├─ Arrow Functions (=>)
│  └─ Anonymous Functions
│
└─ 4. İşlev Türüne Göre
   ├─ Pure Functions
   ├─ Higher-Order Functions
   └─ Recursive Functions
```

---

## 🚫 Void Fonksiyonlar

### Tanım

**Void fonksiyonlar**, değer döndürmeyen fonksiyonlardır. Sadece bir işlem yaparlar.

### Syntax

```dart
void fonksiyonAdi() {
  // İşlemler
  // return yok!
}
```

### Örnekler

#### Örnek 1: Basit Mesaj Yazdırma

```dart
void selamVer() {
  print("Merhaba Dünya!");
}

void main() {
  selamVer();  // Output: Merhaba Dünya!
}
```

#### Örnek 2: Birden Fazla İşlem

```dart
void raporYazdir() {
  print("═══════════════════════");
  print("     GÜNLÜK RAPOR      ");
  print("═══════════════════════");
  print("Tarih: 2024-10-12");
  print("Durum: Başarılı");
  print("═══════════════════════");
}

void main() {
  raporYazdir();
}
```

#### Örnek 3: Parametreli Void Fonksiyon

```dart
void kullaniciyaSelamVer(String isim, int yas) {
  print("Merhaba $isim!");
  print("Yaşınız: $yas");
  print("Hoş geldiniz!");
}

void main() {
  kullaniciyaSelamVer("Ahmet", 25);
  // Output:
  // Merhaba Ahmet!
  // Yaşınız: 25
  // Hoş geldiniz!
}
```

#### Örnek 4: Yan Etki (Side Effect) Fonksiyonları

```dart
List<String> gorevler = [];

void gorevEkle(String gorev) {
  gorevler.add(gorev);
  print("✓ Görev eklendi: $gorev");
}

void gorevleriListele() {
  print("\n📋 Görev Listesi:");
  for (int i = 0; i < gorevler.length; i++) {
    print("${i + 1}. ${gorevler[i]}");
  }
}

void main() {
  gorevEkle("Alışveriş yap");
  gorevEkle("Ders çalış");
  gorevEkle("Spor yap");
  gorevleriListele();
}
```

### Ne Zaman Kullanılır?

✅ **Void Kullan:**
- Ekrana çıktı yazdırma
- Dosya yazma/okuma
- Veritabanı işlemleri
- Yan etki gerektiren işlemler
- UI güncellemeleri

---

## ↩️ Return Fonksiyonlar

### Tanım

**Return fonksiyonlar**, bir değer hesaplayıp **geri döndüren** fonksiyonlardır.

### Syntax

```dart
TipAdi fonksiyonAdi() {
  // İşlemler
  return deger;  // Değer dön!
}
```

### Örnekler

#### Örnek 1: Basit Değer Döndürme

```dart
int sayiGetir() {
  return 42;
}

String mesajGetir() {
  return "Merhaba!";
}

bool aktifMi() {
  return true;
}

void main() {
  int sayi = sayiGetir();
  String mesaj = mesajGetir();
  bool durum = aktifMi();
  
  print(sayi);   // 42
  print(mesaj);  // Merhaba!
  print(durum);  // true
}
```

#### Örnek 2: Hesaplama Yapan Fonksiyonlar

```dart
int topla(int a, int b) {
  return a + b;
}

int cikar(int a, int b) {
  return a - b;
}

int carp(int a, int b) {
  return a * b;
}

double bol(int a, int b) {
  return a / b;
}

void main() {
  print("10 + 5 = ${topla(10, 5)}");    // 15
  print("10 - 5 = ${cikar(10, 5)}");    // 5
  print("10 × 5 = ${carp(10, 5)}");     // 50
  print("10 ÷ 5 = ${bol(10, 5)}");      // 2.0
}
```

#### Örnek 3: String İşlemleri

```dart
String buyukHarfYap(String metin) {
  return metin.toUpperCase();
}

String tersineEvir(String metin) {
  return metin.split('').reversed.join('');
}

int kelimeSayisi(String metin) {
  return metin.split(' ').length;
}

void main() {
  String metin = "merhaba dünya";
  
  print(buyukHarfYap(metin));    // MERHABA DÜNYA
  print(tersineEvir(metin));     // aynüd abahrem
  print(kelimeSayisi(metin));    // 2
}
```

#### Örnek 4: Liste İşlemleri

```dart
List<int> ciftSayilar(List<int> sayilar) {
  List<int> ciftler = [];
  for (int sayi in sayilar) {
    if (sayi % 2 == 0) {
      ciftler.add(sayi);
    }
  }
  return ciftler;
}

int enBuyukSayi(List<int> sayilar) {
  int enBuyuk = sayilar[0];
  for (int sayi in sayilar) {
    if (sayi > enBuyuk) {
      enBuyuk = sayi;
    }
  }
  return enBuyuk;
}

double ortalama(List<int> sayilar) {
  int toplam = 0;
  for (int sayi in sayilar) {
    toplam += sayi;
  }
  return toplam / sayilar.length;
}

void main() {
  List<int> sayilar = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  print("Çift sayılar: ${ciftSayilar(sayilar)}");
  print("En büyük: ${enBuyukSayi(sayilar)}");
  print("Ortalama: ${ortalama(sayilar)}");
}
```

### Return Kuralları

```dart
// ✅ DOĞRU - Her yol return eder
int mutlakDeger(int sayi) {
  if (sayi < 0) {
    return -sayi;
  } else {
    return sayi;
  }
}

// ❌ HATA - Bazı yollar return etmiyor
int yanlis(int sayi) {
  if (sayi > 0) {
    return sayi;
  }
  // else durumu yok - HATA!
}

// ✅ DOĞRU - Erken return
String notHarfi(int puan) {
  if (puan >= 90) return "AA";
  if (puan >= 80) return "BA";
  if (puan >= 70) return "BB";
  if (puan >= 60) return "CB";
  return "FF";
}
```

---

## 📥 Parametreli Fonksiyonlar

### Positional Parameters (Sıralı Parametreler)

Parametrelerin **sırası önemli** olan parametrelerdir.

#### Syntax

```dart
TipAdi fonksiyon(Tip param1, Tip param2) {
  // işlemler
}
```

#### Örnekler

```dart
// Basit örnek
void tanit(String isim, int yas, String sehir) {
  print("Ben $isim, $yas yaşındayım ve $sehir'de yaşıyorum.");
}

void main() {
  tanit("Ahmet", 25, "İstanbul");
  // Sıra: isim, yas, sehir
  
  // tanit(25, "Ahmet", "İstanbul");  // ❌ HATA - Sıra yanlış!
}
```

```dart
// Matematiksel işlem
double dikdortgenAlan(double uzunluk, double genislik) {
  return uzunluk * genislik;
}

double dikdortgenCevre(double uzunluk, double genislik) {
  return 2 * (uzunluk + genislik);
}

void main() {
  print("Alan: ${dikdortgenAlan(5, 3)}");      // 15
  print("Çevre: ${dikdortgenCevre(5, 3)}");    // 16
}
```

### Optional Positional Parameters (Opsiyonel Sıralı)

Köşeli parantez `[]` içine alınır ve **opsiyoneldir**.

#### Syntax

```dart
void fonksiyon(Tip zorunlu, [Tip? opsiyonel]) {
  // işlemler
}
```

#### Örnekler

```dart
void selamla(String isim, [String? unvan]) {
  if (unvan != null) {
    print("Merhaba $unvan $isim!");
  } else {
    print("Merhaba $isim!");
  }
}

void main() {
  selamla("Ahmet");              // Merhaba Ahmet!
  selamla("Mehmet", "Dr.");      // Merhaba Dr. Mehmet!
}
```

```dart
// Default değerle
void kahveYap(String tur, [int seker = 0, String? boyut]) {
  String mesaj = "$tur kahve";
  if (seker > 0) mesaj += " ($seker şeker)";
  if (boyut != null) mesaj += " - $boyut";
  print(mesaj);
}

void main() {
  kahveYap("Türk");                    // Türk kahve
  kahveYap("Türk", 2);                 // Türk kahve (2 şeker)
  kahveYap("Latte", 1, "Grande");      // Latte kahve (1 şeker) - Grande
}
```

---

## 🏷️ Named Parameters (İsimli Parametreler)

Parametrelerin **isimle verildiği** parametrelerdir. Süslü parantez `{}` içinde tanımlanır.

### Syntax

```dart
void fonksiyon({Tip? param1, required Tip param2}) {
  // işlemler
}
```

### Örnekler

#### Örnek 1: Basit Kullanım

```dart
void kullaniciOlustur({
  required String ad,
  required String email,
  int yas = 18,
  String? telefon,
}) {
  print("Kullanıcı Oluşturuldu:");
  print("  Ad: $ad");
  print("  Email: $email");
  print("  Yaş: $yas");
  if (telefon != null) print("  Telefon: $telefon");
}

void main() {
  kullaniciOlustur(
    ad: "Ahmet",
    email: "ahmet@test.com",
  );
  
  kullaniciOlustur(
    ad: "Mehmet",
    email: "mehmet@test.com",
    yas: 30,
    telefon: "555-1234",
  );
}
```

#### Örnek 2: Widget Benzeri Kullanım

```dart
void kartGoster({
  required String baslik,
  required String icerik,
  String? resimUrl,
  bool gorunur = true,
  int genislik = 300,
  int yukseklik = 200,
}) {
  if (!gorunur) return;
  
  print("┌${"─" * 40}┐");
  print("│ $baslik");
  print("├${"─" * 40}┤");
  print("│ $icerik");
  if (resimUrl != null) print("│ 🖼️ $resimUrl");
  print("│ ${genislik}x${yukseklik}");
  print("└${"─" * 40}┘");
}

void main() {
  kartGoster(
    baslik: "Dart Öğreniyorum",
    icerik: "Fonksiyonlar çok kullanışlı!",
    resimUrl: "dart-logo.png",
  );
}
```

#### Örnek 3: Karışık Kullanım

```dart
// Hem positional hem named
void siparis(String urun, int adet, {double indirim = 0, bool kargoUcretsiz = false}) {
  double fiyat = 100 * adet;
  fiyat = fiyat * (1 - indirim);
  
  print("Sipariş Özeti:");
  print("  Ürün: $urun");
  print("  Adet: $adet");
  print("  Toplam: $fiyat TL");
  if (kargoUcretsiz) print("  🎁 Kargo Ücretsiz!");
}

void main() {
  siparis("Laptop", 1, indirim: 0.1, kargoUcretsiz: true);
}
```

### Positional vs Named

| Özellik | Positional | Named |
|---------|-----------|-------|
| Sıra | ✅ Önemli | ❌ Önemsiz |
| Okunabilirlik | Orta | ✅ Yüksek |
| Opsiyonel | `[]` ile | Varsayılan |
| Required | Varsayılan | `required` ile |
| Kullanım | 2-3 parametre | 4+ parametre |

---

## 🎯 Arrow Functions (Ok Fonksiyonları)

### Tanım

**Arrow functions**, tek satırlık fonksiyonlar için kısa yazım şeklidir. `=>` kullanır.

### Syntax

```dart
// Normal
TipAdi fonksiyon(params) {
  return ifade;
}

// Arrow
TipAdi fonksiyon(params) => ifade;
```

### Örnekler

#### Örnek 1: Basit Dönüşümler

```dart
// Normal yazım
int kare1(int sayi) {
  return sayi * sayi;
}

// Arrow function
int kare(int sayi) => sayi * sayi;

String selamla(String isim) => "Merhaba $isim!";

bool ciftMi(int sayi) => sayi % 2 == 0;

double cevre(double yaricap) => 2 * 3.14 * yaricap;

void main() {
  print(kare(5));           // 25
  print(selamla("Ahmet"));  // Merhaba Ahmet!
  print(ciftMi(4));         // true
  print(cevre(10));         // 62.8
}
```

#### Örnek 2: Liste İşlemleri

```dart
void main() {
  List<int> sayilar = [1, 2, 3, 4, 5];
  
  // map ile arrow function
  var kareler = sayilar.map((sayi) => sayi * sayi);
  print("Kareler: $kareler");  // [1, 4, 9, 16, 25]
  
  // where ile arrow function
  var ciftler = sayilar.where((sayi) => sayi % 2 == 0);
  print("Çiftler: $ciftler");  // [2, 4]
  
  // forEach ile arrow function
  sayilar.forEach((sayi) => print("Sayı: $sayi"));
}
```

#### Örnek 3: Getter'larda Kullanım

```dart
class Dikdortgen {
  double genislik;
  double yukseklik;
  
  Dikdortgen(this.genislik, this.yukseklik);
  
  // Arrow function ile getter
  double get alan => genislik * yukseklik;
  double get cevre => 2 * (genislik + yukseklik);
  bool get kare => genislik == yukseklik;
}

void main() {
  var dikdortgen = Dikdortgen(5, 3);
  print("Alan: ${dikdortgen.alan}");      // 15
  print("Çevre: ${dikdortgen.cevre}");    // 16
  print("Kare mi? ${dikdortgen.kare}");   // false
}
```

### Arrow Function Kuralları

```dart
// ✅ DOĞRU - Tek ifade
int topla(int a, int b) => a + b;

// ❌ HATA - Birden fazla satır olamaz
int yanlis(int a, int b) => {
  int toplam = a + b;  // HATA!
  return toplam;
};

// ✅ DOĞRU - Void fonksiyon
void yazdir(String mesaj) => print(mesaj);

// ✅ DOĞRU - Ternary operator
String durumBelirle(int puan) => puan >= 50 ? "Geçti" : "Kaldı";
```

---

## 👤 Anonymous Functions (Anonim Fonksiyonlar)

### Tanım

**Anonymous functions**, isimsiz fonksiyonlardır. Lambda fonksiyonlar olarak da bilinir.

### Syntax

```dart
(parametreler) {
  // işlemler
}

// veya arrow ile
(parametreler) => ifade
```

### Örnekler

#### Örnek 1: Liste İşlemleri

```dart
void main() {
  List<String> isimler = ["Ahmet", "Mehmet", "Ayşe", "Fatma"];
  
  // Anonymous function ile forEach
  isimler.forEach((isim) {
    print("Merhaba $isim!");
  });
  
  // Arrow anonymous function
  isimler.forEach((isim) => print("Hoş geldin $isim!"));
}
```

#### Örnek 2: map ve where

```dart
void main() {
  List<int> sayilar = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  // Kareleri al
  var kareler = sayilar.map((n) => n * n).toList();
  print("Kareler: $kareler");
  
  // Çift sayıları filtrele
  var ciftler = sayilar.where((n) => n % 2 == 0).toList();
  print("Çiftler: $ciftler");
  
  // Çift sayıların kareleri
  var ciftKareler = sayilar
      .where((n) => n % 2 == 0)
      .map((n) => n * n)
      .toList();
  print("Çift kareler: $ciftKareler");
}
```

#### Örnek 3: Callback Fonksiyonlar

```dart
void islemYap(int sayi, Function(int) callback) {
  print("İşlem başlıyor...");
  callback(sayi);
  print("İşlem bitti!");
}

void main() {
  // Anonymous function callback
  islemYap(5, (sonuc) {
    print("Sonuç: $sonuc");
  });
  
  // Arrow anonymous function
  islemYap(10, (sonuc) => print("Değer: $sonuc"));
}
```

#### Örnek 4: Sıralama

```dart
void main() {
  List<Map<String, dynamic>> ogrenciler = [
    {'ad': 'Ahmet', 'not': 75},
    {'ad': 'Mehmet', 'not': 90},
    {'ad': 'Ayşe', 'not': 85},
  ];
  
  // Nota göre sırala (anonymous function)
  ogrenciler.sort((a, b) => b['not'].compareTo(a['not']));
  
  print("Sıralama (nota göre):");
  ogrenciler.forEach((ogr) => print("${ogr['ad']}: ${ogr['not']}"));
}
```

---

## 🎭 Higher-Order Functions

### Tanım

**Higher-order functions**, başka fonksiyonları parametre olarak alan veya fonksiyon döndüren fonksiyonlardır.

### Örnekler

#### Örnek 1: Fonksiyon Parametresi

```dart
void islemYap(int a, int b, int Function(int, int) islem) {
  int sonuc = islem(a, b);
  print("Sonuç: $sonuc");
}

int topla(int a, int b) => a + b;
int carp(int a, int b) => a * b;

void main() {
  islemYap(5, 3, topla);  // 8
  islemYap(5, 3, carp);   // 15
  
  // Anonymous function
  islemYap(5, 3, (a, b) => a - b);  // 2
}
```

#### Örnek 2: Fonksiyon Döndürme

```dart
Function carpan(int katsayi) {
  return (int sayi) => sayi * katsayi;
}

void main() {
  var ikiKati = carpan(2);
  var ucKati = carpan(3);
  
  print(ikiKati(5));   // 10
  print(ucKati(5));    // 15
}
```

#### Örnek 3: Decorator Pattern

```dart
Function logla(Function fonksiyon) {
  return (dynamic input) {
    print("🔵 Fonksiyon çağrıldı: $input");
    var sonuc = fonksiyon(input);
    print("🟢 Sonuç: $sonuc");
    return sonuc;
  };
}

int kare(int n) => n * n;

void main() {
  var kareLoglu = logla(kare);
  kareLoglu(5);
  // 🔵 Fonksiyon çağrıldı: 5
  // 🟢 Sonuç: 25
}
```

#### Örnek 4: Pratik Kullanım

```dart
typedef Validator = String? Function(String?);

Validator zorunluAlan(String mesaj) {
  return (String? deger) {
    if (deger == null || deger.isEmpty) {
      return mesaj;
    }
    return null;
  };
}

Validator minUzunluk(int uzunluk) {
  return (String? deger) {
    if (deger == null || deger.length < uzunluk) {
      return "En az $uzunluk karakter olmalı";
    }
    return null;
  };
}

void main() {
  var emailValidator = zorunluAlan("Email gerekli");
  var sifreValidator = minUzunluk(6);
  
  print(emailValidator(null));      // Email gerekli
  print(sifreValidator("123"));     // En az 6 karakter olmalı
  print(sifreValidator("123456"));  // null (geçerli)
}
```

---

## 🔄 Recursive Functions (Özyinelemeli)

### Tanım

**Recursive functions**, kendini çağıran fonksiyonlardır.

### Örnekler

#### Örnek 1: Faktöriyel

```dart
int faktoriyel(int n) {
  // Base case (Temel durum)
  if (n <= 1) return 1;
  
  // Recursive case
  return n * faktoriyel(n - 1);
}

void main() {
  print("5! = ${faktoriyel(5)}");  // 120
  print("3! = ${faktoriyel(3)}");  // 6
}
```

**Açıklama:**
```
faktoriyel(5)
= 5 * faktoriyel(4)
= 5 * 4 * faktoriyel(3)
= 5 * 4 * 3 * faktoriyel(2)
= 5 * 4 * 3 * 2 * faktoriyel(1)
= 5 * 4 * 3 * 2 * 1
= 120
```

#### Örnek 2: Fibonacci

```dart
int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  for (int i = 0; i < 10; i++) {
    print("fib($i) = ${fibonacci(i)}");
  }
  // 0, 1, 1, 2, 3, 5, 8, 13, 21, 34
}
```

#### Örnek 3: Liste Toplamı

```dart
int listeToplam(List<int> liste) {
  if (liste.isEmpty) return 0;
  return liste.first + listeToplam(liste.sublist(1));
}

void main() {
  print(listeToplam([1, 2, 3, 4, 5]));  // 15
}
```

#### Örnek 4: Güç Hesaplama

```dart
int guc(int taban, int us) {
  if (us == 0) return 1;
  return taban * guc(taban, us - 1);
}

void main() {
  print("2^5 = ${guc(2, 5)}");   // 32
  print("3^3 = ${guc(3, 3)}");   // 27
}
```

### Recursive Kuralları

```dart
// ✅ DOĞRU - Base case var
int faktoriyel(int n) {
  if (n <= 1) return 1;  // Base case
  return n * faktoriyel(n - 1);
}

// ❌ HATA - Base case yok (sonsuz döngü!)
int yanlis(int n) {
  return n * yanlis(n - 1);  // Hiç durmaz!
}

// ✅ DOĞRU - Her çağrıda problemi küçült
int dogru(int n) {
  if (n <= 0) return 0;
  return dogru(n - 1);  // n küçülüyor
}
```

---

## ✅ Best Practices (En İyi Uygulamalar)

### 1. İsimlendirme

```dart
// ✅ İYİ - Açıklayıcı isimler
double hesaplaIndirim(double fiyat, double oran);
bool emailGecerliMi(String email);
List<User> aktifKullanicilariGetir();

// ❌ KÖTÜ - Belirsiz isimler
double calc(double x, double y);
bool check(String s);
List<User> get();
```

### 2. Tek Sorumluluk

```dart
// ✅ İYİ - Her fonksiyon bir iş yapar
double fiyatHesapla(double fiyat, double kdv) {
  return fiyat * (1 + kdv);
}

void fiyatYazdir(double fiyat) {
  print("Fiyat: $fiyat TL");
}

// ❌ KÖTÜ - Birden fazla sorumluluk
void fiyatIsle(double fiyat, double kdv) {
  double toplam = fiyat * (1 + kdv);
  print("Fiyat: $toplam TL");
  // Veritabanına kaydet
  // Email gönder
  // Log yaz
}
```

### 3. Parametre Sayısı

```dart
// ✅ İYİ - Az parametre
void kullaniciOlustur({
  required String ad,
  required String email,
  int yas = 18,
}) { }

// ❌ KÖTÜ - Çok fazla parametre
void yanlis(String p1, String p2, String p3, String p4, 
            String p5, String p6, String p7) { }
```

### 4. Return Değeri

```dart
// ✅ İYİ - Her yol return eder
String notBelirle(int puan) {
  if (puan >= 90) return "A";
  if (puan >= 80) return "B";
  if (puan >= 70) return "C";
  return "F";
}

// ✅ İYİ - Null dönebilir
String? kullaniciBul(String id) {
  // Bulunamazsa null döner
  return null;
}
```

### 5. Pure Functions

```dart
// ✅ İYİ - Pure function (yan etki yok)
int topla(int a, int b) {
  return a + b;  // Sadece hesaplar
}

// ❌ KÖTÜ - Yan etki var
int sayac = 0;
int arttir(int x) {
  sayac++;  // Global değişken değiştiriliyor!
  return x + sayac;
}
```

### 6. Dokümantasyon

```dart
/// Verilen iki sayının toplamını hesaplar
///
/// [a] birinci sayı
/// [b] ikinci sayı
///
/// Returns: İki sayının toplamı
///
/// Example:
/// ```dart
/// int sonuc = topla(5, 3);  // 8
/// ```
int topla(int a, int b) {
  return a + b;
}
```

---

## ❌ Sık Yapılan Hatalar

### 1. Return Unutmak

```dart
// ❌ HATA
int topla(int a, int b) {
  a + b;  // return yok!
}

// ✅ DOĞRU
int topla(int a, int b) {
  return a + b;
}
```

### 2. Void Fonksiyonda Return

```dart
// ❌ HATA
void yazdir(String mesaj) {
  return mesaj;  // void return edemez!
}

// ✅ DOĞRU
void yazdir(String mesaj) {
  print(mesaj);
}
```

### 3. Parametre Sırası

```dart
void siparis(String urun, int adet, double fiyat) { }

// ❌ HATA - Sıra yanlış
siparis(100, "Laptop", 1);

// ✅ DOĞRU
siparis("Laptop", 1, 100);
```

### 4. Named Parameter required Unutmak

```dart
// ❌ HATA - null olabilir ama değer verilmezse sorun
void kullanici({String ad}) {
  print(ad.toUpperCase());  // null olabilir!
}

// ✅ DOĞRU
void kullanici({required String ad}) {
  print(ad.toUpperCase());
}
```

### 5. Recursive Base Case Unutmak

```dart
// ❌ HATA - Sonsuz döngü
int faktoriyel(int n) {
  return n * faktoriyel(n - 1);  // Hiç durmuyor!
}

// ✅ DOĞRU
int faktoriyel(int n) {
  if (n <= 1) return 1;  // Base case
  return n * faktoriyel(n - 1);
}
```

---

## 📊 Fonksiyon Karşılaştırma Tablosu

| Özellik | Void | Return | Arrow | Anonymous |
|---------|------|--------|-------|-----------|
| Değer döndürür | ❌ | ✅ | ✅ | ✅/❌ |
| İsmi var | ✅ | ✅ | ✅ | ❌ |
| Tek satır | ❌ | ❌ | ✅ | ✅/❌ |
| Callback olabilir | ✅ | ✅ | ✅ | ✅ |
| Kullanım | İşlemler | Hesaplamalar | Kısa işlem | Callback |

---

## 🎓 Özet

### Altın Kurallar

1. ✅ **Tek sorumluluk** - Her fonksiyon bir iş yapsın
2. ✅ **Açıklayıcı isim** - Ne yaptığı belliolsun
3. ✅ **Az parametre** - 3-4'ten fazla olmasın
4. ✅ **Pure function** - Yan etkiden kaçının
5. ✅ **Dokümante edin** - Nasıl kullanılacağını açıklayın

### Ne Zaman Hangisi?

| Durum | Fonksiyon Türü |
|-------|---------------|
| Değer hesaplama | Return function |
| Ekrana yazdırma | Void function |
| Tek satır işlem | Arrow function |
| Callback | Anonymous function |
| 2-3 parametre | Positional parameters |
| 4+ parametre | Named parameters |
| Kendini çağırma | Recursive function |

---

**📝 Not:** Bu dokümanda öğrendiklerinizi `4-Fonksiyonlar.dart` dosyasındaki örneklerle pekiştirebilirsiniz.

```bash
dart run 3-NesneTabanliProgramlama/4-Fonksiyonlar.dart
```

---

**🎉 Tebrikler!** Dart Fonksiyonlar konusunu tamamladınız. Artık temiz ve yeniden kullanılabilir kod yazabilirsiniz! 🔧

