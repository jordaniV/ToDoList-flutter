import 'package:flutter/material.dart';
import 'package:todolist/screens/lista.dart';

void main() => runApp(ToDoListApp());

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Colors.white),
        ),
      ),
      home: ListaTarefas(),
    );
  }
}