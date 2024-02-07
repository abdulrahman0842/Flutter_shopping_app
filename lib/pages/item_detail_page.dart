import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetails extends StatelessWidget {
  final Item catalog;

  const ItemDetails({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.lightBrown,
      appBar: AppBar( ),
      body: Column(children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image))
      ]).p16(),
    );
  }
}
