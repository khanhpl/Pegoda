import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/pcc_image.dart';
import 'package:pegoda/MyLib/class/pcc_model.dart';
import 'package:pegoda/MyLib/models/show_pcc_model_detail.dart';
import 'package:pegoda/MyLib/repository/get_api.dart';
import '../constants.dart' as Constants;

class ShowPCCModelItem extends StatefulWidget {
  PCCModel pccModel;

  ShowPCCModelItem({required this.pccModel});

  @override
  State<ShowPCCModelItem> createState() =>
      _ShowPCCModelItemState(pccModel: this.pccModel);
}

class _ShowPCCModelItemState extends State<ShowPCCModelItem> {
  PCCModel pccModel;

  _ShowPCCModelItemState({required this.pccModel});

  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _boxColor = Constants.boxColor;
    var _bgColor = Constants.bgColor;
    final Future<List<PCCImage>> pccImageListFuture =
        GetAPI().GetAllPCCImage(pccModel.PCCId);

    // TODO: implement build
    return Material(
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowPCCModelDetail(pccModel: pccModel),
            ),
          );
        },
        child: Container(
          color: _boxColor,
          padding: EdgeInsets.only(
              top: _pageHeight * 0.03, bottom: _pageHeight * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: _pageWidth * 0.03),
              Container(
                height: _pageWidth * 0.25,
                width: _pageWidth * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //       pcc.PCCImage),
                  //   fit: BoxFit.fill,
                  // ),
                ),
                child: FutureBuilder<List<PCCImage>>(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    if (snapshot.hasData) {
                      // return Container(
                      //   width: _pageWidth*0.02,
                      //   child: Text(
                      //     snapshot.data![0].imageLink,
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //   ),
                      // );
                      return Image.network(snapshot.data![0].imageLink);
                    } else {
                      return Container(child: CircularProgressIndicator());
                    }
                  },
                  future: pccImageListFuture,
                ),
              ),
              SizedBox(width: _pageWidth * 0.03),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pccModel.PCCName,
                    style: TextStyle(
                      fontSize: _pageHeight * 0.022,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: _pageHeight * 0.02),
                  Container(
                    width: _pageWidth * 0.6,
                    child: Text(
                      pccModel.PCCDescription,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: _pageHeight * 0.022,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  SizedBox(height: _pageHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        color: Constants.starColor,
                        size: _pageHeight * 0.02,
                      ),
                      // Text(
                      //   ' '+ pcc.PCCRating + ' ',
                      //   style: TextStyle(
                      //     fontSize: _pageHeight * 0.022,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      Text(
                        '(999+)',
                        style: TextStyle(
                            fontSize: _pageHeight * 0.022,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[400]),
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
