import 'package:flutter/cupertino.dart';

class RecordType extends ChangeNotifier {
  String name;
  bool select;
  Icon icon;
  String path;
  static List<String> recordtype = [];
  static List<String> imagetype = [];

  //using this data members in viewReportImage!
  String displayRecordName = " ";
  String displayImagePath = " ";

  RecordType({this.name, this.select, this.icon, this.path});

  void addData(String name, String path) {
    recordtype.add(name);
    imagetype.add(path);
    notifyListeners();
  }

  List<String> get recordNameList {
    return recordtype;
  }

  List<String> get imageList {
    return imagetype;
  }

  void addImagePathandName(String name, String imagePath) {
    this.displayImagePath = imagePath;
    this.displayRecordName = name;
    notifyListeners();
  }

  String get getImage {
    return displayImagePath;
  }

  String get getRecordName {
    return displayRecordName;
  }
}
