import 'package:flutter/material.dart';

class LiquorList extends StatelessWidget {
  final liquorLength = {
    '맥주': 7,
    '소주': 3,
    '막걸리': 4,
    '청주': 1,
    '사케': 4,
    '와인': 2,
    '고량주': 6,
    '위스키': 3,
    '꼬냑': 8,
    '보드카': 4,
    '기타': 9,
  };
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
    'assets/images/beer.jpg', // 맥주
    'assets/images/soju.jpg', // 소주
    'assets/images/Makgeolli.jpg', // 막걸리
    'assets/images/rice_wine.png', // 청주
    'assets/images/sake.png', // 사케
    'assets/images/wine.jpg', // 와인
    'assets/images/kaoliang.png', // 고량주
    'assets/images/whiskey.jpg', // 위스키
    'assets/images/cognac.jpg', // 꼬냑
    'assets/images/vodka.jpg', // 보드카
    'assets/images/etc.png', // 기타
  ];

  final String categoryName;

  LiquorList(this.categoryName);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width / 3;
    var eachLiquorListCnt = 1;
    liquorLength.entries.forEach((map) {
      if (categoryName == map.key) {
        eachLiquorListCnt = map.value;
      }
    });
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.grey,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: 30,
            ),
            Text(
              'Sul Doc',
              style: TextStyle(
                  fontFamily: 'Sans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24),
            )
          ],
        ),
        elevation: 0,
      ),

//      appBar: AppBar(
//          centerTitle: true,
//          elevation: 0,
//          title: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.all(4.0),
//                child: Image.asset(
//                  'assets/images/logo.png',
//                  height: 30,
//                ),
//              ),
//              Text(
//                'SulDoc',
//                style: Theme.of(context).textTheme.headline,
//              )
//            ],
//          ),
////          textTheme: Theme.of(context).textTheme,
//          backgroundColor: Colors.blueAccent),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: eachLiquorListCnt,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  Padding paddingData = Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: new InkWell(
                              onTap: () {
                                print('liquor List tap touch!!');
//                                Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) => liquor_page()),
//                                );
                              },
                              child: Container(
                                width: _width,
                                height: _width - 42,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: FadeInImage(
                                    image: AssetImage(_categoryImage[index]),
                                    fit: BoxFit.cover,
                                    placeholder: AssetImage(
                                        'assets/images/loading.gif'),
                                  ),
                                ),
                              ),
                            )),
                        Text(_category[index],
                            style: Theme.of(context).textTheme.body2),
                      ],
                    ),
                  );

                  return paddingData;
                },
              ),
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add the my new',
        onPressed: () {
          print('Pressed');
        },
      ),
    );
  }
}
