import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'navigation_service.dart';
import 'service_locator.dart';

class NotificationService {
  static final notifications = FlutterLocalNotificationsPlugin();

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    const notificationDeteils = NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        importance: Importance.max,
        priority: Priority.high,
        enableVibration: true,
        styleInformation: BigTextStyleInformation(''),
      ),
      iOS: DarwinNotificationDetails(),
    );

    notifications.show(
      id,
      title,
      body,
      notificationDeteils,
      payload: payload,
    );
  }

  static Future<void> initialize() async {
    const android = AndroidInitializationSettings('@drawable/ic_launcher_foreground.png');
    const ios = DarwinInitializationSettings();
    const initSettings = InitializationSettings(android: android, iOS: ios);

    await notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (payload) => _onSelectNotification(payload.payload),
    );
  }

  static void _onSelectNotification(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      getIt<NavigationService>().pushNamed(payload.toString());
    }
  }

  static Future<void> checkForNotifications() async {
    final details = await notifications.getNotificationAppLaunchDetails();

    if (details != null && details.didNotificationLaunchApp) {}
  }
}
