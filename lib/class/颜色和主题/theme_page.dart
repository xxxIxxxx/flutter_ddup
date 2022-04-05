import 'package:flutter/material.dart';

import 'color.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  MaterialColor _themeColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    var listView = ListView.separated(
      itemCount: 20,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 1);
      },
      itemBuilder: (BuildContext context, int index) {
        var color = ColorX.random;
        return Container(
          color: color,
          alignment: Alignment.center,
          height: 60,
          child: Text("text 颜色根据背景色深浅来设置",
              style: TextStyle(
                  fontSize: 20,
                  //* computeLuminance 获取背景色的亮度
                  color: color.computeLuminance() < 0.5
                      ? Colors.white
                      : Colors.black)),
        );
      },
    );
    var scaffold = Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _themeColor = [
                    Colors.amber,
                    Colors.orange,
                    Colors.green,
                    Colors.teal,
                    Colors.blue,
                    Colors.purple,
                    Colors.pink,
                  ].random<MaterialColor>();
                });
              },
              child: const Text('更换主题')),
          Expanded(
            child: listView,
          )
        ],
      ),
    );
    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: scaffold,
    );
  }
}
