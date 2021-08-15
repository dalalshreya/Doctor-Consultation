import "package:flutter/material.dart";
import 'package:flutter_medical/screen/HealthRecord/my_health_record.dart';
import 'package:flutter_medical/screen/HealthRecord/select_record_type.dart';
import 'package:flutter_medical/screen/HealthRecord/viewReportImage.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/model/recordType.dart';
import 'package:flutter_medical/screen/profile/profile.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HealthPageMain extends StatelessWidget {
  int count = 0;
  HealthPageMain({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (count == 1) {
      return MyProfile();
    } else {
      count = 1;
      return ChangeNotifierProvider<RecordType>(
        create: (context) =>
            RecordType(name: " ", select: false, icon: Icon(null), path: " "),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: mBackgroundColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/MyHealthReport',
          routes: {
            '/MyHealthReport': (context) => MyHealthReport(),
            '/SelectRecordType': (context) => SelectRecordType(),
            '/ViewReportImage': (context) => ReportImage(),
            '/Profile': (context) => MyProfile(),
          },
          //home: MyHealthReport(),
        ),
      );
    }
  }
}
