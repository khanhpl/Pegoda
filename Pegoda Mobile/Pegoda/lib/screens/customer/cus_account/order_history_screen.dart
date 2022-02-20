import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/order_review.dart';
import '../../../MyLib/globals.dart' as globals;
import 'show_order_item.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List<OrderReview> _orderReviewList = [
    OrderReview(
      OrderID: '#123456',
      Date: '16/2/2022',
      PetName: 'Con cá',
      PCCName: 'Trung tâm chăm sóc một mình tui',
      Service: 'Khám tổng quát, massage',
      TotalPrice: '220.000đ',
      Note: 'Nhẹ tay',
      Status: 'Đang xử lý',
    ),
    OrderReview(
      OrderID: '#123456',
      Date: '16/2/2022',
      PetName: 'Con cá',
      PCCName: 'Trung tâm chăm sóc một mình tui',
      Service: 'Khám tổng quát, massage',
      TotalPrice: '220.000đ',
      Note: 'Nhẹ tay',
      Status: 'Đang xử lý',
    ),
    OrderReview(
      OrderID: '#123456',
      Date: '16/2/2022',
      PetName: 'Con cá',
      PCCName: 'Trung tâm chăm sóc một mình tui',
      Service: 'Khám tổng quát, massage',
      TotalPrice: '220.000đ',
      Note: 'Nhẹ tay',
      Status: 'Đang xử lý',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Material(
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          // physics: ClampingScrollPhysics(),
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
                'Lịch sử đặt lịch',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w500,
                  fontSize: size.height * 0.032,
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _orderReviewList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: size.height * 0.02);
                },
                itemBuilder: (BuildContext context, int index) {
                  return ShowOrderItem(orderReview: _orderReviewList[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
