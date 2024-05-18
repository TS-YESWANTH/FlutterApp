import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/modals/cart.dart';
import 'package:flutter_application_1/modals/catalog.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url =
      "https://api.jsonbin.io/v3/b/66478be7e41b4d34e4f53fdd"; // Correct URL
  final String masterKey =
      "\$2a\$10\$AlO/nACSSRPRfUxXivB1s.nQqv2lqV2/vaggircPAGQz4kGkXr1iC"; // Master Key

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'X-Master-Key': masterKey,
        },
      );
      if (response.statusCode == 200) {
        final catalogJson = response.body;
        final decodedData = jsonDecode(catalogJson);
        var productsData = decodedData["record"]["products"];
        CatalogModel.items = List.from(productsData)
            .map<Item>((item) => Item.fromMap(item))
            .toList();
        setState(() {});
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // ignore: avoid_print
      print("Error: $e");
      // You can show a dialog or some UI to indicate an error
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder<MyStore>(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, store, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.gray200,
            size: 22,
            count: cart.items.length,
            textStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}
