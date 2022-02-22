import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/coupon.dart';
import 'package:pegoda/MyLib/class/pet.dart';
import 'package:pegoda/screens/customer/cus_main/show_coupon_on_home_screen.dart';
import 'package:pegoda/screens/customer/cus_main/up_nav_bar.dart';
import 'package:pegoda/screens/customer/pet/show_pet_item.dart';
import '../../../MyLib/constants.dart' as Constants;
import 'package:carousel_pro/carousel_pro.dart';

class CusHomeScreen extends StatefulWidget {
  @override
  State<CusHomeScreen> createState() => _CusHomeScreenState();
}

class _CusHomeScreenState extends State<CusHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _bgColor = Constants.bgColor;
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
          couponContent: 'Bí kíp chăm sóc thú cưng mùa dịch cùng pet box.'),
      Coupon(
          couponImage: 'assets/cus/main_screen/coupon2.jpg',
          couponContent: 'Grooming spa ưu đãi lên đến 45%'),
      Coupon(
          couponImage: 'assets/cus/main_screen/coupon3.jpg',
          couponContent: 'Ú tim tìm boss ưu đã lên đến 50%'),
      Coupon(
          couponImage: 'assets/cus/main_screen/coupon4.jpg',
          couponContent: 'Sen ơi ở đây có giảm giá nhà gỗ lofe pet nè'),
      Coupon(
          couponImage: 'assets/cus/main_screen/coupon5.jpg',
          couponContent: 'Trải nghiệm siêu tiết kiệm'),
      Coupon(
          couponImage: 'assets/cus/main_screen/coupon6.jpg',
          couponContent: 'Sale tết lên đến 50%'),
    ];
    return Scaffold(
      appBar: UpAppBar(context),
      body: Material(
        child: Container(
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
                            onPressed: () {},
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
                              'assets/cus/main_screen/service_ic.png',
                              height: _pageWidth * 0.3 * 0.33,
                              width: _pageWidth * 0.3 * 0.33,
                            ),
                            padding: EdgeInsets.all(0),
                          ),
                          SizedBox(height: _pageHeight * 0.03),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Dịch vụ \ngần nhất',
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
                            onPressed: () {},
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.pets,
                      color: Color(0xfff573c7),
                    ),
                    SizedBox(width: _pageWidth * 0.03),
                    Container(
                      child: Text(
                        'Thú cưng của bạn',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: _pageHeight * 0.03,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: _pageWidth * 0.03),
                    Icon(
                      Icons.pets,
                      color: Color(0xfff573c7),
                    ),
                  ],
                ),
                SizedBox(height: _pageHeight * 0.02),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _petList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: _pageHeight * 0.02);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ShowPetItem(pet: _petList[index]);
                  },
                ),

                //khuyến mãi
                SizedBox(height: _pageHeight * 0.03),
                Container(
                  child: Text(
                    'Khuyến mãi nổi bật',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: _pageHeight * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: _pageHeight * 0.02),
                Container(
                  height: _pageHeight * 0.32,
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

                SizedBox(height: _pageHeight * 0.03),
                //Dịch vụ đề xuất

                SizedBox(height: _pageHeight * 0.03),
                //Trung tâm đề xuất

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
