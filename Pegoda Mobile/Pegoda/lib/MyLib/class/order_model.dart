class OrderModel {
  var customerId;
  var customerName;
  var email;
  var petId;
  var petName;
  var petStatus;
  var petGender;
  var orderId;
  var date;
  var totalPrice;
  var orderStatus;
  var centerID;

  OrderModel(
      this.customerId,
      this.customerName,
      this.email,
      this.petId,
      this.petName,
      this.petStatus,
      this.petGender,
      this.orderId,
      this.date,
      this.totalPrice,
      this.orderStatus,
      this.centerID);

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      json['customerId'],
      json['customerName'],
      json['email'],
      json['petId'],
      json['petName'],
      json['petStatus'],
      json['petGender'],
      json['orderId'],
      json['date'],
      json['totalPrice'],
      json['orderStatus'],
      json['centerId'],
    );
  }
}
