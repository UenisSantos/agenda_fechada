import 'package:agenda_fechada/app/core/database/sql_conect_factory.dart';
import 'package:agenda_fechada/app/module/splach-widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppModule extends StatefulWidget {
  @override
  _AppModuleState createState() => _AppModuleState();
}

class _AppModuleState extends State<AppModule> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => SqlConectionFactory(),
        )
      ],
      child:
       Scaffold(
          appBar: AppBar(),
          body: Splach(),
        ),
    
    );
  }
}
