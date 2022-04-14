// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilePathPage extends StatefulWidget {
  const FilePathPage({Key? key}) : super(key: key);

  @override
  _FilePathPageState createState() => _FilePathPageState();
}

class _FilePathPageState extends State<FilePathPage> {
  int _counter = 0;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int _counter2 = 0;

  @override
  void initState() {
    super.initState();

    _prefs.then((SharedPreferences prefs) {
      _counter2 = prefs.getInt("_counter2") ?? 0;
    });

    readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  // 获取文件
  Future<File> getLocalFile() async {
    // get the path to the document directory.
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/counter.txt');
  }

  // 读取数据
  Future<int> readCounter() async {
    try {
      File file = await getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } catch (_) {
      return 0;
    }
  }

  // 写入数据
  Future<File> writeCounter(int counter) async {
    final file = await getLocalFile();
    return file.writeAsString('$counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('文件操作'),
      ),
      body: ListView(
        children: [
          Text("使用 path_provider读取数据 $_counter"),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
                // writeCounter(_counter);
                writeCounter(_counter).then((file) {
                  print(file);
                });
              },
              child: const Text("add")),
          Text("使用 shared_preferences 读取数据 $_counter2"),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter2 += 1;
                });
                _prefs.then((SharedPreferences prefs) {
                  prefs.setInt("_counter2", _counter2);
                });
              },
              child: const Text("add")),
        ],
      ),
    );
  }
}
