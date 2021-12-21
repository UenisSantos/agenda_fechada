import 'package:agenda_fechada/app/core/database/sqlite_magrat_factory.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class SqlConectionFactory {
  static SqlConectionFactory? _instance;
  Database? _db;
  static const _VERSION = 1;
  static const _DATABASE_NOME = 'TODOlIST';
  final _look = Lock();
  SqlConectionFactory._();

  factory SqlConectionFactory() {
    if (_instance == null) {
      _instance = SqlConectionFactory._();
    }

    return _instance!;
  }

  Future<void> openConection() async {
    var databasePath = await getDatabasesPath();
    var databasePathFinal = join(databasePath, _DATABASE_NOME);
    if (_db == null) {
      await _look.synchronized(() async {
        if (_db == null) {
          _db = await openDatabase(
            databasePathFinal,
            version: _VERSION,
            onConfigure: onConfigure,
            onCreate: onCreate,
            onDowngrade: onDowngrade,
            onUpgrade: onUpgrade,
          );
          return _db!;
        }
      });
    }
  }

  void closeConection() {
    _db?.close();
    _db = null;
  }

  Future<void> onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys=ON');
  }

  Future<void> onCreate(Database db, version) async {
    final batch = db.batch();

    final migrates = SqliteMigratFactory().getCreateMigrations();
    for (var migrate in migrates) {
      migrate.create(batch);

      batch.commit();
    }
  }

  Future<void> onDowngrade(Database db, oldversion, newVersion) async {}
  Future<void> onUpgrade(Database db, oldversion, newVersion) async {}
}
