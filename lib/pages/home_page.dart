import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home_pages/catalog_head.dart';
import 'package:flutter_application_1/pages/home_pages/catalog_list.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadJson();
  }

  loadJson() async {
    await Future.delayed(const Duration(seconds: 2));
    final jsonData = await rootBundle.loadString('assets/files/catalog.json');
    final decodedJson = jsonDecode(jsonData);
    var productData = decodedJson["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.lightBrown,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ));
        },
        splashColor: Colors.white12,
        backgroundColor: MyTheme.darkBluish,
        child: const Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: Vx.m20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHead(),
            if (CatalogModel.items.isNotEmpty)
              CatalogList().expand()
            else
              const CircularProgressIndicator().centered().expand()
          ],
        ),
      )),
    );
  }
}
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).primaryColor,
        //   title: const Text(
        //     'S H O P P I N G - A P P - U I',
        //   ),
        // ),
        // body: Padding(
        //     padding: const EdgeInsets.all(5.0),
        //     child: (CatalogModel.items.isNotEmpty)
        //         ?
        //         // ListView.builder(
        //         //     itemCount: CatalogModel.items.length,
        //         //     itemBuilder: (context, index) {
        //         //       return ItemWidget(item: CatalogModel.items[index]);
        //         //     },
        //         //   )
        //         GridView.builder(
        //             gridDelegate:
        //                 const SliverGridDelegateWithFixedCrossAxisCount(
        //                     crossAxisCount: 2),
        //             itemBuilder: (context, index) {
        //               final item = CatalogModel.items[index];
        //               return GridTile(child: Image.network(item.image));
        //             },
        //             itemCount: CatalogModel.items.length,
        //           )
        //         : const Center(child: CircularProgressIndicator())),
        // drawer: const mydrawer()