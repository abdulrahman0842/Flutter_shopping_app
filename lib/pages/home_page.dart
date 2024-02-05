// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_application_1/pages/mydrawer.dart';
// import 'package:flutter_application_1/models/catalog.dart';
// import 'package:flutter_application_1/widgets/item_widget.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();
//     loadJson();
//   }

//   loadJson() async {
//     try {
//       final jsonData = await rootBundle.loadString('assets/files/catalog.json');
//       print('Loaded JSON data: $jsonData');
//       final decodedJson = jsonDecode(jsonData);
//       var productData = decodedJson["products"];
//       CatalogModel.items = List.from(productData).map<Item>((item) {
//         print('Item: $item');
//         return Item.fromMap(item);
//       }).toList();
//       setState(() {});
//     } catch (e) {
//       print('Error loading or parsing JSON data: $e');
//       // Handle error appropriately, e.g., show error message to user
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).primaryColor,
//         title: const Text(
//           'Shopping App',
//         ),
//       ),
//       body: Center(
//         child: CatalogModel.items.isNotEmpty &&
//                 CatalogModel.items.length > 1 &&
//                 CatalogModel.items[1].image.isNotEmpty
//             ? Text('Image URL for second item: ${CatalogModel.items[1].image}')
//             : CatalogModel.items.isNotEmpty && CatalogModel.items.length > 1
//                 ? Text('Second item URL is empty')
//                 : Text('No items available'),
//       ),
//       drawer: const mydrawer(),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/mydrawer.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

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
    await Future.delayed(Duration(seconds: 2));
    final jsonData = await rootBundle.loadString('assets/files/catalog.json');
    final decodedJson = jsonDecode(jsonData);
    var productData = decodedJson["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'S H O P P I N G - A P P - U I',
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                ?
                // ListView.builder(
                //     itemCount: CatalogModel.items.length,
                //     itemBuilder: (context, index) {
                //       return ItemWidget(item: CatalogModel.items[index]);
                //     },
                //   )
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final item = CatalogModel.items[index];
                      return GridTile(child: Image.network(item.image));
                    },
                    itemCount: CatalogModel.items.length,
                  )
                : const Center(child: CircularProgressIndicator())),
        drawer: const mydrawer());
  }
}
