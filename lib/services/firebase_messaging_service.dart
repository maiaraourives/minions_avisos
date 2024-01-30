import 'package:cloud_firestore/cloud_firestore.dart';
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

  void _handleMessage(RemoteMessage message) async {
    try {
      final String route = message.data['route'] ?? '';
      final String title = message.notification?.title ?? 'Title';
      final String body = message.notification?.body ?? 'Body';

      // Obter dados personalizados da notificação
      final Map<String, dynamic> notificationData = message.data;

      // Salvar a notificação no banco de dados Firestore aqui
      await _saveNotificationToDatabase(title, body, notificationData);

      // Agora, mostrar o diálogo ou realizar outras ações, se necessário
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
    } catch (e) {
      debugPrint('Erro ao lidar com a notificação: $e');
    }
  }

  _saveNotificationToDatabase(String title, String body, Map<String, dynamic> notificationData) async {
    try {
      // Acesse a instância do Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Crie um novo documento com um ID automático
      DocumentReference documentReference = await firestore.collection('notificacoesVisualizadas').add({
        'title': title,
        'body': body,
        'timestamp': FieldValue.serverTimestamp(),
      });

      debugPrint('Notificação salva no Firestore com ID: ${documentReference.id}');
    } catch (e) {
      debugPrint('Erro ao salvar notificação no Firestore: $e');
    }
  }
}
