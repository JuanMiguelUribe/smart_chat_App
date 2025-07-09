import 'package:flutter/material.dart';
import 'package:yes_no_app/core/theme/app_theme.dart' show AppTheme;
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 8).theme(),
      home: ChatScreen(),
    );
  }
}
