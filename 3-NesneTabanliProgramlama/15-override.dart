// ========================= OVERRIDE (GEÇERSİZ KILMA) =========================
/*
 * Override (Geçersiz Kılma), kalıtımda child class'ın parent class'tan
 * miras aldığı bir metodu kendi ihtiyacına göre yeniden yazmasıdır.
 * 
 * Amaç:
 * - Parent class'ın genel davranışını, child class için özelleştirmek
 * - Aynı metod ismiyle farklı işlevler sağlamak
 * - Polymorphism (Çok Biçimlilik) için temel oluşturmak
 * 
 * Önemli Noktalar:
 * - Metod imzası (isim, parametreler) aynı olmalı
 * - Dönüş tipi aynı veya alt tip olmalı
 * - @override annotation kullanılması önerilir (zorunlu değil)
 */

// Parent Class - Genel hayvan davranışları
class Hayvan {
  // Parent class'taki metod - Genel bir ses
  void ses() {
    print("Hayvan sesi");
  }

  // Başka bir örnek metod
  void hareketEt() {
    print("Hayvan hareket ediyor");
  }

  // Bilgi göster metodu
  String bilgiVer() {
    return "Bu bir hayvandır";
  }
}

// Child Class - Kedi, Hayvan'dan türetilir
class Kedi extends Hayvan {
  late String renk;

  /*
   * @override Annotation:
   * 
   * Zorunlu DEĞİLDİR, yazmasanız da override çalışır.
   * 
   * Ancak MUTLAKA yazılması önerilir çünkü:
   * 
   * 1. GÜVENLİK:
   *    - Parent class'ta böyle bir metod yoksa hata verir
   *    - Yanlış metod ismi yazdıysanız uyarır
   *    - Metod imzası farklıysa (parametre, dönüş tipi) uyarır
   * 
   * 2. OKUNAKLILIK:
   *    - Kodun daha anlaşılır olmasını sağlar
   *    - Bu metodun override edildiğini açıkça gösterir
   *    - Diğer geliştiricilere ipucu verir
   * 
   * 3. BAKIM:
   *    - Parent class değiştiğinde derleyici uyarır
   *    - IDE desteği daha iyi çalışır
   *    - Refactoring daha güvenli olur
   */

  // Kedi için özelleştirilmiş ses metodu
  @override
  void ses() {
    print("Miyav miyav! 🐱"); // Parent metodun davranışı değiştirildi
  }

  // hareketEt metodu override edilmedi
  // Kedi, Hayvan'ın hareketEt metodunu kullanır

  // bilgiVer metodu override ediliyor
  @override
  String bilgiVer() {
    return "Bu bir kedidir, rengi: $renk";
  }
}

// Başka bir Child Class örneği - Köpek
class Kopek extends Hayvan {
  String cins;

  Kopek(this.cins);

  // Köpek için özelleştirilmiş ses
  @override
  void ses() {
    print("Hav hav! 🐕");
  }

  // Köpek için özelleştirilmiş hareket
  @override
  void hareketEt() {
    print("Köpek koşuyor");
  }

  @override
  String bilgiVer() {
    return "Bu bir köpektir, cinsi: $cins";
  }
}

// Başka bir Child Class - Kuş
class Kus extends Hayvan {
  bool ucabilirMi;

  Kus(this.ucabilirMi);

  @override
  void ses() {
    print("Cik cik! 🐦");
  }

  @override
  void hareketEt() {
    if (ucabilirMi) {
      print("Kuş uçuyor");
    } else {
      print("Kuş yürüyor");
    }
  }

  @override
  String bilgiVer() {
    return "Bu bir kuştur, ${ucabilirMi ? 'uçabilir' : 'uçamaz'}";
  }
}

void main() {
  print("=== OVERRIDE (GEÇERSİZ KILMA) ÖRNEĞİ ===\n");

  // ========================= 1. Basit Override Kullanımı =========================
  print("--- KED İ ÖRNEĞİ ---");
  Kedi kedi = Kedi();
  kedi.renk = "Siyah";

  // Override edilmiş metod çağrılır
  kedi.ses(); // Kedi'nin kendi ses metodu çalışır  (Miyav miyav!)

  // Override edilmemiş metod - Parent'tan gelir
  kedi.hareketEt(); // Hayvan'ın hareketEt metodu çalışır (Hayvan hareket ediyor)

  // Override edilmiş bilgiVer metodu
  print(kedi.bilgiVer()); // Bu bir kedidir, rengi: Siyah

  print("\n--- KÖPEK ÖRNEĞİ ---");
  Kopek kopek = Kopek("Golden Retriever");

  kopek.ses(); // Köpek'in ses metodu (Hav hav!)
  kopek.hareketEt(); // Köpek'in hareketEt metodu (Köpek koşuyor)
  print(kopek.bilgiVer()); // Bu bir köpektir, cinsi: Golden Retriever

  print("\n--- KUŞ ÖRNEĞİ ---");
  Kus kus1 = Kus(true); // Uçabilen kuş
  Kus kus2 = Kus(false); // Uçamayan kuş

  print("Uçabilen kuş:");
  kus1.ses(); // Cik cik! 🐦
  kus1.hareketEt(); // Kuş uçuyor
  print(kus1.bilgiVer()); // Bu bir kuştur, uçabilir

  print("\nUçamayan kuş:");
  kus2.ses(); // Cik cik! 🐦
  kus2.hareketEt(); // Kuş yürüyor
  print(kus2.bilgiVer()); // Bu bir kuştur, uçamaz

  // ========================= 2. Polymorphism ile Override =========================
  print("\n=== POLYMORPHİSM İLE OVERRIDE ===");

  /*
   * Polymorphism (Çok Biçimlilik):
   * Parent class referansı ile child class nesneleri tutulabilir.
   * Override sayesinde, her nesne kendi metodunu çağırır.
   */


  // ========================= 3. Override Kuralları =========================
  print("\n=== OVERRIDE KURALLARI ===");
  print("✅ Metod ismi aynı olmalı");
  print("✅ Parametre sayısı ve tipleri aynı olmalı");
  print("✅ Dönüş tipi aynı veya alt tip olmalı");
  print("✅ @override annotation kullanılması önerilir");
  print("✅ Parent class metodu super ile çağrılabilir");
}
