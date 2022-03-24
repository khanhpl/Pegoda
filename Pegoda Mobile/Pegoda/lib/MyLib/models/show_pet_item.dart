import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/Pet_Model.dart';
import 'package:pegoda/MyLib/models/show_pet_detail.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';

class ShowPetModelItem extends StatefulWidget {
  PetModel petModel;

  ShowPetModelItem({required this.petModel});

  @override
  State<ShowPetModelItem> createState() => _ShowPetModelItemState(petModel: this.petModel);
}

class _ShowPetModelItemState extends State<ShowPetModelItem> {
  PetModel petModel;
  String? animalName;
  _ShowPetModelItemState({required this.petModel});
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
                builder: (context) => ShowPetDetail(petModel: this.petModel),
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
              Spacer(),
              CircleAvatar(
                radius: size.height * 0.03,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: Color(0xff825ee4),
                  size: size.height * 0.05,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
