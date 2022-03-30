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
  static String button = "/button";
  static String image = "/image";
  static String switchs = "/switchs";
  static String textField = "/textField";
  static String progress = "/progress";
  static String constraints = "/constraints";
  static String rowColumn = "/rowColumn";
  static String flexExpanded = "/flexExpanded";
  static String warpFlow = "/warpFlow";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const MyErrorPage();
    });

    router.define(home, handler: homeHandler);
    router.define(lifeCycle, handler: lifeCycleHandler);
    router.define(tipRoute, handler: tipRouteHandler);
    router.define(text, handler: textHandler);
    router.define(button, handler: buttonHandler);
    router.define(image, handler: imageHandler);
    router.define(switchs, handler: switchHandler);
    router.define(textField, handler: textFieldHandeler);
    router.define(progress, handler: progressHandeler);
    router.define(constraints, handler: constraintsHandeler);
    router.define(rowColumn, handler: rowColumnHandeler);
    router.define(flexExpanded, handler: flexExpandedHandeler);
    router.define(warpFlow, handler: warpFlowHandeler);
  }
}
