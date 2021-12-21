import 'package:agenda_fechada/app/core/database/migrations/migrations.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MigrationV1 extends MIgrations {
  @override
  void create(Batch batch) {
    batch.execute('''
create table todo(
id Integer primary key autoincrement,
descricao varchar(500) not null,
data_hora datetime,
finalizado integer

)
  ''');
  }

  @override
  void update(Batch batch) {
  }
}
