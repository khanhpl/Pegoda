library Pegoda.globals;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/coupon.dart';
import 'package:pegoda/MyLib/class/service_model.dart';

bool isAvatarChecked = false;
File avatarFile = File('');
bool isPetAvatarChecked = false;
File petAvatarFile = File('');

List listPayment = [
  'Tiền mặt',
  'Chuyển khoản',
];

List<AssetImage> listSlideHome = [
  AssetImage('assets/cus/main_screen/slide1.jpg'),
  AssetImage('assets/cus/main_screen/slide2.jpg'),
  AssetImage('assets/cus/main_screen/slide3.jpg'),
  AssetImage('assets/cus/main_screen/slide4.png'),
  AssetImage('assets/cus/main_screen/slide5.jpg'),
];



List<Coupon> couponList = [
  Coupon(
    couponImage: 'assets/cus/main_screen/coupon1.png',
    couponContent: 'Trọn gói chăm sóc chỉ 199k.',
    couponValue: '199k',
    price: '249.000đ',
    priceDiscount: '199.000đ',
    center: 'Pet Box',
  ),
  Coupon(
    couponImage: 'assets/cus/main_screen/coupon2.jpg',
    couponContent: 'Grooming spa ưu đãi lên đến 45%',
    couponValue: '45%',
    price: '300.000đ',
    priceDiscount: '165.000đ',
    center: 'Grooming',
  ),
  Coupon(
    couponImage: 'assets/cus/main_screen/coupon3.jpg',
    couponContent: 'Ú tim tìm boss ưu đãi tắm rửa lên đến 50%',
    couponValue: '50%',
    price: '250.000đ',
    priceDiscount: '125.000đ',
    center: 'Boss Ú',
  ),
  Coupon(
    couponImage: 'assets/cus/main_screen/coupon4.jpg',
    couponContent: 'Sen ơi ở đây có giảm giá 40% nhà gỗ lofe pet nè',
    couponValue: '40%',
    price: '550.000đ',
    priceDiscount: '225.000đ',
    center: 'Lofe',
  ),
];


List<String> listCancelReport = [
  ("Tôi muốn đổi thời gian"),
  ("Tôi muốn đổi dịch vụ"),
  ("Tôi không muốn đặt nữa"),
  ("Khác"),

];
String userEmail = '';
String customerId = '';
String deviceToken = '';
String userName = '';
List<ServiceModel> listServiceOnOrder = [];