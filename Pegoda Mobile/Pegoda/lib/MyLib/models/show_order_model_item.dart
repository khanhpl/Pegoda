import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/order_model.dart';
import 'package:pegoda/MyLib/models/show_order_model_detail.dart';
import '../../MyLib/constants.dart' as Constants;

class ShowOrderModelItem extends StatefulWidget {
  OrderModel orderModel;

  ShowOrderModelItem({required this.orderModel});

  @override
  State<ShowOrderModelItem> createState() =>
      _ShowOrderModelItemState(orderModel: this.orderModel);
}

class _ShowOrderModelItemState extends State<ShowOrderModelItem> {
  OrderModel orderModel;

  _ShowOrderModelItemState({required this.orderModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var _primaryColor = Constants.primaryColor;
    var _bgColor = Constants.bgColor;
    var _boxColor = Constants.boxColor;
    // TODO: implement build
    return Material(
      child: Container(
        height: size.height * 0.1,
        margin: EdgeInsets.fromLTRB(size.width * 0.03, 0, size.width * 0.03, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _boxColor,
        ),
        child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ShowOrderModelDetail(orderModel: orderModel),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height * 0.1,
                child: Icon(
                  Icons.bookmarks,
                  size: size.width * 0.08,
                  color: _primaryColor,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: size.width * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width*0.55,
                      child: Text(
                        'Mã đặt lịch: ' + orderModel.orderId,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: size.height * 0.016,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.006),
                    Text(
                      'Thú cưng: ' + orderModel.petName,
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: size.height * 0.016,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: size.height * 0.006),
                    RichText(
                      text: TextSpan(
                        text: orderModel.date.toString() + ' | ',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: size.height * 0.016,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: _getOrderStatus(),
                            style: TextStyle(
                              color: _getStatusColor(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                orderModel.totalPrice.toString(),
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: size.height * 0.016,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: size.width * 0.01),
              CircleAvatar(
                radius: size.height * 0.016,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: size.height * 0.016,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getOrderStatus() {
    String orderStatus = orderModel.orderStatus;

    if (orderStatus == "pending") {
      return "Đang xử lý";
    } else if (orderStatus == "approved") {
      return "Đã xác nhận";
    } else if (orderStatus == "finished") {
      return "Đã hoàn thành";
    } else {
      return "Đã hủy";
    }
  }

  Color _getStatusColor(){
    String orderStatus = orderModel.orderStatus;
    if (orderStatus == "pending") {
      return Colors.yellow;
    } else if (orderStatus == "approved") {
      return Colors.blueAccent;
    } else if (orderStatus == "finished") {
      return Colors.lightGreen;
    } else {
      return Colors.redAccent;
    }
  }
}
