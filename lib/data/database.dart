// import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

// final typecont = TextEditingController();

class GemDataBase {
  // ignore: non_constant_identifier_names
  List GemList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    GemList = [
      // ["Make Tutorial", false],
      // ["Do Exercise", false]
    ];
  }

  void loadData() {
    GemList = _myBox.get("GemLIST");
  }

  void updateDataBase() {
    _myBox.put("GemLIST", GemList);
  }
}
