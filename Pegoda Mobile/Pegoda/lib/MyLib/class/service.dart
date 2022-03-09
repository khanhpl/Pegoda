import 'package:flutter/material.dart';

class Service{
  var ServiceName;
  var ServiceImage;
  List<NetworkImage> ServiceSlideImage;
  var ServicePrice;
  var ServiceDailyPrice;
  var ServiceType;
  var ServiceDescription;

  Service({required this.ServiceName, required this.ServiceImage, required this.ServiceSlideImage, required this.ServicePrice, required this.ServiceDailyPrice, required this.ServiceType,required this.ServiceDescription});
}