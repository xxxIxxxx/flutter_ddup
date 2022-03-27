import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../route/error_page.dart';
import '../route/route_handlers.dart';

class Routes {
  //MARK:主页
  static String home = "/";
  static String lifeCycle = "/lifeCycle";
  static String tipRoute = "/tipRoute";
  static String text = "/text";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const MyErrorPage();
    });

    router.define(home, handler: homeHandler);
    router.define(lifeCycle, handler: lifeCycleHandler);
    router.define(tipRoute, handler: tipRouteHandler);
    router.define(text, handler: textHandler);
  }
}
