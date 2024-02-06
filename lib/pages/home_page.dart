import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_application_1/pages/mydrawer.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
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
      backgroundColor: Color(0xFFECE6DF),
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
              const Center(
                child: CircularProgressIndicator(),
              )
          ],
        ),
      )),
    );
  }
}

class CatalogHead extends StatelessWidget {
  const CatalogHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Shopping App".text.xl4.bold.make(),
      "Trending Products".text.xl2.make()
    ]);
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mOnly(right: 10),
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(onPressed: () {}, child: "Buy".text.make())
              ],
            )
          ],
        ))
      ],
    )).white.rounded.square(100).make().py16().h32(context);
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.p16.make().w40(context);
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