class PetcareSystem {
  String name;
  String address;
  String imageUrl;

  PetcareSystem(
    this.name,
    this.address,
    this.imageUrl,
  );

  static List<PetcareSystem> samples = [
    PetcareSystem(
      'Happy Pet Care',
      '421 Hồng Bàng, Phường 14, Quận 5',
      'assets/cus/main_screen/happyPetcare.png',
    ),
    PetcareSystem(
      'Dog Paradise',
      '313 Hoàng Diệu, Phường 6, Quận 4',
      'assets/cus/main_screen/DogParadise.png',
    ),
    PetcareSystem(
      'Pet Mart',
      '244 Khánh Hội, Phường 6, Quận 5',
      'assets/cus/main_screen/petmart.png',
    ),
    PetcareSystem(
      'Siêu thị thú cưng Petcity ',
      '250/3 Lý Chính Thắng, Quận 3 ',
      'assets/cus/main_screen/petcity.jpg',
    ),
    PetcareSystem(
      'Petsaigon',
      '285/55 Cách Mạng Tháng 8, P.12, Q.10',
      'assets/cus/main_screen/petsaigon.png',
    ),
  ];
}
