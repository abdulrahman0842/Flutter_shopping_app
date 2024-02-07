import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_application_1/pages/mydrawer.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/item_detail_page.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
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

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluish),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.color(Colors.white).make())
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16().h24(context);
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .color(MyTheme.lightBrown)
        .p8
        .make()
        .p16()
        .w40(context);
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