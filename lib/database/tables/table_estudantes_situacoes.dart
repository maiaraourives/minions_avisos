class TableEstudantesSituacoes {
  static const tableName = 'estudantes_situacoes';

  ///[INTEGER] - PK
  static const pkSituacao = 'pk_situacao';

  ///[INTEGER]
  static const cceCodigo = 'cce_codigo';

  ///[INTEGER]
  static const dataInicial = 'data_inicial';

  ///[INTEGER]
  static const dataFinal = 'data_final';

  ///[INTEGER] - FK
  static const codigoEstudante = 'codigo_estudante';

  ///[INTEGER] - FK
  static const codigoTurmaGrupo = 'codigo_turma_grupo';

  ///[INTEGER] - FK
  static const codigoComponente = 'codigo_componente';

  ///[TEXT]
  static const descricaoSituacao = 'descricao_situacao';

  ///[TEXT]
  static const tipoSituacao = 'tipo_situacao';

  ///[INTEGER] - FK
  static const pkUsuario = 'pk_usuario';
}
