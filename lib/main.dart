// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/cart.dart';
import 'package:provider_example/screens/home_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return Cart();
        },
        child: MaterialApp(
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          title: "Smart Home",
          home: HomeScreen(),
        ));
  }
}
