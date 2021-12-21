import 'package:agenda_fechada/app/core/database/sql_conect_factory.dart';
import 'package:flutter/cupertino.dart';

class ObserverSqlite with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final conect = SqlConectionFactory();

    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        conect.closeConection();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
