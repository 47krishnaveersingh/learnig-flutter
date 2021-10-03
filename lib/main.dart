import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:initial/pages/cart_page.dart';
import 'package:initial/pages/home_page.dart';
import 'package:initial/pages/login_page.dart';
import 'package:initial/utils/routes.dart';
import 'package:initial/widgets/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.light,
      darkTheme: MyTheme.darkTheme,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.cartRoute: (context) => const Cart(),
      },
    );
  }
}
