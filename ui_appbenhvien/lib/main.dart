import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:ui_appbenhvien/view/trangchu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Comfortaa'),
      title: 'Flutter Demo',
      home: trangchuPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isWebMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
    return Scaffold(
      appBar: AppBar(
        title: Text('Platform Detection Example thang'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Running on Web: $isWebMobile'),
          ],
        ),
      ),
    );
  }
}
