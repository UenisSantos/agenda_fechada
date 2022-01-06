import 'dart:math';

import 'package:agenda_fechada/app/core/database/sql_conect_factory.dart';
import 'package:agenda_fechada/app/ui/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplachPage extends StatefulWidget {
  @override
  _SplachPageState createState() => _SplachPageState();
}

class _SplachPageState extends State<SplachPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Logo(),
    );
  }
}
