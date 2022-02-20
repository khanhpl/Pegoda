import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/provider/google_sign_in_provider.dart';
import 'package:provider/provider.dart';

class AppSettingScreen extends StatefulWidget{
  @override
  State<AppSettingScreen> createState() => _AppSettingScreenState();
}

class _AppSettingScreenState extends State<AppSettingScreen> {
  bool _notification_status = false;
  bool _notification_status_two = true;
  bool _isVietnamese = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(
            size.width * 0.02, 0, size.width * 0.02, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height * 0.15,
              alignment: Alignment.centerLeft,
              child: Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: ImageIcon(
                    AssetImage('assets/cus/account_screen/cancel.png'),
                    size: size.height * 0.04,
                    color: Color(0xFFBDBDBD),
                  ),
                ),
              ),
            ),
            Text('Cài đặt ứng dụng',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
              height: size.height * 0.08,
              margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Cài đặt thông báo',
                    style: TextStyle(color: Colors.black),
                  ),
                  Spacer(),
                  Switch(
                    onChanged: (value) {
                      setState(() {
                        _notification_status = value;
                      });
                    },
                    value: _notification_status,
                    activeColor: Color(0xff825ee4),
                    inactiveThumbColor: Color(0xffBDBDBD),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
              height: size.height * 0.08,
              margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Cài đặt thông báo',
                    style: TextStyle(color: Colors.black),
                  ),
                  Spacer(),
                  Switch(
                    onChanged: (value) {
                      setState(() {
                        _notification_status_two = value;
                      });
                    },
                    value: _notification_status_two,
                    activeColor: Color(0xff825ee4),
                    inactiveThumbColor: Color(0xffBDBDBD),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              height: size.height * 0.08,
              margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Ngôn ngữ',
                    style: TextStyle(color: Colors.black),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isVietnamese = true;
                      });
                    },
                    child: Container(
                      width: size.width * 0.075,
                      decoration: BoxDecoration(
                        color: _isVietnamese ? Color(0xff825ee4) : Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: _isVietnamese == true
                            ? Border.all(color: Color(0xff825ee4))
                            : Border.all(color: Colors.black38),
                      ),
                      child: Text(
                        'VI',
                        style: TextStyle(
                            color:
                            _isVietnamese ? Colors.white : Colors.black26),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isVietnamese = false;
                      });
                    },
                    child: Container(
                      width: size.width * 0.075,
                      decoration: BoxDecoration(
                        color: _isVietnamese == false
                            ? Color(0xff825ee4)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: _isVietnamese == false
                            ? Border.all(color: Color(0xff825ee4))
                            : Border.all(color: Colors.black38),
                      ),
                      child: Text('EN',
                          style: TextStyle(
                            color: _isVietnamese == false
                                ? Colors.white
                                : Colors.black54,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.08,
              margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/appInforScreen');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Thông tin ứng dụng',
                      style: TextStyle(color: Colors.black),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(

                    padding: EdgeInsets.only(left: size.width*0.03, right: size.width*0.03),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TextButton(
                      child: Text(
                        'Thoát ứng dụng',
                        style: TextStyle(color: Color(0xff7B7B7B)),
                      ),
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                        provider.logout();
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: size.width*0.03, right: size.width*0.03),
                    decoration: BoxDecoration(
                      color: Color(0xff333333),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TextButton(
                      child: Text(
                        'Trang chủ',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cusMain');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}