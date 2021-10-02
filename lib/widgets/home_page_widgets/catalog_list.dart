import 'package:flutter/material.dart';
import 'package:initial/models/catalog.dart';
import 'package:initial/pages/home_detail_page.dart';

import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePageDetail(catalog: catalog))),
          child: CatalogItem(
            catalog: catalog,
          ),
        );
      },
    );
  }
}
