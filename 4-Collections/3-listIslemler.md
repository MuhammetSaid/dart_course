## Dart List İşlemleri – Ayrıntılı Rehber

Bu belge `3-listIslemler.dart` dosyasında anlatılan konuları daha kapsamlı ve sistematik bir şekilde ele alır. Örnekler Dart dilinde ve List (liste) koleksiyonları üzerinedir.

### İçerik
- **Boş mu?**: `isEmpty`, `isNotEmpty`
- **Boyut ve sınırlar**: `length`, indeks erişimi
- **İlk/Son eleman**: `first`, `last`
- **Arama**: `contains`, `indexOf`, `lastIndexOf`, `any`, `every`
- **Ters çevirme**: `reversed`
- **Sıralama**: `sort`, özel karşılaştırıcılar
- **Silme**: `removeAt`, `remove`, `removeLast`, `removeWhere`, `clear`
- **Yan etkiler ve hatalar**: boş liste erişimi, sınır taşması, değiştirilebilirlik
- **Performans ve iyi uygulamalar**

---

### Başlangıç: Liste Oluşturma ve Eleman Ekleme
```dart
final List<String> meyveler = [];
final List<String> sebzeler = [];

meyveler.add("Elma");
meyveler.add("armut");
meyveler.add("Kivi");
meyveler.add("muz");
meyveler.add("üzüm");
```

Notlar:
- Küçük/büyük harf duyarlılığı: "Elma" ile "elma" farklı değerlerdir.
- Liste, varsayılan olarak büyüyebilir (growable) yapıdadır; `add`, `insert`, `remove` gibi metodlarla değişir.

---

### Boşluk Kontrolü: `isEmpty` ve `isNotEmpty`
```dart
print("Meyveler boş mu? ${meyveler.isEmpty}"); // false
print("Sebzeler boş mu? ${sebzeler.isEmpty}"); // true
```

İpuçları:
- `isEmpty` O(1) karmaşıklığa sahiptir.
- Çoğu durumda `list.isEmpty` yerine `list.isNotEmpty` ile pozitif kontrol yapmak daha okunaklıdır.

---

### Boyut: `length`
```dart
print("Meyveler uzunluk: ${meyveler.length}");
print("Sebzeler uzunluk: ${sebzeler.length}");
```

Uyarı:
- İndeks erişimi yaparken üst sınırı aşmayın: geçerli indeks aralığı `0..length-1`.

---

### İlk ve Son Eleman: `first`, `last`
```dart
print("İlk meyve: ${meyveler.first}");
print("Son meyve: ${meyveler.last}");

sebzeler.add("Domates");
print("İlk sebze: ${sebzeler.first}");
print("Son sebze: ${sebzeler.last}");
```

Önemli:
- `first`/`last` boş listede çağrılırsa `StateError` fırlatır. Önce `isNotEmpty` kontrolü yapın.

```dart
if (sebzeler.isNotEmpty) {
  print(sebzeler.first);
}
```

---

### Arama: `contains`
```dart
print('meyveler.contains("Kivi"): ${meyveler.contains("Kivi")}');
print('meyveler.contains("Karpuz"): ${meyveler.contains("Karpuz")}');
```

Notlar:
- `contains` eşitlik için `==` kullanır; String’de büyük/küçük harf duyarlıdır.
- Duyarsız arama için tüm elemanları normalize edin:
```dart
final varMi = meyveler.any((m) => m.toLowerCase() == "kivi");
```

Ek arama metodları:
```dart
final ilkIndeks = meyveler.indexOf("Kivi");      // yoksa -1
final sonIndeks = meyveler.lastIndexOf("Kivi");  // yoksa -1
final varUzunIsim = meyveler.any((m) => m.length > 4);
final hepsiKisa = meyveler.every((m) => m.length < 10);
```

---

### Ters Çevirme: `reversed`
```dart
final tersMeyveler = meyveler.reversed.toList();
print("Ters: $tersMeyveler");
```

Detaylar:
- `reversed` bir iterable döndürür; gerçek bir `List` elde etmek için `toList()` çağırın.
- Orijinal listeyi değiştirmez; yeni bir liste üretir.

---

### Sıralama: `sort`
```dart
meyveler.sort();
print("Sıralı meyveler: $meyveler");

final harfler = ["n", "k", "o", "s", "a", "c", "b"]; 
harfler.sort();
print("Sıralı harfler: $harfler");
```

Özel karşılaştırma ile sıralama:
```dart
// Azalan alfabetik
meyveler.sort((a, b) => b.compareTo(a));

// Uzunluğa göre (kısa -> uzun)
meyveler.sort((a, b) => a.length.compareTo(b.length));

// Büyük/küçük harf duyarsız
meyveler.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
```

Performans:
- `sort` tipik olarak O(n log n) karmaşıklığa sahiptir ve listeyi yerinde (in-place) değiştirir.

---

### Silme İşlemleri: `removeAt`, `remove`, `removeLast`, `removeWhere`, `clear`
```dart
print("Önce: $meyveler");

meyveler.removeAt(2);      // indeksteki elemanı siler
print("removeAt sonrası: $meyveler");

meyveler.remove("Elma");   // değere eşit olan ilk elemanı siler
print("remove sonrası: $meyveler");

// Son elemanı silme
if (meyveler.isNotEmpty) {
  meyveler.removeLast();
}

// Koşula uyanları silme
meyveler.removeWhere((m) => m.length <= 3);

// Tüm elemanları silme
meyveler.clear();          // []
```

Uyarılar:
- `removeAt` için indeks aralığını doğrulayın; aksi halde `RangeError` alırsınız.
- `remove` yalnızca ilk eşleşmeyi siler; tüm eşleşmeleri silmek için `removeWhere` kullanın.

---

### Boş Listede Tehlikeli Çağrılar ve Güvenli Kalıplar
- Boş listede `first`, `last`, `removeLast` çağırmak `StateError` üretir.
- Güvenli kullanım:
```dart
if (liste.isNotEmpty) {
  final ilk = liste.first;
}

final eleman = (liste.length > i) ? liste[i] : null; // güvenli indeks erişimi
```

---

### Değiştirilebilirlik (Mutability) ve Kopyalama
- `reversed`, `map`, `where` gibi metodlar genellikle iterable döndürür; listeye ihtiyaç varsa `toList()` kullanın.
- Orijinali bozmadan çalışmak için kopyalayın:
```dart
final kopya = List<String>.from(meyveler); // sığ kopya
```

Değiştirilemez liste ihtiyacı:
```dart
final degistirilemez = List.unmodifiable(meyveler);
// degistirilemez.add("Yeni"); // hata fırlatır
```

---

### Karmaşıklık ve Performans İpuçları
- **Ekleme/Silme (sona)**: Amortize O(1) – `add`, `removeLast`
- **Araya ekleme/silme**: O(n) – `insert`, `removeAt`
- **Arama**: O(n) – `contains`, `indexOf`
- **Sıralama**: O(n log n) – `sort`

İpuçları:
- Sık üyelik kontrolü yapacaksanız `Set` kullanmayı düşünün (O(1) ortalama `contains`).
- Büyük/küçük harf duyarsız sıralama/arama için veriyi normalize edin (`toLowerCase`).
- Çok büyük listelerde gereksiz kopyalardan kaçın (ör. `toList()` yalnızca gerektiğinde).

---

### Ek Örnekler
```dart
// 1) Boş güvenli first/last
String? guvenliFirst(List<String> l) => l.isNotEmpty ? l.first : null;

// 2) Duyarsız arama (containsCaseInsensitive)
bool containsCaseInsensitive(List<String> l, String q) {
  final lowerQ = q.toLowerCase();
  return l.any((e) => e.toLowerCase() == lowerQ);
}

// 3) Özel sıralama: Türkçe alfabe duyarlı (örnek)
// intl paketinde Collator kullanılabilir (bağımlılık eklemek gerekir)
// import 'package:intl/intl.dart';
// void turkceSirala(List<String> l) {
//   final collator = Collator("tr");
//   l.sort((a, b) => collator.compare(a, b));
// }
```

Not: Türkçe alfabe duyarlı sıralama için `intl` paketindeki `Collator` kullanılabilir. Projede ek bağımlılık gerektirir.

---

### Özet
- **Boşluk**: `isEmpty/isNotEmpty` ile kontrol edin; boş listede `first/last` ve `removeLast` tehlikelidir.
- **Erişim**: İndeks sınırlarını doğrulayın; güvenli kalıplar kullanın.
- **Arama**: `contains`, `indexOf`, `any` ve `every` ihtiyaca göre seçin.
- **Ters/Sırala**: `reversed` orijinali bozmaz; `sort` yerinde çalışır ve O(n log n). 
- **Silme**: Değere göre (`remove`) ilk eşleşmeyi, koşula göre (`removeWhere`) tüm eşleşmeleri siler.

Bu rehber, `3-listIslemler.dart` dosyasındaki konuları daha derinlemesine açıklayarak pratikte karşılaşacağınız durumlar için güvenli ve performanslı kalıplar sunar.
