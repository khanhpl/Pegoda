class OrderReview {
  var OrderID;
  var Date;
  var PetName;
  var PCCName;
  var Service;
  var TotalPrice;
  var Note;
  var Status;
  OrderReview({required this.OrderID, required this.Date, required this.PetName, this.PCCName, required this.Service,
    required this.TotalPrice, required this.Note, required this.Status});

}