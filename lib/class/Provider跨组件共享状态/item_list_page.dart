import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'car_model.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  List items = [
    Item(1, "香蕉🍌", 0, 8.8),
    Item(2, "苹果🍎", 0, 10.8),
    Item(3, "芭乐", 0, 18.9),
    Item(4, "西瓜🍉", 0, 6.8),
    Item(5, "葡萄🍇", 0, 12.8)
  ];

  @override
  Widget build(BuildContext context) {
    Car car = context.watch<Car>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ItemList'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          var i = context.read<Car>().itemMap[item.id] ?? Item.copy(item);
          item.count = i.count;
          return Column(
            children: [
              Text(item.name),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        item.count--;
                        car.remove(i);
                      },
                      icon: const Icon(Icons.remove)),
                  Text(item.count.toString()),
                  IconButton(
                      onPressed: () {
                        item.count++;
                        car.add(i);
                      },
                      icon: const Icon(Icons.add)),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
