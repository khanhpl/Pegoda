import 'package:flutter/material.dart';
import '../../../MyLib/constants.dart' as Constants;

AppBar UpAppBar(context) {
  var _pageWidth = MediaQuery.of(context).size.width;
  var _pageHeight = MediaQuery.of(context).size.height;
  var _bgColor = Constants.bgColor;

  return AppBar(
    backgroundColor: _bgColor,
    // automaticallyImplyLeading: false,
    toolbarHeight: _pageHeight * 0.1,
    leading: Container(
      height: _pageHeight * 0.03,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Pegoda.png'),
          fit: BoxFit.fill,
        ),
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        // Container(
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   width: _pageWidth * 0.72,
        //   height: _pageHeight * 0.05,
        //   child: Row(
        //     children: [
        //       Container(
        //         child: Icon(
        //           Icons.search,
        //           color: Colors.grey[400],
        //         ),
        //         margin: EdgeInsets.only(left: 10),
        //       ),
        //       Expanded(
        //         child: Container(
        //           child: TextField(
        //             decoration: InputDecoration.collapsed(
        //               hintText: 'Tìm trên Pegoda',
        //               hintStyle: TextStyle(
        //                 color: Colors.grey.shade400,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

          Container(
            width: _pageWidth*0.6,
            height: _pageHeight*0.03,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/PegodaName.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),

      ],
    ),
  );
}
