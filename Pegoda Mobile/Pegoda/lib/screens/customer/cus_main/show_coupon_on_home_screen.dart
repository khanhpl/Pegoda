
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
              width: _pageWidth*0.4,
              height: _pageHeight*0.15,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(coupon.couponImage),
                    fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
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
                  fontSize: _pageHeight*0.02,
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