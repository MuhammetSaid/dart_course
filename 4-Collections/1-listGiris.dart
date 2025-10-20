void main() {
  // =========================== LİSTELER (List) ===========================
  // Dart'ta birden fazla veriyi tek bir koleksiyonda tutmak için List (liste) kullanılır.
  // Listeler sıralıdır, her elemanın bir sırası (indeks) vardır ve aynı türden birden fazla veriyi saklayabilir.

  // Liste tanımlama:
  // 1. Yöntem: Düz köşeli parantez ile
  List<String> isimler = ["Ahmet", "Ayşe", "Mehmet", "Zeynep"];

  // 2. Yöntem: List nesnesi kullanarak
  List<int> sayilar = List.from([1, 2, 3, 4, 5]);

  // Listeye eleman ekleme:
  isimler.add("Ali"); // Listenin sonuna eleman ekler
  sayilar.add(6); // Listenin sonuna eleman ekler

  // Belirli bir indexe eleman ekleme:
  isimler.insert(2, "Elif"); // 2. indexe "Elif" eklenir, diğerleri kayar

  // Liste uzunluğu (eleman sayısı) öğrenme:
  print("İsimlerde toplam kişi: ${isimler.length}");

  // Liste elemanlarına erişim (indeks ile, 0'dan başlar)
  print("İlk kişi: ${isimler[0]}");
  print("Son kişi: ${isimler[isimler.length - 1]}");

  // Listenin tüm elemanlarını dolaşma (döngü ile)
  for (int i = 0; i < isimler.length; i++) {
    print("${i + 1}. kişi: ${isimler[i]}");
  }

  // Alternatif yöntem: for-in döngüsü
  for (var isim in isimler) {
    print("Ad: $isim");
  }

  // Eleman silme
  isimler.remove("Ayşe");         // Ayşe'yi siler
  isimler.removeAt(0);            // İlk elemanı (indeks 0) siler

  // Listeyi temizleme
  // isimler.clear();

  // Liste içinde eleman var mı kontrolü
  bool varMi = isimler.contains("Mehmet");
  print("Mehmet listede var mı? $varMi");

  // Boş liste oluşturmak
  List<double> puanlar = [];
  puanlar.add(50.0);

  // Listeyi tersten yazdırmak
  print("Ters isim listesi: ${isimler.reversed.toList()}");
}
