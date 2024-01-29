class TablePeriodos {
  static const tableName = 'periodos';

  ///[INTEGER] - PK
  static const codigoPeriodoLetivo = 'codigo_periodo_letivo';

  ///[INTEGER] - PK
  static const numeroPeriodoLetivo = 'numero_periodo_letivo';

  ///[TEXT]
  static const descricaoPeriodoLetivo = 'descricao_periodo_letivo';

  ///[INTEGER]
  static const dataInicioPeriodo = 'data_inicio_periodo';

  ///[INTEGER]
  static const dataFinalPeriodo = 'data_final_periodo';

  ///[INTEGER]
  static const aulasDadas = 'aulas_dadas';

  ///[INTEGER]
  static const dataLimiteLancamentoChamada = 'data_limite_lancamento_chamada';

  ///[INTEGER] - FK
  static const codigoComponente = 'codigo_componente';

  ///[INTEGER] - FK
  static const codigoTurmaGrupo = 'codigo_turma_grupo';

  ///[INTEGER] - FK
  static const pkUsuario = 'pk_usuario';

  ///[INTEGER]
  static const diasLetivosTotal = 'dias_letivos_total';

  ///[INTEGER]
  static const diasLetivosDados = 'dias_letivos_dados';

  ///[INTEGER]
  static const aulasDadasTotal = 'aulas_dadas_total';
}
