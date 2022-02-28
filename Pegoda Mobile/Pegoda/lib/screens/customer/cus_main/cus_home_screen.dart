import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/PetcarePlace.dart';
import 'package:pegoda/MyLib/class/coupon.dart';
import 'package:pegoda/MyLib/class/pcc.dart';
import 'package:pegoda/MyLib/class/pet.dart';
import 'package:pegoda/MyLib/models/show_coupon_on_home_screen.dart';
import 'package:pegoda/MyLib/models/show_pcc_item.dart';
import 'package:pegoda/screens/customer/cus_main/up_nav_bar.dart';
import 'package:pegoda/MyLib/models/show_pet_item.dart';
import '../../../MyLib/constants.dart' as Constants;
import 'package:pegoda/screens/customer/cus_main/PetCare.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:pegoda/MyLib/class/PetcarePlace.dart';

class CusHomeScreen extends StatefulWidget {
  @override
  State<CusHomeScreen> createState() => _CusHomeScreenState();
}

class _CusHomeScreenState extends State<CusHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;

    List<PCC> _pccList = [
      PCC(
          PCCName: 'Dog Paradise',
          PCCImage:
              'https://petee.vn/wp-content/uploads/2020/11/dogparadise-logo.png',
          PCCService: 'Chăm lo cho boss',
          PCCRating: '4.9',
          PCCDistance: '5km'),
      PCC(
          PCCName: 'Petcare VN',
          PCCImage:
              'https://petcare.vn/wp-content/uploads/2016/05/petcare_logo-1.png',
          PCCService: "Y tế thú cưng",
          PCCRating: '4.6',
          PCCDistance: '10.4km'),
      PCC(
          PCCName: 'Thú y pet pro',
          PCCImage:
              'https://static.topcv.vn/company_logos/pbEIzKqznn7PKiNaVmDPyCZwgpF552sK_1639462508____b229f382460f151f1fb777962db4773a.png',
          PCCService: 'Bệnh viện thú',
          PCCRating: '4.4',
          PCCDistance: '1.6km'),
    ];
    List<Pet> _petList = [
      Pet(
          PetID: "Pet1",
          PetName: "Con gà",
          PetType: "Chó pug",
          PetGender: true,
          PetStatus: "Mập",
          PetImage:
              "https://i.pinimg.com/originals/23/59/7e/23597eae81350a4705644c58bdad7f6b.jpg"),
      Pet(
          PetID: "Pet2",
          PetName: "Con vịt",
          PetType: "Mèo",
          PetGender: false,
          PetStatus: "Mập",
          PetImage:
              "https://i.pinimg.com/564x/7b/a1/b6/7ba1b6556719b4b358e3b86e6c24b30f.jpg"),
    ];
    List<Coupon> _couponList = [
      Coupon(
        couponImage: 'assets/cus/main_screen/coupon1.png',
        couponContent: 'Trọn gói chăm sóc chỉ 199k.',
        couponValue: '199k',
        center: 'Pet Box',
      ),
      Coupon(
        couponImage: 'assets/cus/main_screen/coupon2.jpg',
        couponContent: 'Grooming spa ưu đãi lên đến 45%',
        couponValue: '45%',
        center: 'Grooming',
      ),
      Coupon(
        couponImage: 'assets/cus/main_screen/coupon3.jpg',
        couponContent: 'Ú tim tìm boss ưu đã lên đến 50%',
        couponValue: '50%',
        center: 'Boss Ú',
      ),
      Coupon(
        couponImage: 'assets/cus/main_screen/coupon4.jpg',
        couponContent: 'Sen ơi ở đây có giảm giá 40% nhà gỗ lofe pet nè',
        couponValue: '40%',
        center: 'Lofe',
      ),
    ];
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
                            onPressed: () {},
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
                              'Đơn đặt hàng',
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
                  SizedBox(width:_pageWidth * 0.03 ,),
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
                          onPressed: () {},
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
                      onPressed: () {},
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
                      onPressed: () {},
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
                        'Cấp cứu ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ]),
                  //cap cuu 24/7
                  Expanded(
                    child: Column(children: [
                      FlatButton(
                        onPressed: () {},
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
                Container(
                  constraints: BoxConstraints.expand(
                    width: double.infinity,
                    height: 250,
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/cus/main_screen/shop.jpg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: _pageHeight * 0.03),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _pccList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      width: _pageWidth,
                      child: Column(
                        children: [
                          SizedBox(height: _pageHeight * 0.02),
                          Divider(thickness: 2),
                          SizedBox(height: _pageHeight * 0.02),
                        ],
                      ),
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ShowPCCItem(pcc: _pccList[index]);
                  },
                ),

                //khuyến mãi
                SizedBox(height: _pageHeight * 0.03),

                Container(
                  height: _pageHeight * 0.35,
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
    images: [
      AssetImage('assets/cus/main_screen/slide1.jpg'),
      AssetImage('assets/cus/main_screen/slide2.jpg'),
      AssetImage('assets/cus/main_screen/slide3.jpg'),
      AssetImage('assets/cus/main_screen/slide4.png'),
      AssetImage('assets/cus/main_screen/slide5.jpg'),
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
