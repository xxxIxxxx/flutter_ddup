import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.purple;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button'),
      ),
      body: ListView(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: const Text('ElevatedButton'),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.orange), // 按钮各种状态下的颜色
              foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue), // 按钮各种状态下文字的颜色
              elevation: MaterialStateProperty.all<double>(8.0), // 底部的阴影
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('ElevatedButton 不同状态颜色'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(getColor),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("TextButton 默认无背景色"),
          ),
          OutlinedButton(
              onPressed: () {}, child: const Text("OutlinedButton 外边框")),
          IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up)),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text("ElevatedButton 带图"),
            icon: const Icon(Icons.thumb_up),
          ),
          TextButton.icon(
            onPressed: () {},
            label: const Text("TextButton 带图"),
            icon: const Icon(Icons.thumb_up),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            label: const Text("OutlinedButton 带图"),
            icon: const Icon(Icons.thumb_up),
          ),
        ],
      ),
    );
  }
}
