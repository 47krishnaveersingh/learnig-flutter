import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name = "Krishnaveer Singh";
  final int n = 47;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog app"),
      ),
      body: Center(
        child: Text("My name is $name and my roll no is $n"),
      ),
      drawer: Drawer(),
    );
  }
}
