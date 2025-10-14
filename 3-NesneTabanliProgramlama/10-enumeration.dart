// ========================= ENUMERATION =========================
/*
 * Enumeration (Enum), belirli bir değer kümesini temsil eden özel bir veri tipidir.
 * Kodun okunabilirliğini artırır ve sabit değerleri daha anlamlı hale getirir.
 * Hata yapma olasılığını azaltır çünkü sadece tanımlı değerler kullanılabilir.
 */

// Konserve boyutları için enum tanımı
// Sadece Küçük, Orta ve Büyük değerleri kabul edilir
enum KonserveBoyutu { Kucuk, Orta, Buyuk }

// Bilgisayar markalarını temsil eden enum
// Her marka bir sabit değer olarak tanımlanmıştır
enum Computer {
  Monster,
  Asus,
  Lenovo,
  HP,
  Acer,
  Toshiba,
  Dell,
  Apple,
  Samsung,
  Huawei,
  Sony,
  Microsoft,
  Aorus,
}

void main() {
  // Enum değerleri nokta notasyonu ile kullanılır: EnumAdı.DeğerAdı
  ucretlendirme(KonserveBoyutu.Kucuk);
  bilgisayarFiyati(Computer.Monster);
}

// Enum parametresi alan fonksiyon
// Switch-case yapısı enum'lar ile mükemmel uyum sağlar
void ucretlendirme(KonserveBoyutu boyut) {
  switch (boyut) {
    case KonserveBoyutu.Kucuk:
      print("Küçük konserve için 10 TL ödeme yapılır.");
      break;
    case KonserveBoyutu.Orta:
      print("Orta konserve için 20 TL ödeme yapılır.");
    // break olmadığı için bir sonraki case'e geçer (fall-through)
    case KonserveBoyutu.Buyuk:
      print("Büyük konserve için 30 TL ödeme yapılır.");
      break;
  }
}

// Bilgisayar fiyatını enum değerine göre hesaplayan fonksiyon
// computer.name ile enum değerinin string karşılığını alabiliriz
void bilgisayarFiyati(Computer computer) {
  switch (computer) {
    case Computer.Monster:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 10.000 TL'dir.");
      break;
    case Computer.Asus:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 15.000 TL'dir.");
      break;
    case Computer.Lenovo:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 12.000 TL'dir.");
      break;
    case Computer.HP:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 13.000 TL'dir.");
      break;
    case Computer.Acer:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 14.000 TL'dir.");
      break;
    case Computer.Toshiba:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 16.000 TL'dir.");
      break;
    case Computer.Dell:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 17.000 TL'dir.");
      break;
    case Computer.Apple:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 18.000 TL'dir.");
      break;
    case Computer.Samsung:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 19.000 TL'dir.");
      break;
    case Computer.Huawei:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 20.000 TL'dir.");
      break;
    case Computer.Sony:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 21.000 TL'dir.");
      break;
    case Computer.Microsoft:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 22.000 TL'dir.");
      break;
    case Computer.Aorus:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 23.000 TL'dir.");
      break;
    default:
      print("Seçtiğiniz Bilgisayarın Fiyatı (${computer.name}) 0 TL'dir.");
      break;
  }
}
