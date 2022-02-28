import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pegoda/screens/customer/cus_main/cus_home_screen.dart';
import 'package:pegoda/screens/customer/cus_account/cus_account_screen.dart';
import 'package:pegoda/screens/customer/notification/notification_screen.dart';
import 'package:pegoda/screens/customer/pet/pet_screen.dart';
import '../MyLib/constants.dart' as Constants;

class CusMain extends StatefulWidget {
  int selectedIndex = 0;

  bool isBottomNav = true;

  CusMain({required this.selectedIndex, required this.isBottomNav});

  @override
  State<CusMain> createState() => _CusMainSate(
      selectedIndex: this.selectedIndex, isBottomNav: this.isBottomNav);
}

class _CusMainSate extends State<CusMain> {
  int selectedIndex;
  bool isBottomNav;

  _CusMainSate({required this.selectedIndex, required this.isBottomNav});

  var _primaryColor = Constants.primaryColor;

  Widget pageCaller(index) {
    switch (selectedIndex) {
      case 0:
        return CusHomeScreen();
      case 1:
        return PetScreen();
      case 2:
        isBottomNav = true;
        return NotificationScreen();
      case 3:
        isBottomNav = false;
        return CusAccountScreen();

      default:
        return CusHomeScreen();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: pageCaller(selectedIndex),
      bottomNavigationBar: isBottomNav == true
          ? ConvexAppBar(
              height: size.height * 0.1,
              style: TabStyle.react,
              backgroundColor: Colors.white,
              color: Colors.grey[700],
              activeColor: _primaryColor,
              onTap: _onItemTapped,
              initialActiveIndex: selectedIndex,
              top: -16,
              curveSize: 80,

              items: [

                TabItem(
                  icon: Icons.home,
                  title: 'Trang chủ\n',

                ),
                TabItem(
                  icon: Icons.pets,
                  title: 'Thú cưng\n',
                ),
                TabItem(
                  icon: Icons.notifications,
                  title: 'Thông báo\n',
                ),
                TabItem(
                  icon: Icons.account_box_sharp,
                  title: 'Tài khoản\n',
                ),
              ],
            )
          : Container(
              height: 0,
            ),
    );
  }
}
