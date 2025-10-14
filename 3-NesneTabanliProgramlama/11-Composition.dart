// ========================= COMPOSITION (BİLEŞİM) =========================
/*
 * Composition (Bileşim), bir sınıfın başka sınıfları içermesi durumudur.
 * "Has-A" (Sahip olma) ilişkisini temsil eder.
 * Örnek: Personel bir Adres'e sahiptir (Personel HAS-A Adres)
 * 
 * Composition, kodun yeniden kullanılabilirliğini artırır ve daha esnek yapılar oluşturur.
 */

// Adres sınıfı - Bağımsız bir varlık olarak tasarlanmıştır
class Adres {
  String? il;
  String? ilce;
  String? mahalle;

  // Constructor - Adres nesnesi oluşturulurken gerekli bilgiler alınır
  Adres(this.il, this.ilce, this.mahalle);

  void bilgileriYazdir() {
    print("İl: $il, İlçe: $ilce, Mahalle: $mahalle");
  }
}

// Personel sınıfı - Composition örneği
// Bu sınıf hem Adres hem de Department nesnelerini içerir (COMPOSITION)
// Personel HAS-A Adres (Personelin bir adresi vardır)
// Personel HAS-A Department (Personelin bir departmanı vardır)
class Personel {
  String? name, surname, email, phone;

  // Composition: Personel sınıfı Adres sınıfını içerir
  Adres? adres;

  // Composition: Personel sınıfı Department sınıfını içerir
  Department? department;

  // Constructor - Personel oluşturulurken diğer nesneler de parametre olarak alınır
  Personel(
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.adres,
    this.department,
  );

  void bilgileriYazdir() {
    print(
      "Adı: $name, Soyadı: $surname, Email: $email, Telefon: $phone, Adres: ",
    );
    // Null-safety operatörü (?.) ile adres varsa bilgilerini yazdır
    adres?.bilgileriYazdir();
    print("Bölüm: ");
    department?.bilgileriYazdir();
  }
}

// Department (Bölüm) sınıfı - Başka bir bağımsız varlık
// Bu sınıf da başka sınıflar tarafından composition ile kullanılabilir
class Department {
  late String name;
  String? description;

  // Composition: Department personel listesi içerir
  // Bu da bir tür composition (liste içinde String değerler)
  List<String>? personeller;

  Department(this.name, this.description, this.personeller);

  void bilgileriYazdir() {
    print("Bölüm Adı: $name, Bölüm Açıklaması: $description");
    print("Personeller: ");
    // Listedeki tüm personelleri yazdır
    for (String personel in personeller!) {
      print(personel);
    }
  }
}

void main() {
  // 1. Adım: Önce bağımsız nesneler oluşturuyoruz

  // Adres nesnesi oluşturma
  Adres muhammed_adres = Adres("Malatya", "Battalgazi", "Aslanbey");
  muhammed_adres.bilgileriYazdir();
  print("----------------------------------------------------");

  // Department nesnesi oluşturma
  Department muhammed_department = Department(
    "Bilgisayar Mühendisliği",
    "Bilgisayar Mühendisliği Bölümü",
    ["Muhammed Said Elsalih"],
  );
  muhammed_department.bilgileriYazdir();
  print("----------------------------------------------------");

  // 2. Adım: Composition kullanarak Personel nesnesi oluşturma
  // Personel nesnesi, önceden oluşturduğumuz Adres ve Department nesnelerini içerir
  // Bu COMPOSITION'ın temel mantığıdır
  Personel Muhammed = Personel(
    "Muhammed Said",
    "Elsalih",
    "muhammedsaidelsalih@gmail.com",
    "0537 060 66 07",
    muhammed_adres, // Composition: Adres nesnesi
    muhammed_department, // Composition: Department nesnesi
  );
  Muhammed.bilgileriYazdir();
  print("----------------------------------------------------");

  // 3. Adım: İç içe nesne erişimi
  // Composition sayesinde, Personel üzerinden Department'ın özelliklerine erişebiliriz
  // Bu "nesne zinciri" (object chaining) olarak adlandırılır
  print("Personelin Departmanı: ${Muhammed.department?.name}");
  print("Personelin İli: ${Muhammed.adres?.il}");
}
