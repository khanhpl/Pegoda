import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pegoda/MyLib/class/Pet_Model.dart';
import 'package:pegoda/MyLib/class/service_model.dart';
import 'package:pegoda/MyLib/models/show_pet_item_on_order.dart';
import 'package:pegoda/MyLib/models/show_service_model_item_on_result.dart';
import 'package:pegoda/MyLib/models/show_service_model_on_order.dart';
import 'package:pegoda/MyLib/repository/create_api.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';
import '../../../MyLib/constants.dart' as Constants;
import '../../../MyLib/globals.dart' as Globals;
import 'package:intl/intl.dart';
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

  var paymentValue;
  List _listPayment = Globals.listPayment;
  List<ServiceModel>? _serviceList;
  var _primaryColor = Constants.primaryColor;
  var _boxColor = Constants.boxColor;
  var _bgColor = Constants.bgColor;
  var _date = 'Chọn thời gian thực hiện';
  String dateInputStr ='';
  List<PetModel>? _listPetModel;
  String petId = '';
  bool result = false;
  var totalPrice=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAPI().GetServiceModelByCenterID(centerID).then((value) => {
          setState(() {
            _serviceList = value;
          })
        });
    GetAPI().GetPetModelByEmail(Globals.userEmail).then((value) => {
          setState(() {
            _listPetModel = value;
          })
        });
    Globals.listServiceOnOrder.clear();
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
                  totalPrice.toString()+'đ',
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
                  DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      maxTime: DateTime(2023, 12, 31),
                      onChanged: (date) {}, onConfirm: (date) {
                    String dateInput =
                        date.year.toString() +
                        '-' +
                        date.month.toString() +
                        '-' +
                        date.day.toString();

                    dateInputStr = DateFormat("yyyy-MM-ddTKK:mm:ss").format(date);

                    _changeDate(dateInput);
                  }, currentTime: DateTime.now(), locale: LocaleType.vi);
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
                      'Ngày: '+_date,
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
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _listPetModel!.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: _pageWidth * 0.02);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      //highlightColor: Colors.red,
                      splashColor: Colors.blueAccent,
                      onTap: () {
                        setState(() {
                          _listPetModel!
                              .forEach((element) => element.isSelected = false);
                          _listPetModel![index].isSelected = true;
                        });
                      },
                      child:
                          ShowPetItemOnOrder(petModel: _listPetModel![index]),
                    );
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
                        _calTotalPrice();
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
              Globals.listServiceOnOrder.length == 0
                  ? Container()
                  : ListView.separated(
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: Globals.listServiceOnOrder.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: _pageWidth * 0.02);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Row(
                            children: [
                              Text(
                                Globals.listServiceOnOrder[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: _pageHeight * 0.024,
                                  color: Colors.grey[800],
                                ),
                              ),
                              Spacer(),
                              Text(
                                Globals.listServiceOnOrder[index].price.toString()+'đ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: _pageHeight * 0.026,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
                  totalPrice.toString()+"đ",
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
    setState(() {
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
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _serviceList!.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: size.height * 0.02);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ShowServiceModelItemOnOrder(
                        serviceModel: _serviceList![index]);
                  },
                ),
              ),
            ),
          );
        },
      );
    });
  }

  DropdownMenuItem<String> buildMenuPaymentItem(var item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }

  void _changeDate(String date) async {
    setState(() {
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
                _getPetId();
                if(_date=="Chọn thời gian thực hiện" || totalPrice == 0 || petId.isEmpty){
                  return;
                }
                String curDate =DateFormat("yyyy-MM-ddTKK:mm:ss").format(DateTime.now()) ;
                createOrder(curDate, totalPrice.toString(), centerID, petId);
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
  void _calTotalPrice(){
    setState(() {
      totalPrice = 0;
      for(ServiceModel service in Globals.listServiceOnOrder){
        totalPrice = totalPrice + int.parse(service.price.toString());
      }
    });
  }
  void _getPetId(){
    for(PetModel pet in _listPetModel!){
      if(pet.isSelected){
        petId = pet.petId;
      }
    }
  }
  Future createOrder(String date, String totalPrice, String centerId, String petId) async {
    final createResult = await CreateApi().createOrder(date, totalPrice, centerId, petId);
    if (!mounted) return;
    setState(() {
      result = createResult;
    });
  }
}
