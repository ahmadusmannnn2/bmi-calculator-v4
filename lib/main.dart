import 'package:flutter/material.dart';
import 'package:myapp/screens/gender_screen.dart';
import 'package:myapp/utils/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: themeNotifier,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDark ? ThemeData.dark() : ThemeData.light(),
          home: const GenderScreen(),
        );
      },
    );
  }
}
