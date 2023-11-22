import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/ui/ui_config.dart';

import 'app/views/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: UiConfig.title,
      theme: UiConfig.theme,
      home: const LoginView(),
    );
  }
}

