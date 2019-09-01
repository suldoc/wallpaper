import 'package:flutter/material.dart';
import 'package:suldoc/screens/liquor_list.dart';

class MainBody extends StatelessWidget {
  final List<String> _category = [
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
  ];
  final List<String> _categoryImage = [
    'assets/images/beer.jpg',       // '맥주',
    'assets/images/soju.jpg',       // '소주',
    'assets/images/Makgeolli.jpg',  // '막걸리',
    'assets/images/rice_wine.png',  // '청주',
    'assets/images/sake.png',       // '사케',
    'assets/images/wine.jpg',       // '와인',
    'assets/images/kaoliang.png',   // '고량주',
    'assets/images/whiskey.jpg',    // '위스키',
    'assets/images/cognac.jpg',     // '꼬냑',
    'assets/images/vodka.jpg',      // '보드카',
    'assets/images/etc.png',        // '기타'
  ];

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width / 2;

    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        elevation: 5,
//        title: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(4.0),
//              child: Image.asset(
//                'assets/images/logo.png',
//                height: 30,
//              ),
//            ),
//            Text(
//              'SulDoc',
//              style: Theme.of(context).textTheme.headline,
//            )
//          ],
//        ),
//        textTheme: Theme.of(context).textTheme,
//        backgroundColor: Colors.blueAccent
//      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: _category.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: new InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LiquorList(_category[index])),
                                );
                              },
                              child: Container(
                                width: _width,
                                height: _width - 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: FadeInImage(
                                    image: AssetImage(_categoryImage[index]),
                                    fit: BoxFit.cover,
                                    placeholder:
                                        AssetImage('assets/images/loading.gif'),
                                  ),
                                ),
                              ),
                            )),
                        Text(_category[index],
                            style: Theme.of(context).textTheme.body2),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        )
      )
    );
  }
}
