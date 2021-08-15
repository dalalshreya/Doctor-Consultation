import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/screen/LoginRegister/FadeAnimation.dart';
import 'package:flutter_medical/screen/doctor/doctor_info.dart';
import 'package:flutter_medical/screen/doctor/doctor_tile.dart';
//import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/screen/reserve/widget/my_appbar.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen.dart';
//import 'package:flutter_medical/screen/reserve/widget/user_info.dart';
import 'package:flutter_medical/widget/header_logo.dart';
import 'package:flutter_medical/widget/my_header.dart';

class DoctorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        FadeAnimation(
          1,
          MyHeader(
            height: 210,
            imageUrl: 'assets/images/welcome.png',
            child: Column(
              children: <Widget>[
                MyAppbar(),
                HeaderLogo(),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              /*gradient: LinearGradient(
                colors: [mBackgroundColor, mSecondBackgroundColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),*/
              color: Colors.white,
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
                            'Our Doctors',
                            style: TextStyle(
                              color: mTitleTextColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  FadeAnimation(
                    1.3,
                    DoctorTile(
                      name: 'Dr. Stefeni Albert',
                      specialization: 'Allergy and Immunology',
                      imgUrl: 'assets/images/avatar.png',
                      tap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorsInfo()));
                      },
                    ),
                  ),
                  FadeAnimation(
                    1.4,
                    DoctorTile(
                      name: 'Dr. Shilpa K',
                      specialization: 'Dermatology',
                      imgUrl: 'assets/images/avatar.png',
                      tap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()));
                      },
                    ),
                  ),
                  FadeAnimation(
                    1.5,
                    DoctorTile(
                      name: 'Dr. Hormis Stephen',
                      specialization: 'Anesthesiology',
                      imgUrl: 'assets/images/avatar.png',
                      tap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()));
                      },
                    ),
                  ),
                  FadeAnimation(
                    1.6,
                    DoctorTile(
                      name: 'Dr. Teena Peter',
                      specialization: 'Ayurveda',
                      imgUrl: 'assets/images/avatar.png',
                      tap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()));
                      },
                    ),
                  ),
                  FadeAnimation(
                    1.7,
                    DoctorTile(
                      name: 'Dr. Rutav Kothari',
                      specialization: 'Dental',
                      imgUrl: 'assets/images/avatar.png',
                      tap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()));
                      },
                    ),
                  ),
                  /*  GestureDetector(
                    onTap: () {
                      /*Navigator.push(context,
                MaterialPageRoute(builder: (context) => DoctorsInfo()));*/
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: mBackgroundColor,
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/avatar.png",
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Dr. Stefeni Albert",
                                  style: TextStyle(
                                      color: Color(0xffFC9535), fontSize: 19),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "Heart Speailist",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 9),
                              decoration: BoxDecoration(
                                  color: mButtonColor,
                                  borderRadius: BorderRadius.circular(13)),
                              child: Text(
                                "Call",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )*/
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
