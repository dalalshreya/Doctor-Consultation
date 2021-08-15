import 'package:flutter/foundation.dart';

class AppointmentRecords extends ChangeNotifier {
  String name;
  String date;
  String time;
  String duration;
  static List<AppointmentRecords> myAppointments = [];
  AppointmentRecords({this.name, this.date, this.time, this.duration});

  void addAppointments(String name, String date, String time, String duration) {
    myAppointments.add(AppointmentRecords(
        name: name, date: date, time: time, duration: duration));
    notifyListeners();
  }

  List<AppointmentRecords> get appointments {
    return myAppointments;
  }
}
