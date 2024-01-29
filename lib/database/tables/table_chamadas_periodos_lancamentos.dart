class TableChamadasPeriodosLancamentos {
  static const tableName = 'chamadas_periodos_lancamentos';

  ///[INTEGER] - PK
  static const pkPeriodoChamada = 'pk_periodo_chamada';

  ///[INTEGER]
  static const horarioCodigo = 'horario_codigo';

  ///[INTEGER]
  static const tphCodigo = 'tph_codigo';

  ///[INTEGER]
  static const horarioInicio = 'horario_inicio';

  ///[INTEGER]
  static const trocaHorarioCodigo = 'troca_horario_codigo';

  ///[INTEGER]
  static const hdlCodigo = 'hdl_codigo';

  ///[TEXT]
  static const horarioPeriodo = 'horario_periodo';

  ///[INTEGER] - FK
  static const pkChamadaDataLancamento = 'pk_chamada_data_lancamento';
}
