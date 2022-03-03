import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/service.dart';
import 'package:pegoda/MyLib/models/show_service_detail.dart';
import '../../MyLib/constants.dart' as Constants;

class ShowServiceItem extends StatefulWidget {
  Service service;
  ShowServiceItem({required this.service});
  @override
  State<ShowServiceItem> createState() => _ShowServiceItemState(service: this.service);
}

class _ShowServiceItemState extends State<ShowServiceItem> {
  Service service;
  _ShowServiceItemState({required this.service});
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _bgColor = Constants.bgColor;
    var _boxColor = Constants.boxColor;
    var _starColor = Constants.starColor;
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowServiceDetail(service: this.service),
          ),
        );
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: _pageWidth * 0.03),
              width: _pageWidth * 0.2,
              height: _pageWidth * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(service.ServiceImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: _pageWidth * 0.5,
                  child: Text(
                    service.ServiceName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: _pageHeight * 0.022,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: _pageHeight * 0.015),
                Text(
                  service.ServicePrice+'đ',
                  style: TextStyle(
                    fontSize: _pageHeight * 0.022,
                    fontWeight: FontWeight.w500,
                    color: _primaryColor,
                  ),
                ),
                SizedBox(height: _pageHeight * 0.015),
                Container(
                  width: _pageWidth * 0.5,
                  child: Text(
                    service.ServiceDescription,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: _pageHeight * 0.02,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      padding: EdgeInsets.all(0),
    );
  }
}
