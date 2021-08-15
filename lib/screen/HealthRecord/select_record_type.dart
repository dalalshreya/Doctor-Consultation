import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical/model/recordType.dart';
import 'package:flutter_medical/screen/HealthRecord/my_health_record.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'healthMain.dart';

class SelectRecordType extends StatefulWidget {
  const SelectRecordType({Key key}) : super(key: key);

  @override
  _SelectRecordTypeState createState() => _SelectRecordTypeState();
}

class _SelectRecordTypeState extends State<SelectRecordType> {
  Icon icon = new Icon(null);
  XFile _image;
  int listIndex = 0;
  bool _flag = false;

  List<RecordType> recordType = [
    RecordType(name: 'ECG', select: false, icon: Icon(null), path: " "),
    RecordType(
        name: 'Blood Pressure', select: false, icon: Icon(null), path: " "),
    RecordType(name: 'Temperature', select: false, icon: Icon(null), path: " "),
    RecordType(name: 'SPO2', select: false, icon: Icon(null), path: " "),
    RecordType(name: 'Weight', select: false, icon: Icon(null), path: " "),
    RecordType(name: 'Height', select: false, icon: Icon(null), path: " "),
    RecordType(name: 'HeartBeat', select: false, icon: Icon(null), path: " "),
    RecordType(name: 'X-Ray', select: false, icon: Icon(null), path: " "),
    RecordType(name: 'Any Other', select: false, icon: Icon(null), path: " "),
    RecordType(
        name: 'Prescription', select: false, icon: Icon(null), path: " "),
  ];

  Future getImage(bool isCamera) async {
    XFile image;
    if (isCamera) {
      image = (await ImagePicker().pickImage(
          source: ImageSource.camera,
          preferredCameraDevice: CameraDevice.rear));
    } else {
      image = (await ImagePicker().pickImage(source: ImageSource.gallery));
    }
    setState(() {
      _image = image;
      recordType[listIndex].path = _image.path;
    });
  }

  Future _addRecordType() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Color(0xFFFDFCFF),
          title: Center(
            child: Text(
              'Select Record Type',
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFF25257E),
              ),
            ),
          ),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () async {
                await getImage(true);
                Provider.of<RecordType>(context, listen: false).addData(
                    recordType[listIndex].name, recordType[listIndex].path);

                Navigator.of(context)..pop()..pop();

                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (BuildContext context) {
                //   return MyHealthReport();
                // }));
              },
              child: Center(
                child: Text(
                  'Camera',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF25257E),
                  ),
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () async {
                await getImage(false);
                Provider.of<RecordType>(context, listen: false).addData(
                    recordType[listIndex].name, recordType[listIndex].path);

                Navigator.of(context)..pop()..pop();
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (BuildContext context) {
                //   return MyHealthReport();
                // }));
              },
              child: Center(
                child: Text(
                  'Gallery',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF25257E),
                  ),
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context)..pop()..pop();
              },
              child: Center(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF25257E),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showToastError() {
    Fluttertoast.showToast(
      msg: 'Select Record Type!',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFCFF),
      appBar: AppBar(
        title: Text(
          'Select Record Type',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Color(0xFF25257E),
          ),
        ),
        backgroundColor: Color(0xFFFDFCFF),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF25257E)),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              if (_flag == true) {
                await _addRecordType();
              } else {
                _showToastError();
              }
            },
            child: Text(
              'submit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Color(0xFF25257E),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
              child: Card(
                elevation: 5,
                color: Color(0xFFBCCBF3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  tileColor: Color(0xFFBCCBF3),
                  selectedTileColor: Color(0xFFFDFCFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onTap: () {
                    setState(() {
                      recordType.forEach((element) {
                        element.icon = Icon(null);
                        recordType[index].select = false;
                      });
                      recordType[index].select = true;
                      if (recordType[index].select == true) {
                        recordType[index].icon = Icon(Icons.done);
                        _flag = true;
                        listIndex = index;
                      }
                    });
                  },
                  title: Text(
                    recordType[index].name,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF25257E),
                    ),
                  ),
                  trailing: recordType[index].icon,
                  selected: recordType[index].select,
                ),
              ),
            );
          },
          itemCount: recordType.length,
        ),
      ),
    );
  }
}
