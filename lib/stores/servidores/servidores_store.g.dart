// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servidores_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServidoresStore on _ServidoresStore, Store {
  Computed<List<ServidorModel>>? _$municipiosComputed;

  @override
  List<ServidorModel> get municipios => (_$municipiosComputed ??=
          Computed<List<ServidorModel>>(() => super.municipios,
              name: '_ServidoresStore.municipios'))
      .value;
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_ServidoresStore.loading'))
      .value;
  Computed<bool>? _$hasInternetComputed;

  @override
  bool get hasInternet =>
      (_$hasInternetComputed ??= Computed<bool>(() => super.hasInternet,
              name: '_ServidoresStore.hasInternet'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_ServidoresStore.hasError'))
          .value;
  Computed<String?>? _$searchFilterComputed;

  @override
  String? get searchFilter =>
      (_$searchFilterComputed ??= Computed<String?>(() => super.searchFilter,
              name: '_ServidoresStore.searchFilter'))
          .value;
  Computed<bool>? _$usedFilterComputed;

  @override
  bool get usedFilter =>
      (_$usedFilterComputed ??= Computed<bool>(() => super.usedFilter,
              name: '_ServidoresStore.usedFilter'))
          .value;

  late final _$_municipiosAtom =
      Atom(name: '_ServidoresStore._municipios', context: context);

  @override
  ObservableList<ServidorModel> get _municipios {
    _$_municipiosAtom.reportRead();
    return super._municipios;
  }

  @override
  set _municipios(ObservableList<ServidorModel> value) {
    _$_municipiosAtom.reportWrite(value, super._municipios, () {
      super._municipios = value;
    });
  }

  late final _$_loadingAtom =
      Atom(name: '_ServidoresStore._loading', context: context);

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$_hasInternetAtom =
      Atom(name: '_ServidoresStore._hasInternet', context: context);

  @override
  bool get _hasInternet {
    _$_hasInternetAtom.reportRead();
    return super._hasInternet;
  }

  @override
  set _hasInternet(bool value) {
    _$_hasInternetAtom.reportWrite(value, super._hasInternet, () {
      super._hasInternet = value;
    });
  }

  late final _$_hasErrorAtom =
      Atom(name: '_ServidoresStore._hasError', context: context);

  @override
  bool get _hasError {
    _$_hasErrorAtom.reportRead();
    return super._hasError;
  }

  @override
  set _hasError(bool value) {
    _$_hasErrorAtom.reportWrite(value, super._hasError, () {
      super._hasError = value;
    });
  }

  late final _$_searchFilterAtom =
      Atom(name: '_ServidoresStore._searchFilter', context: context);

  @override
  String? get _searchFilter {
    _$_searchFilterAtom.reportRead();
    return super._searchFilter;
  }

  @override
  set _searchFilter(String? value) {
    _$_searchFilterAtom.reportWrite(value, super._searchFilter, () {
      super._searchFilter = value;
    });
  }

  late final _$_usedFilterAtom =
      Atom(name: '_ServidoresStore._usedFilter', context: context);

  @override
  bool get _usedFilter {
    _$_usedFilterAtom.reportRead();
    return super._usedFilter;
  }

  @override
  set _usedFilter(bool value) {
    _$_usedFilterAtom.reportWrite(value, super._usedFilter, () {
      super._usedFilter = value;
    });
  }

  late final _$_ServidoresStoreActionController =
      ActionController(name: '_ServidoresStore', context: context);

  @override
  void setMunicipios(List<ServidorModel> municipios) {
    final _$actionInfo = _$_ServidoresStoreActionController.startAction(
        name: '_ServidoresStore.setMunicipios');
    try {
      return super.setMunicipios(municipios);
    } finally {
      _$_ServidoresStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading({required bool value}) {
    final _$actionInfo = _$_ServidoresStoreActionController.startAction(
        name: '_ServidoresStore.setLoading');
    try {
      return super.setLoading(value: value);
    } finally {
      _$_ServidoresStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasInternet({required bool value}) {
    final _$actionInfo = _$_ServidoresStoreActionController.startAction(
        name: '_ServidoresStore.setHasInternet');
    try {
      return super.setHasInternet(value: value);
    } finally {
      _$_ServidoresStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasError({required bool value}) {
    final _$actionInfo = _$_ServidoresStoreActionController.startAction(
        name: '_ServidoresStore.setHasError');
    try {
      return super.setHasError(value: value);
    } finally {
      _$_ServidoresStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchFilter(String? filter) {
    final _$actionInfo = _$_ServidoresStoreActionController.startAction(
        name: '_ServidoresStore.setSearchFilter');
    try {
      return super.setSearchFilter(filter);
    } finally {
      _$_ServidoresStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isUsedFilter({bool value = true}) {
    final _$actionInfo = _$_ServidoresStoreActionController.startAction(
        name: '_ServidoresStore.isUsedFilter');
    try {
      return super.isUsedFilter(value: value);
    } finally {
      _$_ServidoresStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPage() {
    final _$actionInfo = _$_ServidoresStoreActionController.startAction(
        name: '_ServidoresStore.resetPage');
    try {
      return super.resetPage();
    } finally {
      _$_ServidoresStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
municipios: ${municipios},
loading: ${loading},
hasInternet: ${hasInternet},
hasError: ${hasError},
searchFilter: ${searchFilter},
usedFilter: ${usedFilter}
    ''';
  }
}
