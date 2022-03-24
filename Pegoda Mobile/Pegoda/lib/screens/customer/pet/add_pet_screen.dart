import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/animal.dart';
import 'package:pegoda/MyLib/repository/create_api.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';

class AddPetScreen extends StatefulWidget {
  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  bool _isGenderMale = false;
  bool _isGenderFemale = false;
  List<Animal>? _listAnimal;
  var pettypeValue;
  bool result = false;
  TextEditingController? nameController;
  TextEditingController? statusController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAPI().GetAllAnimal().then((value) => {
      setState(() {
        _listAnimal = value;
      })
    });
    nameController = new TextEditingController(text: '');
    statusController = new TextEditingController(text: '');
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
                  onPressed: () {},
                  child: Container(
                    width: size.height * 0.12,
                    height: size.height * 0.12,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: size.height * 0.01),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/black.png'),
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
                    SizedBox(height: size.height * 0.03),
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
                        controller: nameController,
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
                      'Loại thú cưng',
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: size.height * 0.02),
                    DropdownButton<String>(
                      value: pettypeValue,
                      items: menuItemPetType,
                      onChanged: (pettypeValue) =>
                          setState(() => this.pettypeValue = pettypeValue),
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
                        controller: statusController,
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
                    'Xác nhận',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.024,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    String genderStr = _isGenderMale ? 'Đực' : 'Cái';
                    // print('Test Name: '+nameController!.text);
                    // print('Test status: '+statusController!.text);
                    // print('Test gender: '+genderStr);
                    // print('Test animalid: '+ pettypeValue );
                    createPet(nameController!.text, statusController!.text, genderStr, pettypeValue);
                    Navigator.pushNamed(context, '/addPetSuccessScreen');

                  },
                ),
              ),
              SizedBox(height: size.height * 0.4),
            ],
          ),
        ),
      ),
    );
  }
  Future createPet(String name, String status, String gender, String animalID) async {
    final createResult = await CreateApi().createPet(name, status, gender, animalID);
    if (!mounted) return;
    setState(() {
      result = createResult;
    });
  }
}
