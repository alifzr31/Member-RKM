import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotif {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher_foreground');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> showNotifications({id, title, body, payload, imageUrl}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'your channel id',
      'Local Notification',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      fullScreenIntent: false,
      // largeIcon: imageUrl == null
      //     ? null
      //     : FilePathAndroidBitmap(
      //         await Image.saveImage(await Image.downloadImage(imageUrl))),
      // styleInformation: imageUrl == null
      //     ? null
      //     : BigPictureStyleInformation(
      //         FilePathAndroidBitmap(
      //             await Image.saveImage(await Image.downloadImage(imageUrl))),
      //         contentTitle: title,
      //         summaryText: body,
      //         hideExpandedLargeIcon: true,
      //       ),
    );

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }
}
