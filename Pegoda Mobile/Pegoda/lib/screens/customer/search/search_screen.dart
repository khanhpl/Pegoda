import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pegoda/MyLib/models/show_pcc_detail.dart';
import '../../../MyLib/constants.dart' as Constants;

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _countResult;

  var _resultLabel = '';
  var pettypeValue;
  var serviceTypeValue;
  var pccContent =
      "Pet Hour / Day care & Month care - Home care service Pet Playground & Pet Bathing - Hotel";
  bool isHaveResult = false;
  List _listPettype = [
    'Chó',
    'Mèo',
    'Gà',
  ];

  List _listServiceType = [
    'Spa&Grooming',
    'Khám bệnh',
    'Tiêm ngừa',
  ];

  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery
        .of(context)
        .size
        .height;
    var _pageWidth = MediaQuery
        .of(context)
        .size
        .width;
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
                onPressed: () {},
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
                      onChanged: (serviceTypeValue) =>
                          setState(
                                  () =>
                              this.serviceTypeValue = serviceTypeValue),
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
              SizedBox(height: _pageHeight * 0.02),
              isHaveResult == false ? Container() : FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowPCCDetail(),
                    ),
                  );
                },
                child: Container(
                  color: _boxColor,
                  padding: EdgeInsets.only(
                      top: _pageHeight * 0.03, bottom: _pageHeight * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: _pageWidth * 0.03),
                      Container(
                        height: _pageWidth * 0.25,
                        width: _pageWidth * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/cus/search_screen/pet_homies_ic.jpg'),
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(width: _pageWidth * 0.03),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pet Homies',
                            style: TextStyle(
                              fontSize: _pageHeight * 0.022,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: _pageHeight * 0.02),
                          Container(
                            width: _pageWidth * 0.6,
                            child: Text(
                              pccContent,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: _pageHeight * 0.022,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                          SizedBox(height: _pageHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellowAccent,
                                size: _pageHeight * 0.02,
                              ),
                              Text(
                                ' 5 ',
                                style: TextStyle(
                                  fontSize: _pageHeight * 0.022,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '(999+)',
                                style: TextStyle(
                                    fontSize: _pageHeight * 0.022,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[400]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
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
}




