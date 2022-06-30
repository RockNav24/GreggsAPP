// read json file

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:greggs_app/model/item.dart';

Future<List<Item>?> readJson() async {
  List<Item> items = [];

  try {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    items.add(
      Item.fromJson(jsonString),
    );
    return items;
  } catch (e) {
    if (kDebugMode) {
      print('Error: $e');
    }
    return items;
  }
}
