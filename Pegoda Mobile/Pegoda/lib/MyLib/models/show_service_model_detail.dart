
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/service_model.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';
import 'package:pegoda/screens/customer/search/order_screen.dart';
import '../constants.dart' as Constants;

class ShowServiceModelDetail extends StatefulWidget {
  ServiceModel serviceModel;
  ShowServiceModelDetail({required this.serviceModel});
  @override
  State<ShowServiceModelDetail> createState() => _ShowServiceModelDetailState(serviceModel: this.serviceModel);
}

class _ShowServiceModelDetailState extends State<ShowServiceModelDetail> {
  ServiceModel serviceModel;
  _ShowServiceModelDetailState({required this.serviceModel});
  String? _serviceTypeName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAPI().GetServiceTypeNameById(serviceModel.serviceTypeId).then((value) => {
      setState(() {
        _serviceTypeName = value;
      })
    });
  }
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _bgColor = Constants.bgColor;
    var _boxColor = Constants.boxColor;
    var _starColor = Constants.starColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        // automaticallyImplyLeading: false,
        toolbarHeight: _pageHeight * 0.08,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Mô tả dịch vụ',
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
      floatingActionButton: ElevatedButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderScreen(centerID: serviceModel.centerId),
            ),
          );

        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => _primaryColor),
        ),
        child: Container(

          alignment: Alignment.center,
          width: _pageWidth*0.8,
          height: _pageHeight*0.04,
          child: Text('Đặt lịch ngay'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        padding: EdgeInsets.fromLTRB(_pageWidth * 0.03, _pageHeight * 0.03,
            _pageWidth * 0.03, _pageHeight * 0.08),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: _pageHeight * 0.4,
                width: _pageWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Image.network(serviceModel.image),
              ),
              SizedBox(height: _pageHeight * 0.04),
              Text(
                _serviceTypeName!,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: _pageHeight * 0.022,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Text(
                serviceModel.name,
                style: TextStyle(
                  fontSize: _pageHeight * 0.03,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Text(
                'Giá dịch vụ: '+serviceModel.price.toString()+'đ',
                style: TextStyle(
                  fontSize: _pageHeight * 0.026,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Text(
                'Mô tả',
                style: TextStyle(
                  fontSize: _pageHeight * 0.026,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: _pageHeight * 0.02),
              Text(
                serviceModel.description,
                style: TextStyle(
                  fontSize: _pageHeight * 0.022,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: _pageHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}


