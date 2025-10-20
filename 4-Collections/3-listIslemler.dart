void main() {
  var meyveler = [];
  var sebzeler = [];

  meyveler.add("Elma");
  meyveler.add("armut");
  meyveler.add("Kivi");
  meyveler.add("muz");
  meyveler.add("üzüm");

  // Bir Listenin Boş Olup Olmadığını Kontrol Etmek için isEmpty metodu kullanılır.
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print(
    "📚 Bir Listenin Boş Olup Olmadığını Kontrol Etmek için isEmpty metodu kullanılır.",
  );
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print(
    "Meyveler Listesi Boş mu? ${meyveler.isEmpty}",
  ); // Burada meyveler Listesi Boş olmadığı için false değeri döner.
  print(
    "Sebzeler Listesi Boş mu? ${sebzeler.isEmpty}",
  ); // Burada sebzeler Listesi Boş olduğu için true değeri döner.

  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 Bir Listenin Boyutunu Öğrenmek için length metodu kullanılır.");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  // Bir Listenin Boyutunu Öğrenmek için length metodu kullanılır.
  print("Meyveler Listesinin Uzunuğu: ${meyveler.length}");
  print("Sebzeler Listesinin Uzunuğu: ${sebzeler.length}");

  // Bir Listenin ilk ve Son Elemanını Öğrenmek için first ve last metodu kullanılır.
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print(
    "📚 Bir Listenin ilk ve Son Elemanını Öğrenmek için first ve last metodu kullanılır.",
  );
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("Meyveler Listesinin İlk Elemanı: ${meyveler.first}");
  print("Meyveler Listesinin Son Elemanı: ${meyveler.last}");
  sebzeler.add("Domates");
  print("Sebzeler Listesinin İlk Elemanı: ${sebzeler.first}");
  print("Sebzeler Listesinin Son Elemanı: ${sebzeler.last}");

  // Bir Listenin içinde Herhangi bir elemanın o listede olup olmadığını kontrol etmek için contains metodu kullanılır.

  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print(
    "📚 Bir Listenin içinde Herhangi bir elemanın o listede olup olmadığını kontrol etmek için contains metodu kullanılır.",
  );
  print("Meyveler Listesinde Kivi elemanının olup olmadığını öğrenmek için: ");
  print("meyveler.contains(\"Kivi\") : ${meyveler.contains("Kivi")}");
  print("--------------------------------");
  print("meyveler.contains(\"Elma\") : ${meyveler.contains("Karpuz")}");

  // Bir Listeyi Terslemek için reversed metodu kullanılır.
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 Bir Listeyi Terslemek için reversed metodu kullanılır.");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("Meyveler Listesini Terslemek için: ");
  var tersMeyveler = meyveler.reversed.toList();
  print("==> Meyveler: ${tersMeyveler}");

  // Bir Listenin Elemanlarını Sıralamak için sort Metodu Kullanılır.

  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 Bir Listenin Elemanlarını Sıralamak için sort Metodu Kullanılır.");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("Meyveler Listesini Sıralamak için: ");
  meyveler.sort();
  print("==> Meyveler: ${meyveler}");
  var sayi = ["n", "k", "o", "s", "a", "c", "b"];
  print("Sayılar: ${sayi}");
  sayi.sort();
  print("Sayılar: ${sayi}");

  // Bir Listeden Eleman silmek için removeAt metodu kullanılır.
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 Bir Listeden Eleman silmek için removeAt metodu kullanılır.");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print ("Meyveler Listesinin Elemanları: ${meyveler}");
  print("Meyveler Listesinden 2. indekste bulunan elemanı silmek için: ");
  meyveler.removeAt(2);
  print("==> Meyveler: ${meyveler}");

  // Bir Listeden Belirtilen Elemanı Silmek için remove metodu kullanılır.
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 Bir Listeden Belirtilen Elemanı Silmek için remove metodu kullanılır.");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("Meyveler Listesinin Elemanları:");
  print ("==> Meyveler: ${meyveler}");
  print("Meyveler Listesinden Elma elemanını silmek için: ");
  meyveler.remove("Elma");
  print("==> Meyveler: ${meyveler}");

  // Bir Listenin Tüm Elemanlarını Silmek için clear metodu kullanılır.
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 Bir Listenin Tüm Elemanlarını Silmek için clear metodu kullanılır.");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("Meyveler Listesinin Elemanları:");
  print ("==> Meyveler: ${meyveler}");
  print("Meyveler Listesinin Tüm Elemanlarını Silmek için: ");
  meyveler.clear();
  print("==> Meyveler: ${meyveler}");
  

}
