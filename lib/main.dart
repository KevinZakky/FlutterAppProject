import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modul2/app/modules/home/controllers/AuthenticationController.dart';
import 'package:modul2/app/modules/home/controllers/notification_handler.dart';
import 'package:modul2/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthenticationController());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseMessagingHandler().initPushNotification();
  await FirebaseMessagingHandler().initLocalNotification();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.IntroRoute,
      getPages: AppPages.routes,
    ),
  );
}
