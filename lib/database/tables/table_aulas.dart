class TableAulas {
  static const tableName = 'aulas';

  ///[INTEGER] - PK
  static const pkAula = 'pk_aula';

  ///[TEXT]
  static const turno = 'turno';

  ///[TEXT]
  static const periodo = 'periodo';

  ///[INTEGER]
  static const data = 'data';

  ///[INTEGER] - FK
  static const codigoComponente = 'codigo_componente';
  
  ///[INTEGER] - FK
  static const codigoTurmaGrupo = 'codigo_turma_grupo';

  ///[INTEGER] - FK
  static const oruCodigo = 'oru_codigo';

  ///[INTEGER] - FK
  static const pkUsuario = 'pk_usuario';
}
