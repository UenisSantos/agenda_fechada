import 'package:flutter/cupertino.dart';

class NavigatorNoContext {
  NavigatorNoContext._();

  static final navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState ?get to => navigatorKey.currentState;
}
