import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:initial/pages/cart_page.dart';
import 'package:initial/utils/routes.dart';
import 'package:initial/widgets/home_page_widgets/catalog_header.dart';
import 'package:initial/widgets/home_page_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:initial/models/catalog.dart';
import 'package:initial/widgets/theme.dart';

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
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyTheme.darkBluishColor,
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: const Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CatalogHeader(),
                  const SizedBox(
                    height: 15,
                  ),
                  if (CatalogModel.items.isNotEmpty)
                    const CatalogList().expand()
                  else
                    const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ))),
    );
  }
}
