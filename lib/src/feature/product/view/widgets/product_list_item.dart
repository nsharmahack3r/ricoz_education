import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/commons/views/widgets/product_item_card.dart';
import 'package:flutter_riverpod_base/src/feature/cart/controller/cart_controller.dart';
import 'package:flutter_riverpod_base/src/models/product.dart';

class ProductListItem extends ConsumerWidget {
  const ProductListItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProductItemCard(
      child: Row(
        children: [
          Container(
            width: 130,
            height: 130,
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
                  height: 4,
                ),
                SizedBox(
                  height: 70,
                  child: Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        ref.read(cartControllerProvider.notifier).addProduct(
                              product: product,
                              context: context,
                            );
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 32,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
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
