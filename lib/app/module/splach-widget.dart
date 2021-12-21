import 'package:agenda_fechada/app/core/database/observer_sqlite.dart';
import 'package:agenda_fechada/app/core/database/sql_conect_factory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splach extends StatefulWidget {
  @override
  _SplachState createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  final observerApp = ObserverSqlite();

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(observerApp);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(observerApp);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (context) => SqlConectionFactory(),
            lazy: false,
          )
        ],
        child: Container(
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text('LOGIN'),
          ),
        ));
  }
}
