// ========================= 3- Örnek Alan Hesabı =========================
/* 
 * Bu dosya, Dart dilinde örnek alan hesabını gösterir.
 * Örnek alan hesabı, programlama mantığının temelini oluşturan bu yapı, hesaplamalarında sıkça kullanılır.
 */

import 'dart:io';

void main() {
  // ========================= 1- Örnek Alan Hesabı =========================
  // Bu program, kullanıcıdan geometrik şekil seçimi alarak
  // seçilen şeklin alanını hesaplamaktadır.

  // Kullanıcıya hoş geldin mesajı ve menü seçeneklerini gösteriyoruz
  print("Alan Hesaplama Programına Hoş Geldiniz");
  print("Lütfen Alanını Hesaplamak İstediğiniz Şekli Seçiniz:");
  print("1. Daire Alanı Hesaplama");
  print("2. Dikdörtgen Alanı Hesaplama");
  print("3. Üçgen Alanı Hesaplama");

  // Kullanıcıdan seçim alıyoruz
  // stdin.readLineSync()! : Konsoldan string olarak veri okur
  // int.parse() : String'i integer'a çevirir
  var secim = int.parse(stdin.readLineSync()!);
  // ========================= Durum 1: Daire Alanı =========================
  if (secim == 1) {
    // Kullanıcı 1'i seçtiyse daire alanı hesaplanacak
    print("Seçiminiz: 1-Daire Alanı Hesaplama");
    print("================================================");

    // Daire yarıçapını kullanıcıdan alıyoruz
    print("Lütfen Daire Yarıçapını Giriniz: ");
    var yaricap = double.parse(stdin.readLineSync()!);

    // Daire alanı formülü: π * r²
    // π (pi) değerini 3.14 olarak alıyoruz
    // yaricap * yaricap = r²
    var alan = 3.14 * yaricap * yaricap;

    // Hesaplanan alanı ekrana yazdırıyoruz
    print("Daire Alanı: $alan");
  }
  // ========================= Durum 2: Dikdörtgen Alanı =========================
  else if (secim == 2) {
    // Kullanıcı 2'yi seçtiyse dikdörtgen alanı hesaplanacak
    print("Seçiminiz: 2-Dikdörtgen Alanı Hesaplama");
    print("================================================");

    // Dikdörtgenin uzun kenar uzunluğunu alıyoruz
    print("Lütfen Diktörtgenin uzun kenarının uzunluğunu giriniz: ");
    var uzunkenar = double.parse(stdin.readLineSync()!);

    // Dikdörtgenin kısa kenar uzunluğunu alıyoruz
    print("Lütfen Diktörtgenin kısa kenarının uzunluğunu giriniz: ");
    var kisakenar = double.parse(stdin.readLineSync()!);

    // Dikdörtgen alanı formülü: Uzun Kenar * Kısa Kenar
    var alan = uzunkenar * kisakenar;

    // Hesaplanan alanı ekrana yazdırıyoruz
    print("Diktörtgen Alanı: $alan");
  }
  // ========================= Durum 3: Üçgen Alanı =========================
  else if (secim == 3) {
    // Kullanıcı 3'ü seçtiyse üçgen alanı hesaplanacak
    print("Seçiminiz: 3-Üçgen Alanı Hesaplama");
    print("================================================");

    // Üçgenin taban uzunluğunu alıyoruz
    print("Lütfen Üçgenin taban uzunluğu giriniz: ");
    var taban = double.parse(stdin.readLineSync()!);

    // Üçgenin yüksekliğini alıyoruz
    print("Lütfen Üçgenin yüksekliğini giriniz: ");
    var yukseklik = double.parse(stdin.readLineSync()!);

    // Üçgen alanı formülü: (Taban * Yükseklik) / 2
    var alan = (taban * yukseklik) / 2;

    // Hesaplanan alanı ekrana yazdırıyoruz
    print("Üçgen Alanı: $alan");
  }
  // ========================= Geçersiz Seçim Durumu =========================
  else {
    // Kullanıcı 1, 2 veya 3 dışında bir değer girdiyse
    // bu blok çalışır ve hata mesajı verir
    print("Lütfen Geçerli Bir Seçim Yapınız");
  } 
  // Program burada sona erer
}
