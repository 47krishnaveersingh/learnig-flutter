import 'package:flutter/material.dart';
import 'package:initial/widgets/drawer.dart';

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
        child: Container(
          color: Colors.green,
          padding: EdgeInsets.all(20),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
