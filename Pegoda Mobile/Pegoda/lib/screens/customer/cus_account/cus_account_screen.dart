import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/account_choice.dart';
import 'package:pegoda/MyLib/provider/google_sign_in_provider.dart';
import 'package:provider/provider.dart';
import '../../../MyLib/constants.dart' as Constants;
import '../../../MyLib/globals.dart' as globals;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CusAccountScreen extends StatefulWidget {
  @override
  State<CusAccountScreen> createState() => _CusAccountScreenState();
}

class _CusAccountScreenState extends State<CusAccountScreen> {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cá nhân',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: _pageHeight * 0.03,
          ),
        ),
        backgroundColor: Constants.primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        color: Constants.bgColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SizedBox(
                        width: 90,
                        height: 90,
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          children: [
                            globals.isAvatarChecked == false
                                ? Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    width: _pageHeight * 0.07,
                                    height: _pageHeight * 0.07,
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: FileImage(globals.avatarFile),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    width: _pageHeight * 0.07,
                                    height: _pageHeight * 0.07,
                                  ),
                            Positioned(
                              right: -10,
                              bottom: 0,
                              child: SizedBox(
                                width: 36,
                                height: 36,
                                child: TextButton(
                                    style: flatButtonStyle,
                                    onPressed: () {},
                                    child: Image.asset(
                                        "assets/cus/account_screen/iconGooglePlus.png")),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hieu",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Constants.boxColor,
                          primary: Colors.black87,
                          padding: EdgeInsets.all(15),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/personalSettingScreen');
                        },
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Thông tin cá nhân",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: _pageHeight * 0.023,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black26,
                              size: 20,
                            )
                          ],
                        )),
                    SizedBox(
                      height: 25,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Constants.boxColor,
                            primary: Colors.black87,
                            padding: EdgeInsets.all(15)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/orderHistoryScreen');
                        },
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Lịch sử đặt lịch',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: _pageHeight * 0.023,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black26,
                              size: 20,
                            )
                          ],
                        )),
                    SizedBox(
                      height: 25,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Constants.boxColor,
                          primary: Colors.black87,
                          padding: EdgeInsets.all(15),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/petScreen');
                        },
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Quản lý thú cưng",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: _pageHeight * 0.023,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black26,
                              size: 20,
                            )
                          ],
                        )),
                    SizedBox(
                      height: 55,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Constants.boxColor,
                          primary: _primaryColor,
                          padding: EdgeInsets.all(15),
                        ),
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                          provider.logout();
                          Navigator.pushNamed(context, '/');
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Đăng xuất",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: _pageHeight * 0.023,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    padding: EdgeInsets.zero,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        side: BorderSide(color: Colors.white)),
  );
}
