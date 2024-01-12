import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:member_rkm/app/core/utils/configs/firebase_options.dart';
import 'package:member_rkm/app/core/utils/firebase_notif.dart';
import 'package:member_rkm/app/core/utils/local_notif.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/routes/pages.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final LocalNotif localNotif = LocalNotif();

  localNotif.showNotifications(
    id: message.notification.hashCode,
    title: message.notification?.title,
    body: message.notification?.body,
    payload: message.data.toString(),
    imageUrl: message.notification?.android?.imageUrl,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseNotif firebaseNotif = FirebaseNotif();
  LocalNotif localNotif = LocalNotif();

  await localNotif.init();
  await localNotif.requestIOSPermissions();
  firebaseNotif.firebaseInit();
  await firebaseNotif.requestNotificationPermission();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );

  initializeDateFormatting('id_ID');
  Intl.defaultLocale = 'id_ID';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RKM',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
        fontFamily: 'Maison Neue',
        colorScheme: ColorScheme.fromSeed(
          seedColor: orangeColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: baseBgScaffold,
        fontFamily: 'Maison Neue',
        colorScheme: const ColorScheme.dark(
          primary: whiteColor,
          secondary: whiteColor,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: whiteColor)),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      defaultTransition: Transition.cupertino,
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
