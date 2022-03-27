import 'package:flutter/material.dart';
import 'package:flutter_ddup/gen/assets.gen.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  static String imgStr =
      "https://img1.baidu.com/it/u=470255208,2889809727&fm=253&fmt=auto&app=120&f=JPEG?w=950&h=443";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Column(children: <Widget>[
        Image.network(
          imgStr,
          width: 200,
        ),
        Image.network(
          imgStr,
          height: 50,
          width: 200,
          fit: BoxFit.cover,
        ),
        const Image(
          image: AssetImage("assets/images/cat.webp"),
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        Image.asset(
          "assets/images/cat.webp",
          height: 50,
        ),
        const Text("使用插件 读取本地 image"),
        /*
        # 图片插件
        assets:
          - assets/images/ 
          - assets/images/cat.webp
        dev_dependencies:
        # 增加依赖
          build_runner:
          flutter_gen_runner:
        终端执行
        flutter packages pub run build_runner build
        */
        Assets.images.cat.image(height: 100, width: 100, fit: BoxFit.cover),
        Image(
          image: Assets.images.cat,
          height: 150,
        ),
        const Icon(
          Icons.tv,
          size: 40,
          color: Colors.red,
        ),
      ]),
    );
  }
}
