import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoTile({super.key, required this.taskName,required this.taskCompleted,required this.onChanged, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right:8.0,top:8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor:Colors.red,
              borderRadius: BorderRadius.circular(10),
            )
          ]

        ),
        child: Container(
          padding:EdgeInsets.all(24),
        child: Row(
    children: [
        Checkbox(value: taskCompleted, onChanged: onChanged,activeColor:Colors.pink[800]),
    Text(taskName,style:TextStyle(decoration:
          taskCompleted
              ?TextDecoration.lineThrough
              :TextDecoration.none)),
        ],
        ),
        decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(15)),
    ),
      ),
    );
  }
}
