import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/pcc.dart';
import 'package:pegoda/MyLib/class/service.dart';
import 'package:pegoda/MyLib/models/show_pcc_detail.dart';
import 'package:pegoda/MyLib/models/show_service_item.dart';
import 'package:pegoda/MyLib/models/show_service_item_on_result.dart';
import '../constants.dart' as Constants;

class ShowResult extends StatefulWidget {
  PCC pcc;

  ShowResult({required this.pcc});

  @override
  State<ShowResult> createState() => _ShowResultState(pcc: this.pcc);
}

class _ShowResultState extends State<ShowResult> {
  PCC pcc;

  _ShowResultState({required this.pcc});

  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _boxColor = Constants.boxColor;
    var _bgColor = Constants.bgColor;
    List<Service> _serviceList = pcc.PCCService;
    // TODO: implement build
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: _boxColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowPCCDetail(pcc: this.pcc),
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
                        image: DecorationImage(
                          image: AssetImage(pcc.PCCImage),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: _pageWidth * 0.03),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pcc.PCCName,
                          style: TextStyle(
                            fontSize: _pageHeight * 0.022,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: _pageHeight * 0.02),
                        Container(
                          width: _pageWidth * 0.6,
                          child: Text(
                            pcc.PCCContent,
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
                            Text(
                              ' ' + pcc.PCCRating + ' ',
                              style: TextStyle(
                                fontSize: _pageHeight * 0.022,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '(999+) . ',
                                  style: TextStyle(
                                      fontSize: _pageHeight * 0.022,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[600]),
                                ),

                                Text(
                                  pcc.PCCDistance,
                                  style: TextStyle(
                                      fontSize: _pageHeight * 0.022,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: _serviceList.length,
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  width: _pageWidth,
                  child: Column(
                    children: [
                      SizedBox(height: _pageHeight * 0.02),
                    ],
                  ),
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return ShowServiceItemOnResult(service: _serviceList[index]);
              },
            ),
            SizedBox(height: _pageHeight * 0.02),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowPCCDetail(pcc: this.pcc),
                    ),
                  );
                },
                child: Text(
                  'Xem tất cả',
                  style: TextStyle(
                    color: _primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
