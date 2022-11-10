// import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

// final typecont = TextEditingController();

class ToDoDataBase {
  List toDoList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      // ["Make Tutorial", false],
      // ["Do Exercise", false]
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
