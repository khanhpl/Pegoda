
import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/pet.dart';
import 'package:pegoda/MyLib/models/show_pet_item.dart';
import '../../../MyLib/constants.dart' as Constants;

class PetScreen extends StatelessWidget {
  List<Pet> _petList = [
    Pet(PetID: "Pet1", PetName: "Con gà", PetType: "Chó pug", PetGender: true, PetStatus: "Mập", PetImage: "https://i.pinimg.com/originals/23/59/7e/23597eae81350a4705644c58bdad7f6b.jpg"),
    Pet(PetID: "Pet2", PetName: "Con vịt", PetType: "Mèo", PetGender: false, PetStatus: "Mập", PetImage: "https://i.pinimg.com/564x/7b/a1/b6/7ba1b6556719b4b358e3b86e6c24b30f.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        automaticallyImplyLeading: false,
        toolbarHeight: _pageHeight * 0.1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Thú cưng',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addPetScreen');
        },
        child: Icon(Icons.add),
        elevation: 0.0,
        backgroundColor: _primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Material(
        child: Container(
          padding:
          EdgeInsets.only(left: _pageWidth * 0.03, right: _pageHeight * 0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: _pageHeight * 0.03),
                Text(
                  'Thú cưng của bạn',
                  style: TextStyle(
                    fontSize: _pageHeight*0.028,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: _pageHeight*0.02),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _petList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: _pageHeight * 0.02);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ShowPetItem(pet: _petList[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
