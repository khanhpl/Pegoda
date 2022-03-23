import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/service_model.dart';
import 'package:pegoda/MyLib/models/show_service_model_detail.dart';
import '../../MyLib/constants.dart' as Constants;
//Test model
class ShowServiceModelItem extends StatefulWidget {
  ServiceModel serviceModel;
  ShowServiceModelItem({required this.serviceModel});
  @override
  State<ShowServiceModelItem> createState() => _ShowServiceModelItemState(serviceModel: this.serviceModel);
}

class _ShowServiceModelItemState extends State<ShowServiceModelItem> {
  ServiceModel serviceModel;
  _ShowServiceModelItemState({required this.serviceModel});
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _bgColor = Constants.bgColor;
    var _boxColor = Constants.boxColor;
    var _starColor = Constants.starColor;
    // print('image link: '+serviceModel.image[0].toString());
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowServiceModelDetail(serviceModel: serviceModel),
          ),
        );
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: _pageWidth * 0.03),
              width: _pageWidth * 0.2,
              height: _pageWidth * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(serviceModel.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: _pageWidth * 0.5,
                  child: Text(
                    serviceModel.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: _pageHeight * 0.022,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: _pageHeight * 0.015),
                Text(
                  serviceModel.price.toString()+'đ',
                  style: TextStyle(
                    fontSize: _pageHeight * 0.022,
                    fontWeight: FontWeight.w500,
                    color: _primaryColor,
                  ),
                ),
                SizedBox(height: _pageHeight * 0.015),
                Container(
                  width: _pageWidth * 0.5,
                  child: Text(
                    serviceModel.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: _pageHeight * 0.02,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      padding: EdgeInsets.all(0),
    );
  }
}
