import 'tables/table_agendas.dart';
import 'tables/table_agendas_atividades.dart';
import 'tables/table_agendas_has_atividades.dart';
import 'tables/table_aulas.dart';
import 'tables/table_chamada_data_lancamento.dart';
import 'tables/table_chamadas.dart';
import 'tables/table_chamadas_periodos_lancamentos.dart';
import 'tables/table_configuracoes.dart';
import 'tables/table_escolas.dart';
import 'tables/table_estudantes.dart';
import 'tables/table_estudantes_has_chamadas.dart';
import 'tables/table_estudantes_has_notas.dart';
import 'tables/table_estudantes_has_turmas.dart';
import 'tables/table_estudantes_situacoes.dart';
import 'tables/table_faltas_motivos.dart';
import 'tables/table_funcionalidades.dart';
import 'tables/table_notas.dart';
import 'tables/table_periodos.dart';
import 'tables/table_turmas.dart';
import 'tables/table_turmas_has_chamadas_data_lancamento.dart';
import 'tables/table_turmas_has_funcionalidades.dart';
import 'tables/table_usuarios.dart';

class DBCreateTables {
  static const usuarios = 'CREATE TABLE ${TableUsuarios.tableName} ('
      '${TableUsuarios.pkUsuario} INTEGER PRIMARY KEY, '
      '${TableUsuarios.codigoUsuario} INTEGER NOT NULL UNIQUE, '
      '${TableUsuarios.usuario} TEXT NOT NULL UNIQUE, '
      '${TableUsuarios.dataLogin} INTEGER NOT NULL, '
      '${TableUsuarios.nome} TEXT NULL, '
      '${TableUsuarios.email} TEXT NULL, '
      '${TableUsuarios.dataNascimento} INTEGER NULL, '
      '${TableUsuarios.celular} TEXT NULL, '
      '${TableUsuarios.cep} TEXT NULL, '
      '${TableUsuarios.cidadeDescricao} TEXT NULL, '
      '${TableUsuarios.uf} TEXT NULL, '
      '${TableUsuarios.endereco} TEXT NULL, '
      '${TableUsuarios.bairro} TEXT NULL, '
      '${TableUsuarios.complemento} TEXT NULL, '
      '${TableUsuarios.sexoUsuario} INTEGER NULL, '
      '${TableUsuarios.numeroCasa} TEXT NULL, '
      '${TableUsuarios.urlServidor} TEXT NOT NULL, '
      '${TableUsuarios.municipio} TEXT NOT NULL, '
      '${TableUsuarios.municipioCodigo} INTEGER NOT NULL, '
      '${TableUsuarios.cpf} TEXT NULL '
      ');';

  static const configuracoes = 'CREATE TABLE ${TableConfiguracoes.tableName} ('
      '${TableConfiguracoes.pkConfiguracao} INTEGER PRIMARY KEY, '
      '${TableConfiguracoes.biometria} INTEGER NOT NULL DEFAULT 0, '
      '${TableConfiguracoes.synkedData} INTEGER NOT NULL DEFAULT 0, '
      '${TableConfiguracoes.textFactor} REAL NOT NULL DEFAULT 1, '
      '${TableConfiguracoes.aceitouPermissoes} INTEGER NOT NULL DEFAULT 0, '
      '${TableConfiguracoes.darkTheme} INTEGER NOT NULL DEFAULT 0, '
      '${TableConfiguracoes.syncOnWifi} INTEGER NOT NULL DEFAULT 0, '
      '${TableConfiguracoes.imageOnWifi} INTEGER NOT NULL DEFAULT 0, '
      '${TableConfiguracoes.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}) '
      ');';

  static const escolas = 'CREATE TABLE ${TableEscolas.tableName} ('
      '${TableEscolas.oruCodigo} INTEGER PRIMARY KEY, '
      '${TableEscolas.descricao} TEXT NOT NULL, '
      '${TableEscolas.descricaoSemAcento} TEXT NOT NULL, '
      '${TableEscolas.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}) '
      ');';

  static const agendas = 'CREATE TABLE ${TableAgendas.tableName} ('
      '${TableAgendas.pkAgenda} INTEGER PRIMARY KEY, '
      '${TableAgendas.data} INTEGER NOT NULL, '
      '${TableAgendas.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}) '
      ');';

  static const agendasAtividades = 'CREATE TABLE ${TableAgendasAtividades.tableName} ('
      '${TableAgendasAtividades.pkAgendaAtividade} INTEGER PRIMARY KEY, '
      '${TableAgendasAtividades.descricao} TEXT NOT NULL, '
      '${TableAgendasAtividades.descricaoSemAcento} TEXT NOT NULL, '
      '${TableAgendasAtividades.diaLetivo} INTEGER NOT NULL, '
      '${TableAgendasAtividades.formacaoPedagogica} INTEGER NOT NULL, '
      '${TableAgendasAtividades.oruCodigo} INTEGER NOT NULL REFERENCES ${TableEscolas.tableName} (${TableEscolas.oruCodigo}) '
      ');';

  static const agendasHasAtividades = 'CREATE TABLE ${TableAgendasHasAtividades.tableName} ('
      '${TableAgendasHasAtividades.pkAgenda} INTEGER NOT NULL REFERENCES ${TableAgendas.tableName} (${TableAgendas.pkAgenda}), '
      '${TableAgendasHasAtividades.pkAgendaAtividade} INTEGER NOT NULL REFERENCES ${TableAgendasAtividades.tableName} (${TableAgendasAtividades.pkAgendaAtividade}), '
      'PRIMARY KEY (${TableAgendasHasAtividades.pkAgenda}, ${TableAgendasHasAtividades.pkAgendaAtividade}) '
      ');';

  static const chamadas = 'CREATE TABLE ${TableChamada.tableName} ('
      '${TableChamada.pkChamada} INTEGER PRIMARY KEY, '
      '${TableChamada.codigoChamadaWeb} INTEGER NULL, '
      '${TableChamada.horarioSigla} TEXT NOT NULL, '
      '${TableChamada.data} INTEGER NOT NULL, '
      '${TableChamada.status} INTEGER NOT NULL, '
      '${TableChamada.horaAula} INTEGER NULL, '
      '${TableChamada.horaChegada} INTEGER NULL, '
      '${TableChamada.sincronizado} INTEGER NOT NULL DEFAULT 0, '
      '${TableChamada.hdlCodigo} INTEGER NULL, '
      '${TableChamada.hrrCodigo} INTEGER NULL, '
      '${TableChamada.cceCodigo} INTEGER NULL, '
      '${TableChamada.observacaoJustificativa} TEXT NULL, '
      '${TableChamada.codigoMotivo} INTEGER NULL REFERENCES ${TableFaltasMotivos.tableName} (${TableFaltasMotivos.codigoMotivo}), '
      '${TableChamada.tchCodigo} INTEGER NULL, '
      '${TableChamada.plcCodigo} INTEGER NULL '
      ');';

  static const notas = 'CREATE TABLE ${TableNotas.tableName} ('
      '${TableNotas.codigoNotaAvalicao} INTEGER PRIMARY KEY, '
      '${TableNotas.codigoNotaAvalicaoParcial} INTEGER NOT NULL, '
      '${TableNotas.codigoTurmaGrupo} INTEGER NOT NULL, '
      '${TableNotas.nota} REAL NOT NULL, '
      '${TableNotas.peso} REAL NOT NULL, '
      '${TableNotas.pesoCalculo} REAL NOT NULL, '
      '${TableNotas.numeroPeriodoLetivo} INTEGER NOT NULL '
      ');';

  static const estudantes = 'CREATE TABLE ${TableEstudantes.tableName} ('
      '${TableEstudantes.codigoEstudante} INTEGER PRIMARY KEY, '
      '${TableEstudantes.dataMatricula} INTEGER NOT NULL, '
      '${TableEstudantes.dataNascimento} INTEGER NOT NULL, '
      '${TableEstudantes.eNovo} INTEGER NOT NULL, '
      '${TableEstudantes.estudanteEspecial} INTEGER NOT NULL, '
      '${TableEstudantes.faltasAlternadas} INTEGER NULL, '
      '${TableEstudantes.faltasConsecutivas} INTEGER NULL, '
      '${TableEstudantes.frequencia} REAL NULL, '
      '${TableEstudantes.imcEstudante} REAL NULL, '
      '${TableEstudantes.nome} TEXT NOT NULL, '
      '${TableEstudantes.nomeMae} TEXT NULL, '
      '${TableEstudantes.nomeMaeSemAcento} TEXT NULL, '
      '${TableEstudantes.nomePai} TEXT NULL, '
      '${TableEstudantes.nomePaiSemAcento} TEXT NULL, '
      '${TableEstudantes.nomeSemAcento} TEXT NOT NULL, '
      '${TableEstudantes.sexoEstudante} INTEGER NULL, '
      '${TableEstudantes.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}) '
      ');';

  static const turmas = 'CREATE TABLE ${TableTurmas.tableName} ('
      '${TableTurmas.codigoComponente} INTEGER NOT NULL, '
      '${TableTurmas.codigoTurmaGrupo} INTEGER NOT NULL, '
      '${TableTurmas.cargaHorariaComponenteTurma} INTEGER NOT NULL, '
      '${TableTurmas.codigoTipoProfessor} INTEGER NOT NULL, '
      '${TableTurmas.descricaoComponenteCurricular} TEXT NOT NULL, '
      '${TableTurmas.descricaoComponenteCurricularSemAcento} TEXT NOT NULL, '
      '${TableTurmas.descricaoSerie} TEXT NOT NULL, '
      '${TableTurmas.descricaoSerieSemAcento} TEXT NOT NULL, '
      '${TableTurmas.nomeTurma} TEXT NOT NULL, '
      '${TableTurmas.nomeTurmaSemAcento} TEXT NOT NULL, '
      '${TableTurmas.oruCodigo} INTEGER NOT NULL REFERENCES ${TableEscolas.tableName} (${TableEscolas.oruCodigo}), '
      '${TableTurmas.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}), '
      '${TableTurmas.tipoNotaComponente} TEXT NOT NULL, '
      '${TableTurmas.quantidadeAvaliacoes} INTEGER NOT NULL, '
      'PRIMARY KEY (${TableTurmas.codigoComponente}, ${TableTurmas.codigoTurmaGrupo}) '
      ');';

  static const estudantesHasTurmas = 'CREATE TABLE ${TableEstudantesHasTurmas.tableName} ('
      '${TableEstudantesHasTurmas.codigoComponente} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoComponente}), '
      '${TableEstudantesHasTurmas.codigoEstudante} INTEGER NOT NULL REFERENCES ${TableEstudantes.tableName} (${TableEstudantes.codigoEstudante}), '
      '${TableEstudantesHasTurmas.codigoTurmaGrupo} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoTurmaGrupo}), '
      '${TableEstudantesHasTurmas.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}), '
      'PRIMARY KEY (${TableEstudantesHasTurmas.codigoComponente}, ${TableEstudantesHasTurmas.codigoEstudante}, ${TableEstudantesHasTurmas.codigoTurmaGrupo})'
      ');';

  static const estudantesHasNotas = 'CREATE TABLE ${TableEstudantesHasNotas.tableName} ('
      '${TableEstudantesHasNotas.codigoEstudante} INTEGER NOT NULL REFERENCES ${TableEstudantes.tableName} (${TableEstudantes.codigoEstudante}), '
      '${TableEstudantesHasNotas.codigoNotaAvaliacao} INTEGER NOT NULL REFERENCES ${TableNotas.tableName} (${TableNotas.codigoNotaAvalicao}), '
      '${TableEstudantesHasNotas.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}), '
      '${TableEstudantesHasNotas.codigoComponente} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoComponente}), '
      '${TableEstudantesHasNotas.codigoTurmaGrupo} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoTurmaGrupo}), '
      'PRIMARY KEY (${TableEstudantesHasNotas.codigoEstudante}, ${TableEstudantesHasNotas.codigoNotaAvaliacao}, ${TableEstudantesHasNotas.codigoComponente}, ${TableEstudantesHasNotas.codigoTurmaGrupo})'
      ');';

  static const estudantesHasChamadas = 'CREATE TABLE ${TableEstudantesHasChamadas.tableName} ('
      '${TableEstudantesHasChamadas.codigoEstudante} INTEGER NOT NULL REFERENCES ${TableEstudantes.tableName} (${TableEstudantes.codigoEstudante}), '
      '${TableEstudantesHasChamadas.pkChamada} INTEGER NOT NULL REFERENCES ${TableChamada.tableName} (${TableChamada.pkChamada}), '
      '${TableEstudantesHasChamadas.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}), '
      '${TableEstudantesHasChamadas.codigoComponente} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoComponente}), '
      '${TableEstudantesHasChamadas.codigoTurmaGrupo} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoTurmaGrupo}), '
      'PRIMARY KEY (${TableEstudantesHasChamadas.codigoEstudante}, ${TableEstudantesHasChamadas.pkChamada}, ${TableEstudantesHasChamadas.codigoComponente}, ${TableEstudantesHasChamadas.codigoTurmaGrupo}) '
      ');';

  static const aulas = 'CREATE TABLE ${TableAulas.tableName} ('
      '${TableAulas.pkAula} INTEGER PRIMARY KEY, '
      '${TableAulas.data} INTEGER NOT NULL, '
      '${TableAulas.periodo} INTEGER NOT NULL, '
      '${TableAulas.turno} TEXT NOT NULL, '
      '${TableAulas.codigoComponente} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoComponente}), '
      '${TableAulas.codigoTurmaGrupo} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoTurmaGrupo}), '
      '${TableAulas.oruCodigo} INTEGER NOT NULL REFERENCES ${TableEscolas.tableName} (${TableEscolas.oruCodigo}), '
      '${TableAulas.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}) '
      ');';

  static const funcionalidades = 'CREATE TABLE ${TableFuncionalidades.tableName} ('
      '${TableFuncionalidades.codigoFuncionalidade} INTEGER PRIMARY KEY, '
      '${TableFuncionalidades.nome} TEXT NOT NULL, '
      '${TableFuncionalidades.descricao} TEXT NOT NULL, '
      '${TableFuncionalidades.codigoTipoProfessor} INTEGER NULL, '
      '${TableFuncionalidades.ordemFuncionalidade} INTEGER NULL '
      ');';

  static const turmasHasFuncionalidades = 'CREATE TABLE ${TableTurmasHasFuncionalidades.tableName} ('
      '${TableTurmasHasFuncionalidades.codigoComponente} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoComponente}), '
      '${TableTurmasHasFuncionalidades.codigoTurmaGrupo} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoTurmaGrupo}), '
      '${TableTurmasHasFuncionalidades.codigoFuncionalidade} INTEGER NOT NULL REFERENCES ${TableFuncionalidades.tableName} (${TableFuncionalidades.codigoFuncionalidade}), '
      '${TableTurmasHasFuncionalidades.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}), '
      'PRIMARY KEY (${TableTurmasHasFuncionalidades.codigoComponente}, ${TableTurmasHasFuncionalidades.codigoFuncionalidade}, ${TableTurmasHasFuncionalidades.codigoTurmaGrupo}) '
      ');';

  static const chamadaDataLancamento = 'CREATE TABLE ${TableChamadaDataLancamento.tableName} ('
      '${TableChamadaDataLancamento.pkChamadaDataLancamento} INTEGER PRIMARY KEY, '
      '${TableChamadaDataLancamento.data} INTEGER NOT NULL, '
      '${TableChamadaDataLancamento.status} INTEGER NOT NULL, '
      '${TableChamadaDataLancamento.periodoLetivoCodigo} INTEGER NOT NULL, '
      '${TableChamadaDataLancamento.dataLimite} INTEGER NULL, '
      '${TableChamadaDataLancamento.turno} TEXT NOT NULL '
      ');';

  static const chamadasPeriodosLancamentos = 'CREATE TABLE ${TableChamadasPeriodosLancamentos.tableName} ('
      '${TableChamadasPeriodosLancamentos.pkPeriodoChamada} INTEGER PRIMARY KEY, '
      '${TableChamadasPeriodosLancamentos.horarioCodigo} INTEGER NOT NULL, '
      '${TableChamadasPeriodosLancamentos.tphCodigo} INTEGER NOT NULL, '
      '${TableChamadasPeriodosLancamentos.horarioInicio} INTEGER NOT NULL, '
      '${TableChamadasPeriodosLancamentos.trocaHorarioCodigo} INTEGER NULL, '
      '${TableChamadasPeriodosLancamentos.hdlCodigo} INTEGER NULL, '
      '${TableChamadasPeriodosLancamentos.horarioPeriodo} TEXT NOT NULL, '
      '${TableChamadasPeriodosLancamentos.pkChamadaDataLancamento} INTEGER NOT NULL REFERENCES ${TableChamadaDataLancamento.tableName} (${TableChamadaDataLancamento.pkChamadaDataLancamento}) '
      ');';

  static const turmasHasChamadaDataLancamento = 'CREATE TABLE ${TableTurmasHasChamadaDataLancamento.tableName} ('
      '${TableTurmasHasChamadaDataLancamento.codigoComponente} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoComponente}), '
      '${TableTurmasHasChamadaDataLancamento.codigoTurmaGrupo} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoTurmaGrupo}), '
      '${TableTurmasHasChamadaDataLancamento.pkChamadaDataLancamento} INTEGER NOT NULL REFERENCES ${TableChamadaDataLancamento.tableName} (${TableChamadaDataLancamento.pkChamadaDataLancamento}), '
      '${TableTurmasHasChamadaDataLancamento.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}) '
      ');';

  static const periodos = 'CREATE TABLE ${TablePeriodos.tableName} ('
      '${TablePeriodos.codigoPeriodoLetivo} INTEGER NOT NULL, '
      '${TablePeriodos.numeroPeriodoLetivo} INTEGER NOT NULL, '
      '${TablePeriodos.descricaoPeriodoLetivo} TEXT NOT NULL, '
      '${TablePeriodos.dataInicioPeriodo} INTEGER NOT NULL, '
      '${TablePeriodos.dataFinalPeriodo} INTEGER NOT NULL, '
      '${TablePeriodos.aulasDadas} INTEGER NOT NULL, '
      '${TablePeriodos.dataLimiteLancamentoChamada} INTEGER NULL, '
      '${TablePeriodos.aulasDadasTotal} INTEGER NOT NULL, '
      '${TablePeriodos.diasLetivosDados} INTEGER NOT NULL, '
      '${TablePeriodos.diasLetivosTotal} INTEGER NOT NULL, '
      '${TablePeriodos.codigoComponente} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoComponente}), '
      '${TablePeriodos.codigoTurmaGrupo} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoTurmaGrupo}), '
      '${TablePeriodos.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}), '
      'PRIMARY KEY (${TablePeriodos.codigoPeriodoLetivo}, ${TablePeriodos.numeroPeriodoLetivo}, ${TablePeriodos.codigoComponente}, ${TablePeriodos.codigoTurmaGrupo}) '
      ');';

  static const estudantesSituacoes = 'CREATE TABLE ${TableEstudantesSituacoes.tableName} ('
      '${TableEstudantesSituacoes.pkSituacao} INTEGER PRIMARY KEY, '
      '${TableEstudantesSituacoes.cceCodigo} INTEGER NOT NULL, '
      '${TableEstudantesSituacoes.dataInicial} INTEGER NOT NULL, '
      '${TableEstudantesSituacoes.dataFinal} INTEGER NOT NULL, '
      '${TableEstudantesSituacoes.codigoEstudante} INTEGER NOT NULL REFERENCES ${TableEstudantesHasTurmas.tableName} (${TableEstudantesHasTurmas.codigoEstudante}), '
      '${TableEstudantesSituacoes.codigoTurmaGrupo} INTEGER NOT NULL REFERENCES ${TableEstudantesHasTurmas.tableName} (${TableEstudantesHasTurmas.codigoTurmaGrupo}), '
      '${TableEstudantesSituacoes.codigoComponente} INTEGER NOT NULL REFERENCES ${TableEstudantesHasTurmas.tableName} (${TableEstudantesHasTurmas.codigoComponente}), '
      '${TableEstudantesSituacoes.descricaoSituacao} TEXT NOT NULL, '
      '${TableEstudantesSituacoes.tipoSituacao} TEXT NOT NULL, '
      '${TableEstudantesSituacoes.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}) '
      ');';

  static const faltasMotivos = 'CREATE TABLE ${TableFaltasMotivos.tableName} ('
      '${TableFaltasMotivos.codigoMotivo} INTEGER NOT NULL, '
      '${TableFaltasMotivos.descricaoMotivo} TEXT NOT NULL, '
      '${TableFaltasMotivos.descricacaoSemAcento} TEXT NOT NULL, '
      '${TableFaltasMotivos.codigoComponente} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoComponente}), '
      '${TableFaltasMotivos.codigoTurmaGrupo} INTEGER NOT NULL REFERENCES ${TableTurmas.tableName} (${TableTurmas.codigoTurmaGrupo}), '
      '${TableFaltasMotivos.pkUsuario} INTEGER NOT NULL REFERENCES ${TableUsuarios.tableName} (${TableUsuarios.pkUsuario}), '
      'PRIMARY KEY (${TableFaltasMotivos.codigoMotivo}, ${TableFaltasMotivos.codigoComponente}, ${TableFaltasMotivos.codigoTurmaGrupo}) '
      ');';
}
