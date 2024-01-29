class TableEstudantes {
  static const tableName = 'estudantes';

  ///[INTEGER] - PK
  static const codigoEstudante = 'codigo_estudante';

  ///[TEXT]
  static const nome = 'nome';

  ///[TEXT]
  static const nomeSemAcento = 'nome_sem_acento';

  ///[INTEGER]
  static const estudanteEspecial = 'estudante_especial';

  ///[INTEGER]
  static const dataMatricula = 'data_matricula';

  ///[INTEGER]
  static const dataNascimento = 'data_nascimento';

  ///[TEXT]
  static const nomeMae = 'nome_mae';

  ///[TEXT]
  static const nomeMaeSemAcento = 'nome_mae_sem_acento';

  ///[TEXT]
  static const nomePai = 'nome_pai';

  ///[TEXT]
  static const nomePaiSemAcento = 'nome_pai_sem_acento';

  ///[INTEGER]
  static const imcEstudante = 'imc_estudante';

  ///[REAL]
  static const frequencia = 'frequencia';

  ///[INTEGER]
  static const faltasAlternadas = 'faltas_alternadas';

  ///[INTEGER]
  static const faltasConsecutivas = 'faltas_consecutivas';

  ///[INTEGER]
  static const eNovo = 'e_novo';

  ///[INTEGER]
  static const sexoEstudante = 'sexo_estudante';

  ///[INTEGER] - FK
  static const pkUsuario = 'pk_usuario';
}
