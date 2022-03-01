import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/models/show_service_detail.dart';
import '../../MyLib/constants.dart' as Constants;
class ShowServiceItem extends StatefulWidget
{
  @override
  State<ShowServiceItem> createState() => _ShowServiceItemState();
}

class _ShowServiceItemState extends State<ShowServiceItem> {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _bgColor = Constants.bgColor;
    var _boxColor = Constants.boxColor;
    var _starColor = Constants.starColor;
    var serviceDescribe = "Gói dịch vụ bao gồm: Tắm, cất móng, mài móng, vệ sinh tai. Lưu ý: Shop chỉ nhận giữ bé sau khi hoàn tất dịch vụ tối đa 2h. Quá 2h phụ thu 100k/ tiếng";

    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowServiceDetail(),
          ),
        );
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: _pageWidth*0.03),
              width: _pageWidth*0.2,
              height: _pageWidth*0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage('https://petacy.com/wp-content/uploads/2019/11/cach-tam-cho-cho.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
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
                SizedBox(height: _pageHeight * 0.015),
                Text(
                  '300.000',
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
                    serviceDescribe,
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