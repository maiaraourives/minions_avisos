class TableChamada {
  static const tableName = 'chamadas';

  ///[INTEGER] - PK
  static const pkChamada = 'pk_chamada';

  ///[INTEGER]
  static const codigoChamadaWeb = 'codigo_chamada_web';

  ///[TEXT]
  static const horarioSigla = 'horario_sigla';

  ///[INTEGER]
  static const data = 'data';

  ///[TEXT]
  static const status = 'status';

  ///[INTEGER]
  static const horaAula = 'hora_aula';

  ///[INTEGER]
  static const horaChegada = 'hora_chegada';

  ///[INTEGER]
  static const sincronizado = 'sincronizado';

  ///[INTEGER]
  static const hdlCodigo = 'hdl_codigo';

  ///[INTEGER]
  static const hrrCodigo = 'hrr_codigo';

  ///[INTEGER]
  static const cceCodigo = 'cce_codigo';

  ///[INTEGER]
  static const tchCodigo = 'tch_codigo';

  ///[INTEGER]
  static const plcCodigo = 'plc_codigo';

  ///[TEXT]
  static const observacaoJustificativa = 'observacao_justificativa';

  ///[INTEGER] - FK
  static const codigoMotivo = 'codigo_motivo';
}
