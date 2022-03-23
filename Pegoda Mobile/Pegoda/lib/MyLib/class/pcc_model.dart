import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';

class PCCModel {
  var PCCId;
  var PCCName;
  var PCCEmail;
  var PCCDescription;
  var PCCAddress;
  var PCCLongitude;
  var PCCLatitude;

  PCCModel(
      {required this.PCCId, required this.PCCName, required this.PCCEmail, required this.PCCDescription, required this.PCCAddress,
        required this.PCCLongitude, required this.PCCLatitude});

  factory PCCModel.fromJson(Map<String, dynamic> json) {
    return PCCModel(
      PCCId: json['id'],
      PCCName: json['name'],
      PCCEmail: json['email'],
      PCCDescription: json['description'],
      PCCAddress: json['address'],
      PCCLongitude: json['longitude'],
      PCCLatitude: json['latiude'],
    );
  }
}
