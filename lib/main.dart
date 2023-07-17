import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/app.dart';
import 'package:flutter_riverpod_base/src/experiment/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const App();
    // return MaterialApp(
    //   home: ProductPage(),
    // );
  }
}