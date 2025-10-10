// ================================ 6- Null Safety ================================
/*
 * Bu dosya, Dart dilinde Null Safety (Null Güvenliği) kavramını açıklar.
 * 
 * NULL NEDİR?
 * - "Değer yok" anlamına gelir
 * - Boş, tanımsız, hiçbir şey demektir
 * - Programlamada en yaygın hata kaynaklarından biridir
 * 
 * NULL SAFETY NEDİR?
 * - Dart'ın null hatalarını önlemek için geliştirdiği güvenlik sistemidir
 * - Compile-time (derleme zamanı) kontrolü yapar
 * - Programınızın çalışma esnasında null hatası almasını engeller
 * 
 * NEDEN ÖNEMLİDİR?
 * - Uygulamanın çökmesini önler
 * - Hataları geliştirme aşamasında yakalar
 * - Daha güvenli kod yazmayı sağlar
 * 
 * Tony Hoare (null'ı icat eden): "Milyar dolarlık hatam" dedi!
 */

// ========================= MAIN FONKSİYONU =========================
void main() {
  print("╔════════════════════════════════════════════════════════════╗");
  print("║        DART NULL SAFETY - DETAYLI KILAVUZ                  ║");
  print("╚════════════════════════════════════════════════════════════╝\n");

  // ==================== ÖRNEK 1: Null Nedir? ====================
  ornekNullKavrami();

  // ==================== ÖRNEK 2: Nullable vs Non-nullable ====================
  ornekNullableVsNonNullable();

  // ==================== ÖRNEK 3: Null Safety Operatörleri ====================
  ornekNullSafetyOperatorleri();

  // ==================== ÖRNEK 4: Late Keyword ====================
  ornekLateKeyword();

  // ==================== ÖRNEK 5: Null Check ve Güvenli Erişim ====================
  ornekNullCheckVeGuvenliErisim();

  // ==================== ÖRNEK 6: Pratik Kullanım ====================
  ornekPratikKullanim();

  print("\n╔════════════════════════════════════════════════════════════╗");
  print("║            PROGRAM BAŞARIYLA TAMAMLANDI                   ║");
  print("╚════════════════════════════════════════════════════════════╝");
}

// ========================= ÖRNEK 1: NULL KAVRAMI =========================
/*
 * Null, bir değişkenin değer içermediği durumu temsil eder.
 * Gerçek hayat analojisi: Boş bir kutu
 */
void ornekNullKavrami() {
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 1: NULL NEDİR?");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // Nullable değişken: ? işareti ile tanımlanır
  String? isim; // Bu değişken null olabilir

  print("İsim değişkeni: $isim"); // Çıktı: null

  // Gerçek hayat analojisi
  print("\n🎁 Gerçek Hayat Analojisi:");
  print("   Kutu 1: İçinde elma var      → Değer var");
  print("   Kutu 2: Boş                  → null (değer yok)");
  print("   Kutu 3: İçinde portakal var  → Değer var");

  // Null değer atama
  String? mesaj = null;
  print("\nMesaj: $mesaj"); // null

  // Daha sonra değer atama
  mesaj = "Merhaba Dünya";
  print("Mesaj (değer atandıktan sonra): $mesaj");
}

// ========================= ÖRNEK 2: NULLABLE vs NON-NULLABLE =========================
/*
 * Dart'ta iki tür değişken vardır:
 * 1. Non-nullable: Kesinlikle değer içermeli (varsayılan)
 * 2. Nullable: Null olabilir (? ile işaretlenir)
 */
void ornekNullableVsNonNullable() {
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 2: NULLABLE vs NON-NULLABLE");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // ❌ NON-NULLABLE (Varsayılan)
  // Kesinlikle değer içermeli, null olamaz
  String ad = "Ahmet"; // Zorunlu olarak değer vermeli
  int yas = 25; // Zorunlu olarak değer vermeli
  bool aktif = true; // Zorunlu olarak değer vermeli

  print("\n✅ Non-nullable Değişkenler (Null olamazlar):");
  print("   Ad: $ad");
  print("   Yaş: $yas");
  print("   Aktif: $aktif");

  // ⚠️  Bu HATA verir:
  // String soyad; // ERROR: Değer verilmeli!
  // int sayi;     // ERROR: Değer verilmeli!

  // ✅ NULLABLE (? ile işaretli)
  // Null olabilir, zorunlu değer ataması yok
  String? soyad; // null olabilir
  int? telNo; // null olabilir
  bool? onayliMi; // null olabilir

  print("\n✅ Nullable Değişkenler (Null olabilirler):");
  print("   Soyad: $soyad"); // null
  print("   Tel No: $telNo"); // null
  print("   Onaylı mı: $onayliMi"); // null

  // Daha sonra değer atanabilir
  soyad = "Yılmaz";
  telNo = 5551234567;
  onayliMi = true;

  print("\n✅ Değer Atandıktan Sonra:");
  print("   Soyad: $soyad");
  print("   Tel No: $telNo");
  print("   Onaylı mı: $onayliMi");

  // KURAL: Eğer bir değişken null olabilecekse ? kullan
  print("\n📋 KURAL:");
  print("   String name;   → Null olamaz, değer zorunlu");
  print("   String? name;  → Null olabilir, değer opsiyonel");
}

// ========================= ÖRNEK 3: NULL SAFETY OPERATÖRLERİ =========================
/*
 * Dart'ta 3 önemli null safety operatörü vardır:
 * 1. ? (Nullable type)
 * 2. ! (Null assertion - Kesinlikle null değil)
 * 3. ?? (Null-aware operator - Null ise varsayılan değer)
 */
void ornekNullSafetyOperatorleri() {
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 3: NULL SAFETY OPERATÖRLERİ");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // ==================== 1. ? OPERATÖRÜ (Nullable Type) ====================
  print("\n🔹 1. ? Operatörü (Nullable Type)");
  print("   Değişkenin null olabileceğini belirtir\n");

  String? kullaniciAdi; // null olabilir
  print("   Kullanıcı adı: $kullaniciAdi"); // null

  kullaniciAdi = "admin";
  print("   Kullanıcı adı: $kullaniciAdi"); // admin

  // ==================== 2. ! OPERATÖRÜ (Null Assertion) ====================
  print("\n🔹 2. ! Operatörü (Null Assertion - Bang Operator)");
  print("   'Bu kesinlikle null değildir' diye garanti verirsiniz");
  print("   ⚠️  DİKKAT: Yanlış kullanımda program çöker!\n");

  String? sehir = "İstanbul";

  // Normal kullanım - Dart emin değil, hata verebilir
  // int uzunluk = sehir.length; // HATA: sehir null olabilir

  // ! operatörü ile garanti veriyoruz
  int uzunluk = sehir!.length; // "Ben eminim, bu null değil!"
  print("   Şehir: $sehir");
  print("   Uzunluk: $uzunluk");

  // ⚠️  TEHLİKELİ KULLANIM:
  print("\n   ⚠️  UYARI: ! operatörünü dikkatli kullanın!");
  print("   Yanlış kullanım programın çökmesine neden olur.");
  print("   Örnek: String? bosString; bosString!.length → ÇÖKER!");

  // ==================== 3. ?? OPERATÖRÜ (Null-aware) ====================
  print("\n🔹 3. ?? Operatörü (Null-aware / Varsayılan Değer)");
  print("   'Eğer null ise, şunu kullan' mantığı\n");

  String? kullanici; // null

  // Eğer kullanici null ise "Misafir" kullan
  String isim = kullanici ?? "Misafir";
  print("   Kullanıcı: $kullanici");
  print("   Gösterilecek isim: $isim"); // Misafir

  // Değer varsa onu kullan
  String? kayitliKullanici = "Ahmet";
  String isim2 = kayitliKullanici ?? "Misafir";
  print("\n   Kayıtlı kullanıcı: $kayitliKullanici");
  print("   Gösterilecek isim: $isim2"); // Ahmet

  // Pratik Örnek: Ayarlar
  int? ayarlananYas;
  int yas = ayarlananYas ?? 18; // Ayarlanmamışsa varsayılan 18

  print("\n   Ayarlanan yaş: $ayarlananYas");
  print("   Kullanılacak yaş: $yas"); // 18 (varsayılan)

  // ==================== 4. ??= OPERATÖRÜ (Null-aware Assignment) ====================
  print("\n🔹 4. ??= Operatörü (Null-aware Assignment)");
  print("   'Eğer null ise, değer ata' mantığı\n");

  String? dil; // null
  print("   Dil (başlangıç): $dil");

  // Eğer dil null ise "Türkçe" ata
  dil ??= "Türkçe";
  print("   Dil (atamadan sonra): $dil"); // Türkçe

  // Eğer zaten değer varsa, değiştirme
  dil ??= "İngilizce";
  print("   Dil (tekrar denemeden sonra): $dil"); // Hala Türkçe

  // ==================== 5. ?. OPERATÖRÜ (Safe Navigation) ====================
  print("\n🔹 5. ?. Operatörü (Safe Navigation / Güvenli Erişim)");
  print("   'Null değilse işlemi yap' mantığı\n");

  String? adres;

  // Normal kullanım - HATA verir
  // int uzunluk = adres.length; // ERROR: adres null olabilir

  // Güvenli kullanım - Null kontrolü yapar
  int? uzunlukGuvenli = adres?.length; // Null ise null döner
  print("   Adres: $adres");
  print("   Uzunluk (güvenli): $uzunlukGuvenli"); // null

  // Değer varsa işlem yapar
  adres = "Ankara, Türkiye";
  int? uzunlukGuvenli2 = adres?.length;
  print("\n   Adres: $adres");
  print("   Uzunluk (güvenli): $uzunlukGuvenli2"); // 15

  // Zincirleme kullanım
  String? sehirAdi = adres?.toUpperCase()?.substring(0, 6);
  print("   Şehir adı (zincirleme): $sehirAdi"); // ANKARA
}

// ========================= ÖRNEK 4: LATE KEYWORD =========================
/*
 * late: "Daha sonra değer alacak" anlamına gelir
 * Kullanım alanları:
 * 1. Değer hemen verilmeyecek ama null olmayacak
 * 2. Ağır işlemler için lazy initialization
 */
void ornekLateKeyword() {
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 4: LATE KEYWORD");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  print("\n🔹 Late nedir?");
  print("   'Şimdi değer yok ama null da olmayacak, sonra atanacak'\n");

  // ❌ Bu HATA verir:
  // String isim; // ERROR: Değer verilmeli

  // ✅ Çözüm 1: Hemen değer ver
  print("   Çözüm 1: String isim = 'Ahmet'; → Hemen değer ver");

  // ✅ Çözüm 2: Nullable yap
  print("   Çözüm 2: String? isim; → Nullable yap (null olabilir)");

  // ✅ Çözüm 3: Late kullan
  late String isim3; // Daha sonra değer alacak, ama null olmayacak
  print("   Çözüm 3: late String isim; → Sonra değer alacak");

  print("   Late değişken tanımlandı (henüz değer yok)");

  // Kullanmadan önce değer atanmalı
  isim3 = "Mehmet";
  print("   Late değişkene değer atandı: $isim3");

  // ⚠️  DİKKAT: Late değişkeni kullanmadan önce değer atanmalı
  // late String test;
  // print(test); // HATA! Değer atanmadan kullanıldı

  // Pratik Kullanım: API'den veri çekme
  print("\n📱 Pratik Örnek: API'den Veri");
  late String apiVerisi;

  print("   1. API çağrısı yapılıyor...");
  // API çağrısı simülasyonu
  apiVerisi = "Veri başarıyla alındı!";
  print("   2. API verisi: $apiVerisi");

  // Late ile Lazy Initialization
  print("\n⚡ Lazy Initialization (Tembel Yükleme):");
  print("   Değişken ilk kullanıldığında değer hesaplanır");

  late String agirIslem = hesaplaAgirIslem();
  print("   Late değişken tanımlandı (henüz hesaplama YOK)");

  // İlk kullanımda hesaplama yapılır
  print("   Değişken kullanılıyor: $agirIslem");
}

/// Ağır bir işlem simülasyonu
String hesaplaAgirIslem() {
  print("   → Ağır işlem hesaplanıyor... 💭");
  return "İşlem tamamlandı!";
}

// ========================= ÖRNEK 5: NULL CHECK VE GÜVENLİ ERİŞİM =========================
void ornekNullCheckVeGuvenliErisim() {
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 5: NULL CHECK VE GÜVENLİ ERİŞİM");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  String? kullaniciAdi = "admin";

  // ==================== Yöntem 1: If Kontrolü ====================
  print("\n🔹 Yöntem 1: If ile Null Kontrolü");
  if (kullaniciAdi != null) {
    // Bu blokta kullaniciAdi kesinlikle null değildir
    print("   Hoş geldin $kullaniciAdi");
    print("   İsim uzunluğu: ${kullaniciAdi.length}");
  } else {
    print("   Kullanıcı girişi yapılmamış");
  }

  // ==================== Yöntem 2: ?. Operatörü ====================
  print("\n🔹 Yöntem 2: ?. ile Güvenli Erişim");
  print("   İsim uzunluğu: ${kullaniciAdi?.length}");

  kullaniciAdi = null;
  print("   İsim uzunluğu (null olduğunda): ${kullaniciAdi?.length}"); // null

  // ==================== Yöntem 3: ?? Operatörü ====================
  print("\n🔹 Yöntem 3: ?? ile Varsayılan Değer");
  String gosterilecekIsim = kullaniciAdi ?? "Misafir";
  print("   Gösterilecek isim: $gosterilecekIsim");

  // ==================== Yöntem 4: ! Operatörü (Riskli) ====================
  print("\n🔹 Yöntem 4: ! ile Garanti (⚠️  Dikkatli kullan!)");
  kullaniciAdi = "test";
  // Eminim ki null değil
  print("   İsim: ${kullaniciAdi!.toUpperCase()}");
}

// ========================= ÖRNEK 6: PRATİK KULLANIM =========================
void ornekPratikKullanim() {
  print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  print("📚 ÖRNEK 6: PRATİK KULLANIM ÖRNEKLERİ");
  print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  // Senaryo 1: Kullanıcı Profili
  print("\n📱 Senaryo 1: Kullanıcı Profili Sistemi");
  String? profilFoto; // Kullanıcı profil fotoğrafı yüklememiş olabilir
  String? bio; // Bio yazılmamış olabilir
  String ad = "Ahmet Yılmaz"; // Ad zorunlu

  print("   Ad: $ad");
  print(
    "   Profil Fotoğrafı: ${profilFoto ?? 'Varsayılan avatar kullanılıyor'}",
  );
  print("   Bio: ${bio ?? 'Henüz bio eklenmemiş'}");

  // Senaryo 2: Form Validasyonu
  print("\n📝 Senaryo 2: Form Validasyonu");
  String? email;
  String? telefon;

  String iletisimBilgisi = email ?? telefon ?? "İletişim bilgisi yok";
  print("   Email: $email");
  print("   Telefon: $telefon");
  print("   İletişim: $iletisimBilgisi");

  // Senaryo 3: API Cevabı
  print("\n🌐 Senaryo 3: API Cevabı İşleme");
  String? apiHataMesaji; // Hata yoksa null

  if (apiHataMesaji == null) {
    print("   ✅ İşlem başarılı!");
  } else {
    print("   ❌ Hata: $apiHataMesaji");
  }

  // Senaryo 4: Ayarlar
  print("\n⚙️  Senaryo 4: Uygulama Ayarları");
  bool? karanlikMod; // Kullanıcı ayarlamamış olabilir
  String? dil;

  bool modKullan = karanlikMod ?? false; // Varsayılan: açık mod
  String dilKullan = dil ?? "Türkçe"; // Varsayılan: Türkçe

  print("   Karanlık Mod: ${modKullan ? 'Açık' : 'Kapalı'}");
  print("   Dil: $dilKullan");
}

// ========================= NULL SAFETY KURALLARI VE İPUÇLARI =========================
/*
 * ✅ İYİ PRATİKLER:
 * 
 * 1. Varsayılan olarak non-nullable kullan
 *    String name = "Ahmet";  ✅
 * 
 * 2. Gerçekten gerekmedikçe nullable yapma
 *    Sadece null olabilecek değerler için ? kullan
 * 
 * 3. ! operatöründen kaçın
 *    Mümkün olduğunca ?., ??, if kontrolü kullan
 * 
 * 4. Late'i dikkatli kullan
 *    Kullanmadan önce değer atadığından emin ol
 * 
 * 5. ?? operatörü ile varsayılan değer belirle
 *    String name = kullanici?.name ?? "Misafir";
 * 
 * ❌ KÖTÜ PRATİKLER:
 * 
 * 1. Her şeyi nullable yapma
 *    String? name; String? age; String? city;  ❌
 * 
 * 2. ! operatörünü aşırı kullanma
 *    value!.property!.method!()  ❌
 * 
 * 3. Null kontrolsüz erişim
 *    print(nullableValue.length);  ❌
 * 
 * 4. Late değişkeni değer atmadan kullanma
 *    late String x; print(x);  ❌
 */

// ========================= ÖZET =========================
/*
 * NULL SAFETY OPERATÖRLERİ:
 * 
 * ?   → Nullable tip (null olabilir)
 *       String? name;
 * 
 * !   → Null assertion (kesinlikle null değil)
 *       name!.toUpperCase()
 * 
 * ??  → Null-aware (null ise varsayılan değer)
 *       name ?? "Varsayılan"
 * 
 * ??= → Null-aware assignment (null ise ata)
 *       name ??= "Varsayılan"
 * 
 * ?.  → Safe navigation (null ise işlem yapma)
 *       name?.length
 * 
 * late → Daha sonra değer alacak
 *        late String name;
 * 
 * HANGI DURUMDA HANGİSİ?
 * 
 * Null olabilir mi?
 *   └─ Evet → String? name;
 *   └─ Hayır → String name = "değer";
 * 
 * Değer hemen verilemiyor mu?
 *   └─ Evet → late String name;
 * 
 * Null kontrolü yapılacak mı?
 *   └─ if kontrolü → if (name != null) { }
 *   └─ Güvenli erişim → name?.length
 *   └─ Varsayılan değer → name ?? "varsayılan"
 */
