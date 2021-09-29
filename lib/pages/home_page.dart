import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:initial/models/catalog.dart';
import 'package:initial/widgets/drawer.dart';
import 'package:initial/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "Krishnaveer Singh";

  final int n = 47;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    final products = decodeData["products"];
    print(products);
  }

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
