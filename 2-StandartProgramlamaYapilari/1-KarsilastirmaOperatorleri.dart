/* 
 * Bu dosya, Dart dilinde karşılaştırma ve mantıksal operatörlerin kullanımını gösterir.
 * Programlama mantığının temelini oluşturan bu operatörler, karar yapılarında sıkça kullanılır.
 */

// Karşılaştırma Operatörleri
// ==, !=, >, <, >=, <=
// ==: Eşit mi?             : True veya False
// !=: Eşit değil mi?        : True veya False
// >: Büyük mü?             : True veya False
// <: Küçük mü?             : True veya False
// >=: Büyük veya eşit mi?  : True veya False
// <=: Küçük veya eşit mi?  : True veya False

// Mantıksal Operatörler
// &&: Ve          : Her iki ifade de doğru ise true, diğer durumlarda false
// ||: Veya          : Her iki ifade de yanlış ise false, diğer durumlarda true
// !: Değil         : Ifade doğru ise false, yanlış ise true

void main() {
  // ========================= 1- Karşılaştırma Operatörleri =========================

  int sayi1 = 60;
  int sayi2 = 50;

  int sayi3 = 70;
  int sayi4 = 80;

  print(
    "$sayi1 == $sayi2: ${sayi1 == sayi2}",
  ); // Eğer sayi1 ve sayi2 eşitse true, değilse false burada eşit olmadığı için false döner.
  print(
    "$sayi1 != $sayi2: ${sayi1 != sayi2}",
  ); // Eğer sayi1 ve sayi2 eşit değilse true, eşitse false burada eşit olmadığı için true döner.

  print(
    "$sayi1 > $sayi2: ${sayi1 > sayi2}",
  ); // Eğer sayi1 sayi2'den büyükse true, değilse false burada sayi1 sayi2'den büyük olduğu için true döner.
  print(
    "$sayi1 < $sayi2: ${sayi1 < sayi2}",
  ); // Eğer sayi1 sayi2'den küçükse true, değilse false burada sayi1 sayi2'den küçük olduğu için true döner.

  print(
    "$sayi1 >= $sayi2: ${sayi1 >= sayi2}",
  ); // Eğer sayi1 sayi2'den büyük veya eşitse true, değilse false burada sayi1 sayi2'den büyük olduğu için true döner.
  print(
    "$sayi1 <= $sayi2: ${sayi1 <= sayi2}",
  ); // Eğer sayi1 sayi2'den küçük veya eşitse true, değilse false burada sayi1 sayi2'den küçük olduğu için true döner.

  // ========================= 2- Mantıksal Operatörler =========================
  print(
    "$sayi1 == $sayi2 && $sayi3 == $sayi4: ${sayi1 == sayi2 && sayi3 == sayi4}",
  ); // Eğer sayi1 ve sayi2 eşitse ve sayi3 ve sayi4 eşitse true, değilse false burada sayi1 ve sayi2 eşit olmadığı için false döner.
  print(
    "$sayi1 == $sayi2 || $sayi3 == $sayi4: ${sayi1 == sayi2 || sayi3 == sayi4}",
  ); // Eğer sayi1 ve sayi2 eşitse veya sayi3 ve sayi4 eşitse true, değilse false burada sayi1 ve sayi2 eşit olmadığı için false döner.
  print(
    "!$sayi1 == $sayi2: ${!(sayi1 == sayi2)}",
  ); // Eğer sayi1 sayi2'ye eşit değilse true, eşitse false burada sayi1 sayi2'ye eşit olduğu için false döner.
}
