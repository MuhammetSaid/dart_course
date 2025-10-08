// =============================== Bölüm 4: Değişken Kapsamı (Variable Scope) ===============================

/*
DEĞİŞKEN KAPSAMI NEDİR?
Değişken kapsamı, bir değişkenin hangi alanlarda kullanılabileceğini belirler.
Dart'ta değişkenlerin farklı kapsamları (scope) vardır ve bu kapsamlar,
değişkenlerin erişilebilirliğini kontrol eder.

KAPSAM TÜRLERİ:
1. GLOBAL (Genel) Kapsam: Sınıf seviyesinde tanımlanan değişkenler
2. LOCAL (Yerel) Kapsam: Metod/fonksiyon içinde tanımlanan değişkenler
3. BLOCK (Blok) Kapsam: Küme parantezleri {} içinde tanımlanan değişkenler

ÖNEMLİ KURALLAR:
- Local değişkenler, aynı isimde global değişkenleri "gölgeler" (shadowing)
- Global değişkenler, sınıfın tüm metodlarında kullanılabilir
- Local değişkenler, sadece tanımlandığı metod içinde kullanılabilir
*/

class Deneme {
  // ========== GLOBAL (GENEL) KAPSAM ==========
  // Bu değişkenler sınıf seviyesinde tanımlandığı için
  // sınıfın tüm metodlarında kullanılabilir
  int x = 10; // Global değişken
  int y = 20; // Global değişken

  int Toplama() {
    // ========== LOCAL (YEREL) KAPSAM ==========
    // Bu değişken sadece bu metod içinde geçerlidir
    int x = 50; // Local değişken (Global x'i gölgeler)

    // AÇIKLAMA: Burada hangi x kullanılır?
    // Local x = 50 kullanılır (global x = 10 gölgelenir)
    // y ise global değişken olduğu için y = 20 kullanılır

    print("Metod içinde - Local x: $x"); // 50
    print("Metod içinde - Global y: $y"); // 20

    return x + y; // 50 + 20 = 70
  }

  int Cikarma() {
    // Bu metodda local x tanımlanmadığı için global x kullanılır
    print("Cikarma metodunda - Global x: $x"); // 10
    print("Cikarma metodunda - Global y: $y"); // 20

    return x - y; // 10 - 20 = -10
  }

  void KapsamOrnegi() {
    // ========== BLOCK (BLOK) KAPSAM ==========
    if (true) {
      int z = 100; // Bu değişken sadece bu if bloğunda geçerlidir
      print("If bloğu içinde z: $z"); // 100
    }
    // print(z); // ❌ HATA! z burada tanımlı değil

    // Başka bir blok
    for (int i = 0; i < 3; i++) {
      print("Döngü içinde i: $i");
    }
    // print(i); // ❌ HATA! i burada tanımlı değil
  }
}

void main() {
  // ========== NESNE OLUŞTURMA VE METOD ÇAĞIRMA ==========
  var a = Deneme(); // Deneme sınıfından bir nesne oluştur

  print("=== TOPLAMA METODU ===");
  print("Toplama sonucu: ${a.Toplama()}"); // 70

  print("\n=== ÇIKARMA METODU ===");
  print("Çıkarma sonucu: ${a.Cikarma()}"); // -10

  print("\n=== KAPSAM ÖRNEĞİ ===");
  a.KapsamOrnegi();

  // ========== DETAYLI KAPSAM AÇIKLAMASI ==========
  print("\n=== KAPSAM DETAYLARI ===");

  // Global değişkenlere erişim
  print("Global x değeri: ${a.x}"); // 10 (global değişken)
  print("Global y değeri: ${a.y}"); // 20 (global değişken)

  // ========== EK KAPSAM ÖRNEKLERİ ==========
  print("\n=== EK KAPSAM ÖRNEKLERİ ===");

  // Fonksiyon içinde local değişken
  void localFonksiyon() {
    int localSayi = 999;
    print("Local fonksiyon içinde: $localSayi");
  }

  localFonksiyon();
  // print(localSayi); // ❌ HATA! localSayi burada tanımlı değil

  // ========== ÖNEMLİ NOTLAR ==========
  /*
  KAPSAM KURALLARI:
  
  1. GLOBAL KAPSAM:
     - Sınıf seviyesinde tanımlanan değişkenler
     - Sınıfın tüm metodlarında kullanılabilir
     - Nesne yaşadığı sürece varlığını sürdürür
     
  2. LOCAL KAPSAM:
     - Metod/fonksiyon içinde tanımlanan değişkenler
     - Sadece tanımlandığı metod içinde kullanılabilir
     - Metod bittiğinde yok olur
     
  3. BLOCK KAPSAM:
     - {} içinde tanımlanan değişkenler
     - Sadece o blok içinde kullanılabilir
     - Blok bittiğinde yok olur
     
  4. SHADOWING (GÖLGELENME):
     - Aynı isimde local değişken, global değişkeni gölgeler
     - Local değişken öncelikli olur
     - Global değişkene erişmek için this.x kullanılabilir
     
  5. ERİŞİM KURALLARI:
     - İç kapsam, dış kapsamdaki değişkenlere erişebilir
     - Dış kapsam, iç kapsamdaki değişkenlere erişemez
     - Aynı seviyedeki kapsamlar birbirine erişemez
  */
}
