
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initializeNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings = InitializationSettings(
      android: androidSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification() async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'hello_channel',
        'Hello Notifications',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Hello',
      'This is your notification message!',
      notificationDetails,
      payload: 'Hello Notification Payload',
    );
  }

  Future<void> showPaymentNotification() async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'payment_channel',
        'Payment Notifications',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Payment Failed',
      'No payment found, please check your profile.',
      notificationDetails,
      payload: 'Payment Notification Payload',
    );
  }
}
