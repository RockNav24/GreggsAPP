import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:greggs_app/model/item.dart';

class BasketProvider extends ChangeNotifier {
  final List<Item> _basket = [];

  List<Item> get basket => _basket;
  int get getItemCount => _basket.length;

  HashSet<Item> get itemCategory {
    final HashSet<Item> itemCategory = HashSet();

    for (Item basketItem in _basket) {
      itemCategory.add(basketItem);
    }
    return itemCategory;
  }

  double get basketTotal {
    double total = 0;
    for (Item item in _basket) {
      total += item.eatOutPrice;
    }
    return total;
  }

  void addItemtoBasket(Item newItem) {
    _basket.add(newItem);
    notifyListeners();
  }

  void deleteItemFromBasket(Item item) {
    _basket.remove(item);
    notifyListeners();
  }
}
