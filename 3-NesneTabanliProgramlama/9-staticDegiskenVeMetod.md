# ⚡ Dart Static Değişken ve Metod - Kapsamlı Rehber

## 📚 İçindekiler
1. [Static Nedir?](#static-nedir)
2. [Static Değişkenler](#static-değişkenler)
3. [Static Metodlar](#static-metodlar)
4. [Static vs Non-Static](#static-vs-non-static)
5. [Kullanım Alanları](#kullanım-alanları)
6. [Singleton Pattern](#singleton-pattern)
7. [Utility Classes](#utility-classes)
8. [Best Practices](#best-practices)
9. [Sık Yapılan Hatalar](#sık-yapılan-hatalar)

---

## 🤔 Static Nedir?

### Tanım

**Static**, bir class üyesinin (değişken veya metod) **class'a ait** olduğunu belirten anahtar kelimedir. Static üyeler **nesneye bağlı değildir**.

### Temel Kavram

```
┌─────────────────────────────────────────────────┐
│            NORMAL (NON-STATIC)                  │
├─────────────────────────────────────────────────┤
│  Her nesne için AYRI kopya                      │
│  object.member ile erişim                       │
│  Nesne oluşturulmalı                            │
└─────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────┐
│                   STATIC                        │
├─────────────────────────────────────────────────┤
│  Bellekte TEK kopya (tüm nesneler paylaşır)    │
│  ClassName.member ile erişim                    │
│  Nesne oluşturmaya gerek YOK                    │
└─────────────────────────────────────────────────┘
```

### Gerçek Hayat Analojisi

**Okul Sınıfı Örneği:**

```
🏫 Okul (Class)
│
├─ 📊 STATIC → Okul Müdürü
│  └─ Tüm öğrenciler için AYNI müdür
│  └─ Okul adı ile erişilir: "Atatürk İlkokulu.mudur"
│
└─ 👤 NON-STATIC → Öğrenci İsimleri
   └─ Her öğrencinin FARKLI ismi var
   └─ Öğrenci nesnesi ile erişilir: "öğrenci1.isim"
```

### Kod Örneği

```dart
class Okul {
  // STATIC - Tüm öğrenciler paylaşır
  static String okulAdi = "Atatürk İlkokulu";
  static String mudur = "Ali Bey";
  
  // NON-STATIC - Her öğrenci için farklı
  String ogrenciAdi;
  int ogrenciNo;
  
  Okul(this.ogrenciAdi, this.ogrenciNo);
}

void main() {
  // Static - Nesne oluşturmadan erişim
  print(Okul.okulAdi);   // "Atatürk İlkokulu"
  print(Okul.mudur);     // "Ali Bey"
  
  // Non-static - Nesne gerekli
  var ogr1 = Okul("Ahmet", 101);
  var ogr2 = Okul("Mehmet", 102);
  
  print(ogr1.ogrenciAdi);  // "Ahmet"
  print(ogr2.ogrenciAdi);  // "Mehmet"
  
  // İkisi de aynı okul bilgisini paylaşır
  print(ogr1.constructor.okulAdi);  // "Atatürk İlkokulu"
}
```

---

## 📦 Static Değişkenler

### Tanım

**Static değişkenler**, class seviyesinde tanımlanan ve tüm nesnelerce **paylaşılan** değişkenlerdir.

### Syntax

```dart
class ClassName {
  static Type variableName = value;
}
```

### Örnekler

#### Örnek 1: Temel Kullanım

```dart
class Counter {
  // Static değişken - Tüm Counter nesneleri paylaşır
  static int count = 0;
  
  Counter() {
    count++;  // Her nesne oluşturulduğunda artar
  }
}

void main() {
  print("Başlangıç: ${Counter.count}");  // 0
  
  var c1 = Counter();
  print("Birinci nesne: ${Counter.count}");  // 1
  
  var c2 = Counter();
  print("İkinci nesne: ${Counter.count}");  // 2
  
  var c3 = Counter();
  print("Üçüncü nesne: ${Counter.count}");  // 3
}
```

#### Örnek 2: Static Sabitler

```dart
class Colors {
  // Static const - Değişmez sabitler
  static const String red = "#FF0000";
  static const String green = "#00FF00";
  static const String blue = "#0000FF";
  static const String white = "#FFFFFF";
  static const String black = "#000000";
}

void main() {
  print("Kırmızı: ${Colors.red}");
  print("Yeşil: ${Colors.green}");
  
  // Colors.red = "#123456";  // ❌ HATA! const değiştirilemez
}
```

#### Örnek 3: Uygulama Ayarları

```dart
class AppConfig {
  // Static değişkenler - Uygulama genelinde paylaşılır
  static String apiUrl = "https://api.example.com";
  static String apiKey = "ABC123XYZ";
  static int timeout = 30;
  static bool debugMode = true;
  
  static void showConfig() {
    print("API URL: $apiUrl");
    print("Timeout: $timeout seconds");
    print("Debug Mode: $debugMode");
  }
}

void main() {
  AppConfig.showConfig();
  
  // Ayarları değiştir - TÜM uygulama etkilenir
  AppConfig.debugMode = false;
  AppConfig.timeout = 60;
  
  AppConfig.showConfig();
}
```

### Static Değişken Özellikleri

| Özellik | Açıklama |
|---------|----------|
| **Erişim** | `ClassName.variable` |
| **Bellek** | Tek kopya (paylaşılır) |
| **Oluşturma** | Class yüklendiğinde |
| **Yaşam süresi** | Program bitene kadar |
| **Değiştirme** | Tüm nesneleri etkiler |

---

## 🔧 Static Metodlar

### Tanım

**Static metodlar**, nesneye bağlı olmayan ve doğrudan class üzerinden çağrılan fonksiyonlardır.

### Syntax

```dart
class ClassName {
  static ReturnType methodName(parameters) {
    // kod
  }
}
```

### Örnekler

#### Örnek 1: Utility Fonksiyonlar

```dart
class MathUtils {
  // Private constructor - Nesne oluşturulamaz
  MathUtils._();
  
  // Static utility metodlar
  static int topla(int a, int b) => a + b;
  static int cikar(int a, int b) => a - b;
  static int carp(int a, int b) => a * b;
  static double bol(int a, int b) => a / b;
  
  static int kare(int n) => n * n;
  static int kup(int n) => n * n * n;
  
  static bool ciftMi(int n) => n % 2 == 0;
  static bool tekMi(int n) => n % 2 != 0;
}

void main() {
  print(MathUtils.topla(10, 5));     // 15
  print(MathUtils.carp(3, 4));       // 12
  print(MathUtils.kare(5));          // 25
  print(MathUtils.ciftMi(8));        // true
  
  // var math = MathUtils();  // ❌ HATA! Private constructor
}
```

#### Örnek 2: String Utilities

```dart
class StringUtils {
  StringUtils._();
  
  static String buyukHarf(String text) => text.toUpperCase();
  static String kucukHarf(String text) => text.toLowerCase();
  
  static String tersineEvir(String text) {
    return text.split('').reversed.join('');
  }
  
  static bool bosmu(String? text) {
    return text == null || text.isEmpty;
  }
  
  static String ilkHarfBuyut(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}

void main() {
  String metin = "merhaba dünya";
  
  print(StringUtils.buyukHarf(metin));      // MERHABA DÜNYA
  print(StringUtils.tersineEvir(metin));    // aynüd abahrem
  print(StringUtils.ilkHarfBuyut(metin));   // Merhaba dünya
  print(StringUtils.bosmu(""));             // true
}
```

#### Örnek 3: Factory Methods

```dart
class User {
  String name;
  String email;
  String role;
  
  User(this.name, this.email, this.role);
  
  // Static factory methods
  static User createAdmin(String name, String email) {
    return User(name, email, "admin");
  }
  
  static User createGuest() {
    return User("Guest", "guest@example.com", "guest");
  }
  
  static User fromJson(Map<String, dynamic> json) {
    return User(
      json['name'],
      json['email'],
      json['role'] ?? 'user',
    );
  }
  
  void display() {
    print("$name ($role) - $email");
  }
}

void main() {
  var admin = User.createAdmin("Ali", "ali@example.com");
  var guest = User.createGuest();
  
  var json = {'name': 'Ayşe', 'email': 'ayse@example.com'};
  var user = User.fromJson(json);
  
  admin.display();  // Ali (admin) - ali@example.com
  guest.display();  // Guest (guest) - guest@example.com
  user.display();   // Ayşe (user) - ayse@example.com
}
```

### Static Metod Kuralları

```dart
class Example {
  static int staticVar = 10;
  int instanceVar = 20;
  
  // ✅ DOĞRU - Static method, static değişken kullanır
  static void staticMethod1() {
    print(staticVar);  // ✅ Çalışır
  }
  
  // ❌ HATA - Static method, instance değişken kullanamaz
  static void staticMethod2() {
    // print(instanceVar);  // ❌ HATA!
    // print(this.instanceVar);  // ❌ this kullanılamaz!
  }
  
  // ✅ DOĞRU - Instance method, her şeyi kullanabilir
  void instanceMethod() {
    print(staticVar);     // ✅ Çalışır
    print(instanceVar);   // ✅ Çalışır
  }
}
```

---

## 🔄 Static vs Non-Static

### Karşılaştırma Tablosu

| Özellik | Static | Non-Static |
|---------|--------|------------|
| **Aidiyet** | Class'a ait | Nesneye ait |
| **Erişim** | `ClassName.member` | `object.member` |
| **Bellek** | Tek kopya | Her nesne için ayrı |
| **Oluşturma** | Nesne gerektirmez | Nesne gerektirir |
| **Paylaşım** | Tüm nesneler paylaşır | Her nesneye özel |
| **this** | ❌ Kullanılamaz | ✅ Kullanılabilir |
| **Kullanım** | Utility, sabitler | Nesne davranışları |

### Görsel Karşılaştırma

```
STATIC DEĞİŞKEN
┌──────────────────────┐
│   Class: Counter     │
│   static count = 0   │  ← Bellekte tek yer
└──────────────────────┘
         ↓  ↓  ↓
    ┌────┐┌────┐┌────┐
    │ c1 ││ c2 ││ c3 │  ← Tüm nesneler aynı count'u görür
    └────┘└────┘└────┘

NON-STATIC DEĞİŞKEN
┌──────────────────────┐
│   Class: Person      │
└──────────────────────┘
         ↓
    ┌─────────┐  ┌─────────┐  ┌─────────┐
    │ name:Ali│  │name:Veli│  │name:Ayşe│
    │ age: 25 │  │ age: 30 │  │ age: 28 │
    └─────────┘  └─────────┘  └─────────┘
    Her nesnenin kendi değerleri var
```

### Örnek: İkisini Birlikte Kullanmak

```dart
class BankAccount {
  // STATIC - Tüm hesaplar için ortak
  static String bankName = "ABC Bank";
  static double interestRate = 0.05;  // %5
  static int totalAccounts = 0;
  
  // NON-STATIC - Her hesap için farklı
  String accountNumber;
  String ownerName;
  double balance;
  
  BankAccount(this.accountNumber, this.ownerName, this.balance) {
    totalAccounts++;  // Static sayaç artır
  }
  
  // Static method
  static void showBankInfo() {
    print("Banka: $bankName");
    print("Faiz Oranı: ${interestRate * 100}%");
    print("Toplam Hesap: $totalAccounts");
  }
  
  // Instance method
  void showAccountInfo() {
    print("\nHesap No: $accountNumber");
    print("Sahibi: $ownerName");
    print("Bakiye: $balance TL");
    print("Banka: $bankName");  // Static'e erişebilir
  }
  
  void addInterest() {
    balance += balance * interestRate;  // Static rate kullan
    print("Faiz eklendi. Yeni bakiye: $balance TL");
  }
}

void main() {
  // Static method - Nesne olmadan
  BankAccount.showBankInfo();
  
  // Hesaplar oluştur
  var acc1 = BankAccount("TR001", "Ali", 1000);
  var acc2 = BankAccount("TR002", "Veli", 2000);
  
  acc1.showAccountInfo();
  acc2.showAccountInfo();
  
  // Faiz oranını değiştir - TÜM hesapları etkiler
  print("\n🔄 Faiz oranı güncelleniyor...");
  BankAccount.interestRate = 0.08;  // %8
  
  acc1.addInterest();
  acc2.addInterest();
  
  print("");
  BankAccount.showBankInfo();
}
```

---

## 🎯 Kullanım Alanları

### 1. Sabitler (Constants)

```dart
class AppConstants {
  // Static const - Değişmez değerler
  static const String appName = "My App";
  static const String version = "1.0.0";
  static const int maxLoginAttempts = 3;
  static const Duration sessionTimeout = Duration(minutes: 30);
  
  // Math constants
  static const double pi = 3.14159;
  static const double e = 2.71828;
}
```

### 2. Utility Functions (Yardımcı Fonksiyonlar)

```dart
class DateUtils {
  DateUtils._();
  
  static String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
  
  static bool isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || 
           date.weekday == DateTime.sunday;
  }
  
  static int daysBetween(DateTime from, DateTime to) {
    return to.difference(from).inDays;
  }
}
```

### 3. Sayaçlar (Counters)

```dart
class User {
  static int _userCount = 0;
  static int get userCount => _userCount;
  
  String username;
  
  User(this.username) {
    _userCount++;
  }
  
  static void resetCounter() {
    _userCount = 0;
  }
}
```

### 4. Cache Mekanizması

```dart
class ImageCache {
  static final Map<String, Image> _cache = {};
  
  static Image? get(String url) {
    return _cache[url];
  }
  
  static void put(String url, Image image) {
    _cache[url] = image;
  }
  
  static void clear() {
    _cache.clear();
  }
  
  static int get size => _cache.length;
}
```

### 5. Configuration (Yapılandırma)

```dart
class Config {
  static bool isDebugMode = false;
  static String environment = "production";
  static Map<String, String> apiEndpoints = {
    'users': '/api/users',
    'products': '/api/products',
  };
  
  static void setDebugMode(bool value) {
    isDebugMode = value;
    print("Debug mode: ${value ? 'ON' : 'OFF'}");
  }
}
```

---

## 🏭 Singleton Pattern

### Tanım

**Singleton**, bir class'tan sadece **bir tane nesne** oluşturulmasını garanti eden tasarım desenidir.

### Implementasyon

```dart
class Database {
  // 1. Private static instance
  static Database? _instance;
  
  // 2. Private constructor
  Database._internal() {
    print("🔗 Database connection created");
  }
  
  // 3. Public static factory
  factory Database() {
    _instance ??= Database._internal();
    return _instance!;
  }
  
  // 4. Instance methods
  void query(String sql) {
    print("Executing: $sql");
  }
}

void main() {
  var db1 = Database();  // Yeni instance oluşturulur
  var db2 = Database();  // Aynı instance döner
  var db3 = Database();  // Aynı instance döner
  
  print(identical(db1, db2));  // true
  print(identical(db2, db3));  // true
  
  db1.query("SELECT * FROM users");
}
```

### Lazy Singleton

```dart
class Logger {
  static Logger? _instance;
  static Logger get instance {
    _instance ??= Logger._();
    return _instance!;
  }
  
  Logger._() {
    print("Logger initialized");
  }
  
  void log(String message) {
    print("[LOG] $message");
  }
}

void main() {
  Logger.instance.log("App started");
  Logger.instance.log("User logged in");
}
```

---

## 🛠️ Utility Classes

### Tanım

**Utility class**, sadece static metodlar içeren ve nesne oluşturmaya gerek olmayan yardımcı class'lardır.

### Best Practice

```dart
class Validators {
  // Private constructor - Nesne oluşturulamaz
  Validators._();
  
  static bool isEmail(String email) {
    return email.contains('@') && email.contains('.');
  }
  
  static bool isPhone(String phone) {
    return RegExp(r'^\d{10}$').hasMatch(phone);
  }
  
  static bool isStrongPassword(String password) {
    return password.length >= 8 &&
           password.contains(RegExp(r'[A-Z]')) &&
           password.contains(RegExp(r'[0-9]'));
  }
  
  static bool isEmpty(String? text) {
    return text == null || text.trim().isEmpty;
  }
}
```

### Dart'ın Kendi Utility Class'ları

```dart
// dart:math
import 'dart:math';

void main() {
  print(pi);              // 3.141592653589793
  print(e);               // 2.718281828459045
  print(max(10, 20));     // 20
  print(min(10, 20));     // 10
  print(sqrt(16));        // 4.0
  
  var random = Random();
  print(random.nextInt(100));  // 0-99 arası
}
```

```dart
// DateTime
void main() {
  var now = DateTime.now();
  print(now);
  
  var birthday = DateTime(1990, 5, 15);
  print(birthday);
  
  var tomorrow = now.add(Duration(days: 1));
  print(tomorrow);
}
```

---

## ✅ Best Practices

### 1. Utility Class için Private Constructor

```dart
// ✅ İYİ - Nesne oluşturulamaz
class Utils {
  Utils._();  // Private constructor
  
  static int topla(int a, int b) => a + b;
}

// ❌ KÖTÜ - Gereksiz nesne oluşturulabilir
class Utils {
  static int topla(int a, int b) => a + b;
}
```

### 2. Sabitler için static const

```dart
// ✅ İYİ - Değişmez sabitler
class Colors {
  static const String red = "#FF0000";
  static const String blue = "#0000FF";
}

// ❌ KÖTÜ - Değiştirilebilir
class Colors {
  static String red = "#FF0000";
}
```

### 3. İsimlendirme

```dart
// ✅ İYİ - Açık ve anlaşılır
class MathUtils {
  static double calculateCircleArea(double radius) {
    return 3.14 * radius * radius;
  }
}

// ❌ KÖTÜ - Belirsiz
class Utils {
  static double calc(double r) {
    return 3.14 * r * r;
  }
}
```

### 4. Sayaç Kontrolü

```dart
class Counter {
  static int _count = 0;
  
  // ✅ İYİ - Private sayaç, public getter
  static int get count => _count;
  
  static void increment() {
    _count++;
  }
  
  static void reset() {
    _count = 0;
  }
}
```

### 5. Static Overuse'den Kaçının

```dart
// ❌ KÖTÜ - Çok fazla static
class User {
  static String? currentUserName;
  static int? currentUserId;
  static String? currentUserEmail;
  // Bu global state yönetimi kötü!
}

// ✅ İYİ - Instance kullan
class User {
  String name;
  int id;
  String email;
  
  User(this.name, this.id, this.email);
}

// ✅ Singleton pattern kullan (gerekirse)
class CurrentUser {
  static CurrentUser? _instance;
  
  String name;
  int id;
  
  CurrentUser._(this.name, this.id);
  
  static void set(String name, int id) {
    _instance = CurrentUser._(name, id);
  }
  
  static CurrentUser? get instance => _instance;
}
```

---

## ❌ Sık Yapılan Hatalar

### 1. Static Method'da Instance Değişken Kullanma

```dart
class Example {
  int instanceVar = 10;
  
  // ❌ HATA
  static void staticMethod() {
    // print(instanceVar);  // HATA! Instance değişken erişilemez
  }
  
  // ✅ DOĞRU
  void instanceMethod() {
    print(instanceVar);  // ✅ Çalışır
  }
}
```

### 2. Nesne Üzerinden Static Erişim

```dart
class Counter {
  static int count = 0;
}

void main() {
  var c = Counter();
  
  // ⚠️ ÇALIŞIR ama önerilmez
  print(c.count);  // Derleyici uyarı verir
  
  // ✅ DOĞRU
  print(Counter.count);  // Class adı ile erişim
}
```

### 3. Static Değişkeni Constructor'da Başlatma

```dart
// ❌ YANLIŞ
class Example {
  static int count;
  
  Example() {
    count = 0;  // Her nesne oluşturulduğunda 0'lanır!
  }
}

// ✅ DOĞRU
class Example {
  static int count = 0;  // Başlangıçta bir kez
  
  Example() {
    count++;  // Artır, sıfırlama
  }
}
```

### 4. this Kullanımı

```dart
class Example {
  static int staticVar = 10;
  
  // ❌ HATA
  static void test() {
    // print(this.staticVar);  // HATA! this kullanılamaz
  }
  
  // ✅ DOĞRU
  static void test2() {
    print(staticVar);  // Doğrudan erişim
  }
}
```

### 5. Gereksiz Static Kullanımı

```dart
// ❌ KÖTÜ - Her şey static
class User {
  static String name = "";
  static int age = 0;
  static String email = "";
  
  static void display() {
    print("$name, $age, $email");
  }
}

// ✅ İYİ - Instance kullan
class User {
  String name;
  int age;
  String email;
  
  User(this.name, this.age, this.email);
  
  void display() {
    print("$name, $age, $email");
  }
}
```

---

## 📊 Özet Tablosu

### Ne Zaman Static, Ne Zaman Instance?

| Durum | Static | Instance |
|-------|--------|----------|
| Utility fonksiyonlar | ✅ | ❌ |
| Sabitler | ✅ | ❌ |
| Sayaçlar (toplam) | ✅ | ❌ |
| Singleton | ✅ | ❌ |
| Factory methods | ✅ | ❌ |
| Nesne davranışları | ❌ | ✅ |
| Nesneye özel veri | ❌ | ✅ |
| Çoklu instance | ❌ | ✅ |

### Hızlı Referans

```dart
class QuickReference {
  // Static const - Değişmez sabitler
  static const String APP_NAME = "MyApp";
  
  // Static değişken - Paylaşılan state
  static int counter = 0;
  
  // Static method - Utility fonksiyon
  static int topla(int a, int b) => a + b;
  
  // Static getter
  static int get doubleCounter => counter * 2;
  
  // Instance değişken - Nesneye özel
  String name;
  
  // Instance method - Nesne davranışı
  void display() => print(name);
  
  QuickReference(this.name);
}

void main() {
  // Static erişim - Nesne gerekmez
  print(QuickReference.APP_NAME);
  print(QuickReference.topla(5, 3));
  
  // Instance erişim - Nesne gerekir
  var obj = QuickReference("Test");
  obj.display();
}
```

---

## 🎓 Son Söz

### Altın Kurallar

1. ✅ **Utility için static kullan** - Math, String utils
2. ✅ **Sabitler static const** - Değişmez değerler
3. ✅ **Singleton için static** - Tek instance gerekirse
4. ✅ **Sayaçlar static** - Toplam nesne takibi
5. ❌ **Her şeyi static yapma** - Nesne davranışları için instance

### Static Kullanım Kararı

```
Soru: Bu üye static olmalı mı?

├─ Tüm nesneler aynı değeri mi paylaşacak?
│  └─ EVET → Static ✅
│  └─ HAYIR → Instance ✅
│
├─ Nesne oluşturmadan kullanılacak mı?
│  └─ EVET → Static ✅
│  └─ HAYIR → Instance ✅
│
└─ Utility/helper fonksiyon mu?
   └─ EVET → Static ✅
   └─ HAYIR → Instance ✅
```

---

**📝 Not:** Bu dokümanda öğrendiklerinizi `9-staticDegiskenVeMetod.dart` dosyasındaki örneklerle pekiştirebilirsiniz.

```bash
dart run 3-NesneTabanliProgramlama/9-staticDegiskenVeMetod.dart
```

---

**🎉 Tebrikler!** Dart Static konusunu tamamladınız. Artık class seviyesinde programlama yapabilirsiniz! ⚡

