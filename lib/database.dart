import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}