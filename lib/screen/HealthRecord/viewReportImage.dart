import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_medical/model/recordType.dart';
import 'package:provider/provider.dart';
//import 'package:google_fonts/google_fonts.dart';

class ReportImage extends StatefulWidget {
  const ReportImage({Key key}) : super(key: key);

  @override
  _ReportImageState createState() => _ReportImageState();
}

class _ReportImageState extends State<ReportImage> {
  @override
  Widget build(BuildContext context) {
    String path = Provider.of<RecordType>(context).getImage;
    String recordName = Provider.of<RecordType>(context).getRecordName;

    return Scaffold(
      backgroundColor: Color(0xFFFDFCFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          recordName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Color(0xFF25257E),
          ),
        ),
        backgroundColor: Color(0xFFFDFCFF),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Image.file(
          File(path),
          fit: BoxFit.fill,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
