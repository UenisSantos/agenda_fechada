import 'package:agenda_fechada/app/core/database/observer_sqlite.dart';
import 'package:agenda_fechada/app/core/database/sql_conect_factory.dart';
import 'package:agenda_fechada/app/core/navigator/navigator_no_context.dart';
import 'package:agenda_fechada/app/module/auth/auth_module.dart';
import 'package:agenda_fechada/app/module/home/homer_module.dart';
import 'package:agenda_fechada/app/module/splach-widget.dart';
import 'package:agenda_fechada/app/ui/colo_theme.dart';
import 'package:agenda_fechada/app/ui/extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final observerSqlite = ObserverSqlite();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(observerSqlite);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(observerSqlite);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        
        theme:  ColorThemeUi.themeData,
        navigatorKey: NavigatorNoContext.navigatorKey,
        routes: {...AuthModule().routers,
        ...HomerModule().routers,
        
        
        },

        home: SplachPage()
   
    );
  }
}
