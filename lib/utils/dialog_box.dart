import 'package:flutter/material.dart';
import 'package:refresh/utils/my_button.dart';

class DailogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DailogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.deepPurpleAccent[100],
        content: Container (
          height: 120,
          child:Column (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Add a new Task"
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyButton(text: "Save", onPressed: onSave),
                    const SizedBox(width: 8,),
                    MyButton(text: "Cancel", onPressed: onCancel),

                  ],),
              ]),
        )
    );
  }
}