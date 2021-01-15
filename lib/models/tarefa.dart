class Tarefa {
  final int id;
  final String assunto;
  final String descricao;

  Tarefa(this.id, this.assunto, this.descricao);

  @override
  String toString() => 'Tarefa(id: $id, assunto: $assunto, descricao: $descricao)';
}
