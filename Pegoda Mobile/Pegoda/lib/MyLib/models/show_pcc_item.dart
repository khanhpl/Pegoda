import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/pcc.dart';

class ShowPCCItem extends StatefulWidget {
  PCC pcc;

  ShowPCCItem({required this.pcc});

  @override
  State<ShowPCCItem> createState() => _ShowPCCItemState(pcc: this.pcc);
}

class _ShowPCCItemState extends State<ShowPCCItem> {
  PCC pcc;

  _ShowPCCItemState({required this.pcc});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Material(
      child: Container(
        height: size.height*0.15,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.height * 0.15,
              height: size.height * 0.15,
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(pcc.PCCImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: size.width*0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.pets,
                      color: Color(0xff825ee4),
                    ),
                    Text(
                      pcc.PCCName,
                      style: TextStyle(
                        fontSize: size.height * 0.028 ,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  ' '+pcc.PCCService,
                  style: TextStyle(
                    fontSize: size.height * 0.022,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      pcc.PCCRating,
                      style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      (' (999+) '),
                      style: TextStyle(
                        fontSize: size.height * 0.022,
                        fontWeight: FontWeight.w400,
                        color: Colors.black45,
                      ),
                    ),
                    Text(
                      (' . '),
                      style: TextStyle(
                        fontSize: size.height * 0.022,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      pcc.PCCDistance,
                      style: TextStyle(
                        fontSize: size.height * 0.022,
                        fontWeight: FontWeight.w400,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
