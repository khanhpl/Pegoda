import 'package:flutter/material.dart';

class AppInforScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Material(
      child: Container(
        padding:
        EdgeInsets.fromLTRB(size.width * 0.03, 0, size.width * 0.03, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              Text(
                'Thông tin ứng dụng',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w500,
                  fontSize: size.height * 0.032,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                height: size.height * 0.1,
                padding: EdgeInsets.fromLTRB(
                    size.width * 0.03, 0, size.width * 0.03, 0),
                decoration: BoxDecoration(
                  // color: _itemColor,
                  color: Colors.grey[200],

                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Phiên bản',
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w400,
                          fontSize: size.height*0.02
                      ),
                    ),
                    Spacer(),
                    Text(
                      '1.0',
                      style: TextStyle(
                          color: Color(0xff666666),
                          fontWeight: FontWeight.w400,
                          fontSize: size.height*0.02
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height: size.height * 0.1,
                padding: EdgeInsets.fromLTRB(
                    size.width * 0.03, 0, size.width * 0.03, 0),
                decoration: BoxDecoration(
                  // color: _itemColor,
                  color: Colors.grey[200],
                  border: Border(
                    top: BorderSide(
                      color: Color(0xffDADADA),
                    ),
                  ),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Bản cập nhật',
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w400,
                          fontSize: size.height*0.02
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Bản mới nhất',
                      style: TextStyle(
                          color: Color(0xff666666),
                          fontWeight: FontWeight.w400,
                          fontSize: size.height*0.02
                      ),
                    ),

                  ],
                ),
              ),

              Container(
                height: size.height * 0.1,
                padding: EdgeInsets.fromLTRB(
                    size.width * 0.03, 0, size.width * 0.03, 0),
                decoration: BoxDecoration(
                  // color: _itemColor,
                  color: Colors.grey[200],
                  border: Border(
                    top: BorderSide(
                      color: Color(0xffDADADA),
                    ),
                    bottom: BorderSide(
                      color: Color(0xffDADADA),
                      width: 0.8,
                    ),
                  ),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Bản cập nhật',
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w400,
                          fontSize: size.height*0.02
                      ),
                    ),
                    Spacer(),
                    Text(
                      '1.1 ',
                      style: TextStyle(
                          color: Color(0xff666666),
                          fontWeight: FontWeight.w400,
                          fontSize: size.height*0.02
                      ),
                    ),
                    SizedBox(width: size.width*0.01),
                    Container(
                      width: size.height*0.1,
                      margin: EdgeInsets.fromLTRB(0, size.height*0.025,
                          0, size.height*0.025),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffDADADA)),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),

                        onPressed: () {},
                        child: Text(
                          'Cập nhật',
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

              Container(
                height: size.height * 0.1,

                padding: EdgeInsets.fromLTRB(
                    size.width * 0.03, 0, size.width * 0.03, 0),
                decoration: BoxDecoration(
                  // color: _itemColor,
                  color: Colors.grey[200],

                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Facebook',
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w400,
                          fontSize: size.height*0.02
                      ),
                    ),
                    Spacer(),
                    Text(
                      '',
                      style: TextStyle(
                          color: Color(0xff666666),
                          fontWeight: FontWeight.w400,
                          fontSize: size.height*0.02
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(height: size.height * 0.06),
              Container(
                padding: EdgeInsets.only(left: size.width*0.03, right: size.width*0.03),
                decoration: BoxDecoration(
                  color: Color(0xff333333),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: FlatButton(

                  child: Text(
                    'Trang chủ',
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
              SizedBox(height: size.height * 0.06),

            ],
          ),
        ),
      ),
    );
  }
  
}