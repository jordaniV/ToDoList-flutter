//criar o banco de dados
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/models/tarefa.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'todolist.db');
    return openDatabase(path, onCreate: (db, versao) {
      db.execute('CREATE TABLE atividades(id INTEGER PRIMARY KEY, assunto TEXT, descricao TEXT)');
    }, version: 1);
  });
}

Future<int> save(Tarefa tarefa) {
  return createDatabase().then((db) {
    final Map<String, dynamic> tarefaMap = Map();
    tarefaMap['id'] = tarefa.id;
    tarefaMap['assunto'] = tarefa.assunto;
    tarefaMap['descricao'] = tarefa.descricao;
    return db.insert('atividades', tarefaMap);
  });
}

Future<List<Tarefa>> findAll() {
  return createDatabase().then((db) {
    return db.query('atividades').then((maps) {
      final List<Tarefa> tarefas = List();
      for (Map<String, dynamic> map in maps) {
        final Tarefa tarefa = Tarefa(
          map['id'],
          map['assunto'],
          map['descricao'],
        );
        tarefas.add(tarefa);
      }
      return tarefas;
    });
  });
}
