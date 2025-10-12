# 🔒 Dart Visibility Modifier (Erişim Belirleyicileri)

## 📚 İçindekiler
1. [Visibility Modifier Nedir?](#visibility-modifier-nedir)
2. [Public (Herkese Açık)](#public-herkese-açık)
3. [Private (Özel)](#private-özel)
4. [Encapsulation (Kapsülleme)](#encapsulation-kapsülleme)
5. [Getter ve Setter](#getter-ve-setter)
6. [Pratik Örnekler](#pratik-örnekler)
7. [Best Practices](#best-practices)

---

## 🤔 Visibility Modifier Nedir?

**Visibility Modifier** (Erişim Belirleyici), bir class'ın üyelerine (değişken, method) **kimler erişebilir** sorusuna cevap veren mekanizmadır.

### Dart'ın Farkı

```
┌─────────────────────────────────────────────────┐
│  JAVA/C#           │  DART                      │
├────────────────────┼────────────────────────────┤
│  public            │  Varsayılan (alt çizgi yok)│
│  private           │  _altCizgiIle              │
│  protected         │  ❌ YOK                    │
│  internal          │  ❌ YOK                    │
└─────────────────────────────────────────────────┘
```

**Dart'ta sadece 2 seviye var:**
1. ✅ **Public** - Varsayılan, alt çizgi yok
2. 🔒 **Private** - Alt çizgi `_` ile başlar

---

## ✅ Public (Herkese Açık)

### Tanım

**Public**, varsayılan erişim seviyesidir. Alt çizgi olmadan tanımlanan tüm üyeler public'tir.

### Syntax

```dart
class Ornek {
  // Public değişkenler
  String ad;
  int yas;
  
  // Public method
  void selamla() {
    print("Merhaba!");
  }
}
```

### Özellikler

- ✅ **Her yerden erişilebilir**
- ✅ **Diğer dosyalardan erişilebilir**
- ✅ **Varsayılan davranıştır**
- ✅ **Import edildikten sonra kullanılabilir**

### Örnek

```dart
// user.dart
class User {
  String name;      // Public
  String email;     // Public
  
  User(this.name, this.email);
  
  void display() {  // Public
    print("$name - $email");
  }
}

// main.dart
import 'user.dart';

void main() {
  var user = User("Ahmet", "ahmet@test.com");
  print(user.name);   // ✅ Erişilebilir
  user.display();     // ✅ Çağrılabilir
}
```

---

## 🔒 Private (Özel)

### Tanım

**Private**, alt çizgi `_` ile başlayan üyelerdir. **Sadece aynı dosya (library) içinden erişilebilir.**

### Syntax

```dart
class Ornek {
  // Private değişkenler
  String _gizliVeri;
  int _gizliSayi;
  
  // Private method
  void _gizliMetod() {
    print("Bu metod gizli");
  }
}
```

### Özellikler

- 🔒 **Sadece aynı dosyada erişilebilir**
- ❌ **Diğer dosyalardan erişilemez**
- ✅ **Class içinden erişilebilir**
- ✅ **Aynı dosyadaki diğer class'lardan erişilebilir**

### Önemli Not

Dart'ta private **class-level değil, library-level (dosya seviyesinde)** çalışır!

```dart
// Aynı dosya içinde
class A {
  int _privateX = 10;
}

class B {
  void test() {
    var a = A();
    print(a._privateX);  // ✅ ÇALIŞIR! (Aynı dosyada)
  }
}
```

### Örnek: Private Kullanımı

```dart
class BankaHesabi {
  // Private - Dışarıdan değiştirilemez
  double _bakiye = 0;
  
  // Public getter - Sadece okuma
  double get bakiye => _bakiye;
  
  // Public method - Kontrollü yazma
  void paraYatir(double miktar) {
    if (miktar > 0) {
      _bakiye += miktar;
    }
  }
  
  // Private method - İç işlem
  void _logYaz(String mesaj) {
    print("[LOG] $mesaj");
  }
}

void main() {
  var hesap = BankaHesabi();
  
  // hesap._bakiye = 1000000;  // ❌ Başka dosyada erişilemez
  
  print(hesap.bakiye);    // ✅ Getter ile okuma
  hesap.paraYatir(500);   // ✅ Kontrollü yazma
  
  // hesap._logYaz("test");  // ❌ Private method erişilemez
}
```

---

## 🛡️ Encapsulation (Kapsülleme)

### Tanım

**Encapsulation**, verileri gizleme (private) ve kontrollü erişim sağlama (public method/getter/setter) prensididir.

### Neden Önemli?

```dart
// ❌ KÖTÜ - Encapsulation YOK
class User {
  String email;  // Herkes değiştirebilir
  
  User(this.email);
}

void main() {
  var user = User("ahmet@test.com");
  user.email = "gecersiz-email";  // ❌ Validasyon yok!
}

// ✅ İYİ - Encapsulation VAR
class User {
  String _email;  // Private
  
  User(this._email);
  
  String get email => _email;
  
  set email(String value) {
    if (value.contains('@')) {
      _email = value;
    } else {
      throw FormatException('Geçersiz email!');
    }
  }
}

void main() {
  var user = User("ahmet@test.com");
  // user._email = "x";  // ❌ Erişilemez
  user.email = "mehmet@test.com";  // ✅ Validasyon ile
}
```

### Encapsulation Avantajları

| Avantaj | Açıklama |
|---------|----------|
| 🛡️ **Veri Koruması** | Veriler doğrudan değiştirilemez |
| ✅ **Validasyon** | Geçersiz değer ataması önlenir |
| 🔧 **Esneklik** | İç yapı değişse dış arayüz sabit kalır |
| 🐛 **Hata Azaltma** | Yanlış kullanım engellenir |
| 📖 **Okunabilirlik** | API daha temiz ve anlaşılır |

---

## 🎯 Getter ve Setter

### Getter (Okuyucu)

**Getter**, private bir değişkeni **okumak** için kullanılan public method'dur.

```dart
class Product {
  double _price = 100;
  
  // Getter
  double get price => _price;
  
  // Getter ile hesaplama
  double get priceWithTax => _price * 1.18;
}

void main() {
  var product = Product();
  print(product.price);        // 100
  print(product.priceWithTax); // 118
}
```

### Setter (Yazıcı)

**Setter**, private bir değişkeni **yazmak** için kullanılan public method'dur.

```dart
class Temperature {
  double _celsius = 0;
  
  // Getter
  double get celsius => _celsius;
  
  // Setter
  set celsius(double value) {
    if (value < -273.15) {
      throw Exception('Sıcaklık mutlak sıfırın altında olamaz!');
    }
    _celsius = value;
  }
  
  // Fahrenheit getter
  double get fahrenheit => (_celsius * 9/5) + 32;
  
  // Fahrenheit setter
  set fahrenheit(double value) {
    _celsius = (value - 32) * 5/9;
  }
}

void main() {
  var temp = Temperature();
  
  temp.celsius = 25;
  print("${temp.celsius}°C = ${temp.fahrenheit}°F");
  // 25°C = 77°F
  
  temp.fahrenheit = 100;
  print("${temp.fahrenheit}°F = ${temp.celsius}°C");
  // 100°F = 37.78°C
}
```

### Read-Only Property

Sadece getter, setter yok → **Read-only** (Sadece okunabilir)

```dart
class Circle {
  final double radius;
  
  Circle(this.radius);
  
  // Read-only - Hesaplanmış değer
  double get area => 3.14 * radius * radius;
  double get circumference => 2 * 3.14 * radius;
}

void main() {
  var circle = Circle(5);
  print(circle.area);  // 78.5
  // circle.area = 100;  // ❌ HATA! Setter yok
}
```

---

## 💡 Pratik Örnekler

### Örnek 1: Kullanıcı Sistemi

```dart
class User {
  String _username;
  String _password;
  int _loginAttempts = 0;
  
  User(this._username, this._password);
  
  // Public getter
  String get username => _username;
  
  // Login - Public method, private veri kullanır
  bool login(String username, String password) {
    if (_loginAttempts >= 3) {
      print("❌ Hesap kilitlendi!");
      return false;
    }
    
    if (_username == username && _password == password) {
      _loginAttempts = 0;
      print("✅ Giriş başarılı!");
      return true;
    } else {
      _loginAttempts++;
      print("❌ Hatalı giriş! Kalan hak: ${3 - _loginAttempts}");
      return false;
    }
  }
  
  // Private method
  void _resetAttempts() {
    _loginAttempts = 0;
  }
}
```

### Örnek 2: Alışveriş Sepeti

```dart
class ShoppingCart {
  List<String> _items = [];
  
  // Read-only
  int get itemCount => _items.length;
  
  // Public method
  void addItem(String item) {
    _items.add(item);
    _logAction("Eklendi: $item");
  }
  
  void removeItem(String item) {
    if (_items.remove(item)) {
      _logAction("Silindi: $item");
    }
  }
  
  void displayItems() {
    print("Sepet (${itemCount} ürün):");
    for (var item in _items) {
      print("  - $item");
    }
  }
  
  // Private method
  void _logAction(String action) {
    print("[LOG ${DateTime.now()}] $action");
  }
}
```

### Örnek 3: Singleton Pattern

```dart
class Database {
  // Private static instance
  static Database? _instance;
  
  // Private constructor
  Database._internal() {
    print("Veritabanı bağlantısı oluşturuldu");
  }
  
  // Public factory
  factory Database() {
    _instance ??= Database._internal();
    return _instance!;
  }
  
  void query(String sql) {
    print("Query: $sql");
  }
}

void main() {
  var db1 = Database();
  var db2 = Database();
  
  print(identical(db1, db2));  // true (aynı instance)
}
```

---

## ✅ Best Practices

### 1. Varsayılan Olarak Private Kullan

```dart
// ✅ İYİ
class User {
  String _name;      // Private
  String _email;     // Private
  
  User(this._name, this._email);
  
  // Public getter'lar
  String get name => _name;
  String get email => _email;
}

// ❌ KÖTÜ - Her şey public
class User {
  String name;
  String email;
  
  User(this.name, this.email);
}
```

### 2. Getter/Setter ile Validasyon

```dart
// ✅ İYİ
class Person {
  int _age = 0;
  
  int get age => _age;
  
  set age(int value) {
    if (value >= 0 && value <= 150) {
      _age = value;
    } else {
      throw ArgumentError('Geçersiz yaş!');
    }
  }
}
```

### 3. Private Helper Methods

```dart
// ✅ İYİ
class Calculator {
  double calculate(double a, double b) {
    _validate(a, b);
    return _compute(a, b);
  }
  
  void _validate(double a, double b) {
    if (b == 0) throw Exception('Sıfıra bölme!');
  }
  
  double _compute(double a, double b) {
    return a / b;
  }
}
```

### 4. Read-Only için Final + Getter

```dart
// ✅ İYİ
class Config {
  final String _apiUrl;
  
  Config(this._apiUrl);
  
  String get apiUrl => _apiUrl;  // Read-only
}
```

### 5. İsimlendirme Kuralları

```dart
// ✅ DOĞRU
class Example {
  String _privateVariable;   // Alt çizgi başta
  String publicVariable;     // Alt çizgi yok
  
  void _privateMethod() { }  // Alt çizgi başta
  void publicMethod() { }    // Alt çizgi yok
}

// ❌ YANLIŞ
class Example {
  String private_variable;   // Yanlış format
  String _public_Variable;   // Public ama alt çizgi var
}
```

---

## 📊 Public vs Private Karşılaştırma

| Özellik | Public | Private |
|---------|--------|---------|
| **Syntax** | `name` | `_name` |
| **Erişim** | Her yerden | Sadece aynı dosya |
| **Import sonrası** | ✅ Erişilebilir | ❌ Erişilemez |
| **Varsayılan** | ✅ Evet | ❌ Hayır |
| **Kullanım** | API, interface | İç mantık |
| **Değiştirme** | ⚠️ Dikkatli | ✅ Özgürce |

---

## 🎓 Özet

### Altın Kurallar

1. ✅ **Varsayılan olarak private kullan** - Gerekmedikçe public yapma
2. ✅ **Encapsulation uygula** - Veriler private, erişim public method ile
3. ✅ **Getter/Setter kullan** - Validasyon ve kontrol için
4. ✅ **Private helper methods** - İç işlemler için
5. ✅ **Alt çizgi sadece başta** - `_name` doğru, `name_` yanlış

### Hızlı Referans

```dart
class Example {
  // Public
  String publicVar = "açık";
  void publicMethod() { }
  
  // Private
  String _privateVar = "gizli";
  void _privateMethod() { }
  
  // Read-only (getter)
  String get readOnly => _privateVar;
  
  // Read-write (getter + setter)
  String get value => _privateVar;
  set value(String v) => _privateVar = v;
}
```

### Ne Zaman Hangisi?

- **Public:** API, dışarıya açık interface
- **Private:** İç mantık, helper methods, hassas veriler
- **Getter:** Veriyi okuma, hesaplanan değerler
- **Setter:** Veriyi kontrollü yazma, validasyon

---

**📝 Not:** Bu dokümanda öğrendiklerinizi `8-visibilityModifier.dart` dosyasındaki örneklerle pekiştirebilirsiniz.

```bash
dart run 3-NesneTabanliProgramlama/8-visibilityModifier.dart
```

---

**🎉 Tebrikler!** Dart Visibility Modifier konusunu tamamladınız. Artık güvenli ve kapsüllenmiş kod yazabilirsiniz! 🔒

