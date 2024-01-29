// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessao_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SessaoModel on _SessaoModel, Store {
  Computed<ServidorModel?>? _$servidorComputed;

  @override
  ServidorModel? get servidor =>
      (_$servidorComputed ??= Computed<ServidorModel?>(() => super.servidor,
              name: '_SessaoModel.servidor'))
          .value;
  Computed<ConfiguracoesModel>? _$configuracoesComputed;

  @override
  ConfiguracoesModel get configuracoes => (_$configuracoesComputed ??=
          Computed<ConfiguracoesModel>(() => super.configuracoes,
              name: '_SessaoModel.configuracoes'))
      .value;
  Computed<Uint8List?>? _$fotoComputed;

  @override
  Uint8List? get foto => (_$fotoComputed ??=
          Computed<Uint8List?>(() => super.foto, name: '_SessaoModel.foto'))
      .value;
  Computed<DadosUsuarioModel>? _$dadosUsuarioComputed;

  @override
  DadosUsuarioModel get dadosUsuario => (_$dadosUsuarioComputed ??=
          Computed<DadosUsuarioModel>(() => super.dadosUsuario,
              name: '_SessaoModel.dadosUsuario'))
      .value;

  late final _$_configuracoesAtom =
      Atom(name: '_SessaoModel._configuracoes', context: context);

  @override
  ConfiguracoesModel get _configuracoes {
    _$_configuracoesAtom.reportRead();
    return super._configuracoes;
  }

  @override
  set _configuracoes(ConfiguracoesModel value) {
    _$_configuracoesAtom.reportWrite(value, super._configuracoes, () {
      super._configuracoes = value;
    });
  }

  late final _$_servidorAtom =
      Atom(name: '_SessaoModel._servidor', context: context);

  @override
  ServidorModel? get _servidor {
    _$_servidorAtom.reportRead();
    return super._servidor;
  }

  @override
  set _servidor(ServidorModel? value) {
    _$_servidorAtom.reportWrite(value, super._servidor, () {
      super._servidor = value;
    });
  }

  late final _$_dadosUsuarioAtom =
      Atom(name: '_SessaoModel._dadosUsuario', context: context);

  @override
  DadosUsuarioModel get _dadosUsuario {
    _$_dadosUsuarioAtom.reportRead();
    return super._dadosUsuario;
  }

  @override
  set _dadosUsuario(DadosUsuarioModel value) {
    _$_dadosUsuarioAtom.reportWrite(value, super._dadosUsuario, () {
      super._dadosUsuario = value;
    });
  }

  late final _$_fotoAtom = Atom(name: '_SessaoModel._foto', context: context);

  @override
  Uint8List? get _foto {
    _$_fotoAtom.reportRead();
    return super._foto;
  }

  @override
  set _foto(Uint8List? value) {
    _$_fotoAtom.reportWrite(value, super._foto, () {
      super._foto = value;
    });
  }

  late final _$_SessaoModelActionController =
      ActionController(name: '_SessaoModel', context: context);

  @override
  void setServidor(ServidorModel? servidor) {
    final _$actionInfo = _$_SessaoModelActionController.startAction(
        name: '_SessaoModel.setServidor');
    try {
      return super.setServidor(servidor);
    } finally {
      _$_SessaoModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfiguracoes(ConfiguracoesModel configuracoes) {
    final _$actionInfo = _$_SessaoModelActionController.startAction(
        name: '_SessaoModel.setConfiguracoes');
    try {
      return super.setConfiguracoes(configuracoes);
    } finally {
      _$_SessaoModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFoto(Uint8List? foto) {
    final _$actionInfo = _$_SessaoModelActionController.startAction(
        name: '_SessaoModel.setFoto');
    try {
      return super.setFoto(foto);
    } finally {
      _$_SessaoModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDadosUsuario(DadosUsuarioModel dadosUsuario) {
    final _$actionInfo = _$_SessaoModelActionController.startAction(
        name: '_SessaoModel.setDadosUsuario');
    try {
      return super.setDadosUsuario(dadosUsuario);
    } finally {
      _$_SessaoModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void copyWith({required SessaoModel newSession}) {
    final _$actionInfo = _$_SessaoModelActionController.startAction(
        name: '_SessaoModel.copyWith');
    try {
      return super.copyWith(newSession: newSession);
    } finally {
      _$_SessaoModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
servidor: ${servidor},
configuracoes: ${configuracoes},
foto: ${foto},
dadosUsuario: ${dadosUsuario}
    ''';
  }
}
