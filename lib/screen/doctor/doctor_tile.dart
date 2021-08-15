import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';

class DoctorTile extends StatelessWidget {
  final String name;
  final String specialization;
  final String imgUrl;
  final Function tap;

  const DoctorTile({
    Key key,
    this.name,
    this.specialization,
    this.imgUrl,
    this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [mBackgroundColor, mSecondBackgroundColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Row(
            children: <Widget>[
              Image.asset(
                imgUrl,
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
                    name,
                    style: TextStyle(
                      //color: Color(0xffFC9535),
                      color: Colors.orange,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    specialization,
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                decoration: BoxDecoration(
                    color: mButtonColor,
                    borderRadius: BorderRadius.circular(13)),
                child: Text(
                  "Consult",
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
    );
  }
}
