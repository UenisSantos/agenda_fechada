import 'package:agenda_fechada/app/core/database/sql_conect_factory.dart';
import 'package:agenda_fechada/app/module/splach-widget.dart';
import 'package:agenda_fechada/app/repository/use/uer_repository_implemen.dart';
import 'package:agenda_fechada/app/repository/use/user.repository.dart';
import 'package:agenda_fechada/app/service/user/user_service.dart';
import 'package:agenda_fechada/app/service/user/user_service_implement.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        Provider(create: (_)=> FirebaseAuth.instance),
        Provider(
          create: (context) => SqlConectionFactory()  ),

      Provider< UserRepository>(create: (context)=>UserRepositoryImplement(firebaseAuth: context.read()),),
      Provider<UserService>(create: (context)=>UserServiceImplement(userRepository: context.read()))
      ],
      child:
       Scaffold(
          appBar: AppBar(),
          body: Splach(),
        ),
    
    );
  }
}
