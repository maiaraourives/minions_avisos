// ignore_for_file: unused_element, library_private_types_in_public_api

import 'dart:typed_data';

import 'package:mobx/mobx.dart';

import '../servidor/servidor_model.dart';
import 'configuracoes_model.dart';
import 'dados_usuario_model.dart';

part 'sessao_model.g.dart';

class SessaoModel = _SessaoModel with _$SessaoModel;

abstract class _SessaoModel with Store {
  _SessaoModel();

  _SessaoModel.fromDatabase(Map data) {
    _pkUsuario = data['PK_USUARIO'];
    _usuario = data['USUARIO'];
    _configuracoes = ConfiguracoesModel.fromDatabase(data);
    _servidor = ServidorModel.fromDatabase(data);
    _dadosUsuario = DadosUsuarioModel.fromDatabase(data);
  }

  int? _pkUsuario;
  String? _usuario;
  String? _senha;
  String? _senhaAntiga; //Utilizado apenas na troca de senha

  @observable
  ConfiguracoesModel _configuracoes = ConfiguracoesModel();

  @observable
  ServidorModel? _servidor;

  @observable
  DadosUsuarioModel _dadosUsuario = DadosUsuarioModel();

  @observable
  Uint8List? _foto;

  void setUsuario(String? usuario) {
    _usuario = usuario;
  }

  String? get usuario => _usuario;

  void setSenha(String? senha) {
    _senha = senha;
  }

  String? get senha => _senha;

  void setSenhaAntiga(String? senha) {
    _senhaAntiga = senha;
  }

  String? get senhaAntiga => _senhaAntiga;

  @action
  void setServidor(ServidorModel? servidor) {
    _servidor = servidor;
  }

  @computed
  ServidorModel? get servidor => _servidor;

  @action
  void setConfiguracoes(ConfiguracoesModel configuracoes) {
    _configuracoes = configuracoes;
  }

  @computed
  ConfiguracoesModel get configuracoes => _configuracoes;

  void setPKUsuario(int? pk) {
    _pkUsuario = pk;
  }

  int? get pkUsuario => _pkUsuario;

  @action
  void setFoto(Uint8List? foto) {
    _foto = foto;
  }

  @computed
  Uint8List? get foto => _foto;

  @action
  void setDadosUsuario(DadosUsuarioModel dadosUsuario) {
    _dadosUsuario = dadosUsuario;
  }

  @computed
  DadosUsuarioModel get dadosUsuario => _dadosUsuario;

  ///Copia as informações de uma SessaoModel nova, para uma já existente (por referência)
  @action
  void copyWith({
    required SessaoModel newSession,
  }) {
    this
      ..setPKUsuario(newSession.pkUsuario)
      ..setUsuario(newSession.usuario)
      ..setServidor(newSession.servidor)
      ..setConfiguracoes(newSession.configuracoes)
      ..setFoto(newSession.foto)
      ..setDadosUsuario(newSession.dadosUsuario);
  }
}
