import 'package:flutter/material.dart';
import 'package:flutter_medical/screen/Appointment/myAppointment.dart';
import 'package:flutter_medical/screen/HealthRecord/healthMain.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/screen/HealthRecord/my_health_record.dart';
import 'package:flutter_medical/screen/LoginRegister/FadeAnimation.dart';
import 'package:flutter_medical/screen/LoginRegister/login.dart';
import 'package:flutter_medical/screen/reserve/widget/my_appbar.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Your Profile"),
        //color: Colors.amber,
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // MyAppbar(),
          FadeAnimation(
            1,
            Container(
              alignment: Alignment.topCenter,
              height: 270,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/avatar_head.png"),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: <Widget>[
                  MyAppbar(),
                  Text(
                    "My Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mTitleTextColor,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Image.asset(
                    "assets/images/avatar.png",
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Mr.Austin Mcbroom",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mTitleTextColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FadeAnimation(
                    1.2,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyHealthReport();
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                          //borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(Icons.local_hospital_outlined),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "My Health Record",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Colors.blueGrey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //2nd Option
                  FadeAnimation(
                    1.3,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return WelcomeScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                          //borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(Icons.book_online),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Book Consultation",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 92,
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Colors.blueGrey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //3rd Option
                  FadeAnimation(
                    1.4,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyAppointments();
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                          //borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(Icons.article_outlined),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "My Appointment",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 107,
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Colors.blueGrey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //4th Option
                  FadeAnimation(
                    1.5,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                          //borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(Icons.logout),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Log Out",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 185,
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Colors.blueGrey),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
