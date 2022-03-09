
import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/time_slot.dart';
import '../constants.dart' as Constants;

class TimeSlotItem extends StatefulWidget {
  TimeSlot timeSlot;

  TimeSlotItem({required this.timeSlot});

  @override
  State<TimeSlotItem> createState() =>
      _TimeSlotItemState(timeSlot: this.timeSlot);
}

class _TimeSlotItemState extends State<TimeSlotItem> {
  TimeSlot timeSlot;

  _TimeSlotItemState({required this.timeSlot});
  var _primaryColor = Constants.primaryColor;
  var _boxColor = Constants.boxColor;
  var _bgColor = Constants.bgColor;
  var _isChoose = false;


  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _status = timeSlot.status;
    return FlatButton(
      onPressed: () {
        setState(() {
          _isChoose = true;
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        height: _pageHeight * 0.06,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          color: !_isChoose ? _setTimeSlotBoxColor(_status) : _primaryColor,
        ),
        child: Text(
          timeSlot.timeSlot,
        ),
      ),
    );
  }

  Color _setTimeSlotBoxColor(var status) {
      if (timeSlot.status == "1") {
        return Colors.grey;

      } else if (timeSlot.status == "2") {
        return _boxColor;
      } else {
        return _primaryColor;
      }
  }
}
