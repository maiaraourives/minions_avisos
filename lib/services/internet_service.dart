import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../stores/network/network_store.dart';
import 'dialog_service.dart';
import 'service_locator.dart';

StreamSubscription? _networkState;

///Verifica se o dispositivo está conectado a uma rede `WI-FI` ou `DADOS MÓVEIS`
Future<bool> hasInternet() async {
  ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    //Há conexão
    return true;
  } else if (connectivityResult == ConnectivityResult.none) {
    //Sem conexão
    return false;
  }

  return false;
}

Future<bool> isConnection3G() async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  return connectivityResult == ConnectivityResult.mobile;
}

void connectivityListen() {
  final network = getIt<NetworkStore>();

  _networkState = Connectivity().onConnectivityChanged.listen((state) {
    try {
      switch (state) {
        case ConnectivityResult.mobile:
          showSnackbar('O aplicativo está utilizando dados móveis');
          network.setHasInternet(value: true);
          return;
        case ConnectivityResult.wifi:
          network.setHasInternet(value: true);
          return;
        case ConnectivityResult.none:
        default:
          network.setHasInternet(value: false);
          showSnackbar('A conexão com a internet foi perdida');
          break;
      }
    } catch (_) {
      network.setHasInternet(value: false);
    }
  });
}

void stopConnectivityListen() {
  _networkState?.cancel();
}
