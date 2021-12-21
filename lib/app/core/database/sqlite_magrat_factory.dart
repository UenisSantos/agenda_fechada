import 'package:agenda_fechada/app/core/database/migrations/migration_v1.dart';
import 'package:agenda_fechada/app/core/database/migrations/migrations.dart';

class SqliteMigratFactory{

List<MIgrations>getCreateMigrations()=>[

MigrationV1()

];
List<MIgrations>getUpagradeMigratios(int version)=>[];


}