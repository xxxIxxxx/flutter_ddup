import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({Key? key}) : super(key: key);

  @override
  _AnimatedListPageState createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> dataList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData([int count = 3]) {
    int c = dataList.length;
    for (var i = c; i < c + count; i++) {
      dataList.add("A  $i");
    }
  }

  Widget buildOneItem(int index) {
    String text = "当前数据：" + dataList[index] + "     在列表中：index = $index";
    return Container(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
        height: 50,
        child: Row(
          children: [
            Text(text),
            const Spacer(),
            IconButton(
              onPressed: () {
                deleteItem(index);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ));
  }

  deleteItem(int index) {
    Widget item = buildOneItem(index);
    _listKey.currentState?.removeItem(index, (context, animation) {
      return FadeTransition(
        opacity: animation,
        child: SizeTransition(sizeFactor: animation, child: item),
      );
    });
    dataList.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedList'),
        actions: [
          IconButton(
              onPressed: () {
                getData(1);
                _listKey.currentState?.insertItem(dataList.length - 1);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: dataList.length,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: buildOneItem(index));
        },
      ),
    );
  }
}
