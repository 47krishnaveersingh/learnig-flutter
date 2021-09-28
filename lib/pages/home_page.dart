import 'package:flutter/material.dart';
import 'package:initial/models/catalog.dart';
import 'package:initial/widgets/drawer.dart';
import 'package:initial/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final String name = "Krishnaveer Singh";
  final int n = 47;

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(4, (index) => CatalogModel.products[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog app"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: dummyList[index]);
        },
      ),
      drawer: const MyDrawer(),
    );
  }
}
