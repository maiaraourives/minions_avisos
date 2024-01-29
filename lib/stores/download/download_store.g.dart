// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DownloadStore on _DownloadStore, Store {
  Computed<int>? _$progressComputed;

  @override
  int get progress => (_$progressComputed ??=
          Computed<int>(() => super.progress, name: '_DownloadStore.progress'))
      .value;
  Computed<int>? _$totalComputed;

  @override
  int get total => (_$totalComputed ??=
          Computed<int>(() => super.total, name: '_DownloadStore.total'))
      .value;
  Computed<double>? _$progressPercentComputed;

  @override
  double get progressPercent => (_$progressPercentComputed ??= Computed<double>(
          () => super.progressPercent,
          name: '_DownloadStore.progressPercent'))
      .value;

  late final _$_progressAtom =
      Atom(name: '_DownloadStore._progress', context: context);

  @override
  int get _progress {
    _$_progressAtom.reportRead();
    return super._progress;
  }

  @override
  set _progress(int value) {
    _$_progressAtom.reportWrite(value, super._progress, () {
      super._progress = value;
    });
  }

  late final _$_totalAtom =
      Atom(name: '_DownloadStore._total', context: context);

  @override
  int get _total {
    _$_totalAtom.reportRead();
    return super._total;
  }

  @override
  set _total(int value) {
    _$_totalAtom.reportWrite(value, super._total, () {
      super._total = value;
    });
  }

  late final _$_DownloadStoreActionController =
      ActionController(name: '_DownloadStore', context: context);

  @override
  void setProgress(int progress) {
    final _$actionInfo = _$_DownloadStoreActionController.startAction(
        name: '_DownloadStore.setProgress');
    try {
      return super.setProgress(progress);
    } finally {
      _$_DownloadStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotal(int total) {
    final _$actionInfo = _$_DownloadStoreActionController.startAction(
        name: '_DownloadStore.setTotal');
    try {
      return super.setTotal(total);
    } finally {
      _$_DownloadStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetState() {
    final _$actionInfo = _$_DownloadStoreActionController.startAction(
        name: '_DownloadStore.resetState');
    try {
      return super.resetState();
    } finally {
      _$_DownloadStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
progress: ${progress},
total: ${total},
progressPercent: ${progressPercent}
    ''';
  }
}
