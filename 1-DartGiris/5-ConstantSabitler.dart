// =============================== Bölüm 5: Sabit Değişkenler (const ve final) ===============================

/*
SABİT DEĞİŞKENLER NEDİR?
Sabit değişkenler, program çalışması sırasında değeri değişmeyen değişkenlerdir.
Dart'ta iki tür sabit değişken vardır: const ve final

CONST vs FINAL FARKLARI:

1. CONST (Compile-time Constant):
   - Derleme zamanında değeri belirlenir
   - Değer tamamen sabit olmalıdır
   - Daha hızlı çalışır
   - Matematik işlemleri, String literal'lar kullanılabilir

2. FINAL (Run-time Constant):
   - Çalışma zamanında değeri belirlenir
   - Sadece bir kez atanabilir
   - Daha esnek kullanım
   - Metod çağrıları, hesaplamalar kullanılabilir

KULLANIM ALANLARI:
- Matematik sabitleri (π, e, vb.)
- Uygulama ayarları
- API URL'leri
- Sabit metinler
- Performans optimizasyonu
*/

void main() {
  // ========================= CONST (Compile-time Constant) =========================

  print("=== CONST ÖRNEKLERİ ===");

  // ========== Temel const Kullanımı ==========
  const double pi = 3.14159; // Matematik sabiti
  const String uygulamaAdi = "Dart App"; // Uygulama adı
  const int maxKullaniciSayisi = 1000; // Maksimum kullanıcı sayısı

  print("Pi değeri: $pi");
  print("Uygulama adı: $uygulamaAdi");
  print("Max kullanıcı: $maxKullaniciSayisi");

  // ========== const ile Matematik İşlemleri ==========
  const int sayi1 = 10;
  const int sayi2 = 20;
  const int toplam = sayi1 + sayi2; // ✅ Doğru: const ile matematik işlem
  const double alan = pi * 5 * 5; // ✅ Doğru: const ile hesaplama

  print("Toplam: $toplam");
  print("Dairenin alanı (r=5): $alan");

  // ========== const ile String İşlemleri ==========
  const String selam = "Merhaba";
  const String isim = "Dart";
  const String mesaj = selam + " " + isim + "!"; // ✅ String birleştirme

  print("Mesaj: $mesaj");

  // ========== const ile Liste ve Map ==========
  const List<int> sayilar = [1, 2, 3, 4, 5];
  const Map<String, int> puanlar = {"Matematik": 95, "Fizik": 88, "Kimya": 92};

  print("Sayılar: $sayilar");
  print("Puanlar: $puanlar");
  print("İlk sayı: ${sayilar[0]}");
  print("Matematik puanı: ${puanlar['Matematik']}");

  // ❌ HATA ÖRNEKLERİ (const ile yapılamaz):
  // const DateTime simdi = DateTime.now(); // ❌ HATA: Runtime değer
  // const int rastgele = Random().nextInt(100); // ❌ HATA: Runtime değer

  // ========================= FINAL (Run-time Constant) =========================

  print("\n=== FINAL ÖRNEKLERİ ===");

  // ========== Temel final Kullanımı ==========
  final DateTime simdi = DateTime.now(); // ✅ Çalışma zamanında değer
  final String kullaniciAdi = "Muhammed"; // ✅ String değer
  final int yas = 25; // ✅ Sayısal değer

  print("Şu anki zaman: $simdi");
  print("Kullanıcı adı: $kullaniciAdi");
  print("Yaş: $yas");

  // ========== final ile Hesaplamalar ==========
  final double boy = 1.85;
  final double kilo = 75.5;
  final double vki = kilo / (boy * boy); // ✅ BMI hesaplama

  print("Boy: ${boy}m");
  print("Kilo: ${kilo}kg");
  print("VKI: ${vki.toStringAsFixed(2)}");

  // ========== final ile Metod Çağrıları ==========
  final String buyukHarf = kullaniciAdi.toUpperCase();
  final int karakterSayisi = kullaniciAdi.length;
  final String formatliYas = "Yaş: $yas";

  print("Büyük harf: $buyukHarf");
  print("Karakter sayısı: $karakterSayisi");
  print("Formatlı yaş: $formatliYas");

  // ========== final ile Liste ve Map ==========
  final List<String> hobiler = ["Kitap okuma", "Yüzme", "Müzik"];
  final Map<String, dynamic> kullaniciBilgileri = {
    "ad": kullaniciAdi,
    "yas": yas,
    "aktif": true,
    "kayitTarihi": simdi,
  };

  print("Hobiler: $hobiler");
  print("Kullanıcı bilgileri: $kullaniciBilgileri");

  // ❌ HATA ÖRNEĞİ (final ile yapılamaz):
  // final String sabit = "Merhaba";
  // sabit = "Selam"; // ❌ HATA: final değişken tekrar atanamaz

  // ========================= KARŞILAŞTIRMA ÖRNEKLERİ =========================

  print("\n=== CONST vs FINAL KARŞILAŞTIRMASI ===");

  // Aynı değer için const ve final kullanımı
  const String constMesaj = "Merhaba Dünya";
  final String finalMesaj = "Merhaba Dünya";

  print("Const mesaj: $constMesaj");
  print("Final mesaj: $finalMesaj");

  // Performans farkı (const daha hızlı)
  const int constSayi = 42;
  final int finalSayi = 42;

  print("Const sayı: $constSayi");
  print("Final sayı: $finalSayi");

  // ========================= GERÇEK HAYAT ÖRNEKLERİ =========================

  print("\n=== GERÇEK HAYAT ÖRNEKLERİ ===");

  // ========== Uygulama Sabitleri ==========
  const String appName = "E-Ticaret App";
  const String version = "1.0.0";
  const String apiBaseUrl = "https://api.e-ticaret.com";
  const int maxRetryCount = 3;

  print("Uygulama: $appName v$version");
  print("API URL: $apiBaseUrl");
  print("Max retry: $maxRetryCount");

  // ========== Kullanıcı Bilgileri (final) ==========
  final String userId = "user_12345";
  final DateTime loginTime = DateTime.now();
  final String sessionToken = "abc123def456";

  print("Kullanıcı ID: $userId");
  print("Login zamanı: $loginTime");
  print("Session token: $sessionToken");

  // ========== Hesaplamalı Sabitler ==========
  const double kdvOrani = 0.18; // %18 KDV
  final double urunFiyati = 100.0;
  final double kdvTutari = urunFiyati * kdvOrani;
  final double toplamTutar = urunFiyati + kdvTutari;

  print("Ürün fiyatı: ${urunFiyati} TL");
  print("KDV tutarı: ${kdvTutari.toStringAsFixed(2)} TL");
  print("Toplam tutar: ${toplamTutar.toStringAsFixed(2)} TL");

  // ========================= SINIF İÇİNDE SABİT KULLANIMI =========================

  print("\n=== SINIF İÇİNDE SABİT KULLANIMI ===");

  var hesap = BankaHesabi("1234567890", 1000.0);
  hesap.bilgiGoster();
}

// ========== ÖRNEK SINIF: BankaHesabi ==========
class BankaHesabi {
  // const ile sınıf sabitleri
  static const String bankaAdi = "Türk Bankası";
  static const double faizOrani = 0.12; // %12 faiz

  // final ile instance değişkenler
  final String hesapNo;
  final double bakiye;
  final DateTime acilisTarihi;

  // Constructor
  BankaHesabi(this.hesapNo, this.bakiye) : acilisTarihi = DateTime.now();

  void bilgiGoster() {
    print("\n--- BANKA HESAP BİLGİLERİ ---");
    print("Banka: $bankaAdi");
    print("Hesap No: $hesapNo");
    print("Bakiye: ${bakiye.toStringAsFixed(2)} TL");
    print("Açılış tarihi: $acilisTarihi");
    print("Faiz oranı: ${(faizOrani * 100).toStringAsFixed(0)}%");

    // Hesaplamalı değerler (final)
    final double yillikFaiz = bakiye * faizOrani;
    final double aylikFaiz = yillikFaiz / 12;

    print("Yıllık faiz: ${yillikFaiz.toStringAsFixed(2)} TL");
    print("Aylık faiz: ${aylikFaiz.toStringAsFixed(2)} TL");
  }
}

// ========================= ÖNEMLİ NOTLAR VE ÖNERİLER =========================

/*
CONST vs FINAL NE ZAMAN KULLANILIR?

✅ CONST KULLAN:
- Matematik sabitleri (π, e, vb.)
- String literal'lar
- Derleme zamanında bilinen değerler
- Performans kritik yerler
- Liste/Map sabitleri

✅ FINAL KULLAN:
- Constructor parametreleri
- Metod çağrıları sonucu
- Runtime hesaplamalar
- Kullanıcı girişi sonucu
- DateTime.now() gibi runtime değerler

❌ NE ZAMAN KULLANMA:
- Değeri değişebilecek değişkenler için
- Geçici hesaplamalar için
- Loop içinde değişen değerler için

PERFORMANS:
- const: En hızlı, derleme zamanında optimize edilir
- final: Hızlı, runtime'da bir kez hesaplanır
- var: Her seferinde yeniden hesaplanabilir

BEST PRACTICES:
1. Mümkün olduğunca const kullanın
2. Runtime değerler için final kullanın
3. Sabit değerler için büyük harf kullanın
4. Sınıf sabitleri için static const kullanın
5. Instance değişkenleri için final kullanın
*/
