import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';
import 'package:url_launcher/url_launcher.dart';

_makingPhoneCall() async {
  const url = 'tel:0917405847907';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class DoctorHeader extends StatelessWidget {
  //const DoctorHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: <Widget>[
          Image.asset("assets/images/avatar.png", height: 140),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width - 222,
              height: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dr. Stefeni Albert",
                    style: TextStyle(fontSize: 25, color: mTitleTextColor),
                  ),
                  Text(
                    "Allergy & Immunology",
                    style: TextStyle(fontSize: 19, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFFECDD),
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          icon: const Icon(Icons.mail_outline_outlined),
                          tooltip: 'Mail',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFFECDD),
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          icon: const Icon(Icons.call),
                          tooltip: 'Call',
                          onPressed: _makingPhoneCall,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFFECDD),
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          icon: const Icon(Icons.video_call),
                          tooltip: 'Video call',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
