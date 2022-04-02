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
  static String stackPositioned = "/stackPositioned";
  static String alignCenter = "/alignCenter";
  static String layoutBuilder = "/layoutBuilder";
  static String padding = "/padding";
  static String decoratedBox = "/decoratedBox";
  static String transform = "/transform";
  static String container = "/container";
  static String clip = "/clip";
  static String fittedBox = "/fittedBox";
  static String scaffoldAppBar = "/ScaffoldAppBar";
  static String singleChildScrollView = "/singleChildScrollView";
  static String listView = "/listView";
  static String scrollController = "/scrollController";
  static String animatedList = "/animatedList";
  static String gridView = "/gridView";

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
    router.define(stackPositioned, handler: stackPositionedHandeler);
    router.define(alignCenter, handler: alignCenterHandeler);
    router.define(layoutBuilder, handler: layoutBuilderHandeler);
    router.define(padding, handler: paddingHandeler);
    router.define(decoratedBox, handler: decoratedBoxHandeler);
    router.define(transform, handler: transformRotatedHandeler);
    router.define(container, handler: containerHandeler);
    router.define(clip, handler: clipHandeler);
    router.define(fittedBox, handler: fittedBoxHandeler);
    router.define(scaffoldAppBar, handler: scaffoldAppBarHandeler);
    router.define(singleChildScrollView,
        handler: singleChildScrollViewHandeler);
    router.define(listView, handler: listViewHandeler);
    router.define(scrollController, handler: scrollControllerViewHandeler);
    router.define(animatedList, handler: animatedListHandeler);
    router.define(gridView, handler: gridViewHandeler);
  }
}
