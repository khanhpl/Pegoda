import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/pcc_model.dart';
import 'package:pegoda/MyLib/models/show_pcc_model_item.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';
import '../../../MyLib/constants.dart' as Constants;

class NearestPCCScreen extends StatefulWidget{
  @override
  State<NearestPCCScreen> createState() => _NearestPCCScreenState();
}

class _NearestPCCScreenState extends State<NearestPCCScreen> {
  var _primaryColor = Constants.primaryColor;
  final Future<List<PCCModel>> pccModels = GetAPI().GetAllPCC();
  @override
  Widget build(BuildContext context) {

    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Trung tâm gần bạn',
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
      body: Material(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: _pageHeight * 0.03),
                FutureBuilder<List<PCCModel>>(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        // itemCount: snapshot.data!.length,
                        itemCount: 5,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: _pageHeight * 0.03);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return ShowPCCModelItem(
                              pccModel: snapshot.data![index]);
                        },
                      );
                    } else {
                      return Container(child: CircularProgressIndicator());
                    }
                  },
                  future: pccModels,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}