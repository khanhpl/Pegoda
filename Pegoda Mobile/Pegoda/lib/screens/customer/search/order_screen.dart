import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pegoda/MyLib/class/pet.dart';
import 'package:pegoda/MyLib/class/service_model.dart';
import 'package:pegoda/MyLib/models/show_pet_item_on_order.dart';
import 'package:pegoda/MyLib/models/show_service_model_item_on_result.dart';
import 'package:pegoda/MyLib/models/show_time_slot_item.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';
import '../../../MyLib/constants.dart' as Constants;
import '../../../MyLib/globals.dart' as Globals;

class OrderScreen extends StatefulWidget {
  var centerID;

  OrderScreen({required this.centerID});

  @override
  State<OrderScreen> createState() =>
      _OrderScreenState(centerID: this.centerID);
}

class _OrderScreenState extends State<OrderScreen> {
  var centerID;

  _OrderScreenState({required this.centerID});

  List<Pet> _petList = Globals.petList;
  var paymentValue;
  List _listPayment = Globals.listPayment;
  List<ServiceModel>? _serviceList;
  var _primaryColor = Constants.primaryColor;
  var _boxColor = Constants.boxColor;
  var _bgColor = Constants.bgColor;
  var _date = 'Chọn thời gian thực hiện';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAPI()
        .GetServiceModelByCenterID('AE750B41-8D37-5807-5807-08D9F90AA2DD')
        .then((value) => {
      setState(() {
        _serviceList = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        toolbarHeight: _pageHeight * 0.08,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Đặt lịch',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: _pageHeight * 0.03,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        alignment: Alignment.center,
        padding:
            EdgeInsets.fromLTRB(_pageWidth * 0.03, 0, _pageWidth * 0.03, 0),
        height: _pageHeight * 0.14,
        decoration: BoxDecoration(
          color: _boxColor,
          border: Border(
            top: BorderSide(
              color: _bgColor,
              width: 3.0,
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: _pageHeight * 0.02),
            Row(
              children: [
                Text(
                  'Tổng tiền:',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: _pageHeight * 0.025,
                  ),
                ),
                Spacer(),
                Text(
                  '500.000đ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: _pageHeight * 0.03,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => _primaryColor),
              ),
              onPressed: () {
                _showConfirmDialog();
              },
              child: Container(
                width: _pageWidth,
                alignment: Alignment.center,
                child: Text('Đặt Lịch'),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(_pageWidth * 0.03, _pageHeight * 0.03,
            _pageWidth * 0.03, _pageHeight * 0.05),
        color: _boxColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  setState(() {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime(2023, 12, 31),
                        onChanged: (date) {}, onConfirm: (date) {
                      setState(() {
                        String dateInput = 'Ngày: ' +
                            date.day.toString() +
                            '-' +
                            date.month.toString() +
                            '-' +
                            date.year.toString();
                        _changeDate(dateInput);
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.vi);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Container(
                        height: _pageWidth * 0.04,
                        width: _pageWidth * 0.04,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/cus/search_screen/calendar_ic.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: _pageWidth * 0.03),
                    Text(
                      'Chọn thời gian thực hiện',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: _pageHeight * 0.02,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _pageHeight * 0.04),
              Text(
                'THÚ CƯNG',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: _pageHeight * 0.028,
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Container(
                height: _pageHeight * 0.15,
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: _pageHeight * 0.02);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ShowPetItemOnOrder(pet: _petList[index]);
                  },
                ),
              ),
              SizedBox(height: _pageHeight * 0.04),
              Row(
                children: [
                  Text(
                    'DỊCH VỤ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: _pageHeight * 0.028,
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      _ChooseService(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) => _primaryColor),
                    ),
                    child: Container(
                      child: Text(
                        '+ Thêm dịch vụ',
                        style: TextStyle(
                          fontSize: _pageHeight * 0.018,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _pageHeight * 0.03),
              Container(
                child: Row(
                  children: [
                    Text(
                      'Tắm chó - Dog Bathing',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: _pageHeight * 0.024,
                        color: Colors.grey[800],
                      ),
                    ),
                    Spacer(),
                    Text(
                      '250.000đ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: _pageHeight * 0.026,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Container(
                child: Row(
                  children: [
                    Text(
                      'Tiêm phòng 4 bệnh Felocell - Pfizer',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: _pageHeight * 0.024,
                        color: Colors.grey[800],
                      ),
                    ),
                    Spacer(),
                    Text(
                      '250.000đ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: _pageHeight * 0.026,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _pageHeight * 0.04),
              Row(
                children: [
                  Text(
                    'Phương thức thanh toán:',
                  ),
                  Spacer(),
                  DropdownButton<String>(
                    value: paymentValue,
                    icon: Icon(Icons.keyboard_arrow_up),
                    items: _listPayment
                        .map<DropdownMenuItem<String>>(buildMenuPaymentItem)
                        .toList(),
                    onChanged: (paymentValue) =>
                        setState(() => this.paymentValue = paymentValue),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Áp dụng ưu đãi:',
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) => _primaryColor),
                    ),
                    onPressed: () {},
                    child: Text('+Thêm mã'),
                  ),
                ],
              ),
              SizedBox(height: _pageHeight * 0.04),
              Text(
                'HÓA ĐƠN',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: _pageHeight * 0.028,
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Row(
                children: [
                  Text(
                    'Tạm tính:',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: _pageHeight * 0.026,
                      color: Colors.grey[800],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '500.000đ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: _pageHeight * 0.028,
                    ),
                  ),
                ],
              ),
              SizedBox(height: _pageHeight * 0.04),
              Container(
                padding: EdgeInsets.only(left: _pageWidth * 0.03),
                alignment: Alignment.center,
                width: _pageWidth,
                height: _pageHeight * 0.1,
                decoration: BoxDecoration(
                  color: _bgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "Ghi chú",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              SizedBox(height: _pageHeight * 0.2),
            ],
          ),
        ),
      ),
    );
  }

  void _ChooseService(BuildContext context) {
    var size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          scrollable: true,
          content: Container(
            padding: EdgeInsets.all(size.width * 0.03),
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: size.width,
              height: size.height * 0.7,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _serviceList!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: size.height * 0.02);
                },
                itemBuilder: (BuildContext context, int index) {
                  return ShowServiceModelItemOnResult(serviceModel: _serviceList![index]);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  DropdownMenuItem<String> buildMenuPaymentItem(var item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }

  void _changeDate(String date) async {
    setState(() {
      print('ngày được set: ' + date);
      _date = date;
    });
  }

  Future<void> _showConfirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận đặt lịch'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Bạn xác nhận muốn đặt lịch?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Xác nhận',
                style: TextStyle(color: _primaryColor),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/orderSuccessScreen');
              },
            ),
            TextButton(
              child: Text(
                'Hủy',
                style: TextStyle(color: _primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
