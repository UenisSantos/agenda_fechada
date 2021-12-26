import 'package:agenda_fechada/app/module/auth/login/login_page.dart';
import 'package:agenda_fechada/app/module/auth/login/login_controller.dart';
import 'package:agenda_fechada/app/module/auth/registro/register_controller.dart';
import 'package:agenda_fechada/app/module/auth/registro/registro.dart';
import 'package:agenda_fechada/app/module/todo_list_module.dart';
import 'package:provider/provider.dart';

class AuthModule extends TodoListModule {



  AuthModule()
      : super(bindings: [
          ChangeNotifierProvider(create: (_) => LoginControlller()),
                    ChangeNotifierProvider(create: (context) => RegisterController(userService: context.read())),

        ], routers: {
          '/login': (context) => LoginPage(),
           '/registro': (context) => Registro()
        });
}
