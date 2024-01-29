// ignore_for_file: unused_element, library_private_types_in_public_api

import 'package:mobx/mobx.dart';

import '../../configs/constants.dart';
import '../../extensions/int_ext.dart';

part 'configuracoes_model.g.dart';

class ConfiguracoesModel = _ConfiguracoesModel with _$ConfiguracoesModel;

abstract class _ConfiguracoesModel with Store {
  _ConfiguracoesModel();

  _ConfiguracoesModel.fromDatabase(Map data) {
    _biometria = data['BIOMETRIA'];
    _synkedData = data['SYNKED_DATA'];
    setTextFactor(data['TEXT_FACTOR']);
    _aceitouPermissoes = data['ACEITOU_PERMISSOES'];
    setDarkTheme(data['DARK_THEME']);
    _syncOnWifi = data['SYNC_ON_WIFI'];
    _imageOnWifi = data['IMAGE_ON_WIFI'];
  }

  @observable
  int _biometria = CadOptions.NAO;

  int _synkedData = CadOptions.NAO;

  @observable
  double _textFactor = 1;

  int _aceitouPermissoes = CadOptions.NAO;

  @observable
  int _darkTheme = CadOptions.NAO;

  @observable
  int _syncOnWifi = CadOptions.NAO;

  @observable
  int _imageOnWifi = CadOptions.NAO;

  @action
  void setBiometria(int value) {
    _biometria = value;
  }

  @computed
  int get biometria => _biometria;

  void setSynkedData(int value) {
    _synkedData = value;
  }

  int get synkedData => _synkedData;

  bool get isSynkedData => _synkedData.toBool();

  @action
  void setTextFactor(double value) {
    _textFactor = value;
  }

  @computed
  double get textFactor => _textFactor;

  void setAceitouPermissoes(int value) {
    _aceitouPermissoes = value;
  }

  int get aceitouPermissoes => _aceitouPermissoes;

  @action
  void setDarkTheme(int value) {
    _darkTheme = value;
  }

  @computed
  int get darkTheme => _darkTheme;

  @computed
  bool get isDarkTheme => _darkTheme.toBool();

  @action
  void setSyncOnWifi(int value) {
    _syncOnWifi = value;
  }

  @computed
  int get syncOnWifi => _syncOnWifi;

  @action
  void setImageOnWifi(int value) {
    _imageOnWifi = value;
  }

  @computed
  int get imageOnWifi => _imageOnWifi;

  @action
  void applyChanges(Map data) {
    _biometria = data['BIOMETRIA'];
    _synkedData = data['SYNKED_DATA'];
    setTextFactor(data['TEXT_FACTOR']);
    _aceitouPermissoes = data['ACEITOU_PERMISSOES'];
    setDarkTheme(data['DARK_THEME']);
    _syncOnWifi = data['SYNC_ON_WIFI'];
    _imageOnWifi = data['IMAGE_ON_WIFI'];
  }
}
