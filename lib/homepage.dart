import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:refresh/data/database.dart';
import 'package:refresh/utils/dialog_box.dart';
import 'package:refresh/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();


  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    }
    else {
      db.loadData();
      super.initState();
    }
  }
  final _controller = TextEditingController();



  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });

    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask () {
    showDialog(
        context: context,
        builder: (context){
          return DailogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: Navigator.of(context).pop,
          );
        },
    );
  }

  void deleteTask (index) {
    setState(() {
      db.toDoList.removeAt(index);

    });
    db.updateDataBase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          title: Text(
            "To Do",
            style: TextStyle(
              color: Colors.deepPurple[600],
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.deepPurpleAccent[100],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),

        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }
        )
    );
  }
}
