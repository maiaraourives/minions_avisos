// ignore_for_file: library_private_types_in_public_api

import 'package:avisos_pendecias/models/minions/minions_model.dart';
import 'package:mobx/mobx.dart';

part 'home_state.g.dart';

class HomeState = _HomeState with _$HomeState;

abstract class _HomeState with Store {
  @observable
  ObservableList<MinionsModel> _listaMinions = ObservableList();

  @computed
  List<MinionsModel> get listaMinions => [..._listaMinions];

  @action
  void setMinions(List<MinionsModel> minions) {
    _listaMinions = minions.asObservable();
  }
}
