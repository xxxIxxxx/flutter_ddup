import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddup/route/routes.dart';

import 'application.dart';

class AppComponent extends StatefulWidget {
  const AppComponent({Key? key}) : super(key: key);

  @override
  State createState() {
    return AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    // 初始化路由
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Fluro',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
    );
//    print("initial route = ${app.initialRoute}");
    return app;
  }
}
