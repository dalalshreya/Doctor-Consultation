import 'dart:ui';
import "package:flutter/material.dart";
import 'package:flutter_medical/model/appointmentRecords.dart';
import 'package:flutter_medical/screen/Appointment/myAppointment.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/model/task.dart';
import 'package:flutter_medical/screen/HealthRecord/my_health_record.dart';
import 'package:flutter_medical/screen/LoginRegister/FadeAnimation.dart';
import 'package:flutter_medical/screen/reserve/widget/my_appbar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class appointmentPage extends StatefulWidget {
  const appointmentPage({Key key}) : super(key: key);

  @override
  _appointmentPageState createState() => _appointmentPageState();
}

class _appointmentPageState extends State<appointmentPage> {
  Task task = new Task();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String _chosenValue;

  //declaring varaibles to store in appointmentRecords!
  String time;
  String duration;
  String _chosendate;

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _dateController.text = date;
        _chosendate = DateFormat("dd-MM-yyyy").format(picked);
      });
  }

  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Consult Online",
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
                    "Dr. Stefeni Albert",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mTitleTextColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Column(
                            children: [
                              FadeAnimation(
                                1.2,
                                GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      onSaved: (val) {
                                        //date = selectedDate.toString();
                                      },
                                      controller: _dateController,
                                      decoration: InputDecoration(
                                        //labelText: "Date",
                                        hintText: "Date",
                                        icon: Icon(Icons.calendar_today),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return "Please enter a date for your task";
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FadeAnimation(
                                1.3,
                                TextFormField(
                                  controller:
                                      timeinput, //editing controller of this TextField
                                  decoration: InputDecoration(
                                    //labelText: "Date",
                                    hintText: "Enter Time",
                                    icon: Icon(Icons.timer),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueAccent,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    TimeOfDay pickedTime = await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );

                                    if (pickedTime != null) {
                                      print(pickedTime
                                          .format(context)); //output 10:51 PM
                                      DateTime parsedTime = DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString());
                                      //converting to DateTime so that we can further format on different pattern.
                                      print(
                                          parsedTime); //output 1970-01-01 22:53:00.000
                                      String formattedTime =
                                          DateFormat('HH:mm:ss')
                                              .format(parsedTime);
                                      print(formattedTime); //output 14:59:00
                                      //DateFormat() is from intl package, you can format the time on any pattern you need.

                                      setState(() {
                                        timeinput.text =
                                            formattedTime; //set the value of text field.
                                        time = formattedTime;
                                      });
                                    } else {
                                      print("Time is not selected");
                                    }
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Time is not selected";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FadeAnimation(
                                1.4,
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Container(
                                        //width: 10,
                                        height: 79,
                                        padding:
                                            EdgeInsets.fromLTRB(20, 0, 75, 0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.blue,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: DropdownButtonFormField<String>(
                                          value: _chosenValue,
                                          //elevation: 5,
                                          style:
                                              TextStyle(color: Colors.blueGrey),

                                          items: <String>[
                                            '5',
                                            '10',
                                            '15',
                                            '20',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          hint: Text(
                                            "Duration",
                                            style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 16,
                                              //fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          onChanged: (String value) {
                                            setState(() {
                                              _chosenValue = value;
                                              duration = _chosenValue;
                                            });
                                          },
                                          validator: (value) => value == null
                                              ? "Select duration!"
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              FadeAnimation(
                                1.5,
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text("Present Health Condition",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FadeAnimation(
                                1.5,
                                TextFormField(
                                  onSaved: (val) => task.name = val,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    //labelText: 'Task Name',
                                    hintText: "eg. Headache since last 2 days",
                                    icon: Icon(Icons.healing),
                                    hintStyle: TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueAccent,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              FadeAnimation(
                                1.6,
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
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
                                      child: Text(
                                          "Do you have any health record to upload?",
                                          //textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: mTitleTextColor,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FadeAnimation(
                                1.7,
                                FlatButton(
                                  child: Text("Submit"),
                                  textColor: Colors.white,
                                  color: Colors.blueAccent,
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      Provider.of<AppointmentRecords>(context,
                                              listen: false)
                                          .addAppointments("Dr. Stefeni Albert",
                                              _chosendate, time, duration);
                                      showAlertDialog(context);
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
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

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context)..pop()..pop()..pop()..pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Simple Alert"),
    content: Text("Appointment Booked"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
