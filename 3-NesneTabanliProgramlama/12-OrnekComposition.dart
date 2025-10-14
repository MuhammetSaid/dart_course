// ========================= FİLM VERİTABANI SİSTEMİ =========================
/*
 * Bu örnek, Composition (Bileşim) konseptini film veritabanı üzerinden gösterir.
 * 
 * Sınıflar arası ilişkiler:
 * - Filmler HAS-A Kategori (Film bir kategoriye sahiptir)
 * - Filmler HAS-A Yönetmen (Film bir yönetmene sahiptir)
 * 
 * Bu örnek aynı zamanda liste kullanımı ve nesne yönetimini de gösterir.
 */

// Kategori sınıfı - Filmlerin kategorilerini temsil eder
// Örnek: Dram, Korku, Macera vb.
class Kategori {
  late int kategori_id;
  late String kategori_adi;

  // Constructor - Kategori nesnesi oluşturulurken ID ve ad alınır
  Kategori(this.kategori_id, this.kategori_adi);

  // Kategori bilgilerini string olarak döndüren metot
  String Yazdir() {
    return ("Kategori ID: $kategori_id, Kategori Adı: $kategori_adi");
  }
}

// Yönetmenler sınıfı - Film yönetmenlerini temsil eder
// Örnek: Quentin Tarantino, Christopher Nolan vb.
class Yonetmenler {
  late int yonetmen_id;
  late String yonetmen_adi;

  // Constructor - Yönetmen nesnesi oluşturulurken ID ve ad alınır
  Yonetmenler(this.yonetmen_id, this.yonetmen_adi);

  // Yönetmen bilgilerini string olarak döndüren metot
  String Yazdir() {
    return ("Yönetmen ID: $yonetmen_id, Yönetmen Adı: $yonetmen_adi");
  }
}

// Filmler sınıfı - COMPOSITION KULLANIMI
// Bu sınıf hem Kategori hem de Yönetmenler nesnelerini içerir
// Film HAS-A Kategori (Film bir kategoriye sahiptir)
// Film HAS-A Yönetmen (Film bir yönetmene sahiptir)
class Filmler {
  late int film_id;
  late String film_adi;
  late String film_yili;

  // COMPOSITION: Film sınıfı Kategori sınıfını içerir
  // Her filmin bir kategorisi vardır
  late Kategori kategori;

  // COMPOSITION: Film sınıfı Yönetmenler sınıfını içerir
  // Her filmin bir yönetmeni vardır
  late Yonetmenler yonetmen;

  // Constructor - Film nesnesi oluşturulurken
  // temel bilgilerin yanı sıra Kategori ve Yönetmen nesneleri de alınır
  // Bu COMPOSITION'ın temel prensibidir
  Filmler(
    this.film_id,
    this.film_adi,
    this.film_yili,
    this.kategori, // Composition: Kategori nesnesi
    this.yonetmen, // Composition: Yönetmen nesnesi
  );

  // Film bilgilerini ekrana yazdıran metot
  // Composition sayesinde kategori ve yönetmen bilgilerine de erişebiliyoruz
  void Yazdir() {
    print(
      "Film ID: $film_id, Film Adı: $film_adi, Film Yılı: $film_yili, Kategori: \"${kategori.Yazdir()}\", Yönetmen: \"${yonetmen.Yazdir()}\"",
    );
  }
}

void main() {
  // ========================= ADIM 1: KATEGORİ NESNELERİNİ OLUŞTURMA =========================

  /*
   * ÖNEMLİ NOT: Nesne Yaşam Döngüsü
   * 
   * Yanlış kullanım:
   * for döngüsü içinde oluşturulan nesneler, döngü bittiğinde erişilemez hale gelir.
   * Örnek:
   *   for (var kategoriAdi in kategoriler) {
   *     Kategori kategori = Kategori(1, kategoriAdi); // Bu nesne sadece döngü içinde yaşar!
   *   }
   *   // Burada kategori nesnesine erişemeyiz!
   * 
   * Doğru kullanım:
   * Nesneleri bir liste içinde saklayarak, daha sonra erişilebilir hale getiriyoruz.
   */

  // Kategori isimlerini tutan string listesi
  List<String> kategoriler = [
    "Dram",
    "Korku",
    "Macera",
    "Romantik",
    "Bilim Kurgu",
  ];

  // Kategori NESNELERİNİ saklamak için boş bir liste oluşturuyoruz
  // Bu liste, oluşturduğumuz Kategori nesnelerini tutacak
  List<Kategori> kategoriNesneleri = [];

  // Her kategori için bir Kategori nesnesi oluşturuyoruz
  for (int i = 0; i < kategoriler.length; i++) {
    // Yeni Kategori nesnesi oluştur (ID: i+1, Ad: kategoriler[i])
    Kategori kategori = Kategori(i + 1, kategoriler[i]);

    // Oluşturulan nesneyi listeye ekle - BU ÇOK ÖNEMLİ!
    // Bu sayede nesne döngü dışında da yaşamaya devam eder
    kategoriNesneleri.add(kategori);

    // Kullanıcıya bilgi ver
    print(
      "${kategoriler[i]} Kategorisi ${i + 1} Id'si ile Başarılı bir Şekilde Oluşturulmuştur.",
    );
  }

  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print(
    "✅ Kategori Nesneleri Başarılı Bir Şekilde Oluşturulmuştur. (${kategoriler.length} adet kategori oluşturulmuştur.)",
  );

  // Listeden nesnelere erişim - Index kullanarak
  // Artık her kategori nesnesine kolayca erişebiliriz
  Kategori dram = kategoriNesneleri[0]; // Index 0: Dram
  Kategori korku = kategoriNesneleri[1]; // Index 1: Korku
  Kategori macera = kategoriNesneleri[2]; // Index 2: Macera
  Kategori romantik = kategoriNesneleri[3]; // Index 3: Romantik
  Kategori bilimKurgu = kategoriNesneleri[4]; // Index 4: Bilim Kurgu

  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // ========================= ADIM 2: YÖNETMEN NESNELERİNİ OLUŞTURMA =========================

  // Ünlü film yönetmenlerinin isimlerini tutan string listesi
  List<String> yonetmenler = [
    "Alfred Hitchcock",
    "Quentin Tarantino",
    "Steven Spielberg",
    "Martin Scorsese",
    "Christopher Nolan",
  ];

  // Yönetmen NESNELERİNİ saklamak için boş bir liste
  List<Yonetmenler> yonetmenNesneleri = [];

  // Her yönetmen için bir Yönetmenler nesnesi oluşturuyoruz
  // Bu işlem kategorilerle aynı mantıkla çalışır
  for (int i = 0; i < yonetmenler.length; i++) {
    // Yeni Yönetmenler nesnesi oluştur
    Yonetmenler yonetmen = Yonetmenler(i + 1, yonetmenler[i]);

    // Nesneyi listeye ekle
    yonetmenNesneleri.add(yonetmen);

    // Bilgilendirme mesajı
    print(
      "${yonetmenler[i]} Yönetmeni ${i + 1} Id'si ile Başarılı bir Şekilde Oluşturulmuştur.",
    );
  }

  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print(
    "✅ Yönetmen Nesneleri Başarılı Bir Şekilde Oluşturulmuştur. (${yonetmenler.length} adet yönetmen oluşturulmuştur.)",
  );
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // Listeden yönetmen nesnelerine erişim
  // Her bir değişken, listede saklanan Yönetmenler nesnesine referans tutar
  Yonetmenler alfredHitchcock =
      yonetmenNesneleri[0]; // Index 0: Alfred Hitchcock
  Yonetmenler quentinTarantino =
      yonetmenNesneleri[1]; // Index 1: Quentin Tarantino
  Yonetmenler stevenSpielberg =
      yonetmenNesneleri[2]; // Index 2: Steven Spielberg
  Yonetmenler martinScorsese = 
    yonetmenNesneleri[3]; // Index 3: Martin Scorsese
  Yonetmenler christopherNolan =
      yonetmenNesneleri[4]; // Index 4: Christopher Nolan
  // ========================= ADIM 3: FİLM NESNELERİNİ OLUŞTURMA (COMPOSITION) =========================

  /*
   * FİLM NESNELERİ OLUŞTURMA - COMPOSITION ÖRNEĞİ
   * 
   * Şimdi en önemli kısma geliyoruz: COMPOSITION
   * 
   * Film nesnesi oluştururken, daha önce oluşturduğumuz:
   * - Kategori nesnelerini
   * - Yönetmen nesnelerini
   * parametre olarak veriyoruz.
   * 
   * Bu sayede:
   * - Film bir Kategori'ye sahip olur (Film HAS-A Kategori)
   * - Film bir Yönetmen'e sahip olur (Film HAS-A Yönetmen)
   * 
   * Bu composition sayesinde:
   * - film1.kategori.kategori_adi şeklinde erişim yapabiliriz
   * - film1.yonetmen.yonetmen_adi şeklinde erişim yapabiliriz
   * - Kodun yeniden kullanılabilirliği artar
   * - Sınıflar arasında esnek ilişkiler kurulur
   */

  // Film 1: The Dark Knight
  print("Film 1 Oluşturuluyor...");
  Filmler film1 = Filmler(
    1, // Film ID
    "The Dark Knight", // Film adı
    "2008", // Yıl
    korku, // COMPOSITION: Kategori nesnesi
    alfredHitchcock, // COMPOSITION: Yönetmen nesnesi
  );
  print("Film 1 Başarılı Bir Şekilde Oluşturulmuştur.");
  print("Film 1 Bilgileri:");
  film1.Yazdir(); // Composition sayesinde kategori ve yönetmen bilgileri de yazdırılır
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // Film 2: Pulp Fiction
  print("Film 2 Oluşturuluyor...");
  Filmler film2 = Filmler(
    2, // Film ID
    "Pulp Fiction", // Film adı
    "1994", // Yıl
    romantik, // COMPOSITION: Farklı bir kategori
    quentinTarantino, // COMPOSITION: Farklı bir yönetmen
  );
  print("Film 2 Başarılı Bir Şekilde Oluşturulmuştur.");
  print("Film 2 Bilgileri:");
  film2.Yazdir();
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // Film 3: The Lord of the Rings
  print("Film 3 Oluşturuluyor...");
  Filmler film3 = Filmler(
    3,
    "The Lord of the Rings: The Return of the King",
    "2003",
    macera, // COMPOSITION: Macera kategorisi
    stevenSpielberg, // COMPOSITION: Steven Spielberg
  );
  print("Film 3 Başarılı Bir Şekilde Oluşturulmuştur.");
  print("Film 3 Bilgileri:");
  film3.Yazdir();
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // Film 4: The Dark Knight Rises
  print("Film 4 Oluşturuluyor...");
  Filmler film4 = Filmler(
    4,
    "The Dark Knight Rises",
    "2012",
    dram, // COMPOSITION: Aynı kategori tekrar kullanılabilir
    christopherNolan, // COMPOSITION: Christopher Nolan
  );
  print("Film 4 Başarılı Bir Şekilde Oluşturulmuştur.");
  print("Film 4 Bilgileri:");
  film4.Yazdir();
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // Film 5: The Dark Knight (Tekrar)
  print("Film 5 Oluşturuluyor...");
  Filmler film5 = Filmler(
    5,
    "The Dark Knight",
    "2008",
    bilimKurgu, // COMPOSITION: Nesneleri yeniden kullanabiliyoruz
    martinScorsese, // COMPOSITION: Aynı yönetmen birden fazla filmde olabilir
  );
  print("Film 5 Başarılı Bir Şekilde Oluşturulmuştur.");
  print("Film 5 Bilgileri:");
  film5.Yazdir();
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // ========================= ÖZET =========================
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("✅ Tüm Filmler Başarılı Bir Şekilde Oluşturulmuştur.");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  /*
   * COMPOSITION'IN FAYDALARI (Bu örnekte):
   * 
   * 1. YENİDEN KULLANILABİLİRLİK:
   *    - 'korku' kategorisi birden fazla filmde kullanıldı
   *    - 'alfredHitchcock' yönetmeni birden fazla filmde kullanıldı
   *    - Aynı nesneyi tekrar tekrar oluşturmaya gerek yok
   * 
   * 2. ESNEKLIK:
   *    - Her film farklı kategori ve yönetmen kombinasyonuna sahip olabilir
   *    - İstediğimiz zaman film kategorisini veya yönetmenini değiştirebiliriz
   * 
   * 3. BAKIM KOLAYLIĞI:
   *    - Kategori veya Yönetmen sınıflarında yapılan değişiklikler
   *      otomatik olarak tüm filmlere yansır
   * 
   * 4. GERÇEK DÜNYA MODELLEMESİ:
   *    - Gerçek hayattaki ilişkileri doğru bir şekilde temsil eder
   *    - Film gerçekten de bir kategoriye ve yönetmene SAHİPTİR
   * 
   * 5. KOD TEMİZLİĞİ:
   *    - Her sınıf kendi sorumluluğuna sahip (Single Responsibility)
   *    - İlişkiler açık ve anlaşılır
   */
}
