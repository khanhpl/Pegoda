import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pegoda/MyLib/class/animal.dart';
import 'package:pegoda/MyLib/class/pcc_image.dart';
import 'package:pegoda/MyLib/class/pcc_model.dart';
import 'package:pegoda/MyLib/class/service_model.dart';
import 'package:pegoda/MyLib/class/service_type.dart';
import '../globals.dart' as Globals;

class GetAPI {
  Future<List<PCCModel>> GetAllPCC() async {
    try {
      var url =
      Uri.parse("https://pegoda.azurewebsites.net/api/v1.0/centers");
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode.toString() == '200') {
        return parseAgentsPCCModel(response.body);
      } else {
        throw Exception('Unable to fetch PCCModel from the REST API');
      }
    } finally {}
  }
  Future <String> GetPCCNameById(String id) async {
    try {
      var url =
      Uri.parse("https://pegoda.azurewebsites.net/api/v1.0/centers/${id}");
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode.toString() == '200') {
        return json.decode(response.body)['name'];
      } else {
        throw Exception('Unable to fetch PCCModel from the REST API');
      }
    } finally {}
  }
  Future <String> GetServiceTypeNameById(String id) async {
    try {
      var url =
      Uri.parse("https://pegoda.azurewebsites.net/api/v1.0/servicetypes/${id}");
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode.toString() == '200') {
        print('test: ' + json.decode(response.body)['name']);
        return json.decode(response.body)['name'];
      } else {
        throw Exception('Unable to fetch ServiceModel from the REST API');
      }
    } finally {}
  }
  Future<List<PCCImage>> GetAllPCCImage(var CenterID) async {
    try {
      var url =
      Uri.parse("https://pegoda.azurewebsites.net/api/v1.0/albumimages?CenterId=${CenterID}");
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode.toString() == '200') {
        return parseAgentsPCCImage(response.body);
      } else {
        throw Exception('Unable to fetch PCCImage from the REST API');
      }
    } finally {}
  }

  Future<List<ServiceModel>> GetServiceModelByCenterID(var CenterID) async {
    try {
      var url =
      Uri.parse("https://pegoda.azurewebsites.net/api/v1.0/services?centerId=${CenterID}");
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode.toString() == '200') {
        return parseAgentsServiceModel(response.body);
      } else {
        throw Exception('Unable to fetch ServiceModel from the REST API');
      }
    } finally {}
  }
  Future<List<Animal>> GetAllAnimal() async {
    try {
      var url =
      Uri.parse("https://pegoda.azurewebsites.net/api/v1.0/animals");
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode.toString() == '200') {
        return parseAgentsAnimal(response.body);
      } else {
        throw Exception('Unable to fetch Animal from the REST API');
      }
    } finally {}
  }
  Future<List<ServiceType>> GetAllServiceType() async {
    try {
      var url =
      Uri.parse("https://pegoda.azurewebsites.net/api/v1.0/servicetypes");
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode.toString() == '200') {
        return parseAgentsServiceType(response.body);
      } else {
        throw Exception('Unable to fetch Animal from the REST API');
      }
    } finally {}
  }
}

List<PCCModel> parseAgentsPCCModel(String responseBody) {
final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
return parsed.map<PCCModel>((json) => PCCModel.fromJson(json)).toList();
}

List<PCCImage> parseAgentsPCCImage(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<PCCImage>((json) => PCCImage.fromJson(json)).toList();
}

List<ServiceModel> parseAgentsServiceModel(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ServiceModel>((json) => ServiceModel.fromJson(json)).toList();
}

List<Animal> parseAgentsAnimal(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Animal>((json) => Animal.fromJson(json)).toList();
}
List<ServiceType> parseAgentsServiceType(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ServiceType>((json) => ServiceType.fromJson(json)).toList();
}



