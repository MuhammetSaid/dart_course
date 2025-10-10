# 🛡️ Dart Null Safety - Kapsamlı Rehber

## 📚 İçindekiler
1. [Null Nedir?](#null-nedir)
2. [Null Safety Nedir?](#null-safety-nedir)
3. [Neden Null Safety Önemlidir?](#neden-null-safety-önemlidir)
4. [Nullable vs Non-Nullable](#nullable-vs-non-nullable)
5. [Null Safety Operatörleri](#null-safety-operatörleri)
6. [Late Keyword](#late-keyword)
7. [Null Check Yöntemleri](#null-check-yöntemleri)
8. [Pratik Kullanım Senaryoları](#pratik-kullanım-senaryoları)
9. [İyi ve Kötü Pratikler](#iyi-ve-kötü-pratikler)
10. [Sık Sorulan Sorular](#sık-sorulan-sorular)
11. [Özet ve Karar Ağacı](#özet-ve-karar-ağacı)

---

## 🤔 Null Nedir?

### Tanım
**Null**, bir değişkenin **değer içermediği** durumu temsil eder. "Hiçbir şey", "boş", "tanımsız" anlamına gelir.

### Gerçek Hayat Analojisi

Null'ı anlamak için kutular düşünün:

```
┌─────────────┐
│   🍎 ELMA   │  → Değer var (String: "elma")
└─────────────┘

┌─────────────┐
│    BOŞ      │  → null (değer yok)
└─────────────┘

┌─────────────┐
│ 🍊 PORTAKAL │  → Değer var (String: "portakal")
└─────────────┘
```

- İçinde elma olan kutu → Değer içeren değişken
- Boş kutu → `null` değeri
- İçinde portakal olan kutu → Başka bir değer içeren değişken

### Programlamada Null

```dart
String? isim;           // Değişken tanımlandı ama değer atanmadı
print(isim);            // Output: null

int? yas;               // null
bool? aktif;            // null
List<String>? liste;    // null
```

### Null Kullanım Durumları

**Ne zaman null kullanılır?**

1. ✅ **Opsiyonel Bilgiler**
   ```dart
   String? ortaIsim;  // Herkesin orta ismi olmayabilir
   String? bio;       // Kullanıcı bio yazmamış olabilir
   ```

2. ✅ **Henüz Yüklenmeyen Veriler**
   ```dart
   String? apiVerisi;  // API'den henüz veri gelmedi
   Image? profilFoto;  // Fotoğraf henüz yüklenmedi
   ```

3. ✅ **Hata Durumları**
   ```dart
   String? hataMesaji;  // Hata yoksa null
   Error? error;        // Başarılıysa null
   ```

4. ✅ **Arama Sonuçları**
   ```dart
   User? bulunanKullanici;  // Bulunamadıysa null
   Product? urun;           // Ürün yoksa null
   ```

---

## 🛡️ Null Safety Nedir?

### Tanım

**Null Safety** (Null Güvenliği), Dart'ın **null referans hatalarını** önlemek için geliştirdiği bir güvenlik sistemidir.

### Tarihçe

```
ESKI DART (Null Safety Öncesi)
├─ Her değişken null olabilirdi
├─ Çalışma zamanında hatalar çıkardı
└─ "NullPointerException" çok yaygındı

YENİ DART (Null Safety Sonrası - Dart 2.12+)
├─ Değişkenler varsayılan olarak non-nullable
├─ Null hatalar derleme zamanında yakalanır
└─ Daha güvenli ve öngörülebilir kod
```

### Tony Hoare'ın Ünlü Sözü

> **"Milyar dolarlık hatam!"**
> 
> — Tony Hoare (null referansını icat eden bilgisayar bilimci)
> 
> Null pointer hatalarının dünya çapında milyarlarca dolarlık zarara yol açtığını kabul etti.

### Compile-Time vs Runtime Kontrol

#### Eski Dart (Runtime Hatası)
```dart
// Eski Dart - Hata çalışma zamanında
String name;
print(name.length);  // ÇÖKER! (runtime error)
```

#### Yeni Dart (Compile-Time Hatası)
```dart
// Yeni Dart - Hata derleme zamanında
String name;  // DERLEME HATASI! Değer zorunlu
```

**Avantaj:** Hatayı programı çalıştırmadan önce görürsünüz! ✅

---

## ⚠️ Neden Null Safety Önemlidir?

### 1. Uygulama Çökmelerini Önler

```dart
// ❌ Eski Dart - Çökme riski
String kullaniciAdi;
print("Hoş geldin ${kullaniciAdi.toUpperCase()}");  // ÇÖKER!

// ✅ Yeni Dart - Güvenli
String kullaniciAdi = "Ahmet";  // Değer zorunlu
print("Hoş geldin ${kullaniciAdi.toUpperCase()}");  // Güvenli!
```

### 2. Hataları Erken Yakalar

```
HATA YAKALAMA ZİNCİRİ:

1. IDE'de Yazarken          ← En iyi! ✅
   └─ Kırmızı çizgi görürsünüz

2. Derleme Zamanında        ← İyi ✅
   └─ Derleyici hata verir

3. Test Aşamasında          ← Fena değil ⚠️
   └─ Test sırasında keşfedilir

4. Production'da (Canlıda)  ← Felaket! ❌
   └─ Kullanıcılar hatayı görür
```

### 3. Kod Güvenilirliğini Artırır

```dart
// Fonksiyon signature'ından ne döneceği belli
User? kullaniciBul(String id) {
  // null dönebilir, dikkatli ol!
}

User kullaniciGetir(String id) {
  // Kesinlikle User döner, null olmaz!
}
```

### 4. Dokümantasyon Görevi Görür

```dart
class User {
  String ad;           // Zorunlu alan
  String soyad;        // Zorunlu alan
  String? ortaAd;      // Opsiyonel alan
  String? bio;         // Opsiyonel alan
  int yas;             // Zorunlu alan
}
```

Kod kendini açıklar: Hangi alanların zorunlu, hangilerinin opsiyonel olduğu açık!

### 5. Null Pointer Exception'ları Ortadan Kaldırır

**İstatistikler:**
- Tüm yazılım hatalarının yaklaşık %70'i null pointer hatalarıdır
- Null Safety bu hataların büyük kısmını engeller
- Google'ın araştırmasına göre %80 azalma

---

## 🔀 Nullable vs Non-Nullable

### Non-Nullable (Varsayılan)

**Tanım:** Kesinlikle değer içermesi gereken değişkenler.

```dart
// Non-nullable değişkenler
String ad = "Ahmet";        // Zorunlu
int yas = 25;               // Zorunlu
bool aktif = true;          // Zorunlu
List<String> liste = [];    // Zorunlu (boş bile olsa)
```

**Kurallar:**
- ❌ Null atanamaz
- ✅ Başlangıç değeri zorunlu
- ✅ Her zaman değer içerir
- ✅ Güvenle kullanılabilir

**Hata Veren Kullanımlar:**
```dart
❌ String isim;                    // HATA: Değer yok
❌ int sayi;                       // HATA: Değer yok
❌ String isim = null;             // HATA: null atanamaz
```

### Nullable (? ile işaretli)

**Tanım:** Null olabilen değişkenler.

```dart
// Nullable değişkenler
String? ad;                 // null olabilir
int? yas;                   // null olabilir
bool? aktif;                // null olabilir
List<String>? liste;        // null olabilir
```

**Kurallar:**
- ✅ Null olabilir
- ✅ Başlangıç değeri opsiyonel
- ⚠️  Kullanmadan önce null kontrolü gerekli
- ⚠️  Doğrudan erişim riskli

**Geçerli Kullanımlar:**
```dart
✅ String? isim;                   // Başlangıçta null
✅ String? isim = null;            // Açıkça null
✅ String? isim = "Ahmet";         // Değer var
✅ isim = null;                    // Sonradan null atanabilir
```

### Karşılaştırma Tablosu

| Özellik | Non-Nullable | Nullable |
|---------|-------------|----------|
| Syntax | `String name` | `String? name` |
| Null olabilir mi? | ❌ Hayır | ✅ Evet |
| Başlangıç değeri | Zorunlu | Opsiyonel |
| Doğrudan erişim | ✅ Güvenli | ⚠️ Kontrol gerekli |
| Varsayılan | ✅ Evet | ❌ Hayır |
| Kullanım | %80-90 | %10-20 |

### Ne Zaman Hangisi?

```dart
// ✅ Non-nullable kullan (çoğunlukla)
String kullaniciAdi = "ahmet";  // Her kullanıcının adı var
int yas = 25;                   // Yaş zorunlu
bool girisYapti = false;        // Giriş durumu belli

// ✅ Nullable kullan (gerektiğinde)
String? profilFoto;             // Herkesin fotoğrafı olmayabilir
String? bio;                    // Bio opsiyonel
int? calistigiSirket;           // İşsiz olabilir
```

### Geçiş Kuralı

**Önemli:** Non-nullable'dan nullable'a geçiş kolay, tersi zor!

```dart
String isim = "Ahmet";
String? nullableIsim = isim;  // ✅ Non-null → Nullable (güvenli)

String? nullableIsim2;
String isim2 = nullableIsim2; // ❌ HATA! Nullable → Non-null (riskli)
```

---

## 🔧 Null Safety Operatörleri

Dart, null ile çalışmak için 5 özel operatör sunar.

### 1. `?` Operatörü (Nullable Type)

**Amaç:** Değişkenin null olabileceğini belirtir.

**Syntax:**
```dart
Tip? degiskenAdi;
```

**Örnekler:**
```dart
String? kullaniciAdi;     // null olabilir
int? yas;                 // null olabilir
bool? onayliMi;           // null olabilir
List<int>? sayilar;       // null olabilir
User? kullanici;          // null olabilir
```

**Kullanım Alanları:**
- Opsiyonel parametreler
- API yanıtları
- Kullanıcı girdileri
- Arama sonuçları

---

### 2. `!` Operatörü (Null Assertion / Bang Operator)

**Amaç:** "Bu kesinlikle null değildir" diye garanti verirsiniz.

**Syntax:**
```dart
nullableDegisken!
```

**⚠️ UYARI:** Yanlış kullanımda program çöker!

**Örnekler:**

```dart
// ✅ Güvenli Kullanım
String? isim = "Ahmet";
int uzunluk = isim!.length;  // Eminim ki null değil
print(uzunluk);  // 5

// ❌ Tehlikeli Kullanım
String? isim2;
int uzunluk2 = isim2!.length;  // ÇÖKER! null'a ! uygulandı
```

**Ne Zaman Kullanılır?**

```dart
// 1. API'den kesin veri geleceğini biliyorsanız
String? apiVerisi = api.getUser();
User user = User(apiVerisi!);  // Eminim ki geldi

// 2. Önceden null kontrolü yaptıysanız
String? isim;
if (isim != null) {
  print(isim!.toUpperCase());  // Burada güvenli
}

// 3. Test kodlarında
String? test = "test";
assert(test!.isNotEmpty);
```

**Kaçınılması Gereken Kullanım:**
```dart
❌ value!.property!.method!()     // Çok fazla !
❌ map['key']!                     // Map key'i yoksa çöker
❌ list[0]!                        // Liste boşsa çöker
```

**Kural:** `!` operatörünü mümkün olduğunca az kullanın!

---

### 3. `??` Operatörü (Null-Coalescing / Varsayılan Değer)

**Amaç:** "Null ise şunu kullan" mantığı.

**Syntax:**
```dart
deger1 ?? deger2
```
- Eğer `deger1` null değilse → `deger1` kullanılır
- Eğer `deger1` null ise → `deger2` kullanılır

**Örnekler:**

```dart
// Basit kullanım
String? kullanici;
String isim = kullanici ?? "Misafir";
print(isim);  // "Misafir"

kullanici = "Ahmet";
String isim2 = kullanici ?? "Misafir";
print(isim2);  // "Ahmet"

// Sayısal değerler
int? ayarlananYas;
int yas = ayarlananYas ?? 18;  // Varsayılan: 18

// Boolean değerler
bool? karanlikMod;
bool modAktif = karanlikMod ?? false;  // Varsayılan: false

// Zincirleme kullanım
String? ad;
String? soyad;
String? kullaniciAdi;
String gosterilecek = ad ?? soyad ?? kullaniciAdi ?? "Bilinmiyor";
```

**Pratik Örnekler:**

```dart
// Ayarlar
class Ayarlar {
  String dil = kullaniciDili ?? sistemDili ?? "tr";
  int tema = kullaniciTemasi ?? 0;
  bool bildirimler = kullaniciBildirim ?? true;
}

// Fiyatlandırma
double fiyat = indirimliFiyat ?? normalFiyat ?? 0.0;

// Mesajlar
String mesaj = ozelMesaj ?? varsayilanMesaj ?? "Merhaba";
```

**Avantajları:**
- ✅ Kısa ve okunabilir
- ✅ Güvenli (program çökmez)
- ✅ Varsayılan değerler için ideal
- ✅ Zincirleme kullanılabilir

---

### 4. `??=` Operatörü (Null-Aware Assignment)

**Amaç:** "Null ise değer ata, değilse dokunma" mantığı.

**Syntax:**
```dart
degisken ??= deger
```

**Anlamı:**
```dart
// Bu kod:
degisken ??= deger;

// Şunun kısaltmasıdır:
if (degisken == null) {
  degisken = deger;
}
```

**Örnekler:**

```dart
// Basit kullanım
String? dil;
print(dil);      // null
dil ??= "Türkçe";
print(dil);      // "Türkçe"
dil ??= "İngilizce";
print(dil);      // Hala "Türkçe" (değişmedi)

// Sayısal değer
int? sayac;
sayac ??= 0;     // 0 atandı
sayac ??= 10;    // Değişmedi, hala 0

// Liste
List<String>? liste;
liste ??= [];    // Boş liste oluşturuldu
liste.add("a");  // Artık güvenle kullanılabilir
```

**Pratik Kullanım:**

```dart
// Lazy initialization
class Database {
  Connection? _connection;
  
  Connection get connection {
    _connection ??= Connection.create();
    return _connection!;
  }
}

// Cache mekanizması
class Cache {
  Map<String, dynamic> _cache = {};
  
  dynamic get(String key, Function fetch) {
    _cache[key] ??= fetch();
    return _cache[key];
  }
}

// Varsayılan ayarlar
class Config {
  String? _apiUrl;
  
  String get apiUrl {
    _apiUrl ??= "https://api.example.com";
    return _apiUrl!;
  }
}
```

**?? vs ??= Farkı:**

```dart
// ?? → Değer döndürür, değişkeni değiştirmez
String? a;
String b = a ?? "varsayılan";
print(a);  // hala null

// ??= → Değişkeni değiştirir
String? c;
c ??= "varsayılan";
print(c);  // "varsayılan"
```

---

### 5. `?.` Operatörü (Safe Navigation / Güvenli Erişim)

**Amaç:** "Null değilse işlemi yap, null ise null döndür" mantığı.

**Syntax:**
```dart
nullableDegisken?.property
nullableDegisken?.method()
```

**Anlamı:**
```dart
// Bu kod:
degisken?.length

// Şunun kısaltmasıdır:
degisken != null ? degisken.length : null
```

**Örnekler:**

```dart
// Property erişimi
String? isim;
int? uzunluk = isim?.length;
print(uzunluk);  // null

isim = "Ahmet";
int? uzunluk2 = isim?.length;
print(uzunluk2);  // 5

// Method çağrısı
String? metin;
String? buyuk = metin?.toUpperCase();
print(buyuk);  // null

metin = "merhaba";
String? buyuk2 = metin?.toUpperCase();
print(buyuk2);  // "MERHABA"

// Zincirleme erişim
class User {
  Address? address;
}

class Address {
  String? city;
}

User? user;
String? city = user?.address?.city;  // Güvenli zincirleme
```

**Zincirleme Kullanım:**

```dart
// Uzun zincirleme
String? postalCode = user?.address?.street?.postalCode?.toString();

// Karışık kullanım
String city = user?.address?.city ?? "Bilinmiyor";
int? length = user?.name?.toUpperCase()?.length;
```

**Liste ve Map ile:**

```dart
// Liste
List<String>? liste;
int? uzunluk = liste?.length;
String? ilk = liste?.first;
bool? bos = liste?.isEmpty;

// Map
Map<String, int>? map;
int? deger = map?['key'];
bool? varMi = map?.containsKey('key');
```

**Pratik Örnekler:**

```dart
// API yanıtı
Response? response = await api.get('/user');
String? name = response?.data?['name'];

// Kullanıcı profili
String displayName = user?.name?.toUpperCase() ?? "GUEST";

// Nested objeler
double? total = order?.items?.first?.price;
```

**Avantajları:**
- ✅ NullPointerException'ları önler
- ✅ Kod kısalır, okunabilirlik artar
- ✅ If kontrollerine gerek kalmaz
- ✅ Zincirleme erişim güvenli

---

### Operatörler Karşılaştırma Tablosu

| Operatör | Amaç | Güvenli mi? | Örnek |
|----------|------|-------------|-------|
| `?` | Nullable tip | ✅ | `String? name` |
| `!` | Null assertion | ❌ Riskli | `name!` |
| `??` | Varsayılan değer | ✅ | `name ?? "default"` |
| `??=` | Null ise ata | ✅ | `name ??= "default"` |
| `?.` | Güvenli erişim | ✅ | `name?.length` |

---

## ⏰ Late Keyword

### Tanım

**`late`**: "Daha sonra değer alacak ama null olmayacak" anlamına gelir.

### Syntax

```dart
late Tip degiskenAdi;
```

### Ne Zaman Kullanılır?

```dart
// ❌ Bu HATA verir (değer yok)
String isim;

// ✅ Çözüm 1: Hemen değer ver
String isim = "Ahmet";

// ✅ Çözüm 2: Nullable yap
String? isim;

// ✅ Çözüm 3: Late kullan
late String isim;
```

### Late'in 3 Ana Kullanım Amacı

#### 1. Gecikmeli Başlatma (Delayed Initialization)

```dart
class User {
  late String name;
  
  User() {
    // Constructor
  }
  
  void init(String n) {
    name = n;  // Daha sonra atandı
  }
}

void main() {
  var user = User();
  user.init("Ahmet");
  print(user.name);  // Ahmet
}
```

#### 2. Lazy Initialization (Tembel Yükleme)

```dart
class DatabaseConnection {
  // İlk erişimde oluşturulur
  late final Connection connection = _createConnection();
  
  Connection _createConnection() {
    print("Bağlantı oluşturuluyor...");
    return Connection();
  }
}

void main() {
  var db = DatabaseConnection();
  print("Nesne oluşturuldu");
  // Henüz "Bağlantı oluşturuluyor..." yazdırmadı
  
  print(db.connection);
  // Şimdi "Bağlantı oluşturuluyor..." yazdırıldı
}
```

**Avantaj:** Ağır işlemler sadece gerektiğinde yapılır!

#### 3. Nullable Yerine Late

```dart
// ❌ Nullable (her erişimde kontrol gerekir)
String? apiData;

void fetchData() {
  apiData = "data";
}

void useData() {
  if (apiData != null) {
    print(apiData!.toUpperCase());
  }
}

// ✅ Late (tek seferlik atama, sonra güvenle kullan)
late String apiData;

void fetchData() {
  apiData = "data";
}

void useData() {
  print(apiData.toUpperCase());  // Direkt kullanım
}
```

### Late ile Final

```dart
// Late + Final: Bir kez atanır, değiştirilemez
late final String userId;

void init(String id) {
  userId = id;
  // userId = "başka";  // HATA! Final değiştirilemez
}
```

### Late Kullanım Kuralları

**✅ Doğru Kullanım:**
```dart
late String name;

void init() {
  name = "Ahmet";  // Kullanmadan önce ata
}

void use() {
  print(name);  // Güvenle kullan
}

main() {
  init();  // Önce ata
  use();   // Sonra kullan
}
```

**❌ Yanlış Kullanım:**
```dart
late String name;

void use() {
  print(name);  // HATA! Atanmadan kullanıldı
}

main() {
  use();  // ÇÖKER!
}
```

### Late vs Nullable

| Özellik | Late | Nullable |
|---------|------|----------|
| Null olabilir mi? | ❌ | ✅ |
| Başlangıç değeri | Sonra | Opsiyonel |
| Erişim | Doğrudan | Kontrol gerekli |
| Performans | Daha iyi | Biraz yavaş |
| Kullanım | İç değişkenler | Public API'ler |

### Late Kullanırken Dikkat!

```dart
// ⚠️ DİKKAT 1: Atamadan kullanma
late String x;
// print(x);  // ÇÖKER!

// ⚠️ DİKKAT 2: Circular dependency
late String a = b;
late String b = a;  // Sonsuz döngü!

// ⚠️ DİKKAT 3: Exception'lar
late String name = throw Exception();  // İlk erişimde exception
```

---

## ✅ Null Check Yöntemleri

Null değerleri kontrol etmenin 5 yöntemi vardır.

### 1. If Kontrolü (Klasik Yöntem)

**En güvenli ve açık yöntem.**

```dart
String? kullaniciAdi;

// Null kontrolü
if (kullaniciAdi != null) {
  // Bu blokta kullaniciAdi kesinlikle null değildir
  print("Hoş geldin $kullaniciAdi");
  print("İsim uzunluğu: ${kullaniciAdi.length}");
} else {
  print("Kullanıcı girişi yapılmamış");
}
```

**Type Promotion:**
```dart
String? name;

if (name != null) {
  // Dart akıllıca anlar: burada name artık String (non-nullable)
  String upperName = name.toUpperCase();  // ! gerekmez
}
```

**Erken Return Pattern:**
```dart
void processUser(String? name) {
  if (name == null) {
    print("Geçersiz kullanıcı");
    return;  // Erken çık
  }
  
  // Bu noktadan sonra name kesinlikle null değil
  print(name.toUpperCase());
  print(name.length);
}
```

### 2. Safe Navigation (`?.`)

**Kısa ve güvenli yöntem.**

```dart
String? kullaniciAdi;

// Null ise null döner, değilse length döner
int? uzunluk = kullaniciAdi?.length;
print(uzunluk);  // null

kullaniciAdi = "admin";
int? uzunluk2 = kullaniciAdi?.length;
print(uzunluk2);  // 5
```

**Zincirleme:**
```dart
user?.address?.street?.name?.toUpperCase();
```

### 3. Null Coalescing (`??`)

**Varsayılan değer sağlama yöntemi.**

```dart
String? kullaniciAdi;

// Null ise "Misafir" kullan
String gosterilecek = kullaniciAdi ?? "Misafir";
print(gosterilecek);  // "Misafir"

// Kombinasyon
int uzunluk = (kullaniciAdi ?? "").length;
String buyuk = (kullaniciAdi ?? "Misafir").toUpperCase();
```

### 4. Type Casting (`as`)

**Nullable'dan Non-nullable'a dönüşüm.**

```dart
Object? deger = "Merhaba";

// Emin değiliz, kontrol edelim
if (deger is String) {
  // Bu blokta deger artık String (non-nullable)
  print(deger.toUpperCase());
}

// Riskli dönüşüm
String? nullableStr = "test";
String nonNullStr = nullableStr as String;  // ⚠️ Riskli!
```

### 5. Assertion (`!`)

**En riskli yöntem - sadece eminseniz kullanın!**

```dart
String? kullaniciAdi = "admin";

// Eminim ki null değil
print(kullaniciAdi!.toUpperCase());

// ⚠️ Riskli - null'sa çöker
String? bos;
// print(bos!.length);  // ÇÖKER!
```

### Yöntemler Karşılaştırma

| Yöntem | Syntax | Güvenlik | Kullanım |
|--------|--------|----------|----------|
| If kontrolü | `if (x != null)` | ✅✅✅ En güvenli | Karmaşık mantık |
| Safe navigation | `x?.property` | ✅✅✅ Güvenli | Kısa erişimler |
| Null coalescing | `x ?? default` | ✅✅✅ Güvenli | Varsayılan değer |
| Type casting | `x as Type` | ⚠️ Orta | Tip dönüşümü |
| Assertion | `x!` | ❌ Riskli | Sadece eminken |

### Hangi Durumda Hangisi?

```dart
// Karmaşık mantık → If kontrolü
if (user != null && user.isActive) {
  processUser(user);
}

// Basit erişim → Safe navigation
int? length = name?.length;

// Varsayılan değer → Null coalescing
String display = name ?? "Guest";

// Tip kontrolü → Type casting
if (value is String) {
  print(value.toUpperCase());
}

// Kesin biliyorsanız → Assertion (dikkatli!)
print(definitlyNotNull!);
```

---

## 💡 Pratik Kullanım Senaryoları

### Senaryo 1: Kullanıcı Profili Sistemi

```dart
class UserProfile {
  String userId;                    // Zorunlu
  String email;                     // Zorunlu
  String? displayName;              // Opsiyonel
  String? bio;                      // Opsiyonel
  String? profilePhotoUrl;          // Opsiyonel
  DateTime? birthDate;              // Opsiyonel
  String? phoneNumber;              // Opsiyonel
  
  UserProfile({
    required this.userId,
    required this.email,
    this.displayName,
    this.bio,
    this.profilePhotoUrl,
    this.birthDate,
    this.phoneNumber,
  });
  
  // Gösterilecek ismi belirle
  String get name => displayName ?? email.split('@').first;
  
  // Profil fotoğrafı veya varsayılan avatar
  String get photoUrl => profilePhotoUrl ?? 'assets/default_avatar.png';
  
  // Yaş hesaplama
  int? get age {
    if (birthDate == null) return null;
    return DateTime.now().year - birthDate!.year;
  }
  
  // Profil doluluk oranı
  double get completionRate {
    int total = 7;
    int filled = 2;  // userId ve email zorunlu
    if (displayName != null) filled++;
    if (bio != null) filled++;
    if (profilePhotoUrl != null) filled++;
    if (birthDate != null) filled++;
    if (phoneNumber != null) filled++;
    return filled / total;
  }
}
```

### Senaryo 2: API Yanıt İşleme

```dart
class ApiResponse<T> {
  T? data;
  String? error;
  int statusCode;
  
  ApiResponse({this.data, this.error, required this.statusCode});
  
  bool get isSuccess => statusCode >= 200 && statusCode < 300;
  bool get hasError => error != null;
  bool get hasData => data != null;
}

// Kullanım
Future<void> fetchUser(String id) async {
  ApiResponse<User> response = await api.getUser(id);
  
  if (response.hasError) {
    print("Hata: ${response.error}");
    return;
  }
  
  User? user = response.data;
  if (user != null) {
    print("Kullanıcı: ${user.name}");
  }
  
  // Kısa yol
  String userName = response.data?.name ?? "Bilinmiyor";
}
```

### Senaryo 3: Form Validasyonu

```dart
class FormValidator {
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email zorunludur";
    }
    if (!email.contains('@')) {
      return "Geçersiz email formatı";
    }
    return null;  // Geçerli
  }
  
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Şifre zorunludur";
    }
    if (password.length < 6) {
      return "Şifre en az 6 karakter olmalıdır";
    }
    return null;  // Geçerli
  }
  
  String? validatePhone(String? phone) {
    // Phone opsiyonel, boş olabilir
    if (phone == null || phone.isEmpty) {
      return null;  // Geçerli (opsiyonel alan)
    }
    if (phone.length != 10) {
      return "Telefon 10 haneli olmalıdır";
    }
    return null;  // Geçerli
  }
}

// Kullanım
void submitForm() {
  String? emailError = validator.validateEmail(emailController.text);
  String? passwordError = validator.validatePassword(passwordController.text);
  String? phoneError = validator.validatePhone(phoneController.text);
  
  if (emailError != null) {
    showError(emailError);
    return;
  }
  
  if (passwordError != null) {
    showError(passwordError);
    return;
  }
  
  // Form geçerli, gönder
  submitToServer();
}
```

### Senaryo 4: Önbellekleme (Caching)

```dart
class Cache<T> {
  final Map<String, T> _cache = {};
  final Map<String, DateTime> _timestamps = {};
  final Duration _maxAge;
  
  Cache({Duration maxAge = const Duration(minutes: 5)})
      : _maxAge = maxAge;
  
  T? get(String key) {
    if (!_cache.containsKey(key)) {
      return null;  // Cache'de yok
    }
    
    DateTime? timestamp = _timestamps[key];
    if (timestamp == null) {
      return null;
    }
    
    // Süre dolmuş mu?
    if (DateTime.now().difference(timestamp) > _maxAge) {
      _cache.remove(key);
      _timestamps.remove(key);
      return null;
    }
    
    return _cache[key];
  }
  
  void set(String key, T value) {
    _cache[key] = value;
    _timestamps[key] = DateTime.now();
  }
  
  T getOrFetch(String key, T Function() fetch) {
    T? cached = get(key);
    if (cached != null) {
      return cached;
    }
    
    T value = fetch();
    set(key, value);
    return value;
  }
}

// Kullanım
var userCache = Cache<User>();

User getUser(String id) {
  return userCache.getOrFetch(
    id,
    () => api.fetchUser(id),  // Sadece cache'de yoksa çağrılır
  );
}
```

### Senaryo 5: Ayarlar Yönetimi

```dart
class AppSettings {
  // Nullable ayarlar
  String? _theme;
  String? _language;
  bool? _notifications;
  int? _fontSize;
  
  // Getter'lar varsayılan değerlerle
  String get theme => _theme ?? 'light';
  String get language => _language ?? 'tr';
  bool get notifications => _notifications ?? true;
  int get fontSize => _fontSize ?? 14;
  
  // Ayarları yükle
  Future<void> load() async {
    _theme = await storage.read('theme');
    _language = await storage.read('language');
    _notifications = await storage.readBool('notifications');
    _fontSize = await storage.readInt('fontSize');
  }
  
  // Ayarları kaydet
  Future<void> setTheme(String theme) async {
    _theme = theme;
    await storage.write('theme', theme);
  }
  
  Future<void> setLanguage(String language) async {
    _language = language;
    await storage.write('language', language);
  }
  
  // Ayarları sıfırla
  Future<void> reset() async {
    _theme = null;
    _language = null;
    _notifications = null;
    _fontSize = null;
    await storage.clear();
  }
}
```

### Senaryo 6: Arama ve Filtreleme

```dart
class ProductFilter {
  String? searchQuery;
  double? minPrice;
  double? maxPrice;
  String? category;
  List<String>? tags;
  bool? inStock;
  
  List<Product> apply(List<Product> products) {
    var filtered = products;
    
    // Arama sorgusu varsa filtrele
    if (searchQuery != null && searchQuery!.isNotEmpty) {
      filtered = filtered.where((p) =>
        p.name.toLowerCase().contains(searchQuery!.toLowerCase())
      ).toList();
    }
    
    // Minimum fiyat varsa filtrele
    if (minPrice != null) {
      filtered = filtered.where((p) => p.price >= minPrice!).toList();
    }
    
    // Maksimum fiyat varsa filtrele
    if (maxPrice != null) {
      filtered = filtered.where((p) => p.price <= maxPrice!).toList();
    }
    
    // Kategori varsa filtrele
    if (category != null) {
      filtered = filtered.where((p) => p.category == category).toList();
    }
    
    // Tag'ler varsa filtrele
    if (tags != null && tags!.isNotEmpty) {
      filtered = filtered.where((p) =>
        tags!.any((tag) => p.tags.contains(tag))
      ).toList();
    }
    
    // Stok durumu varsa filtrele
    if (inStock != null) {
      filtered = filtered.where((p) => p.inStock == inStock).toList();
    }
    
    return filtered;
  }
  
  bool get hasFilters =>
    searchQuery != null ||
    minPrice != null ||
    maxPrice != null ||
    category != null ||
    (tags != null && tags!.isNotEmpty) ||
    inStock != null;
}
```

---

## ✅ İyi ve Kötü Pratikler

### İyi Pratikler ✅

#### 1. Varsayılan Olarak Non-Nullable Kullan

```dart
✅ İYİ
class User {
  String name;          // Zorunlu alanlar non-nullable
  String email;
  int age;
  
  String? bio;          // Sadece gerçekten opsiyonel olanlar nullable
  String? phoneNumber;
}

❌ KÖTÜ
class User {
  String? name;         // Her şey nullable - gereksiz
  String? email;
  int? age;
  String? bio;
}
```

#### 2. `??` Operatörü ile Varsayılan Değer Belirle

```dart
✅ İYİ
String userName = user?.name ?? "Guest";
int count = items?.length ?? 0;

❌ KÖTÜ
String userName;
if (user != null && user.name != null) {
  userName = user.name!;
} else {
  userName = "Guest";
}
```

#### 3. `?.` ile Güvenli Erişim

```dart
✅ İYİ
int? length = name?.length;
String? upper = text?.toUpperCase();

❌ KÖTÜ
int? length;
if (name != null) {
  length = name.length;
}
```

#### 4. Erken Return Pattern

```dart
✅ İYİ
void processUser(User? user) {
  if (user == null) return;
  
  // Artık user kesinlikle null değil
  print(user.name);
  print(user.email);
}

❌ KÖTÜ
void processUser(User? user) {
  if (user != null) {
    print(user.name);
    print(user.email);
    // Çok iç içe bloklar
  }
}
```

#### 5. Late ile Lazy Initialization

```dart
✅ İYİ
class Database {
  late final Connection connection = _connect();
  
  Connection _connect() {
    // Ağır işlem, sadece gerektiğinde çalışır
    return Connection();
  }
}

❌ KÖTÜ
class Database {
  Connection? connection;
  
  Connection getConnection() {
    connection ??= _connect();
    return connection!;
  }
}
```

#### 6. Null Check'ten Sonra Non-Nullable Kullan

```dart
✅ İYİ
String? name;
if (name != null) {
  // Type promotion - artık String (non-nullable)
  print(name.toUpperCase());
}

❌ KÖTÜ
String? name;
if (name != null) {
  print(name!.toUpperCase());  // Gereksiz !
}
```

### Kötü Pratikler ❌

#### 1. Aşırı ! Kullanımı

```dart
❌ KÖTÜ
user!.address!.street!.name!.toUpperCase()

✅ İYİ
user?.address?.street?.name?.toUpperCase() ?? "Bilinmiyor"
```

#### 2. Her Şeyi Nullable Yapmak

```dart
❌ KÖTÜ
String? name;
String? email;
int? age;
bool? active;
// Her şey nullable - gereksiz karmaşa

✅ İYİ
String name;           // Zorunlu
String email;          // Zorunlu
int age;               // Zorunlu
bool active;           // Zorunlu
String? nickname;      // Sadece bu opsiyonel
```

#### 3. Null Kontrolsüz Erişim

```dart
❌ KÖTÜ
String? name;
print(name.length);    // HATA!

✅ İYİ
String? name;
print(name?.length ?? 0);
```

#### 4. Late'i Yanlış Kullanmak

```dart
❌ KÖTÜ
late String name;
print(name);           // ÇÖKER! Atanmadan kullanıldı

✅ İYİ
late String name;
name = "Ahmet";
print(name);           // Güvenli
```

#### 5. Gereksiz Null Check'ler

```dart
❌ KÖTÜ
String name = "Ahmet";  // Zaten non-nullable
if (name != null) {     // Gereksiz kontrol
  print(name);
}

✅ İYİ
String name = "Ahmet";
print(name);            // Direkt kullan
```

#### 6. Cascade ile ! Kullanımı

```dart
❌ KÖTÜ
user!
  ..name = "Ahmet"
  ..email = "test@test.com"
  ..save();

✅ İYİ
final user = this.user;
if (user != null) {
  user
    ..name = "Ahmet"
    ..email = "test@test.com"
    ..save();
}
```

### Performans İpuçları

```dart
// ✅ Bir kez kontrol et, sonra kullan
String? name;
if (name != null) {
  final safeName = name;  // Local variable
  print(safeName.toUpperCase());
  print(safeName.length);
  print(safeName.toLowerCase());
}

// ❌ Her seferinde kontrol
String? name;
print(name?.toUpperCase() ?? "");
print(name?.length ?? 0);
print(name?.toLowerCase() ?? "");
```

### Okunabilirlik İpuçları

```dart
// ✅ İyi isimlendirme
String? optionalName;
String? maybeEmail;
User? foundUser;

// ❌ Kötü isimlendirme
String? n;
String? e;
User? u;
```

---

## ❓ Sık Sorulan Sorular

### S1: Null ve Empty String arasındaki fark nedir?

**Cevap:**
```dart
String? a = null;      // Değer yok (hiçbir şey)
String b = "";         // Değer var ama boş (boş string)
String c = "test";     // Değer var ve dolu

print(a?.length);      // null (değer yok)
print(b.length);       // 0 (boş string)
print(c.length);       // 4 (dolu string)
```

**Analoji:**
- `null` → Kutu yok
- `""` → Boş kutu
- `"test"` → İçinde test olan kutu

### S2: Late ne zaman, nullable ne zaman kullanmalıyım?

**Cevap:**

**Late kullan:**
- İç class değişkenleri için
- Kesinlikle değer alacağını biliyorsan
- Lazy initialization istiyorsan
- Performans önemliyse

**Nullable kullan:**
- Public API'ler için
- Gerçekten null olabilecek değerler için
- Method parametreleri için
- Optional alanlar için

```dart
class Example {
  late String _internal;      // İç kullanım, late
  String? publicValue;        // Dış kullanım, nullable
}
```

### S3: ! operatörü ne zaman güvenlidir?

**Cevap:**

Sadece şu durumlarda güvenlidir:
1. Az önce null kontrolü yaptıysanız
2. Kesinlikle değer olduğunu biliyorsanız
3. Test kodlarında

```dart
// ✅ Güvenli
if (name != null) {
  print(name!);  // Az önce kontrol ettik
}

// ✅ Güvenli
String? name = "Ahmet";
print(name!);  // Kesinlikle değer var

// ❌ Güvensiz
String? name;
print(name!);  // ÇÖKER!
```

**Kural:** `!` kullanmak yerine `?.` veya `??` tercih edin!

### S4: Nullable list ile list of nullable arasındaki fark nedir?

**Cevap:**

```dart
// Nullable List (liste kendisi null olabilir)
List<String>? nullableList;
nullableList = null;        // ✅ Geçerli
nullableList = ["a", "b"];  // ✅ Geçerli

// List of Nullable (listenin elemanları null olabilir)
List<String?> listOfNullable = [null, "a", null, "b"];
// listOfNullable = null;   // ❌ HATA! Liste null olamaz

// Her ikisi de nullable
List<String?>? both;
both = null;                // ✅ Liste null
both = [null, "a", null];   // ✅ Elemanlar null
```

### S5: Null Safety öncesi kodum nasıl çalışıyor?

**Cevap:**

Dart, geriye dönük uyumlu. Eski kod çalışmaya devam eder:

```dart
// @dart=2.9  (Dosya başına ekle)
// Null safety'siz mod

String name;  // null olabilir (eski davranış)
```

**Önerim:** Yeni projelerde kesinlikle Null Safety kullanın!

### S6: Type promotion nasıl çalışır?

**Cevap:**

Dart akıllıca tip çıkarımı yapar:

```dart
String? name;

// Bu noktada name: String?
if (name != null) {
  // Bu blokta name: String (non-nullable)
  print(name.toUpperCase());  // ! gerekmez
}
// Bu noktada yine name: String?

// Çalışmayan durum:
if (name != null) {
  delay();  // Başka işlem
  // print(name.length);  // HATA! name değişmiş olabilir
}
```

Type promotion sadece **local değişkenlerde** çalışır:

```dart
class Example {
  String? name;
  
  void test() {
    if (name != null) {
      // print(name.length);  // HATA! Class field'da çalışmaz
      
      final localName = name;
      if (localName != null) {
        print(localName.length);  // ✅ Local'de çalışır
      }
    }
  }
}
```

### S7: Null safety'i nasıl test ederim?

**Cevap:**

```dart
void main() {
  test('nullable değer kontrolü', () {
    String? name;
    expect(name, isNull);
    
    name = "Ahmet";
    expect(name, isNotNull);
    expect(name, equals("Ahmet"));
  });
  
  test('null safety operatörler', () {
    String? name;
    
    // ?? operatörü
    expect(name ?? "default", equals("default"));
    
    // ?. operatörü
    expect(name?.length, isNull);
    
    name = "test";
    expect(name?.length, equals(4));
  });
}
```

---

## 📊 Özet ve Karar Ağacı

### Hızlı Referans Tablosu

| Ne Yapmak İstiyorsun? | Operatör | Örnek |
|----------------------|----------|-------|
| Null olabileceğini belirt | `?` | `String? name` |
| Varsayılan değer ver | `??` | `name ?? "default"` |
| Null ise değer ata | `??=` | `name ??= "default"` |
| Güvenli erişim | `?.` | `name?.length` |
| Kesin garanti | `!` | `name!` (dikkatli!) |
| Sonra değer gelecek | `late` | `late String name` |

### Karar Ağacı

```
Değişken tanımlayacaksın
│
├─ Null olabilir mi?
│  ├─ Evet → String? name
│  └─ Hayır → String name = "değer"
│
├─ Şimdi değer veremiyorum
│  ├─ Null olabilir → String? name
│  └─ Null olmayacak → late String name
│
├─ Değere erişeceksin
│  ├─ Null olabilir
│  │  ├─ Güvenli erişim → name?.property
│  │  ├─ Varsayılan değer → name ?? "default"
│  │  ├─ If kontrolü → if (name != null) { }
│  │  └─ Kesin değil → name! (riskli)
│  │
│  └─ Null olamaz → name.property
```

### Null Safety Checklist

Koda başlamadan önce kendinize sorun:

- [ ] Bu değişken null olabilir mi?
- [ ] Opsiyonel mi, zorunlu mu?
- [ ] Başlangıç değeri verebilir miyim?
- [ ] Erişimde null kontrolü gerekli mi?
- [ ] Varsayılan değer mantıklı mı?
- [ ] Late uygun mu, yoksa nullable mı?

### Son Tavsiyeler

1. **Varsayılan olarak non-nullable kullan** → %80-90 durumda
2. **Nullable sadece gerektiğinde** → %10-20 durumda
3. **! operatöründen kaçın** → Güvenli alternatifleri tercih et
4. **??, ?. operatörlerini sev** → Kod kısalır, güvenli olur
5. **Late'i bilinçli kullan** → Kullanmadan önce değer ata
6. **Null check pattern'leri öğren** → If, ?., ??, late
7. **IDE uyarılarını dinle** → Dart çok akıllı
8. **Test et!** → Null senaryolarını test et

### Daha Fazla Öğrenmek İçin

- 📖 [Dart Official Null Safety Guide](https://dart.dev/null-safety)
- 📖 [Understanding Null Safety](https://dart.dev/null-safety/understanding-null-safety)
- 📖 [Migrating to Null Safety](https://dart.dev/null-safety/migration-guide)
- 🎥 [Dart Null Safety Video](https://www.youtube.com/watch?v=iYhOU9AuaFs)

---

## 🎓 Özet

### Altın Kurallar

1. ✅ **Non-nullable öncelik** - Varsayılan seçeneğiniz olsun
2. ✅ **Nullable sadece gerektiğinde** - Gerçekten null olabilecekse
3. ✅ **??, ?. kullan** - ! yerine güvenli alternatifleri tercih et
4. ✅ **Late bilinçli kullan** - Lazy initialization için ideal
5. ✅ **Null kontrollerini atma** - Her zaman kontrol et

### Son Söz

Null Safety, Dart'ın en önemli özelliklerinden biri. İlk başta karmaşık görünebilir, ancak alıştıkça:

- 💪 Daha güvenli kod yazarsınız
- 🐛 Daha az bug yaşarsınız
- 📝 Daha okunabilir kod üretirsiniz
- 🚀 Daha iyi uygulamalar geliştirirsiniz

**Unutmayın:** Null Safety sizin dostunuz, düşmanınız değil! 🛡️

---

**📝 Not:** Bu dokümanda öğrendiklerinizi `6-NullSafety.dart` dosyasındaki örneklerle pekiştirebilirsiniz.

```bash
dart run 3-NesneTabanliProgramlama/6-NullSafety.dart
```

---

**🎉 Tebrikler!** Dart Null Safety konusunu bitirdiniz. Artık null hatalardan korkmadan kod yazabilirsiniz!

