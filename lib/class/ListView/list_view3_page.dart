import 'package:flutter/material.dart';

class ListView3Page extends StatefulWidget {
  const ListView3Page({Key? key}) : super(key: key);

  @override
  _ListView3PageState createState() => _ListView3PageState();
}

class _ListView3PageState extends State<ListView3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView3'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.redAccent,
            child: const Text("""
头部固定在这里
结构是 Cloumn(
  child:[
    Container(...),
    Expanded(
            child: ListView.separated()
    ),    
  ]
)"""),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 100,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 1,
                  color: Colors.black,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.amber,
                  height: 50,
                  child: Center(
                    child: Text("带分割线的 继续划拉 $index"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
