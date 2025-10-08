// ========================= 10- Tek Çift Sayı Bulma =========================

/*  
 * Bu dosya, Dart dilinde tek çift sayı bulma programını gösterir.
 * 
 * Program Amacı:
 * - Kullanıcıdan sürekli sayı alır (sonsuz döngü)
 * - Her sayının tek mi çift mi olduğunu bulur
 * - Sonucu ekrana yazdırır
 * - 0 girildiğinde program sonlanır
 * 
 * Kullanılan Kavramlar:
 * - While döngüsü (sonsuz döngü)
 * - Modül operatörü (%)
 * - Break kullanımı
 * - If-else if-else yapısı
 * 
 * Tek/Çift Mantığı:
 * - Çift Sayı: 2'ye tam bölünen sayı (kalan 0)
 * - Tek Sayı: 2'ye bölündüğünde kalanı 1 olan sayı
 */

import 'dart:io'; // Konsol işlemleri için gerekli kütüphane

void main() {
  // ========================= Tek Çift Sayı Bulma =========================

  // Program başlığını yazdır
  print("Tek Çift Sayı Bulma Programı");
  print("================================");
  print("Bu program sayıların tek mi çift mi olduğunu bulur.");
  print("Programdan çıkmak için 0 (sıfır) giriniz.\n");

  // Sonsuz döngü: while(true) - Kullanıcı 0 girene kadar devam eder
  // Bu tür döngüler genellikle break ile sonlandırılır
  while (true) {
    // Kullanıcıdan sayı girişi iste
    print("Lütfen bir sayı giriniz: (Çıkmak için 0 giriniz)");

    // Konsoldan okunan string değeri integer'a çevir
    var girilenSayi = int.parse(stdin.readLineSync()!);

    // Çıkış Kontrolü: Eğer kullanıcı 0 girdiyse
    if (girilenSayi == 0) {
      print("\n✓ Program sonlandırılıyor...");
      print("İyi günler!");
      break; // Döngüden çık, programı sonlandır
    }
    // Çift Sayı Kontrolü: Sayı 2'ye tam bölünüyorsa (kalan 0 ise)
    else if (girilenSayi % 2 == 0) {
      // Modül operatörü (%): Bir sayının diğerine bölümünden kalanı verir
      // Örnek: 10 % 2 = 0 (10, 2'ye tam bölünür, kalan 0)
      // Örnek: 8 % 2 = 0 (8, çift sayıdır)
      print("✓ $girilenSayi sayısı çift sayıdır.");
      print(
        "   → $girilenSayi ÷ 2 = ${girilenSayi ~/ 2} (Kalan: ${girilenSayi % 2})",
      );
    }
    // Tek Sayı Durumu: Sayı 2'ye bölündüğünde kalan 1 ise
    else {
      // Örnek: 9 % 2 = 1 (9, 2'ye bölündüğünde kalan 1)
      // Örnek: 7 % 2 = 1 (7, tek sayıdır)
      print("✓ $girilenSayi sayısı tek sayıdır.");
      print(
        "   → $girilenSayi ÷ 2 = ${girilenSayi ~/ 2} (Kalan: ${girilenSayi % 2})",
      );
    }

    // Okunabilirlik için boş satır
    print("");
  }

  // Bu satır sadece break ile döngüden çıkıldığında çalışır
  // Normal şartlarda while(true) sonsuz döngüdür
}
