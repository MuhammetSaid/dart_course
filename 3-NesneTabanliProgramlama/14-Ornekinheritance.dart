// ========================= INHERITANCE ÖRNEK: EV SİSTEMİ =========================
/*
 * Bu örnek, kalıtımın (inheritance) gerçek hayat senaryolarında nasıl kullanıldığını gösterir.
 * 
 * Senaryo: Farklı ev tipleri (Villa, Saray) ortak özellikleri paylaşır
 * 
 * Kalıtım Hiyerarşisi:
 * Ev (Parent Class)
 *  ├── Villa (Child Class)
 *  └── Saray (Child Class)
 */

// Parent/Base/Super Class - Tüm evlerin ortak özelliklerini içerir
class Ev {
  // Tüm ev tiplerinin ortak özellikleri
  late int pencereSayisi;
  late String adresi;
  late int odaSayisi;

  // Parent class constructor
  // Ortak özellikler burada başlatılır
  Ev(this.pencereSayisi, this.adresi, this.odaSayisi);
}

// Child/Derived Class - Villa, Ev sınıfından türetilir
// Villa IS-A Ev (Villa bir Evdir)
class Villa extends Ev {
  // Villa'ya özgü özellikler
  // Bu özellikler sadece Villa sınıfına aittir
  late int bahceSayisi;
  late int havuzSayisi;

  // Villa constructor
  // super. ile parent class (Ev) parametrelerine direkt erişim sağlanır (Dart 2.17+)
  Villa(
    this.bahceSayisi, // Villa'ya özgü
    this.havuzSayisi, // Villa'ya özgü
    super.pencereSayisi, // Ev'den gelir → Parent class'a gönderilir
    super.adresi, // Ev'den gelir → Parent class'a gönderilir
    super.odaSayisi, // Ev'den gelir → Parent class'a gönderilir
  );

  // Villa'ya özgü metod
  // Kalıtım sayesinde parent class'ın özelliklerine (adresi, pencereSayisi, odaSayisi) erişebiliriz
  String bilgileriGoster() {
    return ("Adres: $adresi, Pencere Sayısı: $pencereSayisi, Oda Sayısı: $odaSayisi, Bahçe Sayısı: $bahceSayisi, Havuz Sayısı: $havuzSayisi");
  }
}

// Child/Derived Class - Saray, Ev sınıfından türetilir
// Saray IS-A Ev (Saray bir Evdir)
class Saray extends Ev {
  // Saray'a özgü özellikler
  late int kuleSayisi;
  late int
  gunesSayisi; // Örnek: Güneş paneli sayısı veya dekoratif güneş motifi sayısı

  // Saray constructor
  // Kısa super parametreler kullanımı
  Saray(
    this.kuleSayisi, // Saray'a özgü
    this.gunesSayisi, // Saray'a özgü
    super.pencereSayisi, // Ev'den gelir
    super.adresi, // Ev'den gelir
    super.odaSayisi, // Ev'den gelir
  );

  // Saray'a özgü metod
  // Parent class özellikleri (adresi, pencereSayisi, odaSayisi) kullanılıyor
  String bilgileriGoster() {
    return ("Adres: $adresi, Pencere Sayısı: $pencereSayisi, Oda Sayısı: $odaSayisi, Kule Sayısı: $kuleSayisi, Güneş Sayısı: $gunesSayisi");
  }
}

void main() {
  print("=== KALITIM ÖRNEĞİ: EV SİSTEMİ ===\n");

  /*
   * Villa nesnesi oluşturma
   * 
   * Parametre Sırası:
   * 1. bahceSayisi: 3 → Villa'ya özgü
   * 2. havuzSayisi: 1 → Villa'ya özgü
   * 3. pencereSayisi: 10 → Ev'den (parent)
   * 4. adresi: "İstanbul" → Ev'den (parent)
   * 5. odaSayisi: 5 → Ev'den (parent)
   * 
   * Kalıtım sayesinde Villa:
   * - Villa'nın kendi özelliklerine (bahceSayisi, havuzSayisi)
   * - Ev'in özelliklerine (pencereSayisi, adresi, odaSayisi)
   * sahip olur.
   */
  print("--- VILLA BİLGİLERİ ---");
  Villa villa1 = Villa(3, 1, 10, "İstanbul", 5);
  print(villa1.bilgileriGoster());

  print("\n--- SARAY BİLGİLERİ ---");
  /*
   * Saray nesnesi oluşturma
   * 
   * Aynı şekilde Saray da:
   * - Saray'ın kendi özelliklerine (kuleSayisi, gunesSayisi)
   * - Ev'in özelliklerine (pencereSayisi, adresi, odaSayisi)
   * sahiptir.
   */
  Saray saray1 = Saray(3, 1, 10, "İstanbul", 5);
  print(saray1.bilgileriGoster());

  print("\n=== KALITIM ZİNCİRİ ===");
  print("Villa → Ev (Villa bir Evdir)");
  print("Saray → Ev (Saray bir Evdir)");

  print("\n=== ORTAK ÖZELLİKLER ===");
  print("Hem Villa hem Saray, Ev sınıfından:");
  print("- pencereSayisi");
  print("- adresi");
  print("- odaSayisi");
  print("özelliklerini miras alır.");

  print("\n=== ÖZGÜN ÖZELLİKLER ===");
  print("Villa'ya özgü: bahceSayisi, havuzSayisi");
  print("Saray'a özgü: kuleSayisi, gunesSayisi");
}
