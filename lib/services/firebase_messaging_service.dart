import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'navigation_service.dart';
import 'service_locator.dart';

class FirebaseMessagingService {
  Future<void> initialize() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      badge: true,
      sound: true,
      alert: true,
    );

    _onMessage();
    _onMessageOpenedApp();
  }

  Future<String> getToken() async {
    final token = await FirebaseMessaging.instance.getToken(vapidKey: '1047660756029');

    debugPrint('=======================================');
    debugPrint('TOKEN: $token');
    debugPrint('=======================================');

    return token ?? '';
  }

  void _onMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      _handleMessage(message);
    });
  }

  _onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleMessage(message);
    });
  }

  _handleMessage(RemoteMessage message) {
    final String route = message.data['route'] ?? '';
    final String title = message.notification?.title ?? 'Title';
    final String body = message.notification?.body ?? 'Body';

    showDialog(
      context: getIt<NavigationService>().navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    if (route.isNotEmpty) {
      getIt<NavigationService>().pushNamed(route);
    }
  }
}
