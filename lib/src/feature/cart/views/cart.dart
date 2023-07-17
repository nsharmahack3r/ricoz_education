import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/commons/providers/common_providers.dart';
import 'package:flutter_riverpod_base/src/feature/cart/controller/cart_controller.dart';
import 'package:flutter_riverpod_base/src/feature/cart/views/widget/cart_list.dart';
import 'package:flutter_riverpod_base/src/res/strings.dart';
import 'package:go_router/go_router.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const routePath = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: 32,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    CartViewString.title,
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 32),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Consumer(
                builder: (context, ref, child) {
                  final subTotal = ref.watch(cartSubtotalProvider);
                  return Text(
                "Subtotal : \$$subTotal",
                style: TextStyle(color: Colors.grey.shade800, fontSize: 24),
              );
                },
              )
            ),
            // Item List
            const Flexible(child: CartProductList()),
          ],
        ),
      ),
    );
  }
}
