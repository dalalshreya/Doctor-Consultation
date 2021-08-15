import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/screen/Appointment/appointment.dart';
import 'package:flutter_medical/screen/LoginRegister/FadeAnimation.dart';
import 'package:flutter_medical/screen/doctor/doctor_header_info.dart';
import 'package:flutter_medical/screen/doctor/doctor_location.dart';
import 'package:flutter_medical/screen/reserve/reserve_screen.dart';
import 'package:flutter_medical/screen/reserve/widget/my_appbar.dart';
import 'package:flutter_medical/widget/my_header.dart';
//import 'package:url_launcher/url_launcher.dart';

class DoctorsInfo extends StatefulWidget {
  @override
  _DoctorsInfoState createState() => _DoctorsInfoState();
}

class _DoctorsInfoState extends State<DoctorsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FadeAnimation(
            1,
            MyHeader(
              height: 300,
              imageUrl: 'assets/images/avatar_head.png',
              child: Column(
                children: <Widget>[
                  MyAppbar(),
                  /* Doctor Header*/
                  DoctorHeader(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "About",
                      style: TextStyle(
                          fontSize: 24,
                          color: mTitleTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FadeAnimation(
                      1.2,
                      Text(
                        "Dr. Stefeni Albert is a immunologist in Nashville & affiliated with multiple hospitals in the  area.He received his medical degree from Duke University School of Medicine and has been in practice for more than 20 years. ",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //Image.asset("assets/mappin.png"),
                                Icon(Icons.location_on),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Address",
                                      style: TextStyle(
                                          color:
                                              Colors.black87.withOpacity(0.7),
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    FadeAnimation(
                                      1.3,
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              268,
                                          child: Text(
                                            "House # 2, Road # 5, Green Road Dhanmondi, Dhaka, Bangladesh",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                // Image.asset("assets/clock.png"),
                                Icon(Icons.access_time_filled_outlined),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Daily Practict",
                                      style: TextStyle(
                                          color:
                                              Colors.black87.withOpacity(0.7),
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    FadeAnimation(
                                      1.4,
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                268,
                                        child: Text(
                                          '''Monday - Friday
                                              Open till 7 Pm''',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        /*Image.asset(
                          "assets/map.png",
                          width: 180,
                          
                        )*/
                        FadeAnimation(
                          1.4,
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return countryMap();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.topCenter,
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr2qjO6i_HBeinHyO24oCm6PP2qI9WAQusdA&usqp=CAU"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Activity",
                      style: TextStyle(
                          fontSize: 24,
                          color: mTitleTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    FadeAnimation(
                      1.5,
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ReserveScreen();
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                    vertical: 24, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Color(0xffFBB97C),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Color(0xffFCCA9B),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      //child: Image.asset("assets/list.png"),
                                      child: Icon(
                                        Icons.calendar_today,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          107,
                                      child: Text(
                                        "List Of"
                                        "\nSchedule",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return appointmentPage();
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 24, horizontal: 16),
                                decoration: BoxDecoration(
                                    color: Color(0xffA5A5A5),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Color(0xffBBBBBB),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      //child: Image.asset("assets/list.png"),
                                      child: Icon(Icons.post_add),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          107,
                                      child: Text(
                                        "Request Appointment",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath,
          width: 20,
        ),
      ),
    );
  }
}
