import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/screen/LoginRegister/FadeAnimation.dart';
import 'package:flutter_medical/screen/doctor/doctor.dart';
//import 'package:flutter_medical/screen/reserve/reserve_screen.dart';
import 'package:flutter_medical/widget/header_logo.dart';
import 'package:flutter_medical/widget/menu_card.dart';
import 'package:flutter_medical/widget/my_header.dart';
import 'package:flutter_medical/screen/reserve/widget/my_appbar.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(child: Text("Header")),
          ListTile(title: Text("Home"))
        ]),
      ),*/
      body: Column(
        children: <Widget>[
          FadeAnimation(
            1,
            MyHeader(
              height: 255,
              imageUrl: 'assets/images/welcome.png',
              child: Column(
                children: <Widget>[
                  MyAppbar(),
                  HeaderLogo(),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 28,
                      color: mTitleTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 36,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [mBackgroundColor, mSecondBackgroundColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FadeAnimation(
                            1.2,
                            Text(
                              'Our Health\nServices',
                              style: TextStyle(
                                color: mTitleTextColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          /*Icon(
                            Icons.menu,
                            color: mSecondBackgroundColor,
                            size: 36,
                          ),*/
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    FadeAnimation(
                      1.3,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          MenuCard(
                            imageUrl: 'assets/images/general_practice.png',
                            title: 'General Practice',
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DoctorList();
                                  },
                                ),
                              );
                            },
                          ),
                          MenuCard(
                            imageUrl: 'assets/images/specialist.png',
                            title: 'Specialist',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    FadeAnimation(
                      1.4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          MenuCard(
                            imageUrl: 'assets/images/sexual_health.png',
                            title: 'Sexual Health',
                          ),
                          MenuCard(
                            imageUrl: 'assets/images/immunisation.png',
                            title: 'Immunisation',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    /*Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MenuCard(
                          imageUrl: 'assets/images/sexual_health.png',
                          title: 'Sexual Health',
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/immunisation.png',
                          title: 'Immunisation',
                        ),
                      ],
                    ),*/
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
