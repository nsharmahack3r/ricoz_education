// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod_base/src/models/product.dart';

class CartState {
  final List<Product> products;
  final int subTotal;
  CartState({
    required this.products,
    required this.subTotal,
  });

  CartState copyWith({
    List<Product>? products,
    int? subTotal,
  }) {
    return CartState(
      products: products ?? this.products,
      subTotal: subTotal ?? this.subTotal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
      'subTotal': subTotal,
    };
  }

  factory CartState.fromMap(Map<String, dynamic> map) {
    return CartState(
      products: List<Product>.from((map['products'] as List<int>).map<Product>((x) => Product.fromMap(x as Map<String,dynamic>),),),
      subTotal: map['subTotal'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartState.fromJson(String source) => CartState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartState(products: $products, subTotal: $subTotal)';

  @override
  bool operator ==(covariant CartState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.products, products) &&
      other.subTotal == subTotal;
  }

  @override
  int get hashCode => products.hashCode ^ subTotal.hashCode;
}
