void main() {
  var meyveler = ["elma", "armut", "muz"];
  var sebzeler = ["Domates"];

  print("Meyveler: ${meyveler}");


  // Liste elemanlarını güncelleme Yöntemleri
  // 1. [] operatörü ile güncelleme
  // [] operatörü: Listenin belirtilen indeksindeki elemanı güncellemek için kullanılır.
  // Örnek: meyveler[0] = "kiraz";
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 Liste elemanlarını güncelleme Yöntemleri");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📌 ${meyveler[0]} meyvesi kiraz ile değiştirildi.");
  meyveler[0] = "kiraz";
  print("==> Meyveler: ${meyveler}");



  // Listeye Eleman Ekleme Yöntemleri
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 Listeye Eleman Ekleme Yöntemleri");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // 1. add() metodu
  // Add Methodu: Listenin sonuna eleman eklemek için kullanılır.
  print ("📌 add() metodu ile meyveler listesine üzüm eklendi.");
  meyveler.add("üzüm");
  print("==> Meyveler: ${meyveler}");

  // 2. insert() metodu
  // Insert Methodu: Listenin belirtilen indeksine eleman eklemek için kullanılır.
  print ("📌 insert() metodu ile meyveler listesine kiraz 2. indekse eklendi.");
  meyveler.insert(2, "kiraz");
  print("==> Meyveler: ${meyveler}");

  // 3. addAll() metodu
  // AddAll Methodu: Listenin sonuna başka bir listeyi eklemek için kullanılır.
  print ("📌 addAll() metodu ile meyveler listesine sebzeler listesi eklendi.");
  meyveler.addAll(sebzeler);
  print("==> Meyveler: ${meyveler}");

  
}
