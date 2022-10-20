import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  // final bool taskcompleted;
  Function(BuildContext)? deleteFunction;
  ToDoTile(
      {Key? key,
      required this.taskName,
      // required this.taskcompleted,
      required this.deleteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete_rounded,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
            )
          ]
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // Checkbox(value: value, onChanged: onChanged)
              Text(
                taskName,
                // style: TextStyle(
                //   decoration: taskcompleted.
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
