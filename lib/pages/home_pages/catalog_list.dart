import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_pages/catalog_items.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/item_detail_page.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetails(catalog: catalog),
                  ));
            },
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}
