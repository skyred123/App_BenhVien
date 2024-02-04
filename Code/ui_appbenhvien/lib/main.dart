// ignore: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:ui_appbenhvien/view/chat/constants.dart';
import 'package:ui_appbenhvien/view/chat/notification.dart';
import 'package:ui_appbenhvien/view/chat/utils.dart';
import 'package:ui_appbenhvien/view/taikhoan/dang_nhap.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

final navigatorKey = GlobalKey<NavigatorState>();

const int yourAppID = 544254258;
const String yourAppSign = "b0b62b01f71670fefa635c3d478e9a87ead9efbf98670010aa47abdd1de13f81";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final cacheUserID = prefs.get(cacheUserIDKey) as String? ?? '';
  if (cacheUserID.isNotEmpty) {
    currentUser.id = cacheUserID;
    currentUser.name = randomName(key: cacheUserID);
  }

  /// init ZIMKit
  await ZIMKit().init(
    appID: yourAppID /*input your AppID*/,
    appSign: yourAppSign /*input your AppSign*/,
    notificationConfig: ZegoZIMKitNotificationConfig(
      resourceID: 'zego_data_zim',
      androidNotificationConfig: ZegoZIMKitAndroidNotificationConfig(
        channelID: 'ZIM Message',
        channelName: 'Message',
        sound: 'message',
        icon: 'message',
      ),
    ),
  );

  /// set navigator key to ZegoUIKitPrebuiltCallInvitationService
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  ZegoUIKit().initLog().then((value) {
    /// style of offline call
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );

    runApp(const MyApp());
  });

  NotificationManager().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Comfortaa'),
      title: 'Flutter Demo',
      home: const DangNhapPage(),
    );
  }
}

/// on App's user login
void onUserLogin(String id, String name) {
  /// initialized ZegoUIKitPrebuiltCallInvitationService
  /// when app's user is logged in or re-logged in
  /// We recommend calling this method as soon as the user logs in to your app.
  ZegoUIKitPrebuiltCallInvitationService().init(
    appID: yourAppID /*input your AppID*/,
    appSign: yourAppSign /*input your AppSign*/,
    userID: id,
    userName: name,
    plugins: [ZegoUIKitSignalingPlugin()],
    androidNotificationConfig: ZegoAndroidNotificationConfig(
      /// call notification
      channelID: 'ZegoUIKit',
      channelName: 'Call Notifications',
      sound: 'call',
      icon: 'call',

      /// message notification
      messageChannelID: 'Message',
      messageChannelName: 'Message',
      messageSound: 'message',
      messageIcon: 'message',
    ),
  );
}

/// on App's user logout
void onUserLogout() {
  /// de-initialization ZegoUIKitPrebuiltCallInvitationService
  /// when app's user is logged out
  ZegoUIKitPrebuiltCallInvitationService().uninit();
}