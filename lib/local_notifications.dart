import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class LocalnotificationsFlutter {
  LocalnotificationsFlutter();
final BehaviorSubject<LocalnotificationsFlutter> didReceiveLocalNotificationSubject =
    BehaviorSubject<LocalnotificationsFlutter>();
final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();
  final _localnotificationsFlutter = FlutterLocalNotificationsPlugin();
  

  Future<void> intialize() async {
    tz.initializeTimeZones();
    
    const AndroidInitializationSettings androidsettings =
        AndroidInitializationSettings('@drawable/ic_stat_adhan');
    DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );
    final InitializationSettings settings = InitializationSettings(
        android: androidsettings, iOS: initializationSettingsDarwin);
    await _localnotificationsFlutter.initialize(settings,
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  Future<NotificationDetails> notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id', 'channel_name',
            channelDescription: 'description',
            playSound: true,
            sound: RawResourceAndroidNotificationSound('adhan'),
            importance: Importance.max,
            priority: Priority.max);
    const DarwinNotificationDetails iosnotificationdeta =
        DarwinNotificationDetails();
    return const NotificationDetails(
        android: androidNotificationDetails, iOS: iosnotificationdeta);
  }

  Future<void> shownotification({
    required int id,
    required String body,
    required String title,
  }) async {
    final details = await notificationDetails();
    
    _localnotificationsFlutter.show(id, title, body, details);
  }

  Future<void> schedulnotification(
    DateTime? time, {
    required int id,
    required String body,
    required String title,
  }) async {
    final details = await notificationDetails();

    _localnotificationsFlutter.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
          time??DateTime.parse('2024-01-11T14:55:00+03:00'),
            tz.local),
        details,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  @pragma('vm:entry-point')
  static void notificationTapBackground(
      NotificationResponse notificationResponse) {}

  static void onDidReceiveNotificationResponse(NotificationResponse details) {}

  void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {}
}
