import 'package:agenda_fechada/app/module/auth/login/login_page.dart';
import 'package:agenda_fechada/app/module/auth/login/login_controller.dart';
import 'package:agenda_fechada/app/module/todo_list_module.dart';
import 'package:provider/provider.dart';

class AuthModule extends TodoListModule {



  AuthModule()
      : super(bindings: [
          ChangeNotifierProvider(create: (_) => LoginControlller()),
        ], routers: {
          '/login': (context) => LoginPage()
        });
}
