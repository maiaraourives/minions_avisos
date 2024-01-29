import 'package:avisos_pendecias/stores/minions/minios_store.dart';
import 'package:get_it/get_it.dart';

import '../models/sessao/sessao_model.dart';
import '../stores/download/download_store.dart';
import '../stores/network/network_store.dart';
import '../stores/servidores/servidores_store.dart';
import 'navigation_service.dart';

final getIt = GetIt.instance;

///Registra todas as [Stores] utilizadas pelo app
setupServiceLocator({bool firstTime = true}) {
  _registerSingleton<NavigationService>(
    instance: NavigationService(),
    allowAgain: false,
    firstTime: firstTime,
  );

  _registerSingleton<SessaoModel>(
    instance: SessaoModel(),
    allowAgain: true,
    firstTime: firstTime,
  );

  _registerLazySingleton<ServidoresStore>(
    instance: ServidoresStore(),
    allowAgain: false,
    firstTime: firstTime,
  );

  _registerSingleton<NetworkStore>(
    instance: NetworkStore(),
    allowAgain: false,
    firstTime: firstTime,
  );

  _registerSingleton<DownloadStore>(
    instance: DownloadStore(),
    allowAgain: false,
    firstTime: firstTime,
  );
  
  _registerSingleton<Listas>(
    instance: Listas(),
    allowAgain: false,
    firstTime: firstTime,
  );
}

void _registerSingleton<T extends Object>({
  required T instance,
  required bool allowAgain,
  required bool firstTime,
}) {
  if (!allowAgain) {
    if (!firstTime) {
      return;
    }
  }

  getIt.registerSingleton<T>(instance);
}

void _registerLazySingleton<T extends Object>({
  required T instance,
  required bool allowAgain,
  required bool firstTime,
}) {
  if (!allowAgain) {
    if (!firstTime) {
      return;
    }
  }

  getIt.registerSingleton<T>(instance);
}
