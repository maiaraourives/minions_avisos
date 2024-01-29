// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeState on _HomeState, Store {
  Computed<List<MinionsModel>>? _$listaMinionsComputed;

  @override
  List<MinionsModel> get listaMinions => (_$listaMinionsComputed ??=
          Computed<List<MinionsModel>>(() => super.listaMinions,
              name: '_HomeState.listaMinions'))
      .value;

  late final _$_listaMinionsAtom =
      Atom(name: '_HomeState._listaMinions', context: context);

  @override
  ObservableList<MinionsModel> get _listaMinions {
    _$_listaMinionsAtom.reportRead();
    return super._listaMinions;
  }

  @override
  set _listaMinions(ObservableList<MinionsModel> value) {
    _$_listaMinionsAtom.reportWrite(value, super._listaMinions, () {
      super._listaMinions = value;
    });
  }

  late final _$_HomeStateActionController =
      ActionController(name: '_HomeState', context: context);

  @override
  void setMinions(List<MinionsModel> minions) {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.setMinions');
    try {
      return super.setMinions(minions);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaMinions: ${listaMinions}
    ''';
  }
}
