// ========================= POLYMORPHISM (ÇOK BİÇİMLİLİK) =========================
/*
 * Polymorphism (Çok Biçimlilik), aynı arayüzü kullanarak farklı davranışlar
 * sergileyebilme yeteneğidir.
 * 
 * Temel Prensip:
 * - Parent class referansı ile child class nesneleri tutulabilir
 * - Her nesne kendi davranışını sergiler (override metodları)
 * - Tek bir kod parçası, farklı tiplerle çalışabilir
 * 
 * Polymorphism Türleri:
 * 1. Compile-time Polymorphism (Method Overloading) - Dart'ta YOK
 * 2. Runtime Polymorphism (Method Overriding) - Dart'ta VAR
 * 
 * Faydaları:
 * - Kodun yeniden kullanılabilirliği
 * - Esneklik ve genişletilebilirlik
 * - Bakım kolaylığı
 * - Gevşek bağımlılık (Loose Coupling)
 */

// Parent/Base Class - Tüm personel tiplerinin ortak arayüzü
class Personel {
  String ad;
  String departman;
  double maas;

  Personel(this.ad, this.departman, this.maas);

  // Ortak metod - Her personel işe alınır
  void iseAlindi() {
    print("$ad adlı personel işe alındı.");
  }

  // Her personel çalışır ama nasıl çalıştığı farklı olabilir
  void calis() {
    print("$ad çalışıyor...");
  }

  // Maaş bilgisi
  void maasBilgisi() {
    print("$ad - Maaş: $maas TL");
  }

  // Bilgi göster
  String bilgiVer() {
    return "$ad - $departman - $maas TL";
  }
}

// Child Class 1 - Öğretmen
class Ogretmen extends Personel {
  String ders;
  int ogrenciSayisi;

  Ogretmen(String ad, this.ders, double maas, this.ogrenciSayisi)
    : super(ad, "Eğitim", maas);

  // Override - Öğretmene özgü işe alınma süreci
  @override
  void iseAlindi() {
    super.iseAlindi(); // Parent metodunu da çağır
    print("$ders dersi için sınıfa atandı.");
    print("$ogrenciSayisi öğrenciden sorumlu olacak.");
  }

  // Override - Öğretmen nasıl çalışır?
  @override
  void calis() {
    print("$ad ders anlatıyor: $ders");
  }

  // Öğretmene özgü metod
  void sinavaGir() {
    print("$ad sınav hazırlıyor.");
  }
}

// Child Class 2 - İşçi
class Isci extends Personel {
  String vardiya;
  String gorev;

  Isci(String ad, this.gorev, double maas, this.vardiya)
    : super(ad, "Üretim", maas);

  // Override - İşçiye özgü işe alınma süreci
  @override
  void iseAlindi() {
    super.iseAlindi();
    print("$gorev pozisyonuna atandı.");
    print("Vardiya: $vardiya");
  }

  // Override - İşçi nasıl çalışır?
  @override
  void calis() {
    print("$ad $gorev işini yapıyor ($vardiya vardiyası)");
  }

  // İşçiye özgü metod
  void mesaiYap() {
    print("$ad mesai yapıyor.");
  }
}

// Child Class 3 - Müdür
class Mudur extends Personel {
  int ekipBuyuklugu;
  String bolum;

  Mudur(String ad, this.bolum, double maas, this.ekipBuyuklugu)
    : super(ad, "Yönetim", maas);

  // Override - Müdüre özgü işe alınma süreci
  @override
  void iseAlindi() {
    super.iseAlindi();
    print("$bolum bölümünün yöneticisi olarak atandı.");
    print("$ekipBuyuklugu kişilik ekipten sorumlu.");
  }

  // Override - Müdür nasıl çalışır?
  @override
  void calis() {
    print("$ad yönetim toplantısında ($bolum bölümü)");
  }

  /*
   * POLYMORPHİSM'İN GÜCÜ:
   * 
   * Bu metod Personel tipinde parametre alıyor.
   * Ancak Personel'den türeyen HER TÜRLÜ nesneyi kabul edebilir:
   * - Ogretmen
   * - Isci
   * - Mudur
   * - Gelecekte eklenecek başka Personel türleri
   * 
   * Bu sayede tek bir metod, farklı tiplerle çalışabilir!
   */
  void iseAl(Personel personel) {
    print("\n>>> Yeni Personel İşe Alınıyor <<<");
    personel.iseAlindi(); // Her nesne kendi override metodunu çalıştırır
    print("İşe alma işlemi tamamlandı.\n");
  }

  // Müdüre özgü metod
  void toplantiYap() {
    print("$ad toplantı düzenliyor.");
  }
}

void main() {
  print("=== POLYMORPHİSM (ÇOK BİÇİMLİLİK) ÖRNEĞİ ===\n");

  // ========================= 1. Temel Polymorphism =========================
  print("--- 1. TEMEL POLYMORPHİSM ---\n");

  /*
   * POLYMORPHİSM ÖRNEĞİ:
   * 
   * Sol taraf: Parent class tipi (Personel)
   * Sağ taraf: Child class nesnesi (Ogretmen, Isci)
   * 
   * Bu polymorphism'dir! Parent class referansı ile child class nesnesi tutulur.
   */

  Personel ogretmen = Ogretmen("Ahmet Yılmaz", "Matematik", 8000, 30);
  Personel isci = Isci("Mehmet Kaya", "Teknisyen", 5000, "Gündüz");
  Mudur mudur = Mudur("Ayşe Demir", "İnsan Kaynakları", 12000, 15);

  // Müdür işe alım yapıyor - POLYMORPHİSM kullanımı
  mudur.iseAl(ogretmen); // Ogretmen nesnesi, Personel olarak kabul edildi
  mudur.iseAl(isci); // Isci nesnesi, Personel olarak kabul edildi

  // ========================= 2. Liste ile Polymorphism =========================
  print("--- 2. LİSTE İLE POLYMORPHİSM ---\n");

  /*
   * Polymorphism'in en güçlü yanlarından biri:
   * Farklı child class nesnelerini aynı listede tutabilme
   */

  List<Personel> tumPersonel = [
    Ogretmen("Zeynep Ak", "Fizik", 8500, 25),
    Isci("Ali Yurt", "Montajcı", 5500, "Gece"),
    Mudur("Fatma Kara", "Üretim", 15000, 50),
    Ogretmen("Can Öz", "Kimya", 8200, 28),
    Isci("Elif Çelik", "Kalite Kontrol", 6000, "Gündüz"),
  ];

  print("Tüm personel çalışıyor:");
  for (Personel p in tumPersonel) {
    p.calis(); // Her nesne kendi override edilmiş metodunu çağırır!
  }

  print("\nTüm personelin maaş bilgileri:");
  for (Personel p in tumPersonel) {
    p.maasBilgisi();
  }

  // ========================= 3. Tip Kontrolü ve Dönüşüm =========================
  print("\n--- 3. TİP KONTROLÜ VE DÖNÜŞÜM ---\n");

  for (Personel p in tumPersonel) {
    print("${p.ad}:");

    // is operatörü ile tip kontrolü ve otomatik type promotion
    if (p is Ogretmen) {
      print("  - Bu bir öğretmendir");
      // is kontrolünden sonra p otomatik olarak Ogretmen tipine dönüşür
      p.sinavaGir(); // Ogretmen'e özgü metod
    } else if (p is Isci) {
      print("  - Bu bir işçidir");
      // is kontrolünden sonra p otomatik olarak Isci tipine dönüşür
      p.mesaiYap(); // Isci'ye özgü metod
    } else if (p is Mudur) {
      print("  - Bu bir müdürdür");
      // is kontrolünden sonra p otomatik olarak Mudur tipine dönüşür
      p.toplantiYap(); // Mudur'e özgü metod
    }
    print("");
  }

  // ========================= 4. Polymorphic Metod Parametresi =========================
  print("--- 4. POLYMORPHİC METOD PARAMETRESİ ---\n");

  // Bir fonksiyon oluşturuyoruz - Personel tipinde parametre alıyor
  void personelBilgisiYazdir(Personel p) {
    print("=== Personel Bilgileri ===");
    print(p.bilgiVer());
    p.calis(); // Polymorphism: Her nesne kendi metodunu çağırır
    print("=" * 30);
  }

  // Aynı fonksiyon, farklı tiplerle çalışabiliyor!
  Ogretmen yeniOgretmen = Ogretmen("Deniz Gül", "Tarih", 7800, 22);
  Isci yeniIsci = Isci("Burak Yıldız", "Operatör", 5200, "Sabah");

  personelBilgisiYazdir(yeniOgretmen);
  personelBilgisiYazdir(yeniIsci);
  personelBilgisiYazdir(mudur);

  // ========================= 5. Polymorphism'in Faydaları =========================
  print("\n--- POLYMORPHİSM'İN FAYDALARI ---\n");
  print("✅ Tek kod, çok tip: Aynı kod farklı tiplerle çalışır");
  print("✅ Esneklik: Yeni tipler eklemek kolay");
  print("✅ Bakım: Değişiklikler tek yerden yapılır");
  print("✅ Genişletilebilirlik: Mevcut kodu bozmadan yeni özellikler eklenir");
  print("✅ Kod tekrarı önlenir: Ortak işlemler tek yerden yönetilir");

  print("\n=== POLYMORPHİSM ÖRNEĞİ TAMAMLANDI ===");
}
