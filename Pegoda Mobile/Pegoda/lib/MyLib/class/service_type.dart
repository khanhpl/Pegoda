class ServiceType{
  var serviceTypeID;
  var serviceTypeName;
  ServiceType({required this.serviceTypeID, required this.serviceTypeName});
  factory ServiceType.fromJson(Map<String, dynamic> json) {
    return ServiceType(
      serviceTypeID: json['id'],
      serviceTypeName: json['name'],
    );
  }
}