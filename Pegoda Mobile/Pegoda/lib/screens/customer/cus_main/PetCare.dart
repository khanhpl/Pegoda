import 'package:flutter/material.dart';
import '../../../MyLib/class/PetcarePlace.dart';

class Petcare extends StatefulWidget {
  PetcareSystem petcareSystem;
  Petcare({Key? key, required this.petcareSystem}) : super(key: key);

  @override
  _PetcareState createState() => _PetcareState(petcareSystem: this.petcareSystem);
}

class _PetcareState extends State<Petcare> {
  PetcareSystem petcareSystem;
  _PetcareState({required this.petcareSystem});

  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        child: Card(

          child: Column(
            children: [
              Container(
                width: _pageWidth*0.4,
                height: _pageHeight*0.15,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(petcareSystem.imageUrl),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: _pageHeight*0.02),
              Expanded(
                child: Container(
                  width: _pageWidth*0.4,
                  child: Text(
                    petcareSystem.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: _pageHeight*0.02,
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
