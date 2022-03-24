
import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/Pet_Model.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';
import '../constants.dart' as Constants;

class ShowPetItemOnOrder extends StatefulWidget {
  PetModel petModel;
  ShowPetItemOnOrder({required this.petModel});

  @override
  State<ShowPetItemOnOrder> createState() => _ShowPetItemOnOrderState(petModel: this.petModel);
}

class _ShowPetItemOnOrderState extends State<ShowPetItemOnOrder> {
  PetModel petModel;

  _ShowPetItemOnOrderState({required this.petModel});
  String? animalName;
  var _checkChoosen = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAPI().GetAnimalNameByID(petModel.animalId).then((value) => {
      setState(() {
        animalName = value;
      })
    });
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var _primaryColor = Constants.primaryColor;
    var _bgColor = Constants.bgColor;
    // TODO: implement build
    return Material(
      child: Container(
        height: size.height * 0.1,
        // margin: EdgeInsets.fromLTRB(size.width * 0.03, 0, size.width * 0.03, 0),
        padding: EdgeInsets.fromLTRB(size.width * 0.03, 0, size.width * 0.03, 0),
        decoration: BoxDecoration(
          color: petModel.isSelected ? Color(0xff8C8BE4) : _bgColor,
          borderRadius: BorderRadius.circular(10.0),
          // color: Colors.grey[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(

              height: size.height * 0.08,
              width: size.height * 0.08,
              decoration: BoxDecoration(
                border: Border.all(color: _primaryColor),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/pegoda-6de8a.appspot.com/o/images%2F1648118019596.367.jpg?alt=media&token=4770c4ff-d703-4d74-b356-12e86c830f13'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: size.width * 0.03),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  petModel.petName,
                  style: TextStyle(
                    fontSize: size.height * 0.03,
                    color: Color(0xff825ee4),
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    petModel.genderPet == "Đực"
                        ? Icon(
                      Icons.male,
                      color: Colors.lightBlue,
                    )
                        : Icon(
                      Icons.female,
                      color: Colors.pinkAccent,
                    ),
                    Text(
                      animalName!,
                      style: TextStyle(
                        fontSize: size.height * 0.022,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        // child: FlatButton(
        //   onPressed: () {
        //     // setState(() {
        //     //   if(_checkChoosen){
        //     //     _checkChoosen = false;
        //     //   }else{
        //     //     _checkChoosen = true;
        //     //   }
        //     // });
        //   },
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: <Widget>[
        //       Container(
        //
        //         height: size.height * 0.08,
        //         width: size.height * 0.08,
        //         decoration: BoxDecoration(
        //           border: Border.all(color: _primaryColor),
        //           shape: BoxShape.circle,
        //           image: DecorationImage(
        //             image: NetworkImage(petModel.petImage),
        //             fit: BoxFit.fill,
        //           ),
        //         ),
        //       ),
        //       SizedBox(width: size.width * 0.03),
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             petModel.petName,
        //             style: TextStyle(
        //               fontSize: size.height * 0.03,
        //               color: Color(0xff825ee4),
        //             ),
        //           ),
        //           SizedBox(height: size.height * 0.015),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             children: [
        //               petModel.genderPet == "Đực"
        //                   ? Icon(
        //                 Icons.male,
        //                 color: Colors.lightBlue,
        //               )
        //                   : Icon(
        //                 Icons.female,
        //                 color: Colors.pinkAccent,
        //               ),
        //               Text(
        //                 animalName!,
        //                 style: TextStyle(
        //                   fontSize: size.height * 0.022,
        //                   fontWeight: FontWeight.w400,
        //                   color: Colors.black87,
        //                 ),
        //               ),
        //             ],
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
