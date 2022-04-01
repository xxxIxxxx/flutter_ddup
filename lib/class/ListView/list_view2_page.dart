import 'package:flutter/material.dart';

class ListView2Page extends StatefulWidget {
  const ListView2Page({Key? key}) : super(key: key);

  @override
  _ListView2PageState createState() => _ListView2PageState();
}

class _ListView2PageState extends State<ListView2Page> {
  final List<String> _dataList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.separated'),
      ),
      body: ListView.separated(
        itemCount: _dataList.length + 1,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
            color: Colors.black,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          if (index == _dataList.length) {
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
        setState(() {
          var c = _dataList.length;
          for (var i = c; i < c + 20; i++) {
            _dataList.add("带分割线的 继续划拉 $i");
          }
        });
      }
    });
  }
}
