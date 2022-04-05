import 'package:flutter/material.dart';

class FutureStreamPage extends StatefulWidget {
  const FutureStreamPage({Key? key}) : super(key: key);

  @override
  _FutureStreamPageState createState() => _FutureStreamPageState();
}

class _FutureStreamPageState extends State<FutureStreamPage> {
  Future<String> network() async {
    return Future.delayed(const Duration(seconds: 2), () => '我是从网络获取的数据');
  }

  Stream<String> getData() {
    return Stream.periodic(const Duration(seconds: 1), (i) => i.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureStream'),
      ),
      body: Column(
        children: [
          const Text(
            "FutureBuilder",
            textScaleFactor: 2,
          ),
          FutureBuilder(
            future: network(),
            initialData: "InitialData",
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                return Text("加载完成：" + (snapshot.data ?? ""));
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const Text(
            "StreamBuilder",
            textScaleFactor: 2,
          ),
          StreamBuilder(
            stream: getData(),
            initialData: "initialData",
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text("没有Stream");
                case ConnectionState.waiting:
                  return const Text("加载中...");
                case ConnectionState.active:
                  return Text("已获取数据 ${snapshot.data ?? ""} \n 继续加载中...");
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  return Text("加载完成：" + (snapshot.data ?? ""));
              }
            },
          ),
        ],
      ),
    );
  }
}
