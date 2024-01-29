// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NetworkStore on _NetworkStore, Store {
  Computed<bool>? _$hasInternetComputed;

  @override
  bool get hasInternet =>
      (_$hasInternetComputed ??= Computed<bool>(() => super.hasInternet,
              name: '_NetworkStore.hasInternet'))
          .value;

  late final _$_hasInternetAtom =
      Atom(name: '_NetworkStore._hasInternet', context: context);

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

  late final _$_NetworkStoreActionController =
      ActionController(name: '_NetworkStore', context: context);

  @override
  void setHasInternet({required bool value}) {
    final _$actionInfo = _$_NetworkStoreActionController.startAction(
        name: '_NetworkStore.setHasInternet');
    try {
      return super.setHasInternet(value: value);
    } finally {
      _$_NetworkStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasInternet: ${hasInternet}
    ''';
  }
}
