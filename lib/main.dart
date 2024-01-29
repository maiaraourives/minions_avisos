import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'configs/constants.dart';
import 'configs/routes/local_routes.dart';
import 'configs/themes/theme_app.dart';
import 'firebase_options.dart';
import 'models/sessao/sessao_model.dart';
import 'router_app.dart';
import 'services/firebase_messaging_service.dart';
import 'services/navigation_service.dart';
import 'services/notification_service.dart';
import 'services/service_locator.dart';
import 'widgets/no_glow_effect.dart';

final routeObserver = RouteObserver<PageRoute>();

// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    setupServiceLocator();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    
    await FirebaseMessagingService().initialize();

    //Bloqueia a orientação do dispositivo como "Somente Retrato"
    SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.portraitUp,
    ]);

    LicenseRegistry.addLicense(() async* {
      final kleeOneLicence = await rootBundle.loadString('fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], kleeOneLicence);
    });

    ErrorWidget.builder = (errorDetails) => const RotaErrorWidgetView();

    runApp(const MinionsAvsisos());
  }, (error, stackTrack) {});
}

class MinionsAvsisos extends StatefulWidget {
  const MinionsAvsisos({Key? key}) : super(key: key);

  @override
  State<MinionsAvsisos> createState() => _MinionsAvsisosState();
}

class _MinionsAvsisosState extends State<MinionsAvsisos> {
  @override
  void initState() {
    super.initState();

    NotificationService.initialize();
    NotificationService.checkForNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: App.NAME,
          themeMode: ThemeMode.light,
          theme: getIt<SessaoModel>().configuracoes.isDarkTheme ? ThemeApp.darkTheme : ThemeApp.lightTheme,
          color: Colors.white,
          navigatorKey: getIt<NavigationService>().navigatorKey,
          navigatorObservers: [routeObserver],
          builder: (context, child) {
            if (!getIt.isRegistered<BuildContext>()) {
              getIt.registerSingleton<BuildContext>(context);
            }

            return ScrollConfiguration(
              behavior: const NoGlowEffect(),
              child: child!,
            );
          },
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          supportedLocales: const [Locale('pt', 'BR')],
          initialRoute: LocalRoutes.SPLASH_SCREEN,
          onGenerateRoute: RouterApp.onGenerateRoute,
        );
      },
    );
  }
}
