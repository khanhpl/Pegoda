import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/models/show_result.dart';
import '../constants.dart' as Constants;
import '../globals.dart' as Globals;
class ShowServiceTypeScreen extends StatefulWidget{
  var serviceName;
  ShowServiceTypeScreen({required this.serviceName});
  @override
  State<ShowServiceTypeScreen> createState() => _ShowServiceTypeScreenState(serviceName: this.serviceName);
}

class _ShowServiceTypeScreenState extends State<ShowServiceTypeScreen> {
  var serviceName;
  _ShowServiceTypeScreenState({required this.serviceName});
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _boxColor = Constants.boxColor;
    var _bgColor = Constants.bgColor;
    List _pccList = Globals.pccList;
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
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _pccList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    width: _pageWidth,
                    child: Column(
                      children: [
                        SizedBox(height: _pageHeight * 0.03),
                      ],
                    ),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return ShowResult(pcc: _pccList[index]);
                },
              ),
              SizedBox(height: _pageHeight*0.1),
            ],
          ),
        ),
      ),
    );
  }
}