// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracoes_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfiguracoesModel on _ConfiguracoesModel, Store {
  Computed<int>? _$biometriaComputed;

  @override
  int get biometria =>
      (_$biometriaComputed ??= Computed<int>(() => super.biometria,
              name: '_ConfiguracoesModel.biometria'))
          .value;
  Computed<double>? _$textFactorComputed;

  @override
  double get textFactor =>
      (_$textFactorComputed ??= Computed<double>(() => super.textFactor,
              name: '_ConfiguracoesModel.textFactor'))
          .value;
  Computed<int>? _$darkThemeComputed;

  @override
  int get darkTheme =>
      (_$darkThemeComputed ??= Computed<int>(() => super.darkTheme,
              name: '_ConfiguracoesModel.darkTheme'))
          .value;
  Computed<bool>? _$isDarkThemeComputed;

  @override
  bool get isDarkTheme =>
      (_$isDarkThemeComputed ??= Computed<bool>(() => super.isDarkTheme,
              name: '_ConfiguracoesModel.isDarkTheme'))
          .value;
  Computed<int>? _$syncOnWifiComputed;

  @override
  int get syncOnWifi =>
      (_$syncOnWifiComputed ??= Computed<int>(() => super.syncOnWifi,
              name: '_ConfiguracoesModel.syncOnWifi'))
          .value;
  Computed<int>? _$imageOnWifiComputed;

  @override
  int get imageOnWifi =>
      (_$imageOnWifiComputed ??= Computed<int>(() => super.imageOnWifi,
              name: '_ConfiguracoesModel.imageOnWifi'))
          .value;

  late final _$_biometriaAtom =
      Atom(name: '_ConfiguracoesModel._biometria', context: context);

  @override
  int get _biometria {
    _$_biometriaAtom.reportRead();
    return super._biometria;
  }

  @override
  set _biometria(int value) {
    _$_biometriaAtom.reportWrite(value, super._biometria, () {
      super._biometria = value;
    });
  }

  late final _$_textFactorAtom =
      Atom(name: '_ConfiguracoesModel._textFactor', context: context);

  @override
  double get _textFactor {
    _$_textFactorAtom.reportRead();
    return super._textFactor;
  }

  @override
  set _textFactor(double value) {
    _$_textFactorAtom.reportWrite(value, super._textFactor, () {
      super._textFactor = value;
    });
  }

  late final _$_darkThemeAtom =
      Atom(name: '_ConfiguracoesModel._darkTheme', context: context);

  @override
  int get _darkTheme {
    _$_darkThemeAtom.reportRead();
    return super._darkTheme;
  }

  @override
  set _darkTheme(int value) {
    _$_darkThemeAtom.reportWrite(value, super._darkTheme, () {
      super._darkTheme = value;
    });
  }

  late final _$_syncOnWifiAtom =
      Atom(name: '_ConfiguracoesModel._syncOnWifi', context: context);

  @override
  int get _syncOnWifi {
    _$_syncOnWifiAtom.reportRead();
    return super._syncOnWifi;
  }

  @override
  set _syncOnWifi(int value) {
    _$_syncOnWifiAtom.reportWrite(value, super._syncOnWifi, () {
      super._syncOnWifi = value;
    });
  }

  late final _$_imageOnWifiAtom =
      Atom(name: '_ConfiguracoesModel._imageOnWifi', context: context);

  @override
  int get _imageOnWifi {
    _$_imageOnWifiAtom.reportRead();
    return super._imageOnWifi;
  }

  @override
  set _imageOnWifi(int value) {
    _$_imageOnWifiAtom.reportWrite(value, super._imageOnWifi, () {
      super._imageOnWifi = value;
    });
  }

  late final _$_ConfiguracoesModelActionController =
      ActionController(name: '_ConfiguracoesModel', context: context);

  @override
  void setBiometria(int value) {
    final _$actionInfo = _$_ConfiguracoesModelActionController.startAction(
        name: '_ConfiguracoesModel.setBiometria');
    try {
      return super.setBiometria(value);
    } finally {
      _$_ConfiguracoesModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTextFactor(double value) {
    final _$actionInfo = _$_ConfiguracoesModelActionController.startAction(
        name: '_ConfiguracoesModel.setTextFactor');
    try {
      return super.setTextFactor(value);
    } finally {
      _$_ConfiguracoesModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDarkTheme(int value) {
    final _$actionInfo = _$_ConfiguracoesModelActionController.startAction(
        name: '_ConfiguracoesModel.setDarkTheme');
    try {
      return super.setDarkTheme(value);
    } finally {
      _$_ConfiguracoesModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSyncOnWifi(int value) {
    final _$actionInfo = _$_ConfiguracoesModelActionController.startAction(
        name: '_ConfiguracoesModel.setSyncOnWifi');
    try {
      return super.setSyncOnWifi(value);
    } finally {
      _$_ConfiguracoesModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImageOnWifi(int value) {
    final _$actionInfo = _$_ConfiguracoesModelActionController.startAction(
        name: '_ConfiguracoesModel.setImageOnWifi');
    try {
      return super.setImageOnWifi(value);
    } finally {
      _$_ConfiguracoesModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void applyChanges(Map<dynamic, dynamic> data) {
    final _$actionInfo = _$_ConfiguracoesModelActionController.startAction(
        name: '_ConfiguracoesModel.applyChanges');
    try {
      return super.applyChanges(data);
    } finally {
      _$_ConfiguracoesModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
biometria: ${biometria},
textFactor: ${textFactor},
darkTheme: ${darkTheme},
isDarkTheme: ${isDarkTheme},
syncOnWifi: ${syncOnWifi},
imageOnWifi: ${imageOnWifi}
    ''';
  }
}
