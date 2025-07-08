import 'package:flutter/material.dart';
import 'package:yes_no_app/core/theme/app_theme.dart' show AppTheme;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 3).theme(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Center(
          child: FilledButton.tonal(
            onPressed: () {},
            child: const Text("Click Me"),
          ),
        ),
      ),
    );
  }
}
