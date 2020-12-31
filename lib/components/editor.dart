import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;

  Editor({
    this.controlador,
    this.rotulo,
  });

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 16.0,
        ),
        decoration: InputDecoration(
          labelText: rotulo,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
