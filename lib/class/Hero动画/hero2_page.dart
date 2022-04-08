import 'package:flutter/material.dart';
import 'package:flutter_ddup/gen/assets.gen.dart';

class Hero2Page extends StatefulWidget {
  const Hero2Page({Key? key}) : super(key: key);
  static String routeName = "/hero2";
  @override
  _Hero2PageState createState() => _Hero2PageState();
}

class _Hero2PageState extends State<Hero2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero2'),
      ),
      body: Hero(tag: "cat", child: Assets.images.cat.image()),
    );
  }
}
