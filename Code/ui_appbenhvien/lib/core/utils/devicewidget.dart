// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui' as ui;

class DeviceWidget extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  // ignore: use_key_in_widget_constructors
  const DeviceWidget({required this.mobile, required this.desktop});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) {
        return mobile;
      } else {
        return desktop;
      }
    });
  }
}

class DeviceSize {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static bool SizeDeviceMobileWeb() {
    if (kIsWeb) {
      if (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android) {
        return true;
      }
      
      return false;
    }
    return true;
  }
}
