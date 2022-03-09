import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/order_review.dart';
import '../../MyLib/constants.dart' as Constants;

class ShowOrderDetail extends StatelessWidget {
  OrderReview orderReview;

  ShowOrderDetail({required this.orderReview});

  // var _checkCancelButton = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var _primaryColor = Constants.primaryColor;
    var _bgColor = Constants.bgColor;
    var _boxColor = Constants.boxColor;
    // TODO: implement build
    return Material(
      child: Container(
        color: _bgColor,
        width: size.width,
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
                'Chi tiết đặt lịch',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w500,
                  fontSize: size.height * 0.032,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                margin: EdgeInsets.fromLTRB(
                    size.width * 0.03, 0.0, size.width * 0.03, 0.0),
                padding: EdgeInsets.fromLTRB(size.width * 0.03,
                    size.height * 0.03, size.width * 0.03, size.height * 0.03),
                decoration: BoxDecoration(
                  color: _boxColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.38,
                          child: Text(
                            'Mã đặt lịch',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              orderReview.OrderID,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.38,
                          child: Text(
                            'Thú cưng',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              orderReview.PetName,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.38,
                          child: Text(
                            'Trung tâm chăm sóc',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              orderReview.PCCName,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.38,
                          child: Text(
                            'Dịch vụ',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              orderReview.Service,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.38,
                          child: Text(
                            'Tổng tiền',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              orderReview.TotalPrice,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.38,
                          child: Text(
                            'Ghi chú',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              orderReview.Note,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.38,
                          child: Text(
                            'Thời gian',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              orderReview.Date,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.38,
                          child: Text(
                            'Trạng thái',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              _getOrderStatus(),
                              style: TextStyle(
                                color: _getStatusColor(),
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.03, 0, size.width * 0.03, 0),
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
                  _checkCancelButton()
                      ? SizedBox(width: size.width * 0.1)
                      : SizedBox(),
                  _checkCancelButton()
                      ? Container(
                          padding: EdgeInsets.fromLTRB(
                              size.width * 0.03, 0, size.width * 0.03, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Color(0xff333333),
                            ),
                          ),
                          child: FlatButton(
                            child: Text(
                              'Hủy đơn',
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: size.height * 0.024,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/cancelOrderScreen');
                            },
                          ),
                        )
                      : SizedBox(),
                ],
              ),
              SizedBox(height: size.height * 0.06),
            ],
          ),
        ),
      ),
    );
  }

  String _getOrderStatus() {
    String orderStatus = orderReview.Status;

    if (orderStatus == "1") {
      return "Đang xử lý";
    } else if (orderStatus == "2") {
      return "Đã xác nhận";
    } else if (orderStatus == "3") {
      return "Đã hoàn thành";
    } else {
      return "Đã hủy";
    }
  }

  Color _getStatusColor() {
    String orderStatus = orderReview.Status;
    if (orderStatus == "1") {
      return Colors.yellow;
    } else if (orderStatus == "2") {
      return Colors.blueAccent;
    } else if (orderStatus == "3") {
      return Colors.lightGreen;
    } else {
      return Colors.redAccent;
    }
  }

  bool _checkCancelButton() {
    String orderStatus = orderReview.Status;
    if (orderStatus == "1" || orderStatus == "2") {
      return true;
    } else {
      return false;
    }
  }
}
