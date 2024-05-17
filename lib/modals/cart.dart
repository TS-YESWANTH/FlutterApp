import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modals/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Item?> get items {
    if (_catalog == null) {
      // Handle the case when _catalog is not initialized
      return [];
    }
    return _itemIds.map((id) => _catalog.getById(id)).toList();
  }

  num get totalPrice {
    // Handle the case when _catalog is not initialized
    if (_catalog == null) {
      return 0;
    }
    return items.fold(0, (total, current) => total + (current?.price ?? 0));
  }

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
