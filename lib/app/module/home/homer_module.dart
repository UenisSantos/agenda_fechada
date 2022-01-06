
import 'package:agenda_fechada/app/module/home/homer_pager.dart';
import 'package:agenda_fechada/app/module/todo_list_module.dart';
import 'package:path/path.dart';

class HomerModule  extends TodoListModule{
  HomerModule() : super(
routers: {
  '/home':(context) => HomerPager(),
}


  );
  
}