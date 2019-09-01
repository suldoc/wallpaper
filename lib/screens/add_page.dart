import 'dart:io';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();

  String liquorType = '맥주';
  File _image;
  double tasteScore = 0;
  double ratioScore = 0;
  List<Widget> tasteScores = [];
  List<Widget> ratioScores = [];

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  void pressTasteStart(int i, String type) {
    setState(() {
      if (type == "taste") {
        tasteScores = _buildScoreRow(i.toDouble(), type);
      } else {
        ratioScores = _buildScoreRow(i.toDouble(), type);
      }
    });
  }

  @override
  initState() {
    super.initState();
    tasteScores = _buildScoreRow(0, "taste");
    ratioScores = _buildScoreRow(0, "ratio");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      makeImage(BoxFit.contain),
                      Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Column(
                                    children: <Widget>[
                                      Text('술 종류',
                                          style:
                                              Theme.of(context).textTheme.title,
                                          textAlign: TextAlign.left),
                                    ],
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Column(children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        DropdownButton<String>(
                                          value: liquorType,
                                          onChanged: onPageChanged,
                                          items: <String>[
                                            '맥주',
                                            '소주',
                                            '막걸리',
                                            '청주',
                                            '사케',
                                            '와인',
                                            '고량주',
                                            '위스키',
                                            '꼬냑',
                                            '보드카',
                                            '기타'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(value),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.3),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 1.0),
                                              fontSize: 20),
                                        ),
                                      ],
                                    )
                                  ])),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Column(
                                    children: <Widget>[
                                      Text('이름',
                                          style:
                                              Theme.of(context).textTheme.title,
                                          textAlign: TextAlign.left),
                                    ],
                                  )),
                              Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Column(
                                    children: <Widget>[
                                      TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.fromLTRB(2, 3, 2, 3),
                                            hintText: '술 이름을 입력해주세요.'),
                                      ),
                                    ],
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Text('맛'),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: tasteScores,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Text('가성비'),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ratioScores,
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Text('한줄 코멘트'),
                        ],
                      )),
                  Container(
                    alignment: Alignment.topLeft,
                    height: 200,
                    color: Color(0xffffffff),
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: new ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 200.0,
                      ),
                      child: new Scrollbar(
                        child: new SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          child: SizedBox(
                            height: 150.0,
                            child: new TextField(
                              maxLines: 20,
                              decoration: new InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '나만의 느낌!',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget makeImage(BoxFit option) {
    return Container(
      color: Colors.grey,
      child: Image.asset('assets/images/logo.png',
          width: 120, height: 120, fit: option),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    );
  }

  List<Widget> _buildScoreRow(double score, String type) {
    List<Widget> scoreArr = [];
    for (int i = 0; i < 5; i++) {
      scoreArr.insert(
          i,
          new IconButton(
              icon: new Icon(i < score.toInt() ? Icons.star : Icons.star_border,
                  size: 40),
              onPressed: () => {pressTasteStart(i + 1, type)}));
    }
    return scoreArr;
  }

  void onPageChanged(String value) {
    setState(() {
      liquorType = value;
    });
  }
}
