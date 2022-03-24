import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/coupon.dart';
import 'package:pegoda/MyLib/class/pcc_model.dart';
import 'package:pegoda/MyLib/models/show_coupon_on_home_screen.dart';

import 'package:pegoda/MyLib/models/show_pcc_model_item.dart';
import 'package:pegoda/MyLib/models/show_service_type_screen.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';
import 'package:pegoda/screens/customer/cus_main/up_nav_bar.dart';
import '../../../MyLib/constants.dart' as Constants;
import '../../../MyLib/globals.dart' as Globals;
import 'package:carousel_pro/carousel_pro.dart';

class CusHomeScreen extends StatefulWidget {
  @override
  State<CusHomeScreen> createState() => _CusHomeScreenState();
}

class _CusHomeScreenState extends State<CusHomeScreen> {
  var checkGetPcc;
  final Future<List<PCCModel>> pccModels = GetAPI().GetAllPCC();
  @override


  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _boxColor = Constants.boxColor;
    var _bgColor = Constants.bgColor;
    List<Coupon> _couponList = Globals.couponList;
    final getAPI = GetAPI().GetAllPCC().then((value) => checkGetPcc = value);


    return Scaffold(
      appBar: UpAppBar(context),
      body: Material(
        child: Container(
          color: Colors.white,
          padding:
              EdgeInsets.fromLTRB(_pageWidth * 0.03, 0, _pageWidth * 0.03, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: _pageHeight * 0.03),
                //slide
                Container(
                  height: _pageHeight * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: CaroselImage,
                ),

                //danh mục
                SizedBox(height: _pageHeight * 0.03),
                Row(children: [
                  Container(
                    child: Text(
                      'Danh mục',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: _pageHeight * 0.03,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/cus/main_screen/danhmuc.jpg'),
                    height: _pageHeight * 0.06,
                  )
                ]),
                SizedBox(height: _pageHeight * 0.02),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // SizedBox(width: _pageWidth * 0.03),
                      //Trung tâm nổi bật
                      Column(
                        children: [
                          FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/neareastPCCScreen');
                            },
                            child: Image.asset(
                              'assets/cus/main_screen/center_ic.png',
                              height: _pageWidth * 0.3 * 0.33,
                              width: _pageWidth * 0.3 * 0.33,
                            ),
                            padding: EdgeInsets.all(0),
                          ),
                          SizedBox(height: _pageHeight * 0.03),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Trung tâm \ngần nhất',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: _pageWidth * 0.03),
                      //Dịch vụ nổi bật
                      Column(
                        children: [
                          FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/orderHistoryScreen');
                            },
                            child: Image.asset(
                              'assets/cus/main_screen/orderhistory.png',
                              height: _pageWidth * 0.3 * 0.33,
                              width: _pageWidth * 0.3 * 0.33,
                            ),
                            padding: EdgeInsets.all(0),
                          ),
                          SizedBox(height: _pageHeight * 0.03),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Lịch sử đặt lịch',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: _pageWidth * 0.03),
                      //Câu hỏi thường gặp
                      Column(
                        children: [
                          FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/questionScreen');
                            },
                            child: Image.asset(
                              'assets/cus/main_screen/question_ic.png',
                              height: _pageWidth * 0.3 * 0.33,
                              width: _pageWidth * 0.3 * 0.33,
                            ),
                            padding: EdgeInsets.all(0),
                          ),
                          SizedBox(height: _pageHeight * 0.03),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Câu hỏi \nthường gặp',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: _pageWidth * 0.03),
                      //Tư vấn trực tuyến
                      Column(
                        children: [
                          FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/chatScreen');
                            },
                            child: Image.asset(
                              'assets/cus/main_screen/chat_online_ic.png',
                              height: _pageWidth * 0.3 * 0.33,
                              width: _pageWidth * 0.3 * 0.33,
                            ),
                            padding: EdgeInsets.all(0),
                          ),
                          SizedBox(height: _pageHeight * 0.03),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Tư vấn \ntrực tuyến',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Thú cưng của bạn
                SizedBox(height: _pageHeight * 0.03),

                Row(children: [
                  Container(
                    child: Text(
                      'Dịch vụ ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: _pageHeight * 0.03,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _pageWidth * 0.03,
                  ),
                  Image(
                    image: AssetImage('assets/cus/main_screen/service_ic.png'),
                    height: _pageHeight * 0.06,
                  )
                ]),

                SizedBox(height: _pageHeight * 0.03),
                Row(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //spa grooming
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowServiceTypeScreen(
                                    serviceName: 'Spa & Grooming', serviceTypeID: 'BC91836B-13BA-4690-BEBB-08DA0192389B'),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/cus/main_screen/groomingPet.png',
                            height: _pageWidth * 0.3 * 0.33,
                            width: _pageWidth * 0.3 * 0.33,
                          ),
                          padding: EdgeInsets.all(0),
                        ),
                        SizedBox(height: _pageHeight * 0.03),
                        Container(
                          child: Text(
                            'Spa & grooming',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ]),
                  SizedBox(width: _pageWidth * 0.03),
                  // kham benh
                  Column(children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowServiceTypeScreen(
                                serviceName: 'Khám Bệnh', serviceTypeID: 'C30193EE-553D-4ED6-BEBC-08DA0192389B'),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/cus/main_screen/khambenh.png',
                        height: _pageWidth * 0.3 * 0.33,
                        width: _pageWidth * 0.3 * 0.33,
                      ),
                      padding: EdgeInsets.all(0),
                    ),
                    SizedBox(height: _pageHeight * 0.03),
                    Container(
                      child: Text(
                        'Khám bệnh',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ]),
                  //dat cho di dao
                  Column(children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowServiceTypeScreen(
                                serviceName: 'Tiêm Phòng', serviceTypeID: 'DAFA1DB8-01F9-4C64-BEBD-08DA0192389B'),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/cus/main_screen/capcuu.png',
                        height: _pageWidth * 0.3 * 0.33,
                        width: _pageWidth * 0.3 * 0.33,
                      ),
                      padding: EdgeInsets.all(0),
                    ),
                    SizedBox(height: _pageHeight * 0.03),
                    Container(
                      child: Text(
                        'Tiêm Phòng ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ]),
                  //cap cuu 24/7
                  Expanded(
                    child: Column(children: [
                      FlatButton(
                        onPressed: (){},
                        child: Image.asset(
                          'assets/cus/main_screen/xemthem.jpg',
                          height: _pageWidth * 0.3 * 0.33,
                          width: _pageWidth * 0.3 * 0.33,
                        ),
                        padding: EdgeInsets.all(0),
                      ),
                      SizedBox(height: _pageHeight * 0.03),
                      Container(
                        child: Text(
                          'Dịch vụ khác',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ]),
                  ),
                ]),
                SizedBox(height: _pageHeight * 0.03),
                Row(children: [
                  Container(
                    child: Text(
                      'Trung tâm đề xuất',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: _pageHeight * 0.03,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _pageWidth * 0.03,
                  ),
                  Image(
                    image: AssetImage('assets/cus/main_screen/store.jpg'),
                    height: _pageHeight * 0.06,
                  )
                ]),
                SizedBox(height: _pageHeight * 0.03),
                FutureBuilder<List<PCCModel>>(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        // itemCount: snapshot.data!.length,
                        itemCount: 5,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: _pageHeight * 0.03);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return ShowPCCModelItem(
                              pccModel: snapshot.data![index]);
                        },
                      );
                    } else {
                      return Container(child: CircularProgressIndicator());
                    }
                  },
                  future: pccModels,
                ),

                //khuyến mãi
                SizedBox(height: _pageHeight * 0.03),

                Row(children: [
                  Container(
                    child: Text(
                      'Khuyến mãi',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: _pageHeight * 0.03,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _pageWidth * 0.03,
                  ),
                  Image(
                    image: AssetImage('assets/cus/main_screen/khuyenmai.png'),
                    height: _pageHeight * 0.06,
                  )
                ]),
                Container(
                  height: _pageHeight * 0.37,
                  child: ListView.separated(
                    // physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _couponList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: _pageWidth * 0.03);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ShowCouponOnHomeScreen(coupon: _couponList[index]);
                    },
                  ),
                ),
                SizedBox(height: _pageHeight * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget CaroselImage = Center(
  child: Carousel(
    images: Globals.listSlideHome,
    autoplay: true,
    dotSize: 5,
    dotSpacing: 30,
    indicatorBgPadding: 0,
    autoplayDuration: Duration(seconds: 5),
    borderRadius: true,
    dotBgColor: Colors.black.withOpacity(0),
  ),
);
