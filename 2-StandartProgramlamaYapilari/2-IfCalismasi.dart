// ========================= 2- If Çalışması =========================
/* 
 * Bu dosya, Dart dilinde if çalışmasını gösterir.
 * If çalışması, programlama mantığının temelini oluşturan bu yapı, karar yapılarında sıkça kullanılır.
 */

void main() {
  // ========================= 1- If Çalışması =========================
  int yas = 21;
  String isim = "Muhammed Said Elsalih";

  // Örnek 1: Basit If-Else Yapısı
  // Yaş kontrolü yaparak ehliyet alma durumunu kontrol ediyoruz.
  // Eğer yaş 18 veya daha büyükse ilk blok çalışır, değilse else bloğu çalışır.

  if (yas >= 18) {
    print("Ehliyet alabilirsiniz.");
  } else {
    print("Ehliyet alamazsınız.");
  }

  // Örnek 2: String Karşılaştırması
  // İsim değişkenini belirli bir string değer ile karşılaştırıyoruz.
  // Dart'ta string karşılaştırmaları büyük-küçük harf duyarlıdır (case-sensitive).
  // İsim "Muhammed Said" değilse else bloğu çalışır ve gerçek ismi yazdırır.

  if (isim == "Muhammed Said") {
    print("Merhaba Muhammed Said");
  } else {
    print("Tanınmayan kişi:");
    print("Merhaba $isim");
  }

  // Örnek 3: If-Else If-Else Yapısı (Çoklu Koşul Kontrolü)
  // Birden fazla koşulu sırayla kontrol etmek için else if kullanırız.
  // İlk doğru koşul bulunduğunda, o blok çalışır ve diğer koşullar kontrol edilmez.
  // Hiçbir koşul sağlanmazsa en sondaki else bloğu çalışır.

  if (isim == "muhammed said") {
    print("Merhaba Muhammed Said");
  } else if (isim == "Muhammed Said Elsalih") {
    print("Merhaba Muhammed Said Elsalih");
  } else if (isim == "admin") {
    print("Merhaba admin");
  } else {
    print("Tanınmayan kişi:");
    print("Merhaba $isim");
  }

  // Örnek 4: Mantıksal AND (&&) Operatörü Kullanımı
  // && operatörü ile birden fazla koşulun AYNI ANDA doğru olmasını kontrol ederiz.
  // Tüm koşullar doğruysa blok çalışır, bir tanesi bile yanlışsa çalışmaz.
  // Bu örnekte kullanıcı adı ve şifre kontrolü yapılıyor.

  String KullaniciAdi = "admin";
  String sifre = "159802";

  if (KullaniciAdi == "admin" && sifre == "159802") {
    // Her iki koşul da doğru ise bu blok çalışır
    print("Merhaba admin");
  } else if (KullaniciAdi == "admin" && sifre != "159802") {
    // Kullanıcı adı doğru ama şifre yanlış
    print("Şifre yanlış");
  } else if (KullaniciAdi != "admin" && sifre == "159802") {
    // Şifre doğru ama kullanıcı adı yanlış
    print("Kullanıcı adı yanlış");
  } else {
    // Her ikisi de yanlış
    print("Kullanıcı adı veya şifre yanlış");
  }

  // Örnek 5: Mantıksal OR (||) Operatörü Kullanımı
  // || operatörü ile koşullardan EN AZ BİRİNİN doğru olmasını kontrol ederiz.
  // Koşullardan herhangi biri doğruysa blok çalışır.
  // Her ikisi de yanlışsa else bloğu çalışır.

  if (KullaniciAdi == "admin" || sifre == "159802") {
    // Kullanıcı adı "admin" VEYA şifre "159802" ise bu blok çalışır
    print("Merhaba admin");
  } else {
    // Her ikisi de yanlış ise bu blok çalışır
    print("Kullanıcı adı veya şifre yanlış");
  }

  // Örnek 6: NOT (!) Operatörü Kullanımı
  // ! operatörü bir boolean değeri tersine çevirir (true -> false, false -> true)

  // Durum 1: Giriş yapılmamış
  bool girisYapildi = false;
  if (!girisYapildi) {
    print("Lütfen giriş yapınız.");
  }

  // Durum 2: Giriş yapılmış
  bool kullaniciAktif = true;
  if (kullaniciAktif) {
    print("Hoş geldiniz!");
  }
}
