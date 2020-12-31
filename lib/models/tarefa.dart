class Tarefa {
  final String assunto;
  final String descricao;
  bool concluida;

  Tarefa(
    this.assunto,
    this.descricao,
    this.concluida
  );

  @override
  String toString() => 'Tarefa(assunto: $assunto, descricao: $descricao)';
}
