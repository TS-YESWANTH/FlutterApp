import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/modals/cart.dart';
import 'package:flutter_application_1/modals/catalog.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
