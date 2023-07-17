import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/commons/providers/common_providers.dart';
import 'package:flutter_riverpod_base/src/models/product.dart';

final cartControllerProvider = StateNotifierProvider<CartController, List<Product>>((ref){
  return CartController(ref: ref);
});

class CartController extends StateNotifier<List<Product>>{
  CartController({
    required Ref ref
  }): _ref = ref, super([]);

  Ref _ref;

  void addProduct ({required Product product, required BuildContext context}) {
    state = [product, ...state];
    _ref.read(cartSubtotalProvider.notifier).update((state) => _calculateSubtotal());
  }

  void removeProduct({required int productId, required BuildContext context}) {
    final allCartProducts = state;
    allCartProducts.removeWhere((element) => element.id == productId);
    state = allCartProducts;
     _ref.read(cartSubtotalProvider.notifier).update((state) => _calculateSubtotal());
  }

  int _calculateSubtotal(){
    int total = 0;
    for(Product p in state){
      total = total + p.price;
    }
    return total;
  }
}