
import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/Pet_Model.dart';
import 'package:pegoda/MyLib/models/show_pet_item.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';
import '../../../MyLib/constants.dart' as Constants;
import '../../../MyLib/globals.dart' as Globals;

class PetScreen extends StatefulWidget{
  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {

  List<PetModel>? _listPetModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAPI().GetPetModelByEmail(Globals.userEmail).then((value) => {
      setState(() {
        _listPetModel = value;
      })
    });
  }
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                    itemCount: _listPetModel!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: _pageHeight * 0.02);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ShowPetModelItem(petModel: _listPetModel![index]);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
