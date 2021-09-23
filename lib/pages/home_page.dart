import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name = "Krishnaveer Singh";
  final int n = 47;

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog app"),
      ),
      body: Center(
        child: Text("My name is $name and my roll no is $n"),
      ),
      drawer: const Drawer(),
    );
  }
}
