import 'package:flutter/material.dart';
import 'package:sms_bombing/screens/FuturePromotionHomeUI.dart';
import 'package:sms_bombing/screens/PromotionHomeUI.dart';
import 'package:sms_bombing/screens/Transactional24HHomeUI.dart';
import 'package:sms_bombing/utils/components.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    systemColors();
    return MaterialApp(
      title: 'Transactional 24H SMS Bomb',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: Transactional24HHomeUI(),
    );
  }
}
