import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction

  });

  @override
  Widget build(BuildContext context) {
    return Padding( padding: EdgeInsets.only(right: 25, top: 25, left: 25),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children:[
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(12),
                backgroundColor: Colors.red.shade300,
            )]
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding( padding: EdgeInsets.all(24),
              child: Row(children:[
        
        
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
        
        
                Text(
                  taskName,
                  style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ]),
          ),
        ),
      ),
    );
  }
}
