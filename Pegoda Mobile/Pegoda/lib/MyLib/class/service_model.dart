class ServiceModel {
  var id;
  var name;
  var price;
  var description;
  var image;
  var duration;
  var centerId;
  var animalId;
  var serviceTypeId;

  ServiceModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.image,
      required this.duration,
      required this.centerId,
      required this.animalId,
      required this.serviceTypeId});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      duration: json['duration'],
      centerId: json['centerId'],
      animalId: json['animalId'],
      serviceTypeId: json['serviceTypeId'],
    );
  }
}
