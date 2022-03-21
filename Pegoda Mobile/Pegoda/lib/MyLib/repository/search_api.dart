import 'dart:convert';
import 'package:pegoda/MyLib/class/service_model.dart';
import 'package:http/http.dart' as http;
class SearchAPI{
  Future<List<ServiceModel>> SearchService(String serviceName, String animalID, String serviceTypeID) async {
    try {
      var urlString = "https://pegoda.azurewebsites.net/api/v1.0/services?";
      if(serviceName.isNotEmpty){
        urlString = urlString + "name=${serviceName}";
      }
      if(animalID.isNotEmpty){
        if(serviceName.isNotEmpty){
          urlString = urlString + "&animalId=${animalID}";
        }else{
          urlString = urlString + "animalId=${animalID}";
        }
      }

      if(serviceTypeID.isNotEmpty){
        if(serviceName.isNotEmpty || animalID.isNotEmpty){
          urlString = urlString + "&serviceTypeId=${serviceTypeID}";
        }else{
          urlString = urlString + "serviceTypeId=${serviceTypeID}";
        }
      }
      print('String url: '+ urlString);

      var url =
      Uri.parse(urlString);
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print('Responsebody:'+response.body);
      if (response.statusCode.toString() == '200') {
        return parseAgentsServiceModel(response.body);
      } else {
        throw Exception('Unable to fetch PCCModel from the REST API');
      }
    } finally {}
  }
}

List<ServiceModel> parseAgentsServiceModel(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ServiceModel>((json) => ServiceModel.fromJson(json)).toList();
}