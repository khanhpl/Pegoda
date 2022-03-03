import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/pcc.dart';
import 'package:pegoda/MyLib/models/show_pcc_item.dart';
import '../../../MyLib/constants.dart' as Constants;
import '../../../MyLib/globals.dart' as Globals;

class NearestPCCScreen extends StatefulWidget{
  @override
  State<NearestPCCScreen> createState() => _NearestPCCScreenState();
}

class _NearestPCCScreenState extends State<NearestPCCScreen> {
  var _primaryColor = Constants.primaryColor;
  var _bgColor = Constants.bgColor;
  List<PCC> _pccList = Globals.pccList;
  @override
  Widget build(BuildContext context) {

    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Trung tâm gần bạn',
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
      body: Material(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: _pageHeight * 0.03),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _pccList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: _pageHeight*0.02);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ShowPCCItem(pcc: _pccList[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}