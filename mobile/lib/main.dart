import 'package:flutter/material.dart';
import 'package:mobile/features/widgets/screen_main.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
	primaryColor: Colors.blue,
      ),
      home: ScreenMain(),
      debugShowCheckedModeBanner: false,
    );
  }
}
