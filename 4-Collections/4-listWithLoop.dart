/*
 * LIST ELEMANLARI GEZME YÖNTEMLERİ
 * 
 * Bu dosyada Dart'ta list elemanlarını gezmenin farklı yöntemlerini öğreneceğiz.
 * List elemanlarını gezmek için genellikle döngüler (loops) kullanırız.
 * 
 * Ana Yöntemler:
 * 1. for-in döngüsü (Enhanced for loop)
 * 2. Geleneksel for döngüsü (Index-based for loop)
 * 3. forEach metodu
 * 4. while döngüsü
 */

void main() {
  // String türünde bir liste oluşturuyoruz
  List<String> meyveler = ["Muz", "Elma", "Portakal"];
  print("Tüm liste: $meyveler");
  print("Liste uzunluğu: ${meyveler.length}");
  print("");

  print("=== 1. FOR-IN DÖNGÜSÜ (Enhanced For Loop) ===");
  print("Bu yöntem en basit ve okunabilir yöntemdir.");
  print("Sadece elemanları gezer, index bilgisi vermez.");
  print("Kullanım: for (var eleman in liste) { ... }");
  print("");

  // for-in döngüsü: Her elemanı tek tek gezer
  for (var meyve in meyveler) {
    print("Meyve: $meyve");
  }

  print("\n" + "=" * 50);
  print("=== 2. GELENEKSEL FOR DÖNGÜSÜ (Index-based For Loop) ===");
  print("Bu yöntem hem elemanı hem de index'ini kullanmamızı sağlar.");
  print("Kullanım: for (int i = 0; i < liste.length; i++) { ... }");
  print("Avantajları:");
  print("- Index bilgisine erişim");
  print("- Belirli aralıkları gezme");
  print("- Geriye doğru gezme");
  print("");

  // Geleneksel for döngüsü: Index ile elemanlara erişim
  for (int i = 0; i < meyveler.length; i++) {
    print("${i + 1}. Meyve: ${meyveler[i]}");
  }

  print("\n" + "=" * 50);
  print("=== 3. FOREACH METODU ===");
  print("Bu yöntem fonksiyonel programlama yaklaşımıdır.");
  print("Kullanım: liste.forEach((eleman) { ... });");
  print("");

  // forEach metodu: Fonksiyonel yaklaşım
  meyveler.forEach((meyve) {
    print("forEach ile: $meyve");
  });

  print("\n" + "=" * 50);
  print("=== 4. WHILE DÖNGÜSÜ ===");
  print("Bu yöntem daha esnek kontrol sağlar.");
  print("Kullanım: while (koşul) { ... }");
  print("");

  // while döngüsü: Manuel kontrol
  int index = 0;
  while (index < meyveler.length) {
    print("while ile ${index + 1}. Meyve: ${meyveler[index]}");
    index++;
  }

  print("\n" + "=" * 50);
  print("=== 5. GERİYE DOĞRU GEZME ===");
  print("Listeyi sondan başa doğru gezelim:");
  print("");

  // Geriye doğru gezme
  for (int i = meyveler.length - 1; i >= 0; i--) {
    print("Geriye doğru ${i + 1}. Meyve: ${meyveler[i]}");
  }

  print("\n" + "=" * 50);
  print("=== 6. ATLAMALI GEZME ===");
  print("Her 2. elemanı gezelim:");
  print("");

  // Atlamalı gezme (her 2. eleman)
  for (int i = 0; i < meyveler.length; i += 2) {
    print("Atlamalı ${i + 1}. Meyve: ${meyveler[i]}");
  }

  print("\n" + "=" * 50);
  print("=== 7. KOŞULLU GEZME ===");
  print("Belirli koşulları sağlayan elemanları gezelim:");
  print("");

  // Koşullu gezme
  for (var meyve in meyveler) {
    if (meyve.length > 4) {
      // 4 karakterden uzun meyveler
      print("Uzun meyve: $meyve (${meyve.length} karakter)");
    }
  }

  print("\n" + "=" * 50);
  print("=== HANGİ YÖNTEMİ KULLANMALIYIZ? ===");
  print("• Basit gezme için: for-in döngüsü");
  print("• Index gerekliyse: Geleneksel for döngüsü");
  print("• Fonksiyonel yaklaşım için: forEach");
  print("• Karmaşık koşullar için: while döngüsü");
  print("• Performans kritikse: Geleneksel for döngüsü");
}
