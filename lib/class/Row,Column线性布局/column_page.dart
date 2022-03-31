import 'package:flutter/material.dart';

class ColumnPage extends StatefulWidget {
  const ColumnPage({Key? key}) : super(key: key);

  @override
  _ColumnPageState createState() => _ColumnPageState();
}

class _ColumnPageState extends State<ColumnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Column'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("一二三"),
            const SizedBox(
              width: 50,
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            Container(
              color: Colors.orange,
              child: Row(
                children: const <Widget>[
                  Text("Row 中 Row"),
                  SizedBox(
                      width: 50,
                      height: 50,
                      child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red))),
                  Text("一二三")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  color: Colors.red,
                  child: Row(
                    children: const <Widget>[Text("Row")],
                  )),
            ),
            Expanded(
                child: Container(
              color: Colors.purple,
              child: Column(
                children: const <Widget>[Text("使用 Expanded 包裹 Column, 让其占满")],
              ),
            ))
          ],
        ));
  }
}
