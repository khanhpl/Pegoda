import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/models/show_service_item.dart';
import '../constants.dart' as Constants;

class ShowPCCDetail extends StatefulWidget {
  @override
  State<ShowPCCDetail> createState() => _ShowPCCDetailState();
}

class _ShowPCCDetailState extends State<ShowPCCDetail> {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _bgColor = Constants.bgColor;
    var _boxColor = Constants.boxColor;
    var _starColor = Constants.starColor;
    var pccContent =
        "Pet Hour / Day care & Month care - Home care service Pet Playground & Pet Bathing - Hotel";
    var pccAddress =
        "31 Lê Hữu kiều, Phường Bình Trưng Tây, Quận 2, Thành phố Hồ Chí Mình, Việt Nam";
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
                'Pet Homies',
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
      body: Container(
        color: _boxColor,
        padding: EdgeInsets.fromLTRB(_pageWidth * 0.03, _pageHeight * 0.03,
            _pageWidth * 0.03, _pageHeight * 0.03),
        child: SingleChildScrollView(
          child: Column(
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
              SizedBox(height: _pageHeight * 0.05),
              Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/cus/search_screen/tick.png'),
                    color: _primaryColor,
                    size: _pageHeight * 0.025,
                  ),
                  SizedBox(width: _pageWidth * 0.025),
                  Text(
                    'Đã có trên Pegoda',
                    style: TextStyle(
                      color: _primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: _pageHeight * 0.022,
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      color: Color(0xffFEF6E1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: _starColor,
                          size: _pageHeight * 0.025,
                        ),
                        Text(
                          ' 5',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: _pageHeight * 0.022,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: _pageHeight * 0.03),
              Row(
                children: [
                  Text(
                    'Pet Homies',
                    style: TextStyle(
                      fontSize: _pageHeight * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) => _primaryColor),
                    ),
                    onPressed: () {},
                    child: Text('Đặt lịch ngay'),
                  ),
                ],
              ),
              SizedBox(height: _pageHeight * 0.03),
              Container(
                width: _pageWidth,
                child: Text(
                  pccContent,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: _pageHeight * 0.022,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Container(
                height: _pageHeight * 0.25,
                width: _pageWidth,
                padding: EdgeInsets.fromLTRB(_pageWidth * 0.03,
                    _pageHeight * 0.03, _pageWidth * 0.03, _pageWidth * 0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/cus/search_screen/map.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: _pageHeight * 0.05,
                      color: _primaryColor,
                    ),
                    SizedBox(height: _pageHeight * 0.03),
                    Text(
                      'Thành phố Hồ Chí Minh',
                      style: TextStyle(
                        fontSize: _pageHeight * 0.03,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: _pageHeight * 0.03),
                    Container(
                      width: _pageWidth,
                      child: Text(
                        pccAddress,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: _pageHeight * 0.022,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _pageHeight * 0.05),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Spa & Grooming',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: _pageHeight * 0.025,
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: _pageHeight * 0.02),
                    ShowServiceItem(),
                    SizedBox(height: _pageHeight * 0.02),
                    ShowServiceItem(),
                    SizedBox(height: _pageHeight * 0.02),
                    ShowServiceItem(),
                  ],
                ),
              ),
              SizedBox(height: _pageHeight * 0.02),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Dịch vụ khác',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: _pageHeight * 0.025,
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: _pageHeight * 0.02),
                    ShowServiceItem(),
                    SizedBox(height: _pageHeight * 0.02),
                    ShowServiceItem(),
                    SizedBox(height: _pageHeight * 0.02),
                    ShowServiceItem(),
                  ],
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
          'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-6/274119701_308840067892600_1959247234266252491_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=e3f864&_nc_ohc=kea3kUaaJSwAX9tHgLv&_nc_ht=scontent.fsgn2-4.fna&oh=00_AT9SGyqtGONPrRC6NR9qXpYGGVHyjZrw9rM7EhwtMDfrDw&oe=621CBE88'),
      NetworkImage(
          'https://scontent.fsgn2-6.fna.fbcdn.net/v/t39.30808-6/274076245_307845111325429_3352218041814740606_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=e3f864&_nc_ohc=HfDrchxrDBIAX9eXXXE&_nc_ht=scontent.fsgn2-6.fna&oh=00_AT9yvGrEl5lM7kcd-5EVUvVdHqknOiRUjVGTpOL4ilbRXg&oe=621E0F6B'),
      NetworkImage(
          'https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/269682390_276628677780406_999436242810556345_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=e3f864&_nc_ohc=akEKJnzQ0eEAX8s8rE5&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT_fIdjU0ilJSyAF5sF1_bJPWYdw-ODIpwpDjYSMit5-Uw&oe=621DA3E1'),
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
