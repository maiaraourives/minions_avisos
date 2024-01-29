class TableEstudantesHasNotas {
  static const tableName = 'estudantes_has_notas';

  ///[INTEGER] - FK
  static const codigoEstudante = 'codigo_estudante';

  ///[INTEGER] - FK
  static const codigoNotaAvaliacao = 'codigo_nota_avalicao';

  ///[INTEGER] - Fk
  static const codigoComponente = 'codigo_componente';

  ///[INTEGER] - Fk
  static const codigoTurmaGrupo = 'codigo_turma_grupo';

  ///[INTEGER] - FK
  static const pkUsuario = 'pk_usuario';
}
