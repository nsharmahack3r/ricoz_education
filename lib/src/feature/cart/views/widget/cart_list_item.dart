import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/commons/views/widgets/product_item_card.dart';
import 'package:flutter_riverpod_base/src/feature/cart/controller/cart_controller.dart';
import 'package:flutter_riverpod_base/src/models/product.dart';

class CartListItem extends ConsumerWidget {
  const CartListItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProductItemCard(
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10.0)),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                  onPressed: () {
                    // Remove Item from List
                    ref.read(cartControllerProvider.notifier).removeProduct(
                          productId: product.id,
                          context: context,
                        );
                  },
                  color: Colors.grey.shade300,
                  padding: EdgeInsets.zero,
                  child: const Text("Remove"),
                ),
              ],
            ),
          )
        ],
      ),
    );
    ;
  }
}
