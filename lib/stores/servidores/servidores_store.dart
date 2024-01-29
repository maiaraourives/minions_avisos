// ignore_for_file: prefer_final_fields, library_private_types_in_public_api

import 'package:diacritic/diacritic.dart';
import 'package:mobx/mobx.dart';

import '../../models/servidor/servidor_model.dart';

part 'servidores_store.g.dart';

class ServidoresStore = _ServidoresStore with _$ServidoresStore;

abstract class _ServidoresStore with Store {
  @observable
  ObservableList<ServidorModel> _municipios = ObservableList();

  @observable
  bool _loading = false;

  @observable
  bool _hasInternet = true;

  @observable
  bool _hasError = false;

  @observable
  String? _searchFilter;

  @observable
  bool _usedFilter = false;

  @computed
  List<ServidorModel> get municipios {
    if (searchFilter != null) {
      final servidores = _municipios.where((sv) => removeDiacritics(sv.nome).toUpperCase().contains(removeDiacritics(searchFilter!.toUpperCase()))).toList();

      return [...servidores];
    }

    return [..._municipios];
  }

  @computed
  bool get loading => _loading;

  @computed
  bool get hasInternet => _hasInternet;

  @computed
  bool get hasError => _hasError;

  @computed
  String? get searchFilter => _searchFilter;

  @computed
  bool get usedFilter => _usedFilter;

  @action
  void setMunicipios(List<ServidorModel> municipios) {
    _municipios = municipios.asObservable();
  }

  @action
  void setLoading({required bool value}) {
    _loading = value;

    if (value) {
      _hasError = false;
      _hasInternet = true;
    }
  }

  @action
  void setHasInternet({required bool value}) {
    _hasInternet = value;
  }

  @action
  void setHasError({required bool value}) {
    _hasError = value;
  }

  @action
  void setSearchFilter(String? filter) {
    _searchFilter = filter;
  }

  @action
  void isUsedFilter({bool value = true}) {
    _usedFilter = value;
  }

  @action
  void resetPage() {
    _loading = false;
    _hasInternet = true;
    _hasError = false;
    _searchFilter = null;
    _usedFilter = false;
  }
}
