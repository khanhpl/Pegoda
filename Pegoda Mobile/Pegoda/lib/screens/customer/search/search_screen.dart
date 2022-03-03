import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pegoda/MyLib/class/pcc.dart';
import 'package:pegoda/MyLib/models/show_pcc_detail.dart';
import 'package:pegoda/MyLib/models/show_pcc_item.dart';
import 'package:pegoda/MyLib/models/show_result.dart';
import '../../../MyLib/constants.dart' as Constants;
import '../../../MyLib/globals.dart' as Globals;

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.841653189681802, 106.81001421044863),
    zoom: 14.4746,
  );

  Completer<GoogleMapController> _controller = Completer();
  var _countResult;

  var _resultLabel = '';
  var pettypeValue;
  var serviceTypeValue;
  var pccContent =
      "Pet Hour / Day care & Month care - Home care service Pet Playground & Pet Bathing - Hotel";
  bool isHaveResult = false;
  List _listPettype = Globals.listPettype;
  List _listServiceType = Globals.listServiceType;
  List<PCC> _pccList = Globals.pccList;

  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _bgColor = Constants.bgColor;
    var _boxColor = Constants.boxColor;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        // automaticallyImplyLeading: false,
        toolbarHeight: _pageHeight * 0.1,
        title: Container(
          child: Text(
            'Tìm kiếm',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: _pageHeight * 0.03,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(_pageWidth * 0.03, _pageHeight * 0.03,
            _pageWidth * 0.03, _pageHeight * 0.03),
        color: _bgColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //tìm kiếm dịch vụ
              Container(
                decoration: BoxDecoration(
                  color: _boxColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: _pageWidth,
                height: _pageHeight * 0.1,
                child: Row(
                  children: [
                    SizedBox(width: _pageWidth * 0.03),
                    Container(
                      child: Icon(
                        Icons.search,
                        color: _primaryColor,
                      ),
                      margin: EdgeInsets.only(left: 10),
                    ),
                    SizedBox(width: _pageWidth * 0.03),
                    Expanded(
                      child: Container(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: 'Tìm kiếm dịch vụ',
                            hintStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: _pageHeight * 0.025,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Địa chỉ
              SizedBox(height: _pageHeight * 0.02),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _ChooseLocation(context);
                  });
                },
                padding: EdgeInsets.all(0),
                child: Container(
                  decoration: BoxDecoration(
                    color: _boxColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: _pageWidth,
                  height: _pageHeight * 0.1,
                  child: Row(
                    children: [
                      SizedBox(width: _pageWidth * 0.03),
                      Container(
                        child: Icon(
                          Icons.location_on,
                          color: _primaryColor,
                        ),
                        margin: EdgeInsets.only(left: 10),
                      ),
                      SizedBox(width: _pageWidth * 0.03),
                      Expanded(
                        child: Container(
                          child: Text(
                            'Chọn vị trí',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: _pageHeight * 0.025,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Chọn loại thú cưng
              SizedBox(height: _pageHeight * 0.02),
              Container(
                height: _pageHeight * 0.1,
                color: _boxColor,
                child: Row(
                  children: [
                    SizedBox(width: _pageWidth * 0.05),
                    Text(
                      'Loại thú cưng:',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontSize: _pageHeight * 0.025,
                      ),
                    ),
                    SizedBox(width: _pageWidth * 0.02),
                    DropdownButton<String>(
                      value: pettypeValue,
                      items: _listPettype
                          .map<DropdownMenuItem<String>>(buildMenuPettypeItem)
                          .toList(),
                      onChanged: (pettypeValue) =>
                          setState(() => this.pettypeValue = pettypeValue),
                    ),
                  ],
                ),
              ),

              //Chọn loại thú cưng
              SizedBox(height: _pageHeight * 0.02),
              Container(
                height: _pageHeight * 0.1,
                color: _boxColor,
                child: Row(
                  children: [
                    SizedBox(width: _pageWidth * 0.05),
                    Text(
                      'Loại dịch vụ:',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontSize: _pageHeight * 0.025,
                      ),
                    ),
                    SizedBox(width: _pageWidth * 0.02),
                    DropdownButton<String>(
                      value: serviceTypeValue,
                      items: _listServiceType
                          .map<DropdownMenuItem<String>>(
                              buildMenuServiceTypeItem)
                          .toList(),
                      onChanged: (serviceTypeValue) => setState(
                          () => this.serviceTypeValue = serviceTypeValue),
                    ),
                  ],
                ),
              ),

              SizedBox(height: _pageHeight * 0.02),
              Container(
                width: _pageWidth,
                height: _pageHeight * 0.06,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: _primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    _search();
                  },
                  child: Text(
                    'Tìm Kiếm',
                    style: TextStyle(
                      fontSize: _pageHeight * 0.03,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Container(
                child: Text.rich(
                  TextSpan(
                      text: _countResult != null ? '($_countResult)' : '',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: _pageHeight * 0.025,
                        color: Colors.black87,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: _resultLabel,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: _pageHeight * 0.025,
                            color: Colors.black87,
                          ),
                        ),
                      ]),
                ),
              ),

              //show result
              SizedBox(height: _pageHeight*0.02),
              isHaveResult == false
                  ? Container()
                  : ListView.separated(
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
                      ],
                    ),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return ShowResult(pcc: _pccList[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _search() {
    setState(() {
      _countResult = 1;

      _resultLabel = 'Kết quả tìm kiếm';
      isHaveResult = true;
    });
  }

  DropdownMenuItem<String> buildMenuPettypeItem(var item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }

  DropdownMenuItem<String> buildMenuServiceTypeItem(var item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }
  void _ChooseLocation(BuildContext context) {

    var size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          scrollable: true,
          content: Container(
            width: size.width,
            height: size.height*0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: GoogleMap(
              // mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        );
      },
    );
  }
}


