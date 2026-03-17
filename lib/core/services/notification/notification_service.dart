import 'package:ecommerce_apple_tech_app/features/notification/data/models/notification_model.dart';
import 'package:ecommerce_apple_tech_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotif =
      FlutterLocalNotificationsPlugin();

  final NotificationRepository _repository;

  NotificationService(this._repository);

  Future<void> init() async {
    await _fcm.requestPermission(alert: true, sound: true, badge: true);

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings();

    await _localNotif.initialize(
      settings: const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    await _localNotif
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            'promo_chanel',
            'Promo and discount',
            importance: .high,
          ),
        );

    _listenForeground();
    _listenBackground();
    _checkInitialMessage();
  }

  void _listenForeground() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint('🔔 Foreground message: ${message.notification?.title}');

      await _saveToFirestore(message);
      _showLocalNotification(message);
    });
  }

  void _listenBackground() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      await _saveToFirestore(message);
    });
  }

  void _checkInitialMessage() {
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        await _saveToFirestore(message);
      }
    });
  }

  Future<void> _saveToFirestore(RemoteMessage message) async {
    final model = NotificationModel(
      id: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      createdAt: DateTime.now(),
    );

    await _repository.saveNotification(model);
  }

  void _showLocalNotification(RemoteMessage message) {
    final notification = message.notification;
    if (notification == null) return;

    _localNotif.show(
      id: notification.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'promo_chanel',
          'Promo and discount',
          importance: .high,
          priority: .high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  void _onNotificationTap(NotificationResponse response) {}

  Future<String?> getToken() => _fcm.getToken();
}
