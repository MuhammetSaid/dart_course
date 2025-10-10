// ========================= 8- Break Ve Continue =========================

/*  
 * Bu dosya, Dart dilinde break ve continue kullanımını gösterir.
 * 
 * BREAK: Döngüyü tamamen sonlandırır ve döngüden çıkar
 * CONTINUE: Döngünün o anki turunu atlar ve bir sonraki tura geçer
 * 
 * Bu komutlar genellikle for, while ve do-while döngülerinde kullanılır.
 */

void main() {
  // ========================= Örnek 1: BREAK Kullanımı =========================
  // Break komutu, döngüyü tamamen sonlandırır ve döngüden çıkış yapar.
  // Belirli bir koşul sağlandığında döngüyü durdurmak için kullanılır.

  print("--- Örnek 1: Break ile Döngüyü Sonlandırma ---");
  for (int i = 0; i < 10; i++) {
    // i değeri 5'e eşit olduğunda döngü tamamen sonlanacak
    if (i == 5) {
      print("i değeri 5'e ulaştı, döngü sonlandırılıyor!");
      break; // Döngüden çık
    }
    print("Döngü Değeri: $i");
  }
  print("Döngü Bitti\n");
  // Çıktı: 0, 1, 2, 3, 4 (5 yazdırılmaz çünkü break öncesinde çıkış yapıldı)

  // ========================= Örnek 2: CONTINUE Kullanımı =========================
  // Continue komutu, döngünün o anki turunu atlar ve bir sonraki tura geçer.
  // Döngü devam eder ancak continue'den sonraki kodlar o tur için çalışmaz.

  print("--- Örnek 2: Continue ile Döngü Turunu Atlama ---");
  for (int i = 0; i < 10; i++) {
    // i değeri 5'e eşit olduğunda bu turu atla
    if (i == 5) {
      print("i değeri 5, bu tur atlanıyor!");
      continue; // Bu turdan sonraki kodları atla, sonraki tura geç
    }
    print("Döngü Değeri: $i");
  }
  print("Döngü Bitti\n");
  // Çıktı: 0, 1, 2, 3, 4, 6, 7, 8, 9 (5 atlandı ama döngü devam etti)

  // ========================= Örnek 3: Tek Sayıları Atlama (Continue) =========================
  print("--- Örnek 3: Sadece Çift Sayıları Yazdırma ---");
  for (int i = 1; i <= 10; i++) {
    // Eğer sayı tek ise (2'ye bölümünden kalan 1 ise)
    if (i % 2 == 1) {
      continue; // Tek sayıları atla
    }
    print("Çift Sayı: $i");
  }
  print("");

  // ========================= Örnek 4: Belirli Bir Değer Bulunduğunda Dur (Break) =========================
  print("--- Örnek 4: Liste İçinde Arama ---");
  List<String> isimler = ["Ali", "Ayşe", "Mehmet", "Zeynep", "Fatma"];
  String aranan = "Mehmet";

  for (int i = 0; i < isimler.length; i++) {
    print("${i + 1}. isim kontrol ediliyor: ${isimler[i]}");

    if (isimler[i] == aranan) {
      print("✓ $aranan bulundu! İndeks: $i");
      break; // İsim bulundu, döngüyü sonlandır
    }
  }
  print("");

  // ========================= Örnek 5: Negatif Sayıları Atlama (Continue) =========================
  print("--- Örnek 5: Pozitif Sayıları Toplama ---");
  List<int> sayilar = [5, -3, 8, -1, 12, -7, 4, -2, 9];
  int toplam = 0;

  for (int sayi in sayilar) {
    // Negatif sayıları toplamaya dahil etme
    if (sayi < 0) {
      print("$sayi negatif, atlanıyor...");
      continue;
    }

    toplam += sayi;
    print("$sayi toplama eklendi, Toplam: $toplam");
  }
  print("Pozitif Sayıların Toplamı: $toplam\n");

  // ========================= Örnek 6: While Döngüsünde Break =========================
  print("--- Örnek 6: While Döngüsünde Break ---");
  int sayac = 0;

  while (true) {
    // Sonsuz döngü
    sayac++;
    print("Sayaç: $sayac");

    if (sayac == 5) {
      print("Sayaç 5'e ulaştı, döngü durduruluyor!");
      break; // Sonsuz döngüden çık
    }
  }
  print("");

  // ========================= Örnek 7: İç İçe Döngülerde Break =========================
  print("--- Örnek 7: İç İçe Döngülerde Break ---");

  disDongu:
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      print("i: $i, j: $j");

      if (i == 2 && j == 2) {
        print("i=2 ve j=2, dış döngüden çıkılıyor!");
        break disDongu; // Etiketli break ile dış döngüden çık
      }
    }
  }
  print("");

  // ========================= Örnek 8: 3'e Bölünen Sayıları Atlama =========================
  print("--- Örnek 8: 3'e Bölünmeyen Sayıları Yazdırma ---");
  for (int i = 1; i <= 15; i++) {
    if (i % 3 == 0) {
      continue; // 3'e bölünen sayıları atla
    }
    print("Sayı: $i");
  }
  print("");

  // ========================= Break vs Continue Karşılaştırması =========================
  /*
   * BREAK:
   * - Döngüyü tamamen sonlandırır
   * - Döngüden çıkış yapar
   * - Döngüden sonraki kodlar çalışır
   * - Kullanım: Arama işlemleri, koşul sağlandığında durmak
   * 
   * CONTINUE:
   * - Sadece o anki döngü turunu atlar
   * - Döngü devam eder
   * - Sonraki tura geçer
   * - Kullanım: Belirli değerleri atlama, filtreleme işlemleri
   */
}
