import 'package:flutter/material.dart';
import 'package:flutter_medical/model/appointmentRecords.dart';
import 'package:provider/provider.dart';

class MyAppointments extends StatefulWidget {
  MyAppointments({Key key}) : super(key: key);
  @override
  _MyAppointmentsState createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  int counter;
  List<AppointmentRecords> appointmentLists = [];
  @override
  Widget build(BuildContext context) {
    appointmentLists = Provider.of<AppointmentRecords>(context).appointments;
    print(appointmentLists);

    return Scaffold(
      backgroundColor: Color(0xFFFDFCFF),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: IconThemeData(color: Color(0xFF25257E)),
        title: Text(
          'My Appointments',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Color(0xFF25257E),
          ),
        ),
        backgroundColor: Color(0xFFFDFCFF),
        centerTitle: true,
      ),
      body: SizedBox(
        height: double.infinity,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 9.0),
              child: SizedBox(
                height: 100,
                child: Card(
                  borderOnForeground: true,
                  color: Color(0xFFBCCBF3),
                  shadowColor: Color(0xFF25257E),
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                    child: Text(
                      '${appointmentLists[index].name}'
                      '\nDate: ${appointmentLists[index].date}'
                      '\nTime: ${appointmentLists[index].time}'
                      '\nDuration: ${appointmentLists[index].duration} mins',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25257E),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: appointmentLists.length,
        ),
      ),
    );
  }
}
