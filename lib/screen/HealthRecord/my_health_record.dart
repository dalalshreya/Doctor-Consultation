import 'package:flutter/material.dart';
import 'package:flutter_medical/model/recordType.dart';
import 'package:flutter_medical/screen/HealthRecord/healthMain.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyHealthReport extends StatefulWidget {
  const MyHealthReport({Key key}) : super(key: key);

  @override
  _MyHealthReportState createState() => _MyHealthReportState();
}

class _MyHealthReportState extends State<MyHealthReport> {
  // ignore: non_constant_identifier_names
  List<String> record_type = [];
  // ignore: non_constant_identifier_names
  List<String> image_path = [];

  int counter = 0;

  var today = DateFormat("dd-MM-yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    record_type = Provider.of<RecordType>(context).recordNameList;
    image_path = Provider.of<RecordType>(context).imageList;

    print(record_type);
    //print(image_path);
    if (record_type.length > 0) {
      return Scaffold(
        backgroundColor: Color(0xFFFDFCFF),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF25257E)),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text(
            'My Health Report',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Color(0xFF25257E),
            ),
          ),
          backgroundColor: Color(0xFFFDFCFF),
          centerTitle: true,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await Navigator.pushNamed(context, '/SelectRecordType');
                counter++;
              },
              icon: Icon(
                Icons.add,
                color: Color(0xFF25257E),
              ),
              color: Color(0xFFFDFCFF),
              label: Text(''),
            ),
          ],
        ),
        body: SizedBox(
          height: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            //itemExtent: 550,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 9.0),
                child: Card(
                  elevation: 15,
                  semanticContainer: true,
                  color: Color(0xFFBCCBF3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    tileColor: Color(0xFFBCCBF3),
                    onTap: () {},
                    leading: Text(
                      'Record Type: ${record_type[index]}'
                      '\nName: Shreya Dalal'
                      '\nCreated On: $today',
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25257E),
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Provider.of<RecordType>(context, listen: false)
                            .addImagePathandName(
                                record_type[index], image_path[index]);
                        Navigator.pushNamed(context, '/ViewReportImage');
                      },
                      child: Icon(Icons.arrow_forward_ios,
                          color: Color(0xFFBCCBF3)),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Color(0xFFFDFCFF),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: record_type.length,
          ),
        ),
      );
    } else {
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
            'My Health Report',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Color(0xFF25257E),
            ),
          ),
          backgroundColor: Color(0xFFFDFCFF),
          centerTitle: true,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await Navigator.pushNamed(context, '/SelectRecordType');
                counter++;
              },
              icon: Icon(
                Icons.add,
                color: Color(0xFF25257E),
              ),
              color: Color(0xFFFDFCFF),
              label: Text(''),
            ),
          ],
        ),
      );
    }
  }
}
