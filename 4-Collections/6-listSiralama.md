# List Sıralama (Sorting) Konusu

## Genel Bakış

List sıralama, Dart'ta liste elemanlarını belirli kriterlere göre düzenleme işlemidir. Bu konu, veri yapılarında çok önemli bir yer tutar ve gerçek dünya uygulamalarında sıkça kullanılır.

## Temel Kavramlar

### 1. sort() Metodu
- Listelerdeki elemanları sıralar
- Orijinal listeyi değiştirir (in-place sorting)
- Geriye bir değer döndürmez (void)

### 2. compareTo() Metodu
- İki değeri karşılaştırır
- Döndürdüğü değerler:
  - **Negatif**: İlk değer ikinciden küçük
  - **Sıfır**: İki değer eşit
  - **Pozitif**: İlk değer ikinciden büyük

### 3. Comparator
- Karşılaştırma fonksiyonu tanımlar
- `Comparator<T>` türünde
- İki parametre alır ve int döndürür

## Sıralama Türleri

### 1. Sayısal Sıralama

```dart
// Küçükten büyüğe
liste.sort((a, b) => a.compareTo(b));

// Büyükten küçüğe
liste.sort((a, b) => b.compareTo(a));
```

**Örnek:**
```dart
List<int> sayilar = [5, 2, 8, 1, 9];
sayilar.sort((a, b) => a.compareTo(b));
// Sonuç: [1, 2, 5, 8, 9]
```

### 2. String Sıralama

```dart
// Alfabetik sıralama
liste.sort((a, b) => a.compareTo(b));

// Ters alfabetik sıralama
liste.sort((a, b) => b.compareTo(a));
```

**Örnek:**
```dart
List<String> isimler = ["Ahmet", "Mehmet", "Ayşe"];
isimler.sort((a, b) => a.compareTo(b));
// Sonuç: ["Ahmet", "Ayşe", "Mehmet"]
```

### 3. Nesne Sıralama

```dart
class Ogrenci {
  int no;
  String ad;
  String sinif;
  
  Ogrenci(this.no, this.ad, this.sinif);
}

// Numara sıralama
ogrenciler.sort((a, b) => a.no.compareTo(b.no));

// Ad sıralama
ogrenciler.sort((a, b) => a.ad.compareTo(b.ad));

// Sınıf sıralama
ogrenciler.sort((a, b) => a.sinif.compareTo(b.sinif));
```

## Gelişmiş Sıralama Teknikleri

### 1. Çoklu Kriter Sıralama

```dart
// Önce sınıfa göre, sonra ada göre sıralama
ogrenciler.sort((a, b) {
  int sinifKarsilastirma = a.sinif.compareTo(b.sinif);
  if (sinifKarsilastirma != 0) {
    return sinifKarsilastirma;
  }
  return a.ad.compareTo(b.ad);
});
```

### 2. Özel Sıralama Fonksiyonları

```dart
// Uzunluğa göre sıralama
List<String> kelimeler = ["a", "abc", "ab", "abcd"];
kelimeler.sort((a, b) => a.length.compareTo(b.length));
// Sonuç: ["a", "ab", "abc", "abcd"]
```

### 3. Ters Sıralama

```dart
// Ters sıralama için parametreleri yer değiştir
ogrenciler.sort((b, a) => a.no.compareTo(b.no));
```

## Performans ve Algoritma

### 1. Sıralama Algoritması
- Dart'ta **Timsort** algoritması kullanılır
- Kararlı (stable) sıralama
- O(n log n) zaman karmaşıklığı
- O(n) ek bellek kullanımı

### 2. Performans İpuçları
- Küçük listeler için: `sort()` metodu yeterli
- Büyük listeler için: Özel algoritmalar gerekebilir
- Sık sıralama yapılıyorsa: Önceden sıralanmış listeler kullan

## Pratik Örnekler

### 1. Öğrenci Not Sıralama

```dart
class Ogrenci {
  String ad;
  double not;
  
  Ogrenci(this.ad, this.not);
}

List<Ogrenci> ogrenciler = [
  Ogrenci("Ahmet", 85.5),
  Ogrenci("Mehmet", 92.0),
  Ogrenci("Ayşe", 78.5),
];

// Not sıralama (yüksekten düşüğe)
ogrenciler.sort((a, b) => b.not.compareTo(a.not));
```

### 2. Tarih Sıralama

```dart
class Etkinlik {
  String ad;
  DateTime tarih;
  
  Etkinlik(this.ad, this.tarih);
}

List<Etkinlik> etkinlikler = [
  Etkinlik("Konser", DateTime(2024, 3, 15)),
  Etkinlik("Sergi", DateTime(2024, 2, 20)),
  Etkinlik("Tiyatro", DateTime(2024, 4, 10)),
];

// Tarihe göre sıralama (eskiden yeniye)
etkinlikler.sort((a, b) => a.tarih.compareTo(b.tarih));
```

### 3. Karmaşık Sıralama

```dart
class Urun {
  String ad;
  double fiyat;
  int stok;
  
  Urun(this.ad, this.fiyat, this.stok);
}

List<Urun> urunler = [
  Urun("Laptop", 15000, 5),
  Urun("Telefon", 8000, 10),
  Urun("Tablet", 5000, 3),
];

// Önce stok durumuna göre, sonra fiyata göre sıralama
urunler.sort((a, b) {
  int stokKarsilastirma = b.stok.compareTo(a.stok); // Yüksek stok önce
  if (stokKarsilastirma != 0) {
    return stokKarsilastirma;
  }
  return a.fiyat.compareTo(b.fiyat); // Düşük fiyat önce
});
```

## Hata Yönetimi

### 1. Null Değerler

```dart
List<String?> isimler = ["Ahmet", null, "Mehmet", null];

// Null değerleri sona at
isimler.sort((a, b) {
  if (a == null && b == null) return 0;
  if (a == null) return 1;
  if (b == null) return -1;
  return a.compareTo(b);
});
```

### 2. Boş Listeler

```dart
List<int> bosListe = [];
bosListe.sort(); // Hata vermez, güvenli
```

## Alternatif Sıralama Yöntemleri

### 1. sorted() Metodu (Dart 3.0+)

```dart
List<int> orijinal = [5, 2, 8, 1, 9];
List<int> sirali = orijinal.sorted((a, b) => a.compareTo(b));
// Orijinal liste değişmez
```

### 2. reversed() Metodu

```dart
List<int> sayilar = [1, 2, 3, 4, 5];
List<int> ters = sayilar.reversed.toList();
// Sonuç: [5, 4, 3, 2, 1]
```

## En İyi Uygulamalar

### 1. Kod Okunabilirliği

```dart
// Kötü
ogrenciler.sort((a, b) => a.no.compareTo(b.no));

// İyi
Comparator<Ogrenci> numaraSiralama = (a, b) => a.no.compareTo(b.no);
ogrenciler.sort(numaraSiralama);
```

### 2. Yeniden Kullanılabilirlik

```dart
class SiralamaYardimci {
  static void numaraSiralama(List<Ogrenci> ogrenciler) {
    ogrenciler.sort((a, b) => a.no.compareTo(b.no));
  }
  
  static void adSiralama(List<Ogrenci> ogrenciler) {
    ogrenciler.sort((a, b) => a.ad.compareTo(b.ad));
  }
}
```

### 3. Test Edilebilirlik

```dart
void testSiralama() {
  List<Ogrenci> ogrenciler = [
    Ogrenci(3, "C", "1"),
    Ogrenci(1, "A", "1"),
    Ogrenci(2, "B", "1"),
  ];
  
  ogrenciler.sort((a, b) => a.no.compareTo(b.no));
  
  assert(ogrenciler[0].no == 1);
  assert(ogrenciler[1].no == 2);
  assert(ogrenciler[2].no == 3);
}
```

## Özet

List sıralama, Dart'ta veri yapılarının temel işlemlerinden biridir. Bu konuyu öğrenmek için:

1. **Temel kavramları** anlayın (sort, compareTo, Comparator)
2. **Farklı sıralama türlerini** öğrenin
3. **Pratik örnekler** yapın
4. **Performans** konularını göz önünde bulundurun
5. **En iyi uygulamaları** takip edin

Bu bilgilerle, herhangi bir veri türü için etkili sıralama işlemleri gerçekleştirebilirsiniz.
