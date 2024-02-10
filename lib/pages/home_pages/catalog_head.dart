import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
