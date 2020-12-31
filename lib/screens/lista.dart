import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/screens/formulario.dart';

final String _titulo = 'Minhas Tarefas';
final String _tooltipConfig = 'Configurações';
final String _tooltipFiltro = 'Filtrar';

class ListaTarefas extends StatefulWidget {
  final List<Tarefa> _tarefas = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTarefasState();
  }
}

class ListaTarefasState extends State<ListaTarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(_titulo),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt, color: Colors.white),
            tooltip: _tooltipFiltro,
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            tooltip: _tooltipConfig,
            onPressed: (null),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget._tarefas.length,
        itemBuilder: (context, indice) {
          final tarefa = widget._tarefas[indice];
          return ItemTarefas(tarefa);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Formulario();
          })).then(
            (tarefaRecebida) => _atualiza(tarefaRecebida),
          );
        },
      ),
    );
  }

  void _atualiza(Tarefa tarefaRecebida) {
    if (tarefaRecebida != null) {
      setState(() {
        widget._tarefas.add(tarefaRecebida);
      });
    }
  }
}

//widget para cada tarefa da lista.
class ItemTarefas extends StatefulWidget {
  final Tarefa _tarefa;
  ItemTarefas(this._tarefa);

  @override
  _ItemTarefasState createState() => _ItemTarefasState();
}

class _ItemTarefasState extends State<ItemTarefas> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(widget._tarefa.assunto),
            subtitle: Text(widget._tarefa.descricao),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
          ),
        ],
      ),
    );
  }
}
