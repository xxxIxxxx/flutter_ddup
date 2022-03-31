import 'package:flutter/material.dart';

import 'column_page.dart';

class RowPage extends StatefulWidget {
  const RowPage({Key? key}) : super(key: key);

  @override
  _RowPageState createState() => _RowPageState();
}

class _RowPageState extends State<RowPage> {
  Widget text = const Text("一二三");
  Widget redBox = const SizedBox(
    width: 30,
    height: 30,
    child: DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row'),
      ),
      body: Row(
        // 主轴方向
        mainAxisAlignment: MainAxisAlignment.start,
        // 交叉轴方向
        crossAxisAlignment: CrossAxisAlignment.start,
        // textDirection verticalDirection 使用默认值即可 文字布局方向
        // textDirection: TextDirection.ltr,
        // verticalDirection: VerticalDirection.up,
        // 主轴方向的大小
        mainAxisSize: MainAxisSize.max,

        children: [
          text,
          redBox,
          text,
          Row(
            children: <Widget>[
              const Text("Row 中 Row"),
              redBox,
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ColumnPage();
                    }));
                  },
                  child: const Text("去看看Column"))
            ],
          )
        ],
      ),
    );
  }
}
