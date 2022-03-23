import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/pcc_model.dart';
import 'package:pegoda/MyLib/class/service_model.dart';
import 'package:pegoda/MyLib/models/show_pcc_model_item.dart';
import 'package:pegoda/MyLib/models/show_service_model_item_on_result.dart';
import 'package:pegoda/MyLib/repository/search_api.dart';
import '../constants.dart' as Constants;
import '../globals.dart' as Globals;
class ShowServiceTypeScreen extends StatefulWidget{
  var serviceName;
  var serviceTypeID;
  ShowServiceTypeScreen({required this.serviceName, required this.serviceTypeID});
  @override
  State<ShowServiceTypeScreen> createState() => _ShowServiceTypeScreenState(serviceName: this.serviceName, serviceTypeID: this.serviceTypeID);
}

class _ShowServiceTypeScreenState extends State<ShowServiceTypeScreen> {
  var serviceName;
  var serviceTypeID;
  _ShowServiceTypeScreenState({required this.serviceName, required this.serviceTypeID});
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _boxColor = Constants.boxColor;
    var _bgColor = Constants.bgColor;
    final Future<List<ServiceModel>> serviceModels = SearchAPI().SearchService('', '', serviceTypeID);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        toolbarHeight: _pageHeight * 0.08,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text(
                serviceName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: _pageHeight*0.03,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: _bgColor,
        padding: EdgeInsets.fromLTRB(_pageWidth*0.03, _pageHeight*0.03, _pageWidth*0.03, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<List<ServiceModel>>(
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  if (snapshot.hasData) {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      // itemCount: snapshot.data!.length,
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: _pageHeight * 0.03);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ShowServiceModelItemOnResult(serviceModel: snapshot.data![index]);
                      },
                    );
                  } else {
                    return Container(child: CircularProgressIndicator());
                  }
                },
                future: serviceModels,
              ),
              SizedBox(height: _pageHeight*0.1),
            ],
          ),
        ),
      ),
    );
  }
}