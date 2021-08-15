import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/model/appointmentRecords.dart';
import 'package:flutter_medical/model/recordType.dart';
import 'package:flutter_medical/screen/Appointment/appointment.dart';
import 'package:flutter_medical/screen/HealthRecord/healthMain.dart';
import 'package:flutter_medical/screen/HealthRecord/my_health_record.dart';
import 'package:flutter_medical/screen/HealthRecord/select_record_type.dart';
import 'package:flutter_medical/screen/HealthRecord/viewReportImage.dart';
import 'package:flutter_medical/screen/LoginRegister/login.dart';
import 'package:flutter_medical/screen/profile/profile.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RecordType>(
          create: (context) =>
              RecordType(name: " ", select: false, icon: Icon(null), path: " "),
        ),
        ChangeNotifierProvider<AppointmentRecords>(
          create: (context) => AppointmentRecords(
              name: " ", date: " ", time: " ", duration: " "),
        )
      ],
      child: MaterialApp(
        title: 'Medical',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: mBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: StartupScreen(),
        home: LoginPage(),
        routes: {
          '/MyHealthReport': (context) => MyHealthReport(),
          '/SelectRecordType': (context) => SelectRecordType(),
          '/ViewReportImage': (context) => ReportImage(),
          '/Profile': (context) => MyProfile(),
          '/HealthMain': (context) => HealthPageMain(),
          '/WelcomePage': (context) => WelcomeScreen(),
          '/Appointment': (context) => appointmentPage(),
        },
      ),
    );
  }
}
