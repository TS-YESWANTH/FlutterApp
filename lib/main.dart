import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 30;
    return MaterialApp(
      themeMode: ThemeMode.light, // Change themeMode to dark for a dark theme.
      theme: ThemeData(primarySwatch: Colors.green), // Light theme
      darkTheme: ThemeData(
        primarySwatch: Colors.green, // Dark theme
        brightness: Brightness.dark,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => const HomePage(),
        "/login": (context) => LoginPage()
      },
    );
  }
}
