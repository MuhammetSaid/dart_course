// ========================= 6- Donguler =========================
/*  
 * Bu dosya, Dart dilinde donguleri gösterir.
 * Donguler, birden fazla kez bir kod bloğunu çalıştırmak için kullanılır.
 * Dart dilinde donguler, for, while ve do-while olmak üzere 3 farklı şekilde yazılabilir.
 */

void main() {
  // ========================= For Dongusu =========================
  // For dongusu, bir kod bloğunu belirtilen sayıda çalıştırmak için kullanılır.
  // For dongusu, 3 parametre alır.
  // 1. parametre: Başlangıç değeri
  // 2. parametre: Bitiş değeri
  // 3. parametre: Artış değeri
  // For (başlangıç değeri; bitiş değeri; artış değeri) {
  //   // kod bloğu
  // }

  // For (var veri in veri_listesi) {
  //   // kod bloğu
  // }

  // Örnek 1:
  for (int i = 0; i < 5; i++) {
    print("Döngü $i. turu");
  }

  print("--------------------------------");

  // Örnek 2:
  // 10 ile 20 arasındaki 5er artışla sayıları yazdırınız.
  for (int i = 10; i <= 20; i += 5) {
    print("Döngü Değeri: $i");
  }

  print("--------------------------------");

  // Örnek 3:
  // 10 ile 2 arasındaki sayıları 2şer artışla yazdırınız.
  for (int i = 10; i >= 2; i -= 2) {
    print("Döngü Değeri: $i");
  }

  // ========================= While Dongusu =========================
  // While dongusu, bir kod bloğunu belirtilen sayıda çalıştırmak için kullanılır.
  // While dongusu, 1 parametre alır.
  // While (koşul) {
  //   // kod bloğu
  // }
  print("___________________________________________\n");
  print("While Dongusu");
  print("___________________________________________\n");

  var i = 0;
  while (i < 10) {
    print("Döngü Değeri: $i");
    i += 2;
  }
}
