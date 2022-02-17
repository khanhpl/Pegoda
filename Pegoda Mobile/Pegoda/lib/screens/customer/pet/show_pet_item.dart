import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/pet.dart';
import 'package:pegoda/screens/customer/pet/show_pet_detail.dart';

class ShowPetItem extends StatefulWidget{
  Pet pet;
  ShowPetItem({required this.pet});
  @override
  State<ShowPetItem> createState() => _ShowPetItemState(pet: this.pet);
}

class _ShowPetItemState extends State<ShowPetItem> {
  Pet pet;
  _ShowPetItemState({required this.pet});
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
          color: Colors.grey[200],
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
                height: size.height * 0.1,
                child: Icon(
                  Icons.pets,
                  size: size.width*0.08,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: size.width * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tên thú cưng: ' + pet.PetName,
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: size.height * 0.016,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: size.height * 0.006),
                    RichText(
                      text: TextSpan(
                        text: 'Loại thú cưng: ' + pet.PetType + ' | ',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: size.height * 0.016,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'Giới tính: '+ pet.PetGender,
                            style: TextStyle(
                              color: Color(0xff666666),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.006),
                    Text(
                      'Trạng thái thú cưng: ' + pet.PetStatus,
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: size.height * 0.016,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              CircleAvatar(
                radius: size.height * 0.016,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: size.height * 0.016,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}