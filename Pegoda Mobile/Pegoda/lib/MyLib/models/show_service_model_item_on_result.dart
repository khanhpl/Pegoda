import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/pcc_model.dart';
import 'package:pegoda/MyLib/class/service_model.dart';
import 'package:pegoda/MyLib/models/show_service_model_detail.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';
import '../../MyLib/constants.dart' as Constants;
//Test Model

class ShowServiceModelItemOnResult extends StatefulWidget{
  ServiceModel serviceModel;
  ShowServiceModelItemOnResult({required this.serviceModel});
  @override
  State<ShowServiceModelItemOnResult> createState() => _ShowServiceModelItemOnResultState(serviceModel: this.serviceModel);
}

class _ShowServiceModelItemOnResultState extends State<ShowServiceModelItemOnResult> {
  ServiceModel serviceModel;
  _ShowServiceModelItemOnResultState({required this.serviceModel});
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _bgColor = Constants.bgColor;
    var _boxColor = Constants.boxColor;
    var _starColor = Constants.starColor;
    final Future<String> pccFuture = GetAPI().GetPCCNameById(serviceModel.centerId);

    // TODO: implement build
    return  FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowServiceModelDetail(serviceModel: serviceModel),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(_pageWidth*0.15, 0, _pageWidth*0.05, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: _pageWidth * 0.03),
              width: _pageWidth * 0.18,
              height: _pageWidth * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(serviceModel.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: _pageWidth * 0.5,
                  child: Text(
                    serviceModel.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: _pageHeight * 0.022,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: _pageHeight * 0.02),
                Text(
                  serviceModel.price.toString()+'đ',
                  style: TextStyle(
                    fontSize: _pageHeight * 0.022,
                    fontWeight: FontWeight.w500,
                    color: _primaryColor,
                  ),
                ),
                SizedBox(height: _pageHeight * 0.015),
                FutureBuilder<String>(
                  future: pccFuture,
                  builder: (context, snapshot){
                    if (snapshot.hasError) print(snapshot.error);
                    if (snapshot.hasData) {
                      return Container(
                        width: _pageWidth*0.5,
                        child: Text(
                          'Trung tâm: '+ snapshot.data!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: _pageHeight * 0.022,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    } else {
                      return Container(child: CircularProgressIndicator());
                    }
                  },
                ),

              ],
            ),
          ],
        ),
      ),
      padding: EdgeInsets.all(0),
    );
  }
}