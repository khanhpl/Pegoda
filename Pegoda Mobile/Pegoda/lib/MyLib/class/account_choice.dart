import 'package:flutter/material.dart';

class AccountChoice extends StatelessWidget {
  IconData icon;
  String choiceTitle;
  String choiceLink;

  AccountChoice(
      {required this.icon,
      required this.choiceTitle,
      required this.choiceLink});

  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        Navigator.pushNamed(context, choiceLink);
      },
      child: Container(
        width: _pageWidth,
        height: _pageHeight * 0.08,
        padding:
            EdgeInsets.only(left: _pageWidth * 0.03, right: _pageHeight * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.black87,
            ),
            SizedBox(width: _pageWidth * 0.03),
            Text(
              '$choiceTitle',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
