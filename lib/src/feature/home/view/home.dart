import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/cart/views/cart.dart';
import 'package:flutter_riverpod_base/src/feature/product/view/products.dart';
import 'package:flutter_riverpod_base/src/res/strings.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routePath = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    AppStrings.appName,
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 32),
                  ),
                  IconButton(
                    onPressed: () {
                      context.push(CartView.routePath);
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 32,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            // Item List
            const Flexible(
              child: ProductsList(),
            ),
          ],
        ),
      ),
    );
  }
}
