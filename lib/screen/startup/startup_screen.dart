import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/screen/LoginRegister/FadeAnimation.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen.dart';
import 'package:flutter_medical/widget/header_logo.dart';
import 'package:flutter_medical/widget/my_header.dart';

class StartupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FadeAnimation(
            1,
            MyHeader(
              height: 460,
              imageUrl: 'assets/images/doctor.png',
              child: HeaderLogo(),
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
              child: Column(
                children: <Widget>[
                  FadeAnimation(
                    1.1,
                    Text(
                      'Doctor Consultation',
                      style: TextStyle(
                          fontSize: 32,
                          color: mTitleTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                    1.2,
                    Text(
                      'Lorem ipsum dolor sit amet, consectetuer \n'
                      'adipiscing elit, sed diam nonummy nibh euismod ',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: mTitleTextColor),
                    ),
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: FadeAnimation(
                      1.3,
                      FlatButton(
                        color: mButtonColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WelcomeScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
