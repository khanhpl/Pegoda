import 'package:flutter/material.dart';
import 'package:pegoda/screens/pet_care_center/home/pcc_home_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
class PCCMain extends StatefulWidget {
  int selectedIndex = 0;

  bool isBottomNav = true;

  PCCMain({required this.selectedIndex, required this.isBottomNav});

  @override
  State<PCCMain> createState() => _PCCMainSate(
      selectedIndex: this.selectedIndex, isBottomNav: this.isBottomNav);
}

class _PCCMainSate extends State<PCCMain> {
  int selectedIndex;
  bool isBottomNav;
  _PCCMainSate({required this.selectedIndex, required this.isBottomNav});

  Widget pageCaller(index) {
    switch (selectedIndex) {
      case 0:
        return PCCHomeScreen();
      case 1:
        return PCCHomeScreen();
      case 2:
        return PCCHomeScreen();
      case 3:
        return PCCHomeScreen();

      default:
        return PCCHomeScreen();
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
      bottomNavigationBar: isBottomNav == true ? ConvexAppBar(
        height: size.height * 0.1,
        style: TabStyle.react,
        backgroundColor: Colors.white,
        color: Colors.grey[700],
        activeColor: Colors.black,
        onTap: _onItemTapped,
        initialActiveIndex: selectedIndex,
        top: 0.0,
        items: [
          TabItem(
            icon: Icons.home,
            title: 'Trang chủ',
          ),
          TabItem(
            icon: Icons.notifications,
            title: 'Thông báo',
          ),
          TabItem(
            icon: Icons.account_box_sharp,
            title: 'Tài khoản',
          ),
          TabItem(
            icon: Icons.settings,
            title: 'Cài đặt',
          ),
        ],
      ) : Container(
        height: 0,
      ),
    );
  }
}
