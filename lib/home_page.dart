import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/database.dart';
import 'package:to_do_list_app/dialog_box.dart';
import 'package:to_do_list_app/todo_tile.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }
  final _controller = TextEditingController();

 void checkBoxChanged(bool? value, int index){
  setState(() {
    db.toDoList[index][1]=!db.toDoList[index][1];
  });
  db.updateDataBase();
 }
 void saveNewTask(){
   setState(() {
     db.toDoList.add([_controller.text,false]);
     _controller.clear();
   });
   Navigator.of(context).pop();
   db.updateDataBase();

 }
 void createNewTask(){
   showDialog(context: context, builder: (context)
   {
     return DialogBox(
       controller: _controller,
       onSave: saveNewTask,
       onCancel: () => Navigator.of(context).pop(),
     );
   }
   );
 }
 void deleteTask(int index){
   setState(() {
     db.toDoList.removeAt(index);
     db.updateDataBase();
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.pink[200],
      appBar: AppBar(
        title:Center(child:(Text('TO DO', style: TextStyle(color: Colors.black,fontSize: 25)))
        ),
            elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
          child:Icon(Icons.add),
      ),
      body: ListView.builder(
      itemCount: db.toDoList.length,
        itemBuilder: (context,index){
        return ToDoTile(taskName: db.toDoList[index][0],
          taskCompleted: db.toDoList[index][1],
          onChanged:(value) => checkBoxChanged(value, index),
          deleteFunction:(context)=>deleteTask(index),);
        }
      ),

    );
  }
}
