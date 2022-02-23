
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../MyLib/globals.dart' as globals;
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isGenderMale = false;
  bool _isGenderFemale = false;
  late File imageFile;
  bool _picIsChose = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        color: Colors.white,
        width: size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width,
                height: size.height * 0.12,
                alignment: Alignment.centerLeft,
                child: Container(
                  child: IconButton(
                    onPressed: () {
                    },
                    icon: ImageIcon(
                      AssetImage('assets/cus/account_screen/cancel.png'),
                      size: size.height * 0.04,
                      color: Color(0xFFBDBDBD),
                    ),
                  ),
                ),
              ),
              Text(
                'Thông tin tài khoản',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w500,
                  fontSize: size.height * 0.032,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                child: FlatButton(
                  onPressed: () {
                    _getFromGallery();
                  },
                  child: globals.isAvatarChecked == false
                      ? Container(
                    width: size.height * 0.12,
                    height: size.height * 0.12,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: size.height * 0.01),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/ic_pegoda.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                  )
                      : Container(
                    width: size.height * 0.12,
                    height: size.height * 0.12,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: size.height * 0.01),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(globals.avatarFile),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                margin: EdgeInsets.fromLTRB(
                    size.width * 0.03, 0.0, size.width * 0.03, 0.0),
                padding: EdgeInsets.fromLTRB(size.width * 0.03,
                    size.height * 0.03, size.width * 0.03, size.height * 0.03),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Giới tính',
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            value: _isGenderMale,
                            onChanged: (value) {
                              setState(() {
                                _isGenderMale = true;
                                _isGenderFemale = false;
                              });
                            },
                            checkColor: Color(0xff5B9610),
                            activeColor: Colors.white,
                          ),
                          Text(
                            'Nam',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: size.width * 0.1),
                          Checkbox(
                            value: _isGenderFemale,
                            onChanged: (value) {
                              setState(() {
                                _isGenderMale = false;
                                _isGenderFemale = true;
                              });
                            },
                            checkColor: Color(0xff5B9610),
                            activeColor: Colors.white,
                          ),
                          Text(
                            'Nữ',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Tên hiển thị',
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: size.height * 0.02),
                    Container(
                      height: size.height * 0.06,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: size.width * 0.03, right: size.width * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffDADADA)),
                      ),
                      child: TextField(
                        controller: TextEditingController(text: 'khanhpl'),
                        decoration: InputDecoration.collapsed(
                          hintText: '',
                          hintStyle: TextStyle(
                            fontSize: size.height * 0.02,
                            color: Color(0xff666666),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),
                    Container(
                        child: RichText(
                          text: TextSpan(
                            text: 'Email ',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                            ],
                          ),
                        )),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      height: size.height * 0.06,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: size.width * 0.03, right: size.width * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffDADADA)),
                      ),
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'khanhpl@gmail.com',
                          hintStyle: TextStyle(
                            fontSize: size.height * 0.02,
                            color: Color(0xffDADADA),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      child: RichText(
                        text: TextSpan(
                          text: 'Số điện thoại ',
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      height: size.height * 0.06,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: size.width * 0.03, right: size.width * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffDADADA)),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration.collapsed(
                          hintText: '0900 123 456',
                          hintStyle: TextStyle(
                            fontSize: size.height * 0.02,
                            color: Color(0xffDADADA),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      child: RichText(
                        text: TextSpan(
                          text: 'Số điện thoại ',
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      height: size.height * 0.06,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: size.width * 0.03, right: size.width * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffDADADA)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration.collapsed(
                                hintText: 'Nhập số điện thoại',
                                hintStyle: TextStyle(
                                  fontSize: size.height * 0.02,
                                  color: Color(0xff666666),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                size.width * 0.01,
                                size.height * 0.005,
                                size.width * 0.01,
                                size.height * 0.005),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: Color(0xffDADADA)),
                            ),
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {},
                              child: Text(
                                'Kích hoạt',
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: size.height * 0.015,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      height: size.height * 0.06,
                      padding: EdgeInsets.only(
                          left: size.width * 0.03, right: size.width * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffDADADA)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration.collapsed(
                                hintText: 'Nhập mã bạn nhận được',
                                hintStyle: TextStyle(
                                  fontSize: size.height * 0.02,
                                  color: Color(0xff666666),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                size.width * 0.01,
                                size.height * 0.005,
                                size.width * 0.01,
                                size.height * 0.005),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: Color(0xff5B9610)),
                            ),
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                              },
                              child: Text(
                                'Xác nhận',
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: size.height * 0.015,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //end box----------------------------------------------------------
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.06),
              Container(
                width: size.width * 0.75,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                  color: Color(0xff333333),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: FlatButton(
                  child: Text(
                    'Xác nhận',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.024,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cusMain');
                  },
                ),
              ),
              SizedBox(height: size.height * 0.4),
            ],
          ),
        ),
      ),
    );
  }
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        _picIsChose = true;
        globals.isAvatarChecked = true;
        globals.avatarFile = imageFile;
      });
    }
  }
}