import 'package:flutter/material.dart';
import 'package:initial/pages/home_page.dart';
import 'package:initial/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        "/": (context) => const LoginPage(),
        "/login": (context) => const LoginPage()
      },
    );
  }
}
