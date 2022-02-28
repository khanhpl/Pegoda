
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

class ShowServiceDetail extends StatefulWidget {
  @override
  State<ShowServiceDetail> createState() => _ShowServiceDetailState();
}

class _ShowServiceDetailState extends State<ShowServiceDetail> {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _bgColor = Constants.bgColor;
    var _boxColor = Constants.boxColor;
    var _starColor = Constants.starColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        // automaticallyImplyLeading: false,
        toolbarHeight: _pageHeight * 0.08,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Tắm chó - Dog Bathing',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: _pageHeight * 0.03,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: (){},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => _primaryColor),
        ),
        child: Container(

          alignment: Alignment.center,
          width: _pageWidth*0.8,
          height: _pageHeight*0.04,
          child: Text('Đặt lịch ngay'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        padding: EdgeInsets.fromLTRB(_pageWidth * 0.03, _pageHeight * 0.03,
            _pageWidth * 0.03, _pageHeight * 0.08),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: _pageHeight * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: CaroselImage,
              ),
              SizedBox(height: _pageHeight * 0.04),
              Text(
                'SPA & GROOMING',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: _pageHeight * 0.022,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Text(
                'Tắm chó- Dog Bathing',
                style: TextStyle(
                  fontSize: _pageHeight * 0.03,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Text(
                'Giá dịch vụ: 300.000đ',
                style: TextStyle(
                  fontSize: _pageHeight * 0.026,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Text(
                'Mô tả',
                style: TextStyle(
                  fontSize: _pageHeight * 0.026,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: _pageHeight * 0.02),
              Text(
                "Gói dịch vụ bao gồm: Tắm, cất móng, mài móng, vệ sinh tai. Lưu ý: Shop chỉ nhận giữ bé sau khi hoàn tất dịch vụ tối đa 2h. Quá 2h phụ thu 100k/ tiếng",
                style: TextStyle(
                  fontSize: _pageHeight * 0.022,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: _pageHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

Widget CaroselImage = Center(
  child: Carousel(
    images: [
      NetworkImage(
          'https://www.petcity.vn/media/news/2406_Nhung-luu-y-can-nho-khi-tam-cho-cho-1.jpg'),
      NetworkImage(
          'https://kenh14cdn.com/2018/27826dog-bathp-1514881300874-1514881322426.png'),
      NetworkImage(
          'https://www.petcity.vn/media/news/2406_Nhung-luu-y-can-nho-khi-tam-cho-cho-1.jpg'),
      NetworkImage('https://anhbana.vn/ban-chai-tam-cho.png'),
    ],
    autoplay: true,
    dotSize: 5,
    dotSpacing: 30,
    indicatorBgPadding: 0,
    autoplayDuration: Duration(seconds: 5),
    borderRadius: true,
    dotBgColor: Colors.black.withOpacity(0),
  ),
);
