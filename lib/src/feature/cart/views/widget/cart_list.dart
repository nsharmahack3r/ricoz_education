import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/feature/cart/controller/cart_controller.dart';
import 'package:flutter_riverpod_base/src/feature/cart/views/widget/cart_list_item.dart';

class CartProductList extends ConsumerWidget {
  const CartProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartControllerProvider);

    if (cartState.isEmpty) {
      return const Center(
        child: Text("Cart Empty"),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: cartState.length,
      itemBuilder: (context, index) {
        return CartListItem(product: cartState[index]);
      },
    );
  }
}