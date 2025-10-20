# Dart List (Liste) Koleksiyonları - Detaylı Rehber

## İçindekiler
1. [List Nedir?](#list-nedir)
2. [List Tanımlama Yöntemleri](#list-tanımlama-yöntemleri)
3. [List İşlemleri](#list-işlemleri)
4. [List Metodları](#list-metodları)
5. [List Türleri](#list-türleri)
6. [Pratik Örnekler](#pratik-örnekler)
7. [Performans İpuçları](#performans-ipuçları)
8. [Yaygın Hatalar](#yaygın-hatalar)

## List Nedir?

**List (Liste)**, Dart'ta birden fazla veriyi tek bir koleksiyonda tutmak için kullanılan temel veri yapısıdır. Listeler:

- **Sıralıdır**: Her elemanın belirli bir pozisyonu (indeks) vardır
- **Tekrarlanabilir**: Aynı değer birden fazla kez bulunabilir
- **Dinamik**: Çalışma zamanında eleman eklenip çıkarılabilir
- **Tip güvenli**: Belirli bir veri tipinde elemanlar tutabilir

### Temel Özellikler:
```dart
// Liste indeksleri 0'dan başlar
List<String> isimler = ["Ahmet", "Ayşe", "Mehmet"];
//                      [  0   ,   1  ,    2   ]
```

## List Tanımlama Yöntemleri

### 1. Düz Köşeli Parantez ile Tanımlama
```dart
// En yaygın kullanılan yöntem
List<String> isimler = ["Ahmet", "Ayşe", "Mehmet"];
List<int> sayilar = [1, 2, 3, 4, 5];
List<double> puanlar = [85.5, 92.0, 78.5];
```

### 2. List.from() Kullanarak
```dart
// Mevcut bir koleksiyondan liste oluşturma
List<int> sayilar = List.from([1, 2, 3, 4, 5]);

// Başka bir listeden kopyalama
List<String> yeniListe = List.from(isimler);
```

### 3. List.generate() ile Dinamik Oluşturma
```dart
// Belirli uzunlukta ve kurala göre liste oluşturma
List<int> ciftSayilar = List.generate(5, (index) => index * 2);
// Sonuç: [0, 2, 4, 6, 8]

List<String> isimler = List.generate(3, (index) => "Kişi ${index + 1}");
// Sonuç: ["Kişi 1", "Kişi 2", "Kişi 3"]
```

### 4. Boş Liste Oluşturma
```dart
// Boş liste oluşturma
List<String> bosListe = [];
List<int> sayilar = List.empty(growable: true);
```

### 5. Sabit Uzunlukta Liste
```dart
// Uzunluğu sabit olan liste (eleman eklenip çıkarılamaz)
List<String> sabitListe = List.filled(3, "Varsayılan");
// Sonuç: ["Varsayılan", "Varsayılan", "Varsayılan"]
```

## List İşlemleri

### Eleman Ekleme
```dart
List<String> isimler = ["Ahmet", "Ayşe"];

// Sonuna ekleme - O(1) amortize karmaşıklık
isimler.add("Mehmet");           // ["Ahmet", "Ayşe", "Mehmet"]

// Belirli pozisyona ekleme - O(n) karmaşıklık
isimler.insert(1, "Elif");       // ["Ahmet", "Elif", "Ayşe", "Mehmet"]

// Birden fazla eleman ekleme - O(k) karmaşıklık (k = eklenen eleman sayısı)
isimler.addAll(["Ali", "Zeynep"]); // ["Ahmet", "Elif", "Ayşe", "Mehmet", "Ali", "Zeynep"]
```

**Karmaşıklık Notları:**
- `add()`: Amortize O(1) - çoğu durumda çok hızlı, bazen kapasite artırımı gerekebilir
- `insert()`: O(n) - araya ekleme tüm elemanları kaydırır
- `addAll()`: O(k) - eklenen eleman sayısı kadar zaman alır

### Eleman Silme
```dart
List<String> isimler = ["Ahmet", "Elif", "Ayşe", "Mehmet"];

// Değere göre silme - O(n) karmaşıklık
isimler.remove("Elif");          // ["Ahmet", "Ayşe", "Mehmet"]

// İndekse göre silme - O(n) karmaşıklık
isimler.removeAt(0);             // ["Ayşe", "Mehmet"]

// Son elemanı silme - O(1) karmaşıklık
isimler.removeLast();            // ["Ayşe"]

// Belirli koşula uyan elemanları silme - O(n) karmaşıklık
isimler.removeWhere((isim) => isim.length > 4); // 4 karakterden uzun isimleri sil

// Tüm elemanları silme - O(1) karmaşıklık
isimler.clear();                 // []
```

**Karmaşıklık Notları:**
- `remove()`: O(n) - elemanı bulmak için tüm listeyi tarar
- `removeAt()`: O(n) - aradan silme tüm elemanları kaydırır
- `removeLast()`: O(1) - sadece son elemanı siler, çok hızlı
- `removeWhere()`: O(n) - tüm elemanları kontrol eder
- `clear()`: O(1) - sadece referansları temizler

### Eleman Erişimi
```dart
List<String> isimler = ["Ahmet", "Ayşe", "Mehmet"];

// İndeks ile erişim - O(1) karmaşıklık
String ilkIsim = isimler[0];     // "Ahmet"
String sonIsim = isimler[isimler.length - 1]; // "Mehmet"

// Güvenli erişim (hata vermez) - O(1) karmaşıklık
String? guvenliErisim = isimler.length > 5 ? isimler[5] : null;

// İlk ve son eleman - O(1) karmaşıklık
String ilk = isimler.first;      // "Ahmet"
String son = isimler.last;       // "Mehmet"
```

**Karmaşıklık Notları:**
- İndeks erişimi: O(1) - doğrudan bellek adresine erişim, çok hızlı
- `first`/`last`: O(1) - sadece ilk/son elemanı döndürür
- `length`: O(1) - liste boyutu önceden hesaplanmış

## List Metodları

### Arama ve Kontrol Metodları
```dart
List<String> isimler = ["Ahmet", "Ayşe", "Mehmet", "Ayşe"];

// Eleman var mı kontrolü - O(n) karmaşıklık
bool varMi = isimler.contains("Ayşe");        // true

// İndeks bulma - O(n) karmaşıklık
int indeks = isimler.indexOf("Ayşe");         // 1 (ilk bulduğu yer)
int sonIndeks = isimler.lastIndexOf("Ayşe");  // 3 (son bulduğu yer)

// Koşula uyan eleman var mı - O(n) karmaşıklık
bool uzunIsimVar = isimler.any((isim) => isim.length > 5); // false

// Tüm elemanlar koşula uyuyor mu - O(n) karmaşıklık
bool hepsiKisa = isimler.every((isim) => isim.length < 10); // true
```

**Karmaşıklık Notları:**
- `contains()`: O(n) - tüm listeyi tarar, eleman bulunca durur
- `indexOf()`: O(n) - baştan tarar, ilk eşleşmeyi bulur
- `lastIndexOf()`: O(n) - sondan tarar, son eşleşmeyi bulur
- `any()`: O(n) - koşula uyan ilk elemanı bulunca durur
- `every()`: O(n) - tüm elemanları kontrol eder

### Dönüştürme Metodları
```dart
List<int> sayilar = [1, 2, 3, 4, 5];

// Her elemanı dönüştürme - O(n) karmaşıklık
List<String> stringSayilar = sayilar.map((sayi) => sayi.toString()).toList();
// Sonuç: ["1", "2", "3", "4", "5"]

// Koşula uyan elemanları filtreleme - O(n) karmaşıklık
List<int> ciftSayilar = sayilar.where((sayi) => sayi % 2 == 0).toList();
// Sonuç: [2, 4]

// İlk n elemanı alma - O(k) karmaşıklık (k = alınan eleman sayısı)
List<int> ilkUc = sayilar.take(3).toList();   // [1, 2, 3]

// Son n elemanı alma - O(n) karmaşıklık
List<int> sonUc = sayilar.skip(2).toList();   // [3, 4, 5]
```

**Karmaşıklık Notları:**
- `map()`: O(n) - tüm elemanları dönüştürür
- `where()`: O(n) - tüm elemanları kontrol eder
- `take()`: O(k) - sadece istenen kadar eleman alır
- `skip()`: O(n) - atlanacak elemanları da kontrol eder

### Sıralama Metodları
```dart
List<int> sayilar = [5, 2, 8, 1, 9];

// Artan sıralama - O(n log n) karmaşıklık
sayilar.sort();                  // [1, 2, 5, 8, 9]

// Azalan sıralama - O(n log n) karmaşıklık
sayilar.sort((a, b) => b.compareTo(a)); // [9, 8, 5, 2, 1]

// String listesi sıralama - O(n log n) karmaşıklık
List<String> isimler = ["Zeynep", "Ahmet", "Ayşe"];
isimler.sort();                  // ["Ahmet", "Ayşe", "Zeynep"]

// Özel sıralama (uzunluğa göre) - O(n log n) karmaşıklık
isimler.sort((a, b) => a.length.compareTo(b.length));
```

**Karmaşıklık Notları:**
- `sort()`: O(n log n) - TimSort algoritması kullanır, çoğu durumda O(n) yakın performans
- Özel karşılaştırıcı: O(n log n) - her karşılaştırma için fonksiyon çağrısı

### Ters Çevirme
```dart
List<int> sayilar = [1, 2, 3, 4, 5];

// Ters çevirme (orijinal listeyi değiştirmez) - O(n) karmaşıklık
sayilar.reversed.toList();       // [5, 4, 3, 2, 1]

// Orijinal listeyi değiştirmeden ters çevirme - O(n) karmaşıklık
List<int> tersListe = List.from(sayilar.reversed);
```

**Karmaşıklık Notları:**
- `reversed`: O(1) - sadece iterable döndürür, gerçek işlem yapmaz
- `toList()`: O(n) - yeni liste oluşturur ve tüm elemanları kopyalar

## List Türleri

### 1. Growable List (Büyüyebilir Liste)
```dart
List<String> isimler = [];       // Varsayılan olarak büyüyebilir
isimler.add("Yeni isim");        // Eleman eklenebilir
```

### 2. Fixed Length List (Sabit Uzunluklu Liste)
```dart
List<String> sabitListe = List.filled(3, "");
sabitListe[0] = "Ahmet";         // Mevcut eleman değiştirilebilir
// sabitListe.add("Yeni");       // HATA! Eleman eklenemez
```

### 3. Unmodifiable List (Değiştirilemez Liste)
```dart
List<String> orijinal = ["Ahmet", "Ayşe"];
List<String> degistirilemez = List.unmodifiable(orijinal);
// degistirilemez.add("Yeni");   // HATA! Liste değiştirilemez
```

## Pratik Örnekler

### Örnek 1: Öğrenci Notları
```dart
class OgrenciNotlari {
  List<double> notlar = [];
  
  void notEkle(double not) {
    if (not >= 0 && not <= 100) {
      notlar.add(not);
    }
  }
  
  double ortalamaHesapla() {
    if (notlar.isEmpty) return 0;
    return notlar.reduce((a, b) => a + b) / notlar.length;
  }
  
  List<double> yuksekNotlar() {
    return notlar.where((not) => not >= 80).toList();
  }
  
  void notlariSirala() {
    notlar.sort((a, b) => b.compareTo(a)); // Yüksekten düşüğe
  }
}
```

### Örnek 2: Alışveriş Listesi
```dart
class AlisverisListesi {
  List<String> urunler = [];
  
  void urunEkle(String urun) {
    if (!urunler.contains(urun)) {
      urunler.add(urun);
      print("$urun listeye eklendi.");
    } else {
      print("$urun zaten listede var!");
    }
  }
  
  void urunSil(String urun) {
    if (urunler.remove(urun)) {
      print("$urun listeden silindi.");
    } else {
      print("$urun listede bulunamadı!");
    }
  }
  
  void listeyiGoster() {
    if (urunler.isEmpty) {
      print("Liste boş.");
    } else {
      print("Alışveriş Listesi:");
      for (int i = 0; i < urunler.length; i++) {
        print("${i + 1}. ${urunler[i]}");
      }
    }
  }
}
```

### Örnek 3: Sayı İşlemleri
```dart
class SayiIslemleri {
  static List<int> fibonacci(int n) {
    if (n <= 0) return [];
    if (n == 1) return [0];
    if (n == 2) return [0, 1];
    
    List<int> fibonacci = [0, 1];
    for (int i = 2; i < n; i++) {
      fibonacci.add(fibonacci[i-1] + fibonacci[i-2]);
    }
    return fibonacci;
  }
  
  static List<int> asalSayilar(int limit) {
    List<int> asallar = [];
    for (int i = 2; i <= limit; i++) {
      bool asal = true;
      for (int j = 2; j * j <= i; j++) {
        if (i % j == 0) {
          asal = false;
          break;
        }
      }
      if (asal) asallar.add(i);
    }
    return asallar;
  }
}
```

## Performans İpuçları ve Karmaşıklık Özeti

### ⚡ Hızlı İşlemler (O(1))
```dart
// Bu işlemler çok hızlıdır, liste boyutundan bağımsız
liste.isEmpty;        // O(1) - boş mu kontrolü
liste.length;         // O(1) - boyut bilgisi
liste[0];             // O(1) - indeks erişimi
liste.first;          // O(1) - ilk eleman
liste.last;           // O(1) - son eleman
liste.add(item);      // O(1) amortize - sona ekleme
liste.removeLast();   // O(1) - son elemanı silme
liste.clear();        // O(1) - tüm elemanları silme
```

### 🐌 Yavaş İşlemler (O(n))
```dart
// Bu işlemler liste boyutuyla doğru orantılı zaman alır
liste.contains(item);     // O(n) - eleman arama
liste.indexOf(item);      // O(n) - indeks bulma
liste.remove(item);       // O(n) - değere göre silme
liste.removeAt(0);        // O(n) - aradan silme
liste.insert(0, item);    // O(n) - araya ekleme
liste.where(condition);   // O(n) - filtreleme
liste.map(transform);     // O(n) - dönüştürme
```

### 🔥 En Yavaş İşlemler (O(n log n))
```dart
// Sıralama işlemleri
liste.sort();                    // O(n log n) - sıralama
liste.sort(customComparator);    // O(n log n) - özel sıralama
```

### 1. Kapasite Belirtme
```dart
// Büyük listeler için başlangıç kapasitesi belirtin
List<int> buyukListe = List<int>.filled(1000, 0, growable: true);
// Bu, sık add() işlemlerinde performans artışı sağlar
```

### 2. Verimli Arama
```dart
// Sık arama yapılacaksa Set kullanın
Set<String> hizliArama = {"Ahmet", "Ayşe", "Mehmet"};
bool varMi = hizliArama.contains("Ayşe"); // O(1) karmaşıklık

// Listede arama O(n), Set'te arama O(1)
// 1000 elemanlı listede: List.contains() ~1000 karşılaştırma
// 1000 elemanlı Set'te: Set.contains() ~1 karşılaştırma
```

### 3. Bellek Yönetimi
```dart
// Kullanılmayan listeleri temizleyin
List<String> geciciListe = [];
// ... işlemler ...
geciciListe.clear(); // O(1) - Belleği serbest bırak
```

### 4. Performans Karşılaştırması
```dart
// 10,000 elemanlı liste için tahmini süreler:
// O(1) işlemler: ~0.001ms
// O(n) işlemler: ~1ms  
// O(n log n) işlemler: ~13ms

// 100,000 elemanlı liste için:
// O(1) işlemler: ~0.001ms
// O(n) işlemler: ~10ms
// O(n log n) işlemler: ~166ms
```

## Yaygın Hatalar

### 1. Index Out of Range Hatası
```dart
List<String> isimler = ["Ahmet", "Ayşe"];
// String hatali = isimler[5]; // HATA! Index out of range

// Doğru kullanım:
if (isimler.length > 5) {
  String guvenli = isimler[5];
}
```

### 2. Null Safety Sorunları
```dart
List<String?> nullableList = [null, "Ahmet", null];
// String? ilk = nullableList[0]; // null olabilir

// Güvenli kullanım:
String? ilk = nullableList[0];
if (ilk != null) {
  print(ilk.toUpperCase());
}
```

### 3. Tip Uyumsuzluğu
```dart
List<int> sayilar = [1, 2, 3];
// sayilar.add("string"); // HATA! Tip uyumsuzluğu

// Doğru kullanım:
List<dynamic> karisik = [1, "string", 3.14];
```

## Özet

List koleksiyonları Dart'ta en çok kullanılan veri yapılarından biridir. Bu rehberde:

- ✅ List tanımlama yöntemleri
- ✅ Temel işlemler (ekleme, silme, erişim)
- ✅ Gelişmiş metodlar (arama, filtreleme, sıralama)
- ✅ Pratik örnekler ve kullanım senaryoları
- ✅ Performans ipuçları ve yaygın hatalar

öğrendiniz. List kullanımında dikkat edilmesi gereken en önemli noktalar:

1. **Tip güvenliği**: Doğru veri tipini kullanın
2. **Index kontrolü**: Liste sınırları içinde kalın
3. **Null safety**: Null değerleri kontrol edin
4. **Performans**: Büyük listeler için uygun yöntemleri seçin

Bu bilgilerle Dart'ta list koleksiyonlarını etkili bir şekilde kullanabilirsiniz!
