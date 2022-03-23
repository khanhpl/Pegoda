class Animal{
  var animalID;
  var animalName;
  Animal({required this.animalID, required this.animalName});
  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      animalID: json['id'],
      animalName: json['type'],
    );
  }
}