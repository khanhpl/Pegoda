import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/pet.dart';
import 'package:pegoda/MyLib/models/show_pet_detail.dart';

class ShowPetItemOnOrder extends StatefulWidget {
  Pet pet;

  ShowPetItemOnOrder({required this.pet});

  @override
  State<ShowPetItemOnOrder> createState() => _ShowPetItemOnOrderState(pet: this.pet);
}

class _ShowPetItemOnOrderState extends State<ShowPetItemOnOrder> {
  Pet pet;

  _ShowPetItemOnOrderState({required this.pet});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Material(
      child: Container(
        height: size.height * 0.1,
        margin: EdgeInsets.fromLTRB(size.width * 0.03, 0, size.width * 0.03, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // color: Colors.grey[200],
        ),
        child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowPetDetail(pet: this.pet),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height * 0.08,
                width: size.height * 0.08,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(pet.PetImage),
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
                    pet.PetName,
                    style: TextStyle(
                      fontSize: size.height * 0.03,
                      color: Color(0xff825ee4),
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      pet.PetGender && true
                          ? Icon(
                        Icons.male,
                        color: Colors.lightBlue,
                      )
                          : Icon(
                        Icons.female,
                        color: Colors.pinkAccent,
                      ),
                      Text(
                        pet.PetType,
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
        ),
      ),
    );
  }
}
