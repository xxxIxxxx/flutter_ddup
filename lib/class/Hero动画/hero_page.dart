import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddup/app/application.dart';
import 'package:flutter_ddup/gen/assets.gen.dart';
import 'hero2_page.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hero'),
        ),
        body: Column(
          children: [
            Hero(
                tag: "cat",
                child: Assets.images.cat.image(width: 80, height: 80)),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Hero2Page();
                  }));
                },
                child: const Text("不使用 fluro 跳")),
            ElevatedButton(
                onPressed: () {
                  // 这次直接写在这不去那边定义了
                  Application.router
                      .define(Hero2Page.routeName, handler: hero2Handeler);
                  Application.router.navigateTo(context, Hero2Page.routeName,
                      transition: TransitionType.fadeIn);
                },
                child: const Text("使用 fluro 跳")),
            const Text(
              "可见使用 fluro 也没影响嘛",
              textScaleFactor: 3.0,
            )
          ],
        ));
  }
}

var hero2Handeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Hero2Page();
});
