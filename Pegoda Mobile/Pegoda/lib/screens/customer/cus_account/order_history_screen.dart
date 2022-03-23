import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/order_model.dart';
import 'package:pegoda/MyLib/models/show_order_model_item.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';
import '../../../MyLib/globals.dart' as Globals;
import '../../../MyLib/constants.dart' as Constants;

class OrderHistoryScreen extends StatefulWidget {
  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List<OrderModel>? _orderModelList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAPI().GetOrderModelByEmail(Globals.userEmail).then((value) => {
    setState(() {
      _orderModelList = value;
    })
    });
  }
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
              SizedBox(
                width: size.width * 0.2,
                child: Image(
                  image: AssetImage("assets/cus/account_screen/orders.png"),

                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _orderModelList!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: size.height * 0.02);
                },
                itemBuilder: (BuildContext context, int index) {
                  return ShowOrderModelItem(orderModel: _orderModelList![index]);
                },
              ),
              SizedBox(
                height: size.height*0.2
              ),
            ],
          ),
        ),
      ),
    );
  }
}
