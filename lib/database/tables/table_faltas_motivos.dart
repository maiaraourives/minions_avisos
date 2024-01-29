class TableFaltasMotivos {
  static const tableName = 'faltas_motivos';

  ///[INTEGER] - PK
  static const codigoMotivo = 'codigo_motivo';

  ///[TEXT]
  static const descricaoMotivo = 'descricao_motivo';

  ///[TEXT]
  static const descricacaoSemAcento = 'descricao_sem_acento';

  ///[INTEGER] - FK
  static const codigoComponente = 'codigo_componente';

  ///[INTEGER] - FK
  static const codigoTurmaGrupo = 'codigo_turma_grupo';

  ///[INTEGER] - FK
  static const pkUsuario = 'pk_usuario';
}
