import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modals/cart.dart';
import 'package:flutter_application_1/modals/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final CartModel _cart = CartModel(); // Initialize cart

  @override
  void initState() {
    super.initState();
    _cart.catalog = CatalogModel(); // Ensure catalog is set
  }

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isInCart = !isInCart;
        });
        if (isInCart) {
          _cart.add(widget.catalog);
        } else {
          _cart.remove(widget.catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all(const StadiumBorder())),
      child: isInCart
          ? const Icon(
              Icons.done,
              color: Colors.white,
            )
          : const Icon(
              CupertinoIcons.cart_badge_plus,
              color: Colors.white,
            ),
    );
  }
}
