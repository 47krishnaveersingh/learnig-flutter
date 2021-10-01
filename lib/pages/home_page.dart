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
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    final products = decodeData["products"];
    CatalogModel.items =
        List.from(products).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog app"),
      ),
      body: (CatalogModel.items.isNotEmpty)
          ? GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 8),
              itemBuilder: (context, index) {
                final item = CatalogModel.items[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  clipBehavior: Clip.antiAlias,
                  child: GridTile(
                    header: Container(
                      alignment: Alignment.center,
                      height: 32,
                      child: Text(
                        item.name,
                        textScaleFactor: 1.03,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      decoration: const BoxDecoration(color: Colors.deepPurple),
                    ),
                    child: Image.network(item.image),
                    footer: Container(
                      padding: const EdgeInsets.all(3),
                      height: 32,
                      child: Text(
                        "\$${item.price.toString()}",
                        textScaleFactor: 1.06,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      decoration: const BoxDecoration(color: Colors.black),
                    ),
                  ),
                );
              },
              itemCount: CatalogModel.items.length,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const MyDrawer(),
    );
  }
}
