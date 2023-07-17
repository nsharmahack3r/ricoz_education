import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/feature/cart/state/cart_state.dart';
import 'package:flutter_riverpod_base/src/models/product.dart';

final cartControllerProvider = StateNotifierProvider<CartController, CartState>((ref){
  return CartController();
});

class CartController extends StateNotifier<CartState>{
  CartController():super(CartState(products: [], subTotal: 0));

  void addProduct ({required Product product, required BuildContext context}) {
    state = state.copyWith(products: [product, ...state.products]);
    state = state.copyWith(subTotal: _calculateSubtotal());
  }

  void removeProduct({required int productId, required BuildContext context}) {
    final allCartProducts = state.products;
    allCartProducts.removeWhere((element) => element.id == productId);
    state = state.copyWith(products: allCartProducts);
    state = state.copyWith(subTotal: _calculateSubtotal());
  }

  int _calculateSubtotal(){
    int total = 0;
    for(Product p in state.products){
      total = total + p.price;
    }
    return total;
  }
}