import 'package:agenda_fechada/app/core/database/observer_sqlite.dart';
import 'package:agenda_fechada/app/core/database/sql_conect_factory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplachPage extends StatefulWidget {
  @override
  _SplachPageState createState() => _SplachPageState();
}

class _SplachPageState extends State<SplachPage> {


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
