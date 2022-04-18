// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'car_model.dart';

class HttpPage extends StatefulWidget {
  const HttpPage({Key? key}) : super(key: key);

  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  String _text = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    Api.get("get", completion: (Response? response, DioError? error) {
      print("\nrep:" + response.toString() + "\nerror:" + error.toString());
      setState(() {
        _text = response?.headers.toString() ?? "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http'),
      ),
      body: ListView(
        children: [
          const Text("简单封装使用"),
          Text(_text),
          const Text("直接使用，加数据解析"),
          FutureBuilder(
            future: Api.dio.post("post", data: {
              "name": "cybertruck",
              "price": 9.9,
              "img": "https://t.im/x0sr"
            }),
            initialData: "默认值",
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                Response rep = snapshot.data;
                Map data = rep.data;
                var model = CarModel.fromJson(data["json"]);
                return Text(
                    "name:${model.name} price:${model.price} img:${model.img}");
              }
              return const Text("加载中");
            },
          ),
        ],
      ),
    );
  }
}
