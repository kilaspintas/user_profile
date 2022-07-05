import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_profile/Page/profile_edit_ui.dart';


initialNotification() async{
  final notif = FirebaseMessaging.instance;
  final tutup = await notif.getInitialMessage();
  try{
    if(Platform.isIOS){
      await notif.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      await notif.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      //foreground
      FirebaseMessaging.onMessage.listen(_onMessage);
      //background
      FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
      //terminated
      if(tutup != null) {
        print(tutup.notification!.title);
        print(tutup.notification!.body);
        //var _routeName = tutup.data['route'];
        //Get.to(ProfileUI());
      }
      //open
      FirebaseMessaging.onMessageOpenedApp.listen(_onOpened) ;
    }
  } catch (e) {
    debugPrint.toString();
  }
}

void _onMessage (RemoteMessage message) {
  if(message.notification != null) {
    print(message.notification?.title);
    print(message.notification?.body);
  }
}

Future<void> _onBackgroundMessage(RemoteMessage message) async{
  if(message.notification != null) {
    print(message.notification?.title);
    print(message.notification?.body);
  }
}

void _onOpened(RemoteMessage message) {
  print(message.notification?.title);
  print(message.notification?.body);
  //var _routeName = message.data['route'];
  Get.to(ProfileUI());
}