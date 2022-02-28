import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../MyLib/constants.dart' as Constants;

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    var _primaryColor = Constants.primaryColor;
    return Scaffold(
        appBar: AppBar(
          title: Text('Trung tâm trợ  giúp'),
          centerTitle: true,
          backgroundColor: _primaryColor,
          leading: IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, '/cusMain');
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Câu hỏi thường gặp",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 2,
                  height: 50,
                ),
                _buildQuestionBox(" Pety Smart NFC là gì?"),
                const Divider(
                  thickness: 1,
                  height: 50,
                ),
                _buildQuestionBox(
                    "Cách hoạt động của Pety Smart NFC như thế nào?"),
                const Divider(
                  thickness: 2,
                  height: 50,
                ),
                _buildQuestionBox("Làm sao tôi có thẻ Pety Smart NFC?"),
                const Divider(
                  thickness: 2,
                  height: 50,
                ),
                _buildQuestionBox(
                    "Dòng điện thoại nào hỗ trợ quét được thẻ Pety Smart NFC?"),
                const Divider(
                  thickness: 2,
                  height: 50,
                ),
                _buildQuestionBox("Làm sao để quét thẻ Pety Smart NFC?"),
                const Divider(
                  thickness: 2,
                  height: 50,
                ),
                _buildQuestionBox(
                    "Pety Smart NFC hỗ trợ tìm kiếm chó mèo lạc như thế nào?"),
                const Divider(
                  thickness: 2,
                  height: 50,
                ),
                _buildQuestionBox(
                    "Với người chưa tải app Pety, khi họ quét thẻ, mình có biết được vị trí của họ không?"),
                const Divider(
                  thickness: 2,
                  height: 50,
                ),
                _buildQuestionBox(
                    "Chíp Pety NFC có ảnh hưởng tới thú cưng hay không?"),
                const Divider(
                  thickness: 2,
                  height: 50,
                ),
                _buildQuestionBox("Chip Pety NFC dùng được bao lâu?"),
              ],
            ),
          ]),
        ));
  }
  Widget _buildQuestionBox(String name) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            onTap: () async {
              const url =
                  'https://pety.vn/blog/pety-smart-nfc-cau-hoi-thuong-gap.html';
              if (!await launch(url)) throw 'Could not launch $url';
            },
          ),
        ),
      ],
    );
  }
}

