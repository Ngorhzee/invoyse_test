import 'package:flutter/material.dart';

export 'routes.dart';

class PageRouter {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static PageRouter get instance => _instance;
  static final PageRouter _instance = PageRouter._();
  PageRouter._();
  Future gotoWidget(
    Widget screen, {
    bool clearStack = false,
    bool fullScreenDialog = false,
  }) =>
      !clearStack
          ? navigatorKey.currentState!.push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => screen,
              ),
              // RouteAnimationHelper.createRoute(
              //     buildContext: navigatorKey.currentContext!,
              //     currentPage: navigatorKey.currentContext!.widget,
              //     destination: screen,
              //     animType: animationType,
              //     duration: duration.round(),
              //   ),
            )
          : Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => screen),
              ModalRoute.withName('/'),

              // RouteAnimationHelper.createRoute(
              //     buildContext: navigatorKey.currentContext!,
              //     currentPage: navigatorKey.currentContext!.widget,
              //     destination: screen,
              //     animType: animationType,
              //     duration: duration.round()),
              // (_) => false,
            );

  Future gotoNamed(String route,
          {bool clearStack = false, dynamic args = Object}) =>
      !clearStack
          ? Navigator.of(navigatorKey.currentContext!)
              .pushNamed(route, arguments: args)
          : Navigator.of(navigatorKey.currentContext!)
              .pushNamedAndRemoveUntil(route, (_) => false, arguments: args);

  void goBack({bool rootNavigator = false}) {
    Navigator.of(navigatorKey.currentContext!, rootNavigator: rootNavigator)
        .pop();
  }

  void openPage(Widget route) {
    Navigator.of(navigatorKey.currentContext!)
        .push(MaterialPageRoute(builder: (context) => route));
  }

  void replaceAllPages(Widget route) {
    Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => route),
        (Route<dynamic> route) => false);
  }

  void goToRoot({String routeName = ''}) => routeName.isNotEmpty
      ? Navigator.of(navigatorKey.currentContext!)
          .popUntil(ModalRoute.withName(routeName))
      : Navigator.of(navigatorKey.currentContext!)
          .popUntil((route) => route.isFirst);

  void goToNameRoutes(Widget screen, String routeName) =>
      Navigator.of(navigatorKey.currentContext!).push(
        MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (context) => screen,
        ),
      );
}
