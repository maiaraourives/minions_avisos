import 'package:sqflite/sqflite.dart';

import '../../models/sessao/configuracoes_model.dart';
import '../../models/sessao/sessao_model.dart';
import '../helpers/db_helper.dart';
import '../tables/table_agendas.dart';
import '../tables/table_aulas.dart';
import '../tables/table_configuracoes.dart';
import '../tables/table_escolas.dart';
import '../tables/table_estudantes.dart';
import '../tables/table_estudantes_has_chamadas.dart';
import '../tables/table_estudantes_has_notas.dart';
import '../tables/table_estudantes_has_turmas.dart';
import '../tables/table_turmas.dart';
import '../tables/table_turmas_has_chamadas_data_lancamento.dart';
import '../tables/table_turmas_has_funcionalidades.dart';
import '../tables/table_usuarios.dart';

class DBUsuariosController {
  static Future<int> insert(SessaoModel sessao) async {
    Map? oldUser = await _selectByUsuario(sessao.usuario!);

    if (oldUser != null) {
      //Usuário já existia, apenas atualiza as informações
      sessao.setPKUsuario(oldUser['PK_USUARIO']);

      await updateUsuario(sessao);

      sessao.setConfiguracoes(ConfiguracoesModel.fromDatabase(oldUser));

      return sessao.pkUsuario!;
    } else {
      //Usuário novo
      return await _insert(sessao);
    }
  }

  ///Insere um usuário e cria as suas configurações
  static Future<int> _insert(SessaoModel sessao) async {
    sessao.setConfiguracoes(ConfiguracoesModel());

    return await DBHelper.executeTransaction((txn) async {
      int pkUsuario = await DBHelper.insert(
        sql: 'INSERT INTO ${TableUsuarios.tableName} ('
            '${TableUsuarios.usuario}, '
            '${TableUsuarios.codigoUsuario}, '
            '${TableUsuarios.dataLogin}, '
            '${TableUsuarios.email}, '
            '${TableUsuarios.nome}, '
            '${TableUsuarios.dataNascimento}, '
            '${TableUsuarios.celular}, '
            '${TableUsuarios.cep}, '
            '${TableUsuarios.cidadeDescricao}, '
            '${TableUsuarios.uf}, '
            '${TableUsuarios.endereco}, '
            '${TableUsuarios.bairro}, '
            '${TableUsuarios.complemento}, '
            '${TableUsuarios.sexoUsuario}, '
            '${TableUsuarios.numeroCasa}, '
            '${TableUsuarios.urlServidor}, '
            '${TableUsuarios.municipio}, '
            '${TableUsuarios.municipioCodigo}, '
            '${TableUsuarios.cpf} '
            ') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        arguments: [
          sessao.usuario!.toUpperCase(),
          sessao.dadosUsuario.codigoUsuario,
          DateTime.now().millisecondsSinceEpoch,
          sessao.dadosUsuario.email,
          sessao.dadosUsuario.nome,
          sessao.dadosUsuario.dataNascimento?.millisecondsSinceEpoch,
          sessao.dadosUsuario.celular,
          sessao.dadosUsuario.cep,
          sessao.dadosUsuario.municipio,
          sessao.dadosUsuario.uf,
          sessao.dadosUsuario.endereco,
          sessao.dadosUsuario.bairro,
          sessao.dadosUsuario.complemento,
          sessao.dadosUsuario.sexo,
          sessao.dadosUsuario.numeroCasa,
          sessao.servidor!.url,
          sessao.servidor!.nome,
          sessao.servidor!.codigo,
          sessao.dadosUsuario.cpf,
        ],
        transaction: txn,
      );

      await DBHelper.insert(
        sql: 'INSERT INTO ${TableConfiguracoes.tableName} ('
            '${TableConfiguracoes.pkUsuario} '
            ') VALUES (?) ',
        arguments: [pkUsuario],
        transaction: txn,
      );

      return pkUsuario;
    });
  }

  ///Atualiza as informações de um usuário
  static Future<void> updateUsuario(
    SessaoModel sessao, {
    Transaction? transaction,
  }) async {
    await DBHelper.update(
      sql: 'UPDATE ${TableUsuarios.tableName} SET '
          '${TableUsuarios.dataLogin} = ?, '
          '${TableUsuarios.email} = ?, '
          '${TableUsuarios.nome} = ?, '
          '${TableUsuarios.dataNascimento} = ?, '
          '${TableUsuarios.celular} = ?, '
          '${TableUsuarios.cep} = ?, '
          '${TableUsuarios.cidadeDescricao} = ?, '
          '${TableUsuarios.uf} = ?, '
          '${TableUsuarios.endereco} = ?, '
          '${TableUsuarios.bairro} = ?, '
          '${TableUsuarios.complemento} = ?, '
          '${TableUsuarios.sexoUsuario} = ?, '
          '${TableUsuarios.numeroCasa} = ?, '
          '${TableUsuarios.urlServidor} = ?, '
          '${TableUsuarios.cpf} = ? '
          'WHERE ${TableUsuarios.pkUsuario} = ? ',
      arguments: [
        DateTime.now().millisecondsSinceEpoch,
        sessao.dadosUsuario.email,
        sessao.dadosUsuario.nome,
        sessao.dadosUsuario.dataNascimento?.millisecondsSinceEpoch,
        sessao.dadosUsuario.celular,
        sessao.dadosUsuario.cep,
        sessao.dadosUsuario.municipio,
        sessao.dadosUsuario.uf,
        sessao.dadosUsuario.endereco,
        sessao.dadosUsuario.bairro,
        sessao.dadosUsuario.complemento,
        sessao.dadosUsuario.sexo,
        sessao.dadosUsuario.numeroCasa,
        sessao.servidor!.url,
        sessao.dadosUsuario.cpf,
        sessao.pkUsuario,
      ],
      transaction: transaction,
    );
  }

  ///Busca todas as informações de um usuário
  static Future<Map?> _selectByUsuario(String usuario) async {
    List<Map> response = await DBHelper.select(
      sql: 'SELECT '
          'usu.${TableUsuarios.pkUsuario} AS \'PK_USUARIO\', '
          'usu.${TableUsuarios.codigoUsuario} AS \'CODIGO_USUARIO\', '
          'usu.${TableUsuarios.nome} AS \'NOME\', '
          'usu.${TableUsuarios.email} AS \'EMAIL\', '
          'usu.${TableUsuarios.dataLogin} AS \'DATA_ULTIMO_LOGIN\', '
          'usu.${TableUsuarios.usuario} AS \'USUARIO\', '
          'usu.${TableUsuarios.dataNascimento} AS \'DATA_NASCIMENTO\', '
          'usu.${TableUsuarios.celular} AS \'CELULAR\', '
          'usu.${TableUsuarios.cep} AS \'CEP\', '
          'usu.${TableUsuarios.cidadeDescricao} AS \'CIDADE_DESCRICAO\', '
          'usu.${TableUsuarios.uf} AS \'UF\', '
          'usu.${TableUsuarios.endereco} AS \'ENDERECO\', '
          'usu.${TableUsuarios.bairro} AS \'BAIRRO\', '
          'usu.${TableUsuarios.complemento} AS \'COMPLEMENTO\', '
          'usu.${TableUsuarios.sexoUsuario} AS \'SEXO_USUARIO\', '
          'usu.${TableUsuarios.numeroCasa} AS \'NUMERO_CASA\', '
          'usu.${TableUsuarios.municipio} AS \'MUNICIPIO\', '
          'usu.${TableUsuarios.municipioCodigo} AS \'MUNICIPIO_CODIGO\', '
          'usu.${TableUsuarios.urlServidor} AS \'URL_SERVIDOR\', '
          'usu.${TableUsuarios.cpf} AS \'CPF\', '
          'conf.${TableConfiguracoes.biometria} AS \'BIOMETRIA\', '
          'conf.${TableConfiguracoes.synkedData} AS \'SYNKED_DATA\', '
          'conf.${TableConfiguracoes.textFactor} AS \'TEXT_FACTOR\', '
          'conf.${TableConfiguracoes.aceitouPermissoes} AS \'ACEITOU_PERMISSOES\', '
          'conf.${TableConfiguracoes.darkTheme} AS \'DARK_THEME\', '
          'conf.${TableConfiguracoes.syncOnWifi} AS \'SYNC_ON_WIFI\', '
          'conf.${TableConfiguracoes.imageOnWifi} AS \'IMAGE_ON_WIFI\' '
          'FROM ${TableUsuarios.tableName} usu '
          'LEFT OUTER JOIN ${TableConfiguracoes.tableName} conf ON (usu.${TableUsuarios.pkUsuario} = conf.${TableConfiguracoes.pkUsuario}) '
          'WHERE usu.${TableUsuarios.usuario} = ? ',
      arguments: [usuario.toUpperCase()],
    );

    if (response.isEmpty) {
      return null;
    }

    return response.first;
  }

  ///Busca todas as informações de um usuário
  static Future<List<Map>> buscarUsuarios() async {
    return await DBHelper.select(
      sql: 'SELECT '
          'usu.${TableUsuarios.pkUsuario} AS \'PK_USUARIO\', '
          'usu.${TableUsuarios.codigoUsuario} AS \'CODIGO_USUARIO\', '
          'usu.${TableUsuarios.nome} AS \'NOME\', '
          'usu.${TableUsuarios.email} AS \'EMAIL\', '
          'usu.${TableUsuarios.dataLogin} AS \'DATA_ULTIMO_LOGIN\', '
          'usu.${TableUsuarios.usuario} AS \'USUARIO\', '
          'usu.${TableUsuarios.dataNascimento} AS \'DATA_NASCIMENTO\', '
          'usu.${TableUsuarios.celular} AS \'CELULAR\', '
          'usu.${TableUsuarios.cep} AS \'CEP\', '
          'usu.${TableUsuarios.cidadeDescricao} AS \'CIDADE_DESCRICAO\', '
          'usu.${TableUsuarios.uf} AS \'UF\', '
          'usu.${TableUsuarios.endereco} AS \'ENDERECO\', '
          'usu.${TableUsuarios.bairro} AS \'BAIRRO\', '
          'usu.${TableUsuarios.complemento} AS \'COMPLEMENTO\', '
          'usu.${TableUsuarios.sexoUsuario} AS \'SEXO_USUARIO\', '
          'usu.${TableUsuarios.numeroCasa} AS \'NUMERO_CASA\', '
          'usu.${TableUsuarios.municipio} AS \'MUNICIPIO\', '
          'usu.${TableUsuarios.municipioCodigo} AS \'MUNICIPIO_CODIGO\', '
          'usu.${TableUsuarios.urlServidor} AS \'URL_SERVIDOR\', '
          'usu.${TableUsuarios.cpf} AS \'CPF\', '
          'conf.${TableConfiguracoes.biometria} AS \'BIOMETRIA\', '
          'conf.${TableConfiguracoes.synkedData} AS \'SYNKED_DATA\', '
          'conf.${TableConfiguracoes.textFactor} AS \'TEXT_FACTOR\', '
          'conf.${TableConfiguracoes.aceitouPermissoes} AS \'ACEITOU_PERMISSOES\', '
          'conf.${TableConfiguracoes.darkTheme} AS \'DARK_THEME\', '
          'conf.${TableConfiguracoes.syncOnWifi} AS \'SYNC_ON_WIFI\', '
          'conf.${TableConfiguracoes.imageOnWifi} AS \'IMAGE_ON_WIFI\' '
          'FROM ${TableUsuarios.tableName} usu '
          'LEFT OUTER JOIN ${TableConfiguracoes.tableName} conf ON (usu.${TableUsuarios.pkUsuario} = conf.${TableConfiguracoes.pkUsuario}) '
          'ORDER BY usu.${TableUsuarios.usuario} ',
    );
  }

  ///Seleciona o último usuário a fazer login, caso exista
  static Future<Map?> lastLogin() async {
    List<Map<String, dynamic>> response = await DBHelper.select(
      sql: 'SELECT '
          '${TableUsuarios.usuario} AS \'USUARIO\' '
          'FROM ${TableUsuarios.tableName} '
          'ORDER BY ${TableUsuarios.dataLogin} DESC '
          'LIMIT 1',
    );

    if (response.isEmpty) {
      return null;
    }

    return await _selectByUsuario(response.first['USUARIO']);
  }

  ///Atualiza as configurações de um usuário
  static Future<void> updateConfiguracoes(
    SessaoModel sessao, {
    Transaction? transaction,
  }) async {
    await DBHelper.update(
      sql: 'UPDATE ${TableConfiguracoes.tableName} SET '
          '${TableConfiguracoes.biometria} = ?, '
          '${TableConfiguracoes.synkedData} = ?, '
          '${TableConfiguracoes.textFactor} = ?, '
          '${TableConfiguracoes.aceitouPermissoes} = ?, '
          '${TableConfiguracoes.darkTheme} = ?, '
          '${TableConfiguracoes.syncOnWifi} = ?, '
          '${TableConfiguracoes.imageOnWifi} = ? '
          'WHERE ${TableConfiguracoes.pkUsuario} = ?',
      arguments: [
        sessao.configuracoes.biometria,
        sessao.configuracoes.synkedData,
        sessao.configuracoes.textFactor,
        sessao.configuracoes.aceitouPermissoes,
        sessao.configuracoes.darkTheme,
        sessao.configuracoes.syncOnWifi,
        sessao.configuracoes.imageOnWifi,
        sessao.pkUsuario,
      ],
      transaction: transaction,
    );
  }

  static Future<void> excluirUsuario(SessaoModel sessao) async {
    await DBHelper.executeTransaction((txn) async {
      await DBHelper.delete(
        sql: 'DELETE FROM ${TableConfiguracoes.tableName} WHERE ${TableConfiguracoes.pkUsuario} = ? ',
        arguments: [sessao.pkUsuario],
        transaction: txn,
      );

      await DBHelper.delete(
        sql: 'DELETE FROM ${TableTurmas.tableName} WHERE ${TableTurmas.pkUsuario} = ? ',
        arguments: [sessao.pkUsuario],
        transaction: txn,
      );

      await DBHelper.delete(
        sql: 'DELETE FROM ${TableEscolas.tableName} WHERE ${TableEscolas.pkUsuario} = ? ',
        arguments: [sessao.pkUsuario],
        transaction: txn,
      );

      await DBHelper.delete(
        sql: 'DELETE FROM ${TableAgendas.tableName} WHERE ${TableAgendas.pkUsuario} = ? ',
        arguments: [sessao.pkUsuario],
        transaction: txn,
      );

      await DBHelper.delete(
        sql: 'DELETE FROM ${TableEstudantes.tableName} WHERE ${TableEstudantes.pkUsuario} = ? ',
        arguments: [sessao.pkUsuario],
        transaction: txn,
      );

      await DBHelper.delete(
        sql: 'DELETE FROM ${TableTurmasHasFuncionalidades.tableName} WHERE ${TableTurmasHasFuncionalidades.pkUsuario} = ? ',
        arguments: [sessao.pkUsuario],
        transaction: txn,
      );

      await DBHelper.delete(
        sql: 'DELETE FROM ${TableEstudantesHasTurmas.tableName} WHERE ${TableEstudantesHasTurmas.pkUsuario} = ? ',
        arguments: [sessao.pkUsuario],
        transaction: txn,
      );

      await DBHelper.delete(
        sql: 'DELETE FROM ${TableEstudantesHasNotas.tableName} WHERE ${TableEstudantesHasNotas.pkUsuario} = ? ',
        arguments: [sessao.pkUsuario],
        transaction: txn,
      );

      await DBHelper.delete(
        sql: 'DELETE FROM ${TableEstudantesHasChamadas.tableName} WHERE ${TableEstudantesHasChamadas.pkUsuario} = ? ',
        arguments: [sessao.pkUsuario],
        transaction: txn,
      );

      await DBHelper.delete(
        sql: 'DELETE FROM ${TableTurmasHasChamadaDataLancamento.tableName} WHERE ${TableTurmasHasChamadaDataLancamento.pkUsuario} = ? ',
        arguments: [sessao.pkUsuario],
        transaction: txn,
      );

      await DBHelper.delete(
        sql: 'DELETE FROM ${TableAulas.tableName} WHERE ${TableAulas.pkUsuario} = ? ',
        arguments: [sessao.pkUsuario],
        transaction: txn,
      );

      await DBHelper.delete(
        sql: 'DELETE FROM ${TableUsuarios.tableName} WHERE ${TableUsuarios.pkUsuario} = ? ',
        arguments: [sessao.pkUsuario],
        transaction: txn,
      );
    });
  }
}
