import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:task_manager/src/functions/base_functions.dart';
import 'package:task_manager/src/pages/settings.dart';
import 'package:task_manager/src/pages/task.dart';
import 'package:task_manager/src/styles/styles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0; //index page initial

//cle de navigation
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

//controleur boutton navigation
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  //changement de page
  void pageChanged(
    int index,
  ) {
    setState(() {
      _page = index;
    });
  }

//a la selection de l'icone
  void bottomTapped(
    int index,
  ) {
    setState(() {
      pageChanged(index);

      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          items: const <Widget>[
            Icon(Icons.list, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: backgroundPage,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            bottomTapped(index);
          },
          letIndexChange: (index) => true,
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          allowImplicitScrolling: true,
          pageSnapping: true,
          onPageChanged: (index) {
            // pageChanged(index);
          },
          controller: pageController,
          children: [Task(), Setting()],
        ));
  }
}
