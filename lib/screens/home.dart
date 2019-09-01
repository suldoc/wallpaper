import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suldoc/bloc/change_theme_bloc.dart';
import 'package:suldoc/bloc/change_theme_state.dart';
import 'package:suldoc/screens/add_page.dart';
import 'package:suldoc/screens/main_page.dart';
import 'package:suldoc/screens/search_view.dart';
import 'package:suldoc/screens/settings.dart';
import 'package:suldoc/utils/exapndingnav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageIndex = 0;
  PageController pageController = PageController();
  List<String> alcohols = ['Batman', 'Minimal', 'Apple'];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: changeThemeBloc,
      builder: (BuildContext context, ChangeThemeState state) {
        return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              elevation: 5,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 30,
                    ),
                  ),
                  Text(
                    'Sul Doc',
                    style: state.themeData.textTheme.headline,
                  )
                ],
              ),
              backgroundColor: state.themeData.canvasColor
          ),
          body: Container(
            color: state.themeData.primaryColor,
            child: PageView(
                physics: BouncingScrollPhysics(),
                controller: pageController,
                onPageChanged: onPageChanged,
                children: <Widget>[
                  MainBody(),
                  AddPage(),
                  SettingsPage(),
                ]),
          ),
          bottomNavigationBar: ExpandingBottomBar(
            backgroundColor: state.themeData.bottomAppBarColor,
            navBarHeight: 60.0,
            items: [
              ExpandingBottomBarItem(
                icon: Icons.home,
                text: "Home",
                selectedColor: state.themeData.accentColor,
              ),
              ExpandingBottomBarItem(
                icon: Icons.note_add,
                text: "Add",
                selectedColor: state.themeData.accentColor,
              ),
              ExpandingBottomBarItem(
                icon: Icons.settings,
                text: "My Page",
                selectedColor: state.themeData.accentColor,
              ),
            ],
            selectedIndex: pageIndex,
            onIndexChanged: navigationTapped,
          ),
        );
      },
    );
  }

  void onPageChanged(int value) {
    setState(() {
      pageIndex = value;
    });
  }

  void navigationTapped(int value) {
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
