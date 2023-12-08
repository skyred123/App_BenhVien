// Flutter imports:
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ui_appbenhvien/view/videocall/customAvatarBuilder.dart';

// Package imports:
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

// Project imports:

class CallPage extends StatefulWidget {
  final int call_id;
  final String user_ID;
  final String user_Name;
  const CallPage({Key? key, required this.call_id, required this.user_ID, required this.user_Name}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CallPageState();
}

class CallPageState extends State<CallPage> {
  ZegoUIKitPrebuiltCallController? callController;

  @override
  void initState() {
    super.initState();
    callController = ZegoUIKitPrebuiltCallController();
  }

  @override
  void dispose() {
    super.dispose();

    callController = null;
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map<String, String>;
    final callID = arguments[widget.call_id] ?? '';

    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
         appID: 31260134 /*input your AppID*/,
        appSign: '5e6db6962d778b564b72ba521080aa833544ddd608fc535e3f114fd5bb87ddae' /*input your AppSign*/,
        userID: widget.user_ID ,
        userName: widget.user_Name,
        callID: callID,
        controller: callController,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()

          /// support minimizing
          ..topMenuBarConfig.isVisible = true
          ..topMenuBarConfig.buttons = [
            ZegoMenuBarButtonName.minimizingButton,
            ZegoMenuBarButtonName.showMemberListButton,
          ]
          ..avatarBuilder = customAvatarBuilder

          ///
          ..onOnlySelfInRoom = (context) {
            if (PrebuiltCallMiniOverlayPageState.idle !=
                ZegoUIKitPrebuiltCallMiniOverlayMachine().state()) {
              /// now is minimizing state, not need to navigate, just switch to idle
              ZegoUIKitPrebuiltCallMiniOverlayMachine().switchToIdle();
            } else {
              Navigator.of(context).pop();
            }
          },
      ),
    );
  }
}
