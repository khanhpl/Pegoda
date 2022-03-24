class PetModel {
  var isSelected = false;
  var petId;
  var petName;
  var genderPet;
  var petStatus;
  var animalId;
  var customerId;
  var customerName;
  var email;

  PetModel(
      this.petId,
      this.petName,
      this.genderPet,
      this.petStatus,
      this.animalId,
      this.customerId,
      this.customerName,
      this.email);

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      json['petId'],
      json['petName'],
      json['genderPet'],
      json['petStatus'],
      json['animalId'],
      json['customerId'],
      json['customerName'],
      json['email'],
    );
  }
}
