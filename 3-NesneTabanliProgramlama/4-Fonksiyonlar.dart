// ================================ 4- Fonksiyonlar ================================
/*
 * Bu dosya, Dart dilinde fonksiyonların temellerini açıklar.
 * 
 * FONKSİYON NEDİR?
 * - Belirli bir görevi yerine getiren kod bloklarıdır
 * - Kod tekrarını önler
 * - Kodu daha düzenli ve okunabilir yapar
 * - İhtiyaç duyulduğunda tekrar tekrar çağrılabilir
 * 
 * FONKSİYON TÜRLERİ:
 * 1. Void Fonksiyonlar: Değer döndürmeyen
 * 2. Return Fonksiyonlar: Değer döndüren
 * 3. Parametreli Fonksiyonlar: Dışarıdan değer alan
 */

// ========================= MAIN FONKSİYONU =========================
void main() {
  print("╔═══════════════════════════════════════════════╗");
  print("║        DART FONKSİYONLAR - TEMEL KAVRAMLAR    ║");
  print("╚═══════════════════════════════════════════════╝\n");

  // ==================== ÖRNEK 1: Void Fonksiyon ====================
  print("--- Örnek 1: Void Fonksiyonlar ---");
  // Fonksiyon çağrısı: fonksiyonAdi()
  selamVer(); // Bu fonksiyon çalışır ve ekrana yazı yazdırır
  cizgiCiz(); // Bu fonksiyon bir çizgi çizer

  // ==================== ÖRNEK 2: Return Fonksiyon ====================
  print("\n--- Örnek 2: Return Fonksiyonlar ---");
  // Return fonksiyonlar değer döndürür, bu değeri kullanabiliriz
  int sayi = sayiGetir(); // Fonksiyondan dönen değeri değişkene atıyoruz
  print("Fonksiyondan dönen sayı: $sayi");

  int toplam = topla(); // 5 + 3 = 8 döner
  print("Toplama sonucu: $toplam");

  // ==================== ÖRNEK 3: Parametreli Fonksiyonlar ====================
  print("\n--- Örnek 3: Parametreli Fonksiyonlar ---");
  // Fonksiyona değer gönderme (parametre)
  isimYazdir("Ahmet"); // "Ahmet" parametresi gönderiliyor
  isimYazdir("Ayşe"); // "Ayşe" parametresi gönderiliyor

  // ==================== ÖRNEK 4: Parametreli Return Fonksiyonlar ====================
  print("\n--- Örnek 4: Parametreli ve Return Fonksiyonlar ---");
  int sonuc1 = ikiSayiTopla(10, 20); // 10 + 20 = 30
  print("10 + 20 = $sonuc1");

  int sonuc2 = ikiSayiTopla(50, 75); // 50 + 75 = 125
  print("50 + 75 = $sonuc2");

  // ==================== ÖRNEK 5: Pratik Kullanım ====================
  print("\n--- Örnek 5: Pratik Kullanım ---");
  double fiyat = 100.0;
  double indirimOrani = 0.2; // %20

  double indirimliFiyat = indirimHesapla(fiyat, indirimOrani);
  print("Orijinal Fiyat: $fiyat TL");
  print("İndirim Oranı: %${indirimOrani * 100}");
  print("İndirimli Fiyat: $indirimliFiyat TL");

  // ==================== ÖRNEK 6: Fonksiyon İçinde Fonksiyon Çağırma ====================
  print("\n--- Örnek 6: Fonksiyon İçinde Fonksiyon ---");
  selamlamaYap("Mehmet");

  print("\n╔═══════════════════════════════════════════════╗");
  print("║           PROGRAM BAŞARIYLA TAMAMLANDI        ║");
  print("╚═══════════════════════════════════════════════╝");
}

// ========================= FONKSİYON TANIMLARI =========================

// ==================== ÖRNEK 1: Void Fonksiyonlar ====================
/*
 * Void fonksiyonlar değer döndürmez, sadece işlem yapar.
 * Syntax: void fonksiyonAdi() { }
 */

/// Ekrana selam mesajı yazdırır
void selamVer() {
  print("Merhaba! Fonksiyonlar dünyasına hoş geldiniz.");
}

/// Ekrana çizgi çizer
void cizgiCiz() {
  print("─────────────────────────────────────");
}

// ==================== ÖRNEK 2: Return Fonksiyonlar ====================
/*
 * Return fonksiyonlar değer döndürür.
 * Syntax: TipAdi fonksiyonAdi() { return deger; }
 */

/// Bir sayı döndürür
/// Returns: 42 değeri
int sayiGetir() {
  return 42; // Bu değer fonksiyonu çağıran yere döner
}

/// İki sayının toplamını döndürür
/// Returns: 5 + 3 = 8
int topla() {
  int sayi1 = 5;
  int sayi2 = 3;
  return sayi1 + sayi2; // Toplam değer döner
}

// ==================== ÖRNEK 3: Parametreli Fonksiyonlar ====================
/*
 * Parametreli fonksiyonlar dışarıdan değer alır.
 * Syntax: void fonksiyonAdi(TipAdi parametre) { }
 */

/// Verilen ismi ekrana yazdırır
/// [isim]: Yazdırılacak isim
void isimYazdir(String isim) {
  print("Merhaba $isim!");
}

// ==================== ÖRNEK 4: Parametreli Return Fonksiyonlar ====================
/*
 * Hem parametre alır hem de değer döndürür.
 * Syntax: TipAdi fonksiyonAdi(TipAdi param1, TipAdi param2) { return sonuc; }
 */

/// İki sayıyı toplar ve sonucu döndürür
/// [sayi1]: Birinci sayı
/// [sayi2]: İkinci sayı
/// Returns: iki sayının toplamı
int ikiSayiTopla(int sayi1, int sayi2) {
  int toplam = sayi1 + sayi2;
  return toplam;
}

/// İndirimli fiyat hesaplar
/// [fiyat]: Ürünün orijinal fiyatı
/// [indirimOrani]: İndirim oranı (0.0 - 1.0 arası, örn: 0.2 = %20)
/// Returns: İndirimli fiyat
double indirimHesapla(double fiyat, double indirimOrani) {
  double indirimTutari = fiyat * indirimOrani;
  double yeniFiyat = fiyat - indirimTutari;
  return yeniFiyat;
}

// ==================== ÖRNEK 6: Fonksiyon İçinde Fonksiyon ====================
/*
 * Bir fonksiyon içinden başka fonksiyonlar çağrılabilir
 */

/// Kişiye özel selamlama yapar
/// İçinde başka fonksiyonları çağırır
void selamlamaYap(String isim) {
  cizgiCiz(); // Başka bir fonksiyon çağrılıyor
  print("Hoş geldin $isim!");
  print("Güzel günler dileriz.");
  cizgiCiz(); // Tekrar çağrılıyor
}

// ========================= FONKSİYON AVANTAJLARI =========================
/*
 * ✅ KOD TEKRARINI ÖNLER
 *    Aynı kodu her yerde yazmak yerine fonksiyon çağırırız
 * 
 * ✅ OKUNAKLILIK ARTAR
 *    Kod daha anlaşılır ve düzenli olur
 * 
 * ✅ BAKIM KOLAYLIĞI
 *    Değişiklik yapmak istediğimizde sadece fonksiyonu değiştiririz
 * 
 * ✅ YENİDEN KULLANILABİLİRLİK
 *    Aynı fonksiyon farklı yerlerde kullanılabilir
 * 
 * ✅ TEST EDİLEBİLİRLİK
 *    Her fonksiyon ayrı ayrı test edilebilir
 */

// ========================= ÖZET =========================
/*
 * FONKSİYON YAPISI:
 * 
 * [Dönüş Tipi] [Fonksiyon Adı] ([Parametreler]) {
 *     // İşlemler
 *     return [değer]; // (Sadece return fonksiyonlarda)
 * }
 * 
 * ÖRNEKLER:
 * void yazdir()                    → Parametresiz, void
 * void yazdir(String metin)        → Parametreli, void
 * int topla()                      → Parametresiz, return
 * int topla(int a, int b)          → Parametreli, return
 */
