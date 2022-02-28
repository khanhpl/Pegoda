
import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/coupon.dart';

class ShowCouponOnHomeScreen extends StatefulWidget
{
  Coupon coupon;
  ShowCouponOnHomeScreen({required this.coupon});

  @override
  State<ShowCouponOnHomeScreen> createState() => _ShowCouponOnHomeScreenState(coupon: this.coupon);
}

class _ShowCouponOnHomeScreenState extends State<ShowCouponOnHomeScreen> {

  Coupon coupon;
  _ShowCouponOnHomeScreenState({required this.coupon});

  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        child: Column(
          children: [
            Container(
              width: _pageWidth*0.6,
              height: _pageHeight*0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(coupon.couponImage),
                    fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Container(
                      height: _pageHeight*0.04,
                      width: _pageWidth*0.45*0.35,
                      decoration: BoxDecoration(
                        color: Color(0xFF825ee4),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.flash_on,
                            color: Colors.yellowAccent,
                              size: _pageHeight * 0.03,
                            ),
                            Text(
                              coupon.couponValue,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: _pageHeight*0.02),
            Container(
              width: _pageWidth*0.6,
            ),
            SizedBox(height: _pageHeight*0.02),
            Container(
              width: _pageWidth*0.4,
              child: Text(
                coupon.couponContent,
                maxLines: 2,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontSize: _pageHeight*0.022,
                  fontWeight: FontWeight.w400,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}