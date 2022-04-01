import 'package:flutter/material.dart';
import 'package:flutter_ddup/class/ListView/list_view2_page.dart';

import 'list_view3_page.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final List<String> _dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.builder'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.gamepad,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ListView2Page();
              }));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.list,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ListView3Page();
              }));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _dataList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == _dataList.length) {
            if (_dataList.length == 100) {
              return const Center(child: Text('没有更多了'));
            }
            getData();
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          }

          return Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            color: Colors.amber,
            height: 50,
            child: Center(
              child: Text(_dataList[index]),
            ),
          );
        },
      ),
    );
  }

  getData() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      if (mounted) {
        //! 如果没有mounted，则不能调用 setState
        setState(() {
          var c = _dataList.length;
          for (var i = c; i < c + 20; i++) {
            _dataList.add("继续划拉 $i");
          }
        });
      }
    });
  }
}
