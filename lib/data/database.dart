import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  // Use late keyword to initialize later in an async context
  final _myBox = Hive.box('mybox');

  // Initialize the database (async function to open the box)


  // Create initial data if none exists
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
    updateDataBase(); // Save initial data to the database
  }

  // Load data from the database
  void loadData() {
    toDoList = _myBox.get("TODOLIST", defaultValue: []);
  }

  // Update the database with the current list
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}