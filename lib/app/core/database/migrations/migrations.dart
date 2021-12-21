import 'package:sqflite/sqflite.dart';

abstract class MIgrations {
  void create(Batch batch);

  void update(Batch batch);
}
