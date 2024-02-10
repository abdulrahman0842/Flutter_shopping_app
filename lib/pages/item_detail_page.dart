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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        // height: 90,
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluish),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to Cart".text.color(Colors.white).make())
                .wh(140, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image).h32(context),
          ),
          Expanded(
              child: VxArc(
                  height: 30,
                  edge: VxEdge.top,
                  arcType: VxArcType.convey,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Column(children: [
                      catalog.name.text.xl4.bold.make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      const HeightBox(10),
                      "Shall it to bust just tell the is reply shrieked. No surcease with lord and distinctly eyes floor that late, and at door the above floor that, bird just as the still upon nevermore. Master fluttered devil it above if napping but, some whom have till word spoken. She being."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
                    ]).py64(),
                  )))
        ]),
      ),
    );
  }
}
