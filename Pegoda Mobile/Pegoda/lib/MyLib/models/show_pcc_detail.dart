import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/pcc.dart';
import 'package:pegoda/MyLib/class/service.dart';
import 'package:pegoda/MyLib/models/show_service_item.dart';
import '../constants.dart' as Constants;
import '../globals.dart' as Globals;

class ShowPCCDetail extends StatefulWidget {
  PCC pcc;
  ShowPCCDetail({required this.pcc});
  @override
  State<ShowPCCDetail> createState() => _ShowPCCDetailState(pcc: this.pcc);
}

class _ShowPCCDetailState extends State<ShowPCCDetail> {
  PCC pcc;
  _ShowPCCDetailState({required this.pcc});

  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _bgColor = Constants.bgColor;
    var _boxColor = Constants.boxColor;
    var _starColor = Constants.starColor;
    List<Service> _serviceList = pcc.PCCService;
    Widget CaroselImage = Center(
      child: Carousel(
        images: pcc.PCCListSlideImage,
        autoplay: true,
        dotSize: 5,
        dotSpacing: 30,
        indicatorBgPadding: 0,
        autoplayDuration: Duration(seconds: 5),
        borderRadius: true,
        dotBgColor: Colors.black.withOpacity(0),
      ),
    );
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
                pcc.PCCName,
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
                          ' '+pcc.PCCRating,
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
                    pcc.PCCName,
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
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/orderScreen');
                    },
                    child: Text('Đặt lịch ngay'),
                  ),
                ],
              ),
              SizedBox(height: _pageHeight * 0.03),
              Container(
                width: _pageWidth,
                child: Text(
                  pcc.PCCContent,
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
                        pcc.PCCAddress,
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
                        'Dịch vụ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: _pageHeight * 0.025,
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: _pageHeight*0.02),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _serviceList.length,
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
                        return ShowServiceItem(service: _serviceList[index]);
                      },
                    ),
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


