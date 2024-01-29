// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'network_store.g.dart';

class NetworkStore = _NetworkStore with _$NetworkStore;

abstract class _NetworkStore with Store {
  @observable
  bool _hasInternet = true;

  @computed
  bool get hasInternet => _hasInternet;

  @action
  void setHasInternet({required bool value}) {
    _hasInternet = value;
  }
}
