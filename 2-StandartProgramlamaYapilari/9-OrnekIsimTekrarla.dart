// ========================= 9- Örnek İsim Tekrarla =========================

/*  
 * Bu dosya, Dart dilinde örnek isim tekrarlama programını gösterir.
 * 
 * Program Amacı:
 * - Kullanıcıdan bir isim alır
 * - Kullanıcıdan tekrar sayısı alır
 * - İsmi belirtilen sayıda döngü ile tekrarlar
 * 
 * Kullanılan Kavramlar:
 * - Konsol girişi (stdin)
 * - For döngüsü
 * - String değişkenler
 * - Tip dönüşümü (int.parse)
 */

import 'dart:io'; // Konsol işlemleri için gerekli kütüphane

void main() {
  // ========================= Örnek İsim Tekrarla =========================
  // Bu program, kullanıcıdan alınan ismi belirtilen sayıda ekrana yazdırır.

  // Programın başlığını yazdır
  print("Isim Tekrarlama Programı");
  print("================================\n");

  // Kullanıcıdan isim girişi al
  print("Lütfen Tekrarlanmasını İstediğiniz İsimi Giriniz:");
  // stdin.readLineSync()! : Konsoldan satır okur, ! işareti null olmayacağını garanti eder
  String isim = stdin.readLineSync()!;

  // Kullanıcıdan tekrar sayısını al
  print("Lütfen tekrarlanma sayısını giriniz:");
  // String olarak okunan değeri int'e çeviriyoruz
  var sayac = int.parse(stdin.readLineSync()!);

  // Doğrulama: Sayaç negatif veya sıfır olmamalı
  if (sayac <= 0) {
    print("Hata: Tekrar sayısı 0'dan büyük olmalıdır!");
    return; // Programı sonlandır
  }

  print("\n--- Tekrarlamalar Başlıyor ---\n");

  // For döngüsü ile ismi belirlenen sayıda tekrarla
  // i = 0'dan başlar, sayac'a kadar devam eder (sayac dahil değil)
  // Her döngüde i bir artar (i++)
  for (int i = 0; i < sayac; i++) {
    // ${i + 1}: Döngü sayacını 1'den başlatarak gösterir (0 yerine 1, 1 yerine 2, vb.)
    // $isim: Kullanıcının girdiği ismi yazdırır
    print("${i + 1}. tekrar: $isim");
    print("--------------------------------");
  }

  // Tüm tekrarlamalar tamamlandıktan sonra
  print("\n✓ Toplam $sayac kez tekrarlandı!");
  print("Program Tamamlandı.");
}
