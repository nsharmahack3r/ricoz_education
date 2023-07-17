import 'package:flutter/material.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade400, blurRadius: 10),
          ],
          borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: child,
    );
  }
}