// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'download_store.g.dart';

class DownloadStore = _DownloadStore with _$DownloadStore;

abstract class _DownloadStore with Store {
  @observable
  int _progress = 0;

  @observable
  int _total = 0;

  @computed
  int get progress => _progress;

  @computed
  int get total => _total;

  @computed
  double get progressPercent {
    double percent = ((_progress * 100) / _total) / 100;

    if (percent.isNaN || percent.isInfinite) {
      return 0;
    }

    return percent.abs();
  }

  @action
  void setProgress(int progress) {
    _progress = progress;
  }

  @action
  void setTotal(int total) {
    _total = total;
  }

  @action
  void resetState() {
    _progress = 0;
    _total = 0;
  }
}
