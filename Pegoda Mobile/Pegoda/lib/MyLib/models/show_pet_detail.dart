import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/Pet_Model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pegoda/MyLib/class/animal.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';
import '../globals.dart' as globals;
import 'package:flutter/services.dart';

class ShowPetDetail extends StatefulWidget {
  PetModel petModel;

  ShowPetDetail({required this.petModel});

  @override
  State<ShowPetDetail> createState() =>
      _ShowPetDetailState(petModel: this.petModel);
}

class _ShowPetDetailState extends State<ShowPetDetail> {
  PetModel petModel;

  _ShowPetDetailState({required this.petModel});

  bool _isGenderMale = false;
  bool _isGenderFemale = false;
  late File imageFile;
  bool _picIsChose = false;
  String? animalName;
  List<Animal>? _listAnimal;
  TextEditingController? nameController;
  TextEditingController? statusController;
  var pettypeValue;

  void initState() {
    // TODO: implement initState
    super.initState();
    GetAPI().GetAnimalNameByID(petModel.animalId).then((value) => {
          setState(() {
            animalName = value;
          })
        });
    GetAPI().GetAllAnimal().then((value) => {
      setState(() {
        _listAnimal = value;
      })
    });
    nameController = new TextEditingController(text: animalName);
    statusController = new TextEditingController(text: petModel.petStatus);
    _isGenderMale = petModel.genderPet == "Đực" ? true : false;
    _isGenderMale = petModel.genderPet == "Cái" ? true : false;
    pettypeValue = petModel.animalId;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<DropdownMenuItem<String>> menuItemPetType = [];
    for (Animal animal in _listAnimal!) {
      menuItemPetType.add(
        DropdownMenuItem(
          child: Text(animal.animalName.toString()),
          value: animal.animalID,
        ),
      );
    }
    // TODO: implement build
    return Material(
      child: Container(
        color: Colors.white,
        width: size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width,
                height: size.height * 0.12,
                alignment: Alignment.centerLeft,
                child: Container(
                  child: IconButton(
                    onPressed: () {
                      // Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    icon: ImageIcon(
                      AssetImage('assets/cus/account_screen/cancel.png'),
                      size: size.height * 0.04,
                      color: Color(0xFFBDBDBD),
                    ),
                  ),
                ),
              ),
              Text(
                'Thú cưng của bạn',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w500,
                  fontSize: size.height * 0.032,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                child: FlatButton(
                  onPressed: () {
                    _getFromGallery();
                  },
                  child: globals.isAvatarChecked == false
                      ? Container(
                          width: size.height * 0.12,
                          height: size.height * 0.12,
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: size.height * 0.01),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/pegoda-6de8a.appspot.com/o/images%2F1648118019596.367.jpg?alt=media&token=4770c4ff-d703-4d74-b356-12e86c830f13'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          width: size.height * 0.12,
                          height: size.height * 0.12,
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: size.height * 0.01),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: FileImage(globals.petAvatarFile),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                margin: EdgeInsets.fromLTRB(
                    size.width * 0.03, 0.0, size.width * 0.03, 0.0),
                padding: EdgeInsets.fromLTRB(size.width * 0.03,
                    size.height * 0.03, size.width * 0.03, size.height * 0.03),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tên thú cưng',
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: size.height * 0.02),
                    Container(
                      height: size.height * 0.06,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: size.width * 0.03, right: size.width * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffDADADA)),
                      ),
                      child: TextField(
                        controller:
                            TextEditingController(text: petModel.petName),
                        decoration: InputDecoration.collapsed(
                          hintText: '',
                          hintStyle: TextStyle(
                            fontSize: size.height * 0.02,
                            color: Color(0xff666666),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Giới tính',
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            value: _isGenderMale,
                            onChanged: (value) {
                              setState(() {
                                _isGenderMale = true;
                                _isGenderFemale = false;
                              });
                            },
                            checkColor: Color(0xff5B9610),
                            activeColor: Colors.white,
                          ),
                          Text(
                            'Đực',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: size.width * 0.1),
                          Checkbox(
                            value: _isGenderFemale,
                            onChanged: (value) {
                              setState(() {
                                _isGenderMale = false;
                                _isGenderFemale = true;
                              });
                            },
                            checkColor: Color(0xff5B9610),
                            activeColor: Colors.white,
                          ),
                          Text(
                            'Cái',
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownButton<String>(
                      value: pettypeValue,
                      items: menuItemPetType,
                      onChanged: (pettypeValue) =>
                          setState(() => this.pettypeValue = pettypeValue),
                    ),

                    SizedBox(height: size.height * 0.02),
                    Container(
                      height: size.height * 0.06,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: size.width * 0.03, right: size.width * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffDADADA)),
                      ),
                      child: TextField(
                        controller: TextEditingController(text: animalName),
                        decoration: InputDecoration.collapsed(
                          hintText: '',
                          hintStyle: TextStyle(
                            fontSize: size.height * 0.02,
                            color: Color(0xff666666),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Tình trạng thú cưng',
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: size.height * 0.02),
                    Container(
                      height: size.height * 0.06,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: size.width * 0.03, right: size.width * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffDADADA)),
                      ),
                      child: TextField(
                        controller:
                            TextEditingController(text: petModel.petStatus),
                        decoration: InputDecoration.collapsed(
                          hintText: '',
                          hintStyle: TextStyle(
                            fontSize: size.height * 0.02,
                            color: Color(0xff666666),
                          ),
                        ),
                      ),
                    ),

                    //end box----------------------------------------------------------
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.06),
              Container(
                width: size.width * 0.75,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                  color: Color(0xff333333),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: FlatButton(
                  child: Text(
                    'Cập nhật',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.024,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: size.height * 0.4),
            ],
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        _picIsChose = true;
        globals.isPetAvatarChecked = true;
        globals.petAvatarFile = imageFile;
      });
    }
  }
}
