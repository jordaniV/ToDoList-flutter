import 'package:flutter/material.dart';
import 'package:todolist/screens/dashboard.dart';

import 'database/app_database.dart';
import 'models/tarefa.dart';

void main() {
  runApp(ToDoListApp());
  save(Tarefa(3, 'Assunto', 'Descricao')).then((id) {
    findAll().then((tarefas) => debugPrint(tarefas.toString()));
  });
}

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(8, 104, 128, 1.0),
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Colors.white),
        ),
      ),
      home: Dashboard(),
    );
  }
}
