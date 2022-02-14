import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../MyLib/constants.dart' as Constants;

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _bgColor = Constants.bgColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _bgColor,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              //tìm kiếm dịch vụ
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
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
                        color: Colors.black87,
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
                    color: Colors.grey[200],
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
                          color: Colors.black87,
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

              //thời gian đặt lịch


              SizedBox(height: _pageHeight*0.02),
              Container(
                width: _pageWidth,
                height: _pageHeight * 0.06,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: _bgColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/searchResultScreen');
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
            ],
          ),
        ),
      ),
    );
  }
}
