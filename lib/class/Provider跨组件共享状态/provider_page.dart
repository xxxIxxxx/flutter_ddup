import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'car_model.dart';
import 'item_list_page.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    //* 这里要跟着变化所以用 watch
    //* 使用 Car? 当找不到时 不至于崩溃
    var car = context.watch<Car?>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Column(
        children: [
          const Text(
            "在 main.dart 中先注册了 ChangeNotifierProvider ",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const ItemListPage();
                }));
              },
              child: const Text("去挑选")),
          Expanded(
            child: ListView.builder(
              itemCount: car?.list.length,
              itemBuilder: (BuildContext context, int index) {
                final item = car!.list[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text("单价：${item.price}     数量：${item.count}"),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            height: 100,
            child: Row(
              children: [
                Text("总价：${car?.allPrice}"),
                const Spacer(),
                Text("总数：${car?.allCount}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
