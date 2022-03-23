import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/service_model.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';
import '../../MyLib/constants.dart' as Constants;
import '../../MyLib/globals.dart' as Globals;
//Test Model

class ShowServiceModelItemOnOrder extends StatefulWidget{
  ServiceModel serviceModel;
  ShowServiceModelItemOnOrder({required this.serviceModel});
  @override
  State<ShowServiceModelItemOnOrder> createState() => _ShowServiceModelItemOnOrderState(serviceModel: this.serviceModel);
}

class _ShowServiceModelItemOnOrderState extends State<ShowServiceModelItemOnOrder> {
  ServiceModel serviceModel;
  _ShowServiceModelItemOnOrderState({required this.serviceModel});
  var _checkChoosen = false;
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
        setState(() {
          if(_checkChoosen){
            Globals.listServiceOnOrder.remove(serviceModel);
            _checkChoosen = false;
          }else{
            Globals.listServiceOnOrder.add(serviceModel);
            _checkChoosen = true;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(_pageWidth*0.05, 0, _pageWidth*0.05, 0),
        color: _checkChoosen ? Color(0xff8C8BE4) : _boxColor,
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
                  width: _pageWidth * 0.4,
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
              ],
            ),
          ],
        ),
      ),
      padding: EdgeInsets.all(0),
    );
  }
}