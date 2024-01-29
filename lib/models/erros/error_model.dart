import 'package:flutter/material.dart';

import '../../configs/constants.dart';

class ErrorModel implements Exception {
  ErrorModel(this.descricao, {this.callback}) : type = ErrorType.generic;

  ErrorModel.internet({this.descricao = 'Não há conexão com à internet. Verifique o seu wifi ou dados móveis', this.callback}) : type = ErrorType.internet;

  ErrorModel.login(this.descricao, {this.callback}) : type = ErrorType.login;

  ErrorModel.cadastro(this.descricao, {this.callback}) : type = ErrorType.cadastro;

  ErrorModel.http(this.descricao, {this.callback}) : type = ErrorType.http_request;

  ErrorModel.session({this.descricao, this.callback}) : type = ErrorType.session;

  ErrorModel.loginOffline({this.descricao, this.callback}) : type = ErrorType.login_offline;

  ErrorModel.sync(this.descricao, {this.callback}) : type = ErrorType.sync;

  ErrorModel.gps(this.descricao, {this.callback}) : type = ErrorType.gps;

  ErrorModel.expiredSession({this.descricao, this.callback}) : type = ErrorType.expiredToken;

  ErrorModel.type(this.descricao, this.type, {this.callback});

  final String? descricao;
  final ErrorType type;
  final VoidCallback? callback;
}
