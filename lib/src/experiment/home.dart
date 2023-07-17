import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/experiment/widgets/product_list_item.dart';
import 'package:flutter_riverpod_base/src/res/strings.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

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
                  Icon(
                    Icons.shopping_cart,
                    size: 32,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            // Item List
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(20.0),
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return const ProductListItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}