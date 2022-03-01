import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/pcc.dart';
import 'package:pegoda/MyLib/models/show_pcc_item.dart';
import '../../../MyLib/constants.dart' as Constants;

class NearestPCCScreen extends StatefulWidget{
  @override
  State<NearestPCCScreen> createState() => _NearestPCCScreenState();
}

class _NearestPCCScreenState extends State<NearestPCCScreen> {
  var _primaryColor = Constants.primaryColor;
  List<PCC> _pccList = [
    PCC(
        PCCName: 'Dog Paradise',
        PCCImage:
        'https://petee.vn/wp-content/uploads/2020/11/dogparadise-logo.png',
        PCCService: 'Chăm lo cho boss',
        PCCRating: '4.9',
        PCCDistance: '5km'),
    PCC(
        PCCName: 'Petcare VN',
        PCCImage:
        'https://petcare.vn/wp-content/uploads/2016/05/petcare_logo-1.png',
        PCCService: "Y tế thú cưng",
        PCCRating: '4.6',
        PCCDistance: '10.4km'),
    PCC(
        PCCName: 'Thú y pet pro',
        PCCImage:
        'https://static.topcv.vn/company_logos/pbEIzKqznn7PKiNaVmDPyCZwgpF552sK_1639462508____b229f382460f151f1fb777962db4773a.png',
        PCCService: 'Bệnh viện thú',
        PCCRating: '4.4',
        PCCDistance: '1.6km'),
  ];
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
                    return Container(
                      width: _pageWidth,
                      child: Column(
                        children: [
                          SizedBox(height: _pageHeight * 0.02),
                          Divider(thickness: 2),
                          SizedBox(height: _pageHeight * 0.02),
                        ],
                      ),
                    );
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