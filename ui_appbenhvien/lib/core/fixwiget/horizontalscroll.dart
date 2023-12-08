import 'package:flutter/material.dart';
import 'package:ui_appbenhvien/core/app_export.dart';

class HorizontalScroll extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  final Widget child;
  final int startup;
  HorizontalScroll({super.key, this.startup = 0, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (startup == 0 || MediaQuery.of(context).size.width < startup) {
          final newScrollOffset =
              scrollController.offset - (details.delta.dx * 0.8);
          scrollController.jumpTo(newScrollOffset);
        }
      },
      child: SingleChildScrollView(
        controller: DeviceSize.SizeDeviceMobileWeb()? null : scrollController,
        scrollDirection: Axis.horizontal,
        child: child,
      ),
    );
  }
}
