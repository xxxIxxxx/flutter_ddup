import 'package:flutter/material.dart';

class Item {
  final int id;
  final String name;
  late int count;
  final double price;
  Item(this.id, this.name, this.count, this.price);

  static copy(item) {
    return Item(item.id, item.name, item.count, item.price);
  }
}

///  ChangeNotifier
class Car with ChangeNotifier {
  final List<Item> list = [];
  late double allPrice = 0.0;
  late int allCount = 0;
  late Map<int, Item> itemMap = <int, Item>{};

  void add(Item item) {
    Item? i = itemMap[item.id];
    if (i == null) {
      list.add(item);
      itemMap[item.id] = item;
    }
    item.count += 1;
    allCount += 1;
    allPrice += item.price;
    // 通知改变
    notifyListeners();
  }

  void remove(Item item) {
    Item? i = itemMap[item.id];
    if (i == null) {
      return;
    }
    item.count -= 1;
    allCount -= 1;
    allPrice -= item.price;
    if (item.count == 0) {
      list.remove(item);
      itemMap.remove(item.id);
    }
    // 通知改变
    notifyListeners();
  }
}
