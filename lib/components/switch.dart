import 'package:flutter/material.dart';

class SwitchConcluida extends StatefulWidget {

  bool concluida = false;

  SwitchConcluida({
    this.concluida
  });

  @override
  _SwitchState createState() => _SwitchState();
}

class _SwitchState extends State<SwitchConcluida> {

  final String _titulo = 'Concluida?';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
      child: SwitchListTile(
        title: Text(_titulo),
        value: widget.concluida,
        onChanged: (bool value) {
          setState(() {
            widget.concluida = value;
          });
        },
        activeColor: Colors.green,
      ),
    );
  }
}
