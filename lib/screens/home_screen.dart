import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/cart.dart';
import 'package:provider_example/model/item.dart';
import 'package:provider_example/screens/checkout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  List<Item> items = [
    Item(name: "Samsung S4", price: 200),
    Item(name: "Iphone 16 pro", price: 800)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Checkout();
                    }));
                  },
                  icon: Icon(Icons.shopping_cart)),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Consumer<Cart>(builder: (context, cart, child) {
                  return Text("${cart.count}");
                }),
              )
            ],
          )
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(child: Consumer<Cart>(builder: (context, cart, child) {
              return ListTile(
                title: Text(items[index].name),
                trailing: IconButton(
                    onPressed: () {
                      cart.add(items[index]);
                    },
                    icon: Icon(Icons.add_shopping_cart)),
              );
            }));
          }),
    );
  }
}
