# 🏗️ Dart Constructor (Yapıcı Metod) - Kapsamlı Rehber

## 📚 İçindekiler
1. [Constructor Nedir?](#constructor-nedir)
2. [Constructor Çeşitleri](#constructor-çeşitleri)
3. [Positional Parameters Constructor](#positional-parameters-constructor)
4. [Named Parameters Constructor](#named-parameters-constructor)
5. [Constructor Body](#constructor-body)
6. [Default Constructor](#default-constructor)
7. [Named Constructor](#named-constructor)
8. [Factory Constructor](#factory-constructor)
9. [Const Constructor](#const-constructor)
10. [Constructor Initialization List](#constructor-initialization-list)
11. [Constructor Redirecting](#constructor-redirecting)
12. [Best Practices (En İyi Uygulamalar)](#best-practices)
13. [Sık Yapılan Hatalar](#sık-yapılan-hatalar)

---

## 🤔 Constructor Nedir?

### Tanım

**Constructor** (Yapıcı), bir class'tan nesne oluşturulurken **otomatik olarak çağrılan özel bir metoddur**.

### Temel Özellikler

```dart
class User {
  String name;
  int age;
  
  // Constructor
  User(this.name, this.age);
}
```

**Constructor Özellikleri:**
- ✅ Class ile aynı isme sahiptir
- ✅ Nesne oluşturulurken otomatik çalışır
- ✅ Return type'ı yoktur (void bile yazılmaz)
- ✅ Nesneye başlangıç değerleri atamak için kullanılır
- ✅ Birden fazla constructor tanımlanabilir

### Neden Constructor Kullanılır?

```dart
// ❌ Constructor olmadan
class User {
  late String name;
  late int age;
}

void main() {
  var user = User();
  user.name = "Ahmet";  // Manuel atama
  user.age = 25;        // Manuel atama
}

// ✅ Constructor ile
class User {
  String name;
  int age;
  
  User(this.name, this.age);
}

void main() {
  var user = User("Ahmet", 25);  // Tek satırda
}
```

**Avantajlar:**
1. ✅ Kod kısalır
2. ✅ Değerlerin girilmesi garantilenir
3. ✅ Validasyon yapılabilir
4. ✅ Daha güvenli ve temiz kod

---

## 🎯 Constructor Çeşitleri

Dart'ta 6 çeşit constructor vardır:

```
DART CONSTRUCTOR ÇEŞİTLERİ
│
├─ 1. Default Constructor (Generative)
├─ 2. Parametreli Constructor
│  ├─ Positional Parameters
│  └─ Named Parameters
├─ 3. Named Constructor
├─ 4. Factory Constructor
├─ 5. Const Constructor
└─ 6. Redirecting Constructor
```

---

## 📍 Positional Parameters Constructor

### Tanım

Parametrelerin **sırası önemli** olan constructor türüdür.

### Syntax

```dart
class ClassName {
  Type property1;
  Type property2;
  
  // Positional Constructor
  ClassName(this.property1, this.property2);
}
```

### Örnekler

#### Örnek 1: Basit Kullanım

```dart
class Araba {
  String marka;
  String model;
  int yil;
  
  // Positional Constructor
  Araba(this.marka, this.model, this.yil);
}

void main() {
  // Sıra önemli: marka, model, yil
  var araba1 = Araba("Toyota", "Corolla", 2023);
  var araba2 = Araba("BMW", "X5", 2024);
  
  print("${araba1.marka} ${araba1.model} ${araba1.yil}");
  // Output: Toyota Corolla 2023
}
```

#### Örnek 2: Constructor Body ile

```dart
class Ogrenci {
  String ad;
  int yas;
  late String kategori;  // Constructor'da hesaplanacak
  
  Ogrenci(this.ad, this.yas) {
    // Constructor body - ekstra işlemler
    if (yas < 18) {
      kategori = "Çocuk";
    } else if (yas < 65) {
      kategori = "Yetişkin";
    } else {
      kategori = "Yaşlı";
    }
  }
}

void main() {
  var ogrenci = Ogrenci("Ali", 16);
  print("${ogrenci.ad}: ${ogrenci.kategori}");  // Ali: Çocuk
}
```

#### Örnek 3: Validasyon ile

```dart
class BankaHesabi {
  String hesapNo;
  double bakiye;
  
  BankaHesabi(this.hesapNo, double ilkBakiye) {
    // Validasyon
    if (ilkBakiye < 0) {
      throw Exception("Bakiye negatif olamaz!");
    }
    bakiye = ilkBakiye;
  }
}

void main() {
  var hesap1 = BankaHesabi("TR001", 1000);  // ✅ Geçerli
  // var hesap2 = BankaHesabi("TR002", -500);  // ❌ Exception!
}
```

### Avantajlar ve Dezavantajlar

| Avantaj | Dezavantaj |
|---------|------------|
| ✅ Kısa ve hızlı yazım | ❌ Sıra önemli |
| ✅ Az parametre için ideal | ❌ Çok parametrede karışık |
| ✅ Performanslı | ❌ Okunabilirlik azalır |

### Ne Zaman Kullanılır?

```dart
// ✅ 2-3 parametre → Positional ideal
class Point {
  int x, y;
  Point(this.x, this.y);  // Kısa ve net
}

// ❌ Çok parametre → Karışık
class User {
  String name, email, phone, address, city, country;
  User(this.name, this.email, this.phone, 
       this.address, this.city, this.country);  // Karışık!
}
```

---

## 🏷️ Named Parameters Constructor

### Tanım

Parametrelerin **isimle verildiği** constructor türüdür. Sıra önemli değildir.

### Syntax

```dart
class ClassName {
  Type property1;
  Type property2;
  
  // Named Constructor
  ClassName({required this.property1, required this.property2});
}
```

### Örnekler

#### Örnek 1: Basit Kullanım

```dart
class User {
  String name;
  String email;
  int age;
  
  // Named Parameters Constructor
  User({required this.name, required this.email, required this.age});
}

void main() {
  // Sıra önemsiz, isimler önemli
  var user1 = User(name: "Ahmet", email: "ahmet@test.com", age: 25);
  var user2 = User(age: 30, name: "Mehmet", email: "mehmet@test.com");
  // Farklı sırada ama çalışır!
  
  print(user1.name);  // Ahmet
  print(user2.name);  // Mehmet
}
```

#### Örnek 2: Optional (Opsiyonel) Parametreler

```dart
class Product {
  String name;
  double price;
  String? description;  // Opsiyonel
  String? category;     // Opsiyonel
  
  Product({
    required this.name,
    required this.price,
    this.description,     // required yok = opsiyonel
    this.category,
  });
}

void main() {
  // Tüm parametreler
  var product1 = Product(
    name: "Laptop",
    price: 15000,
    description: "Gaming laptop",
    category: "Elektronik"
  );
  
  // Sadece zorunlu parametreler
  var product2 = Product(name: "Mouse", price: 150);
  
  print(product2.description);  // null
}
```

#### Örnek 3: Default Değerler

```dart
class AppSettings {
  String language;
  String theme;
  bool notifications;
  int fontSize;
  
  AppSettings({
    this.language = "tr",           // Default: "tr"
    this.theme = "light",           // Default: "light"
    this.notifications = true,      // Default: true
    this.fontSize = 14,             // Default: 14
  });
}

void main() {
  // Hiçbir parametre vermeden
  var settings1 = AppSettings();
  print(settings1.language);  // tr
  
  // Sadece bazı parametreler
  var settings2 = AppSettings(language: "en", theme: "dark");
  print(settings2.language);      // en
  print(settings2.notifications); // true (default)
}
```

#### Örnek 4: Karışık Kullanım

```dart
class Address {
  String city;        // Positional
  String district;    // Positional
  String? street;     // Named + Optional
  String? buildingNo; // Named + Optional
  
  // Positional parametreler önce, named parametreler sonra
  Address(this.city, this.district, {this.street, this.buildingNo});
}

void main() {
  // Positional parametreler zorunlu ve sıralı
  var address1 = Address("İstanbul", "Kadıköy");
  
  // Named parametreler eklenebilir
  var address2 = Address(
    "Ankara", 
    "Çankaya",
    street: "Atatürk Caddesi",
    buildingNo: "42"
  );
}
```

### Avantajlar ve Dezavantajlar

| Avantaj | Dezavantaj |
|---------|------------|
| ✅ Çok okunabilir | ❌ Biraz uzun yazım |
| ✅ Sıra önemsiz | ❌ Her parametreyi yazmak gerekir |
| ✅ Opsiyonel parametreler kolay | |
| ✅ Çok parametrede ideal | |

### Ne Zaman Kullanılır?

```dart
// ✅ 4+ parametre → Named ideal
class User {
  String name, email, phone, address;
  
  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });  // Okunabilir!
}

// ✅ Opsiyonel alanlar → Named ideal
class Profile {
  String username;
  String? bio;
  String? website;
  
  Profile({required this.username, this.bio, this.website});
}
```

---

## 📦 Constructor Body

Constructor içinde **ekstra işlemler** yapılabilir.

### Syntax

```dart
class ClassName {
  Type property;
  
  ClassName(this.property) {
    // Constructor body
    // Ekstra işlemler buraya
  }
}
```

### Örnekler

#### Örnek 1: Hesaplama

```dart
class Rectangle {
  double width;
  double height;
  late double area;    // Hesaplanacak
  late double perimeter;
  
  Rectangle(this.width, this.height) {
    // Alan ve çevre hesapla
    area = width * height;
    perimeter = 2 * (width + height);
    print("Dikdörtgen oluşturuldu: ${width}x${height}");
  }
}

void main() {
  var rect = Rectangle(5, 3);
  // Output: Dikdörtgen oluşturuldu: 5x3
  print("Alan: ${rect.area}");        // 15
  print("Çevre: ${rect.perimeter}");  // 16
}
```

#### Örnek 2: Validasyon

```dart
class Email {
  String address;
  
  Email(String inputEmail) {
    // Email validasyonu
    if (!inputEmail.contains('@')) {
      throw FormatException("Geçersiz email formatı!");
    }
    if (inputEmail.length < 5) {
      throw FormatException("Email çok kısa!");
    }
    address = inputEmail.toLowerCase();
    print("✓ Email oluşturuldu: $address");
  }
}

void main() {
  var email1 = Email("test@example.com");  // ✅ Geçerli
  // var email2 = Email("invalid");        // ❌ Exception!
  // var email3 = Email("a@b");            // ❌ Exception!
}
```

#### Örnek 3: Loglama

```dart
class User {
  String username;
  DateTime createdAt;
  
  User(this.username) {
    createdAt = DateTime.now();
    _logUserCreation();
  }
  
  void _logUserCreation() {
    print("━━━━━━━━━━━━━━━━━━━━━━━━━");
    print("✓ Kullanıcı oluşturuldu");
    print("  Username: $username");
    print("  Zaman: $createdAt");
    print("━━━━━━━━━━━━━━━━━━━━━━━━━");
  }
}

void main() {
  var user = User("ahmet123");
  // Otomatik log yazdırılır
}
```

---

## 🎨 Default Constructor

Her class'ın otomatik olarak bir **default constructor**'ı vardır.

### Örnek

```dart
// Default constructor (gözükmez ama vardır)
class User {
  String? name;
  int? age;
}

void main() {
  var user = User();  // Default constructor çağrıldı
  user.name = "Ahmet";
  user.age = 25;
}

// Kendimiz default constructor yazarsak
class User2 {
  String? name;
  int? age;
  
  // Explicit default constructor
  User2() {
    print("User2 oluşturuldu!");
  }
}
```

---

## 🏷️ Named Constructor

Bir class'ın **farklı şekillerde** oluşturulmasını sağlar.

### Syntax

```dart
class ClassName {
  Type property;
  
  // Normal constructor
  ClassName(this.property);
  
  // Named constructor
  ClassName.name(/* parametreler */) {
    // işlemler
  }
}
```

### Örnekler

#### Örnek 1: Farklı Oluşturma Yolları

```dart
class User {
  String username;
  String email;
  DateTime createdAt;
  
  // Normal constructor
  User(this.username, this.email) : createdAt = DateTime.now();
  
  // Named constructor: Guest kullanıcı
  User.guest() 
    : username = "guest",
      email = "guest@example.com",
      createdAt = DateTime.now() {
    print("Misafir kullanıcı oluşturuldu");
  }
  
  // Named constructor: JSON'dan oluştur
  User.fromJson(Map<String, dynamic> json)
    : username = json['username'],
      email = json['email'],
      createdAt = DateTime.parse(json['created_at']);
  
  // Named constructor: Copy (Kopyalama)
  User.copy(User other)
    : username = other.username,
      email = other.email,
      createdAt = other.createdAt;
}

void main() {
  // Normal constructor
  var user1 = User("ahmet", "ahmet@test.com");
  
  // Guest constructor
  var user2 = User.guest();
  
  // JSON'dan oluştur
  var json = {
    'username': 'mehmet',
    'email': 'mehmet@test.com',
    'created_at': '2024-01-01T10:00:00'
  };
  var user3 = User.fromJson(json);
  
  // Kopyala
  var user4 = User.copy(user1);
  
  print(user2.username);  // guest
  print(user3.username);  // mehmet
}
```

#### Örnek 2: Date Class Benzeri

```dart
class Point {
  double x;
  double y;
  
  // Normal constructor
  Point(this.x, this.y);
  
  // Named: Origin (0, 0)
  Point.origin() : x = 0, y = 0;
  
  // Named: Polar koordinatlardan
  Point.polar(double radius, double angle)
    : x = radius * cos(angle),
      y = radius * sin(angle);
  
  // Named: Sadece x değeri
  Point.onXAxis(this.x) : y = 0;
  
  // Named: Sadece y değeri
  Point.onYAxis(this.y) : x = 0;
  
  @override
  String toString() => "Point($x, $y)";
}

void main() {
  var p1 = Point(3, 4);
  var p2 = Point.origin();
  var p3 = Point.onXAxis(5);
  var p4 = Point.onYAxis(7);
  
  print(p1);  // Point(3.0, 4.0)
  print(p2);  // Point(0.0, 0.0)
  print(p3);  // Point(5.0, 0.0)
  print(p4);  // Point(0.0, 7.0)
}
```

---

## 🏭 Factory Constructor

Nesne oluşturma mantığını **kontrol eden** özel constructor türüdür.

### Özellikler

- ❌ Her zaman yeni nesne oluşturmaz
- ✅ Cache'lenmiş nesne döndürebilir
- ✅ Alt class nesnesi döndürebilir
- ✅ Singleton pattern için idealdir

### Syntax

```dart
class ClassName {
  // Factory constructor
  factory ClassName() {
    // Özel mantık
    return nesne;
  }
}
```

### Örnekler

#### Örnek 1: Singleton Pattern

```dart
class Database {
  static Database? _instance;
  
  // Private constructor
  Database._internal();
  
  // Factory constructor
  factory Database() {
    // Eğer instance yoksa oluştur
    _instance ??= Database._internal();
    // Her zaman aynı instance'ı döndür
    return _instance!;
  }
}

void main() {
  var db1 = Database();
  var db2 = Database();
  
  print(identical(db1, db2));  // true (aynı nesne)
}
```

#### Örnek 2: Cache Mekanizması

```dart
class User {
  final String username;
  static final Map<String, User> _cache = {};
  
  // Private constructor
  User._internal(this.username);
  
  // Factory constructor
  factory User(String username) {
    // Cache'de var mı kontrol et
    if (_cache.containsKey(username)) {
      print("Cache'den alındı: $username");
      return _cache[username]!;
    }
    
    // Yoksa oluştur ve cache'e ekle
    print("Yeni kullanıcı oluşturuldu: $username");
    var user = User._internal(username);
    _cache[username] = user;
    return user;
  }
}

void main() {
  var user1 = User("ahmet");  // Yeni kullanıcı oluşturuldu
  var user2 = User("mehmet"); // Yeni kullanıcı oluşturuldu
  var user3 = User("ahmet");  // Cache'den alındı
  
  print(identical(user1, user3));  // true
}
```

#### Örnek 3: Alt Class Döndürme

```dart
abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') return Circle();
    if (type == 'square') return Square();
    throw 'Unknown shape: $type';
  }
  
  void draw();
}

class Circle implements Shape {
  @override
  void draw() => print("Daire çizildi");
}

class Square implements Shape {
  @override
  void draw() => print("Kare çizildi");
}

void main() {
  var shape1 = Shape('circle');
  var shape2 = Shape('square');
  
  shape1.draw();  // Daire çizildi
  shape2.draw();  // Kare çizildi
}
```

---

## 🔒 Const Constructor

**Compile-time constant** nesneler oluşturur.

### Özellikler

- ✅ Immutable (değiştirilemez) nesneler
- ✅ Performans avantajı
- ✅ Aynı değerler = aynı nesne

### Syntax

```dart
class ClassName {
  final Type property;
  
  const ClassName(this.property);
}
```

### Örnekler

```dart
class Color {
  final int r, g, b;
  
  const Color(this.r, this.g, this.b);
  
  // Named const constructors
  static const Color red = Color(255, 0, 0);
  static const Color green = Color(0, 255, 0);
  static const Color blue = Color(0, 0, 255);
}

void main() {
  // Const nesneler
  const color1 = Color(255, 0, 0);
  const color2 = Color(255, 0, 0);
  
  print(identical(color1, color2));  // true (aynı nesne)
  
  // Predefined colors
  print(Color.red);
}
```

---

## 📝 Constructor Initialization List

Constructor body'den **önce** çalışan özel bir alandır.

### Syntax

```dart
class ClassName {
  Type property;
  
  ClassName(params) : property = value {
    // Constructor body
  }
}
```

### Örnekler

#### Örnek 1: Final Değişken Atama

```dart
class User {
  final String username;
  final String email;
  final DateTime createdAt;
  
  User(this.username, this.email) 
    : createdAt = DateTime.now() {
    print("User oluşturuldu: $username");
  }
}
```

#### Örnek 2: Validasyon

```dart
class Rectangle {
  final double width;
  final double height;
  
  Rectangle(double w, double h)
    : width = w > 0 ? w : throw ArgumentError('Width must be positive'),
      height = h > 0 ? h : throw ArgumentError('Height must be positive');
}
```

#### Örnek 3: Parent Constructor Çağrısı

```dart
class Person {
  String name;
  
  Person(this.name);
}

class Student extends Person {
  int studentId;
  
  // Parent constructor'ı çağır
  Student(String name, this.studentId) : super(name);
}
```

---

## 🔄 Constructor Redirecting

Bir constructor'ın başka bir constructor'ı çağırmasıdır.

### Syntax

```dart
class ClassName {
  Type property;
  
  ClassName(this.property);
  
  // Redirecting
  ClassName.name() : this(defaultValue);
}
```

### Örnek

```dart
class User {
  String username;
  String email;
  bool isActive;
  
  // Ana constructor
  User(this.username, this.email, this.isActive);
  
  // Redirecting: Guest user
  User.guest() : this("guest", "guest@example.com", false);
  
  // Redirecting: Active user
  User.active(String username, String email) 
    : this(username, email, true);
}

void main() {
  var user1 = User("ahmet", "ahmet@test.com", true);
  var user2 = User.guest();
  var user3 = User.active("mehmet", "mehmet@test.com");
  
  print(user2.username);  // guest
  print(user3.isActive);  // true
}
```

---

## ✅ Best Practices (En İyi Uygulamalar)

### 1. İsimlendirme

```dart
// ✅ İYİ - Açıklayıcı named constructors
class User {
  User.fromJson(Map<String, dynamic> json);
  User.guest();
  User.anonymous();
}

// ❌ KÖTÜ - Belirsiz isimler
class User {
  User.from(Map<String, dynamic> json);  // From ne?
  User.new1();  // new1 ne demek?
}
```

### 2. Parametre Seçimi

```dart
// ✅ Az parametre → Positional
class Point {
  double x, y;
  Point(this.x, this.y);
}

// ✅ Çok parametre → Named
class User {
  String name, email, phone, address;
  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
}
```

### 3. Validasyon

```dart
class Email {
  String address;
  
  Email(String email) {
    if (!email.contains('@')) {
      throw FormatException('Invalid email');
    }
    address = email;
  }
}
```

### 4. Immutability

```dart
// ✅ İYİ - Immutable class
class User {
  final String name;
  final String email;
  
  const User(this.name, this.email);
}

// ❌ KÖTÜ - Mutable (değiştirilebilir)
class User {
  String name;
  String email;
  
  User(this.name, this.email);
}
```

---

## ❌ Sık Yapılan Hatalar

### 1. Return Type Yazmak

```dart
// ❌ HATA
void User(String name) {  // Constructor'da return type olmaz!
  this.name = name;
}

// ✅ DOĞRU
User(this.name);
```

### 2. Late ile Constructor

```dart
// ❌ Gereksiz late kullanımı
class User {
  late String name;
  late int age;
  
  User(String n, int a) {
    name = n;
    age = a;
  }
}

// ✅ DOĞRU
class User {
  String name;
  int age;
  
  User(this.name, this.age);
}
```

### 3. Positional Parametre Sırası

```dart
class User {
  String name;
  int age;
  
  User(this.name, this.age);
}

// ❌ HATA - Sıra yanlış
var user = User(25, "Ahmet");  // int ve String yer değiştirmiş!

// ✅ DOĞRU
var user = User("Ahmet", 25);
```

---

## 📊 Özet Tablosu

| Constructor Türü | Kullanım | Örnek |
|-----------------|---------|-------|
| Positional | 2-3 parametre | `User(name, age)` |
| Named | 4+ parametre, opsiyonel | `User({required name, age})` |
| Named Constructor | Farklı oluşturma yolları | `User.fromJson(json)` |
| Factory | Singleton, cache | `factory Database()` |
| Const | Immutable nesneler | `const Color(255, 0, 0)` |
| Redirecting | Constructor'ı yönlendirme | `User.guest() : this(...)` |

---

## 🎓 Son Söz

Constructor'lar, Dart'ta nesne yönelimli programlamanın temel taşlarından biridir. Doğru constructor seçimi:

- 💪 Daha temiz kod
- 🛡️ Daha güvenli uygulamalar
- 📖 Daha okunabilir syntax
- 🚀 Daha iyi performans

sağlar.

**Unutmayın:**
1. Az parametre → Positional
2. Çok parametre → Named
3. Farklı oluşturma → Named Constructor
4. Singleton → Factory
5. Immutable → Const

---

**📝 Not:** Bu dokümanda öğrendiklerinizi `7-ConstructorKullanimi.dart` dosyasındaki örneklerle pekiştirebilirsiniz.

```bash
dart run 3-NesneTabanliProgramlama/7-ConstructorKullanimi.dart
```

---

**🎉 Tebrikler!** Dart Constructor konusunu tamamladınız. Artık profesyonel class'lar oluşturabilirsiniz! 🏗️

