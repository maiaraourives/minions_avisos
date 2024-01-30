import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Lidando com uma mensagem em segundo plano: ${message.messageId}');

  debugPrint('Dados da mensagem: ${message.data}');
  debugPrint('Notificação: ${message.notification}');

  String title = message.notification?.title ?? '';
  String body = message.notification?.body ?? '';

  if (title.isNotEmpty || body.isNotEmpty) {
    await _saveNotificationToDatabase(title, body);
  } else {
    debugPrint('Notificação ignorada porque tanto o título quanto o corpo são nulos ou vazios.');
  }
}

Future<void> initializeFirebase() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint('Firebase inicializado com sucesso');
  } catch (e) {
    debugPrint('Erro ao inicializar o Firebase: $e');
  }
}

Future<void> _saveNotificationToDatabase(String title, String body) async {
  try {
    if (Firebase.apps.isEmpty) {
      // Certifique-se de que o Firebase foi inicializado
      await initializeFirebase();
    }

    if (title.isNotEmpty || body.isNotEmpty) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      DocumentReference documentReference = await firestore.collection('notificacoesNaoVisualizadas').add({
        'title': title,
        'body': body,
        'timestamp': FieldValue.serverTimestamp(),
      });

      debugPrint('Notificação salva no Firestore com ID: ${documentReference.id}');
    } else {
      debugPrint('Notificação ignorada porque tanto o título quanto o corpo são nulos ou vazios.');
    }
  } catch (e) {
    debugPrint('Erro ao salvar notificação no Firestore: $e');
  }
}

void main() {
  runZonedGuarded(() async {
    await initializeFirebase();

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      FlutterError.presentError(details);
    };

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    setupServiceLocator();

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
  const MinionsAvsisos({super.key});

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
