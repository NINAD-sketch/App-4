import 'package:assignment_4/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFF964DEF, <int, Color>{
          50: Color(0xFFE5D8FF),
          100: Color(0xFFB2A3FF),
          200: Color(0xFF7E6FFF),
          300: Color(0xFF4B3CFF),
          400: Color(0xFF2A1FFF),
          500: Color(0xFF964DEF),
          600: Color(0xFF7A2BFF),
          700: Color(0xFF5E1FFF),
          800: Color(0xFF4B1FFF),
          900: Color(0xFF2A1FFF),
        }),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      title: 'Fun Multi-Feature App',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
