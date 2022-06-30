import 'package:flutter/material.dart';
import 'package:greggs_app/model/item.dart';

class BasketProvider extends ChangeNotifier {
  List<Item> _basket = [];

  List<Item> get basket => _basket;
  int getItemCount() => _basket.length;

  void addItemtoBasket(Item newItem) {
    _basket.add(newItem);
    notifyListeners();
  }

  void deleteItemFromBasket(Item item) {
    _basket.remove(item);
    notifyListeners();
  }
}
