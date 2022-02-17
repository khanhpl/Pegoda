import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/order.dart';
import 'package:pegoda/screens/customer/cus_account/show_order_detail.dart';

class ShowOrderItem extends StatefulWidget {
  Order order;

  ShowOrderItem({required this.order});

  @override
  State<ShowOrderItem> createState() => _ShowOrderItemState(order: this.order);
}

class _ShowOrderItemState extends State<ShowOrderItem> {
  Order order;

  _ShowOrderItemState({required this.order});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Material(
      child: Container(
        height: size.height * 0.1,
        margin: EdgeInsets.fromLTRB(size.width * 0.03, 0, size.width * 0.03, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[200],
        ),
        child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowOrderDetail(order: this.order),
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
                  size: size.width*0.08,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: size.width * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mã đặt lịch' + order.OrderID,
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: size.height * 0.016,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: size.height * 0.006),
                    Text(
                      'Thú cưng: ' + order.PetName,
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: size.height * 0.016,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: size.height * 0.006),
                    RichText(
                      text: TextSpan(
                        text: order.Date + ' | ',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: size.height * 0.016,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: order.Status,
                            style: TextStyle(
                              color: Color(0xffFF3300),
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
                order.TotalPrice,
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
}
