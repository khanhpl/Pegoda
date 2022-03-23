import 'package:flutter/material.dart';
import '../../../MyLib/constants.dart' as Constants;
import '../../../MyLib/globals.dart' as Globals;
class CancelOrderScreen extends StatefulWidget{
  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  String _cancelReport = Globals.listCancelReport[0];

  var _primaryColor = Constants.primaryColor;
  var _bgColor = Constants.bgColor;
  var _boxColor = Constants.boxColor;
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        toolbarHeight: _pageHeight * 0.08,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Xác nhận hủy đặt lịch',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: _pageHeight*0.03,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Material(
        child: Container(
          color: _bgColor,
          padding:
          EdgeInsets.only(left: _pageWidth * 0.03, right: _pageHeight * 0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                ListTile(
                  title: const Text('Tôi muốn đổi thời gian'),
                  leading: Radio(
                    value: Globals.listCancelReport[0],
                    groupValue: _cancelReport,
                    onChanged: (value) {
                      setState(() {
                        _cancelReport = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Tôi muốn đổi dịch vụ'),
                  leading: Radio(
                    value: Globals.listCancelReport[1],
                    groupValue: _cancelReport,
                    onChanged: (value) {
                      setState(() {
                        _cancelReport = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Tôi không muốn đặt nữa'),
                  leading: Radio(
                    value: Globals.listCancelReport[2],
                    groupValue: _cancelReport,
                    onChanged: (value) {
                      setState(() {
                        _cancelReport = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Khác'),
                  leading: Radio(
                    value: Globals.listCancelReport[3],
                    groupValue: _cancelReport,
                    onChanged: (value) {
                      setState(() {
                        _cancelReport = value.toString();
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: _pageWidth * 0.03),
                  alignment: Alignment.center,
                  width: _pageWidth,
                  height: _pageHeight * 0.15,
                  decoration: BoxDecoration(
                    color: _boxColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color:  Colors.black38),
                  ),
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration.collapsed(
                      hintText: "Chú Thích",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: _pageHeight*0.05),
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
                    child: Text('Xác nhận'),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _showConfirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận hủy đặt lịch'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Xác nhận hủy đặt lịch'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Xác nhận',style: TextStyle(color: _primaryColor),),
              onPressed: () {
                Navigator.pushNamed(context, '/cancelOrderSuccessScreen');
              },
            ),
            TextButton(
              child: Text('Hủy',style: TextStyle(color: _primaryColor),),
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