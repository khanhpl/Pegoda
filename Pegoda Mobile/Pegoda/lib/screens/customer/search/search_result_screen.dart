
import 'package:flutter/material.dart';
import '../../../MyLib/constants.dart' as Constants;
class SearchResultScreen extends StatefulWidget{
  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _bgColor = Constants.bgColor;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _bgColor,
        title: Container(
          child: Text(
            'Kết quả tìm kiếm',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: _pageHeight * 0.03,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Material(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text('ket qua tim kiem'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}