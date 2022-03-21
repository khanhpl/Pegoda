library Pegoda.globals;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/coupon.dart';
import 'package:pegoda/MyLib/class/order_review.dart';
import 'package:pegoda/MyLib/class/pcc_model.dart';
import 'package:pegoda/MyLib/class/pet.dart';
import 'package:pegoda/MyLib/class/time_slot.dart';

bool isAvatarChecked = false;
File avatarFile = File('');
bool isPetAvatarChecked = false;
File petAvatarFile = File('');
List<Pet> petList = [
  Pet(
      PetID: "Pet1",
      PetName: "Con gà",
      PetType: "Chó pug",
      PetGender: true,
      PetStatus: "Mập",
      PetImage:
          "https://i.pinimg.com/originals/23/59/7e/23597eae81350a4705644c58bdad7f6b.jpg"),
  Pet(
      PetID: "Pet2",
      PetName: "Con vịt",
      PetType: "Mèo",
      PetGender: false,
      PetStatus: "Mập",
      PetImage:
          "https://i.pinimg.com/564x/7b/a1/b6/7ba1b6556719b4b358e3b86e6c24b30f.jpg"),
];

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

List<OrderReview> orderReviewList = [
  OrderReview(
    OrderID: '#123456',
    Date: '27/2/2022',
    PetName: 'Con cá',
    PCCName: 'Pet Homies',
    Service: 'Khám tổng quát, massage',
    TotalPrice: '440.000đ',
    Note: 'Nhẹ tay',
    Status: "1",
  ),
  OrderReview(
    OrderID: '#123456',
    Date: '28/2/2022',
    PetName: 'Con cá',
    PCCName: 'CPCpetcare - Grooming & Hotel',
    Service: 'Khám tổng quát, massage',
    TotalPrice: '440.000đ',
    Note: 'Nhẹ tay',
    Status: "2",
  ),
  OrderReview(
    OrderID: '#123456',
    Date: '28/2/2022',
    PetName: 'Con cá',
    PCCName: 'Trung tâm chăm sóc một mình tui',
    Service: 'Khám tổng quát, massage',
    TotalPrice: '220.000đ',
    Note: 'Nhẹ tay',
    Status: "3",
  ),
  OrderReview(
    OrderID: '#123456',
    Date: '28/2/2022',
    PetName: 'Con cá',
    PCCName: 'Trung tâm chăm sóc một mình tui',
    Service: 'Khám tổng quát, massage',
    TotalPrice: '220.000đ',
    Note: 'Nhẹ tay',
    Status: 'Đã Hủy',
  ),


];

List<TimeSlot> listTimeSlotMorning = [
  TimeSlot(timeSlot: "7-8 giờ", status: "1"),
  TimeSlot(timeSlot: "8-9 giờ", status: "2"),
  TimeSlot(timeSlot: "9-10 giờ", status: "1"),
  TimeSlot(timeSlot: "10-11 giờ", status: "2"),
  TimeSlot(timeSlot: "11-12 giờ", status: "2"),
];

List<TimeSlot> listTimeSlotLunch = [
  TimeSlot(timeSlot: "13-14 giờ", status: "1"),
  TimeSlot(timeSlot: "14-15 giờ", status: "2"),
  TimeSlot(timeSlot: "15-16 giờ", status: "1"),
  TimeSlot(timeSlot: "16-17 giờ", status: "2"),
  TimeSlot(timeSlot: "17-18 giờ", status: "2"),
];

List<TimeSlot> listTimeSlotEvening = [
  TimeSlot(timeSlot: "18-19 giờ", status: "1"),
  TimeSlot(timeSlot: "19-20 giờ", status: "2"),
];

List<String> listCancelReport = [
  ("Tôi muốn đổi thời gian"),
  ("Tôi muốn đổi dịch vụ"),
  ("Tôi không muốn đặt nữa"),
  ("Khác"),

];
