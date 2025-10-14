// ========================= INHERITANCE (Kalıtım) =========================
/*
 * Inheritance (Kalıtım), bir sınıfın başka bir sınıftan özelliklerini ve metodlarını
 * miras almasını sağlar. Bu "IS-A" (Türetme) ilişkisini temsil eder.
 * 
 * Örnek: Toyota bir Arabadır (Toyota IS-A Araba)
 *        Araba bir Araçtır (Araba IS-A Arac)
 * 
 * Terim Karşılıkları:
 * - Parent Class (Ebeveyn Sınıf) = Base Class = Super Class
 * - Child Class (Çocuk Sınıf) = Derived Class = Sub Class
 * 
 * Dart'ta kalıtım için "extends" anahtar kelimesi kullanılır.
 */

// Parent/Base/Super Class - En genel sınıf
// Tüm araçların ortak özelliklerini içerir
class Arac {
  late String renk;
  late String vites;

  // Parent class constructor
  Arac(this.renk, this.vites);
}

// Child/Derived/Sub Class - Araba, Arac sınıfından türetilir
// "extends" kelimesi kalıtımı sağlar
// Araba IS-A Arac (Araba bir Araçtır)
class Araba extends Arac {
  // Araba'ya özgü özellik
  String? kasaTipi;

  // Child class constructor
  // Parent class'ın constructor'ı "super" ile çağırılır
  Araba(this.kasaTipi, String renk, String vites)
    : super(renk, vites); // super, Arac sınıfının constructor'ını çağırır

  /*
   * Alternatif Constructor Yazımı (Dart 2.17+):
   * super.parametreAdi şeklinde doğrudan parent class parametresine erişilir
   * Araba(this.kasaTipi, super.renk, super.vites);
   */
}

// İkinci Seviye Kalıtım - Toyota, Araba sınıfından türetilir
// Çok seviyeli kalıtım (Multi-level Inheritance)
// Toyota IS-A Araba IS-A Arac
class Toyota extends Araba {
  // Toyota'ya özgü özellikler
  late String model;
  late String yil;

  // Constructor - Dart 2.17+ super parametreler kullanımı
  // super.renk, super.vites → Arac sınıfına gider
  // super.kasaTipi → Araba sınıfına gider
  Toyota(this.model, this.yil, super.kasaTipi, super.renk, super.vites);

  /*
   * Kalıtım Zinciri:
   * Toyota'nın constructor'ı → Araba'nın constructor'ına gider
   * Araba'nın constructor'ı → Arac'ın constructor'ına gider
   */

  // Toyota'ya özgü metod
  void BilgileriGoster() {
    // Parent class'lardan gelen özelliklere erişim
    // renk ve vites → Arac'tan gelir
    // kasaTipi → Araba'dan gelir
    // model ve yil → Toyota'ya aittir
    print(
      "Model: $model, Yıl: $yil, Renk: $renk, Vites: $vites, Kasa Tipi: $kasaTipi",
    );
  }
}

void main() {
  print("=== INHERITANCE (KALITIM) ÖRNEĞİ ===\n");

  /*
   * Toyota nesnesi oluşturma
   * 
   * Parametre Sırası:
   * 1. model → Toyota'ya ait
   * 2. yil → Toyota'ya ait
   * 3. kasaTipi → Araba'dan gelir
   * 4. renk → Arac'tan gelir
   * 5. vites → Arac'tan gelir
   * 
   * Kalıtım sayesinde Toyota nesnesi:
   * - Toyota'nın kendi özelliklerine (model, yil)
   * - Araba'nın özelliklerine (kasaTipi)
   * - Arac'ın özelliklerine (renk, vites)
   * sahiptir.
   */
  Toyota corolla = Toyota("Corolla", "2020", "Sedan", "Kırmızı", "Otomatik");

  // Toyota'nın metodunu çağır
  corolla.BilgileriGoster();

  print("\n=== KALITIM ZİNCİRİ ===");
  print("Toyota → Araba → Arac");
  print("Toyota bir Arabadır (IS-A)");
  print("Araba bir Araçtır (IS-A)");
  print("Dolayısıyla Toyota da bir Araçtır (IS-A)");
}
