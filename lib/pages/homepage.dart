import 'dart:async';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:testapp1/pages/quiz.dart';
import 'package:testapp1/widgets/mydrawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../allpages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var bottomNavIndex = 0;

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //default index of first screen

  // var currentindex = 0;
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  // final displayScreen = <Widget>[
  //   Home(),
  //   Settings(),
  //   Profile(),
  //   About(),
  // ];
  final iconList = <IconData>[
    Icons.home,
    Icons.person_outline,
    Icons.info_outline,
    Icons.settings,
  ];

  @override
  void initState() {
    super.initState();

    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: HexColor('#373A36'),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 0),
      () => _animationController.forward(),
    );
  }

//HOME
  @override
  Widget build(BuildContext context) {
    // Animation<double> animation;
    final displayScreen = <Widget>[
      Home(),
      Profile(),
      About(),
      Settings(),
    ];
    return Scaffold(
        extendBody: true,
        drawer: MyDrawer(),
        // Drawer(
        //   child: Container(
        //     color: drkmd == true ? Colors.grey[900] : Colors.grey[50],
        //     width: double.infinity,
        //     height: double.infinity,
        //   ),
        // ),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          /*actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 10, 4),
            child: CircleAvatar(
              radius: 22,
              child: Image(
                image: AssetImage('images/environment.png'),
              ),
            ),
          ),
        ],*/
          title: Text(
            bottomNavIndex == 0
                ? 'Nepal Health Frontiers '
                : bottomNavIndex == 1
                    ? 'Profile'
                    : bottomNavIndex == 2
                        ? 'About Us'
                        : bottomNavIndex == 3
                            ? 'Settings'
                            : '',
            style: TextStyle(
              fontFamily: 'SuezOne',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          toolbarHeight: 50,
          backgroundColor: bottomNavIndex == 0
              ? HexColor('#0984e3')
              : bottomNavIndex == 1
                  ? HexColor('#e63946')
                  : bottomNavIndex == 2
                      ? HexColor('#6c5ce7')
                      : bottomNavIndex == 3
                          ? HexColor('#00b894')
                          : HexColor('#55efc4'),
          leading: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return IconButton(
                tooltip: 'Open Drawer',
                // splashRadius: 3,
                icon: Icon(Icons.dehaze),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        extendBodyBehindAppBar: true,
        body: CircularRevealAnimation(
          animation: animation,
          centerOffset: Offset(
            MediaQuery.of(context).size.width * 0.9,
            MediaQuery.of(context).size.height * 0.9,
          ),
          maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: displayScreen[bottomNavIndex],
          ),
        ),

        /*NavigationScreen(
    iconList[bottomNavIndex],
        ),*/
        floatingActionButton: ScaleTransition(
          scale: animation,
          child: FloatingActionButton(
            tooltip: 'Play Games',
            elevation: 8,
            backgroundColor: HexColor('#FFA400'),
            child: Icon(
              Icons.gamepad,
              color: HexColor('#373A36'),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => QuizPage()));
              // _animationController.reset();
              // _animationController.forward();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          backgroundColor: bottomNavIndex == 0
              ? HexColor('#0984e3')
              : bottomNavIndex == 1
                  ? HexColor('#e63946')
                  : bottomNavIndex == 2
                      ? HexColor('#6c5ce7')
                      : bottomNavIndex == 3
                          ? HexColor('#00b894')
                          : HexColor('#55efc4'),
          activeIndex: bottomNavIndex,
          activeColor: HexColor('#FFA400'),
          splashColor: HexColor('#FFA400'),
          inactiveColor: Colors.white,
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) => setState(
            () {
              bottomNavIndex = index;

              // currentindex = index;
            },
          ),
        ),
        backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100]);
  }
}

class NavigationScreen extends StatefulWidget {
  final IconData iconData;

  NavigationScreen(this.iconData) : super();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

//PAGES DISPLAY CONTROL
class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void didUpdateWidget(NavigationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.iconData != widget.iconData) {
      _startAnimation();
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    super.initState();
  }

  _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: CircularRevealAnimation(
          animation: animation,
          centerOffset: Offset(
            MediaQuery.of(context).size.width / 2,
            MediaQuery.of(context).size.height / 2,
          ),
          maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
          child: Column()),
    );
  }
}

//CLASS FOR COLOR
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
