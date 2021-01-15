import 'package:flutter/material.dart';
import 'package:todolist/components/editor.dart';
import 'package:todolist/models/tarefa.dart';

const _campoAssunto = 'Assunto';
const _campoDesc = 'Descrição';
const _titulo = 'Nova Tarefa';

class Formulario extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTarefaState();
  }
}

class FormularioTarefaState extends State<Formulario> {
  final TextEditingController _controladorCampoAssunto =
      TextEditingController();
  final TextEditingController _controladorCampoDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoAssunto,
              rotulo: _campoAssunto,
            ),
            Editor(
              controlador: _controladorCampoDesc,
              rotulo: _campoDesc,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: Text(
                    'Adicionar',
                    style: (TextStyle(fontSize: 16.0)),
                  ),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () => _criaTarefa(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTarefa(BuildContext context) {
    final String assunto = _controladorCampoAssunto.text;
    final String descricao = _controladorCampoDesc.text;

    if (assunto != null && descricao != null) {
      final tarefaCriada = Tarefa(0, assunto, descricao);
      Navigator.pop(context, tarefaCriada);
    }
  }
}
