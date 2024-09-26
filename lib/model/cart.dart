import 'package:flutter/material.dart';
import 'package:provider_example/model/item.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];
  double price = 0.0;

  void add(Item item) {
    _items.add(item);

    price = price + item.price;
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);

    price = price - item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return price;
  }

  List<Item> get basketItems {
    return _items;
  }
}
