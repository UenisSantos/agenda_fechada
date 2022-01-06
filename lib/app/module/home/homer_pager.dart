import 'package:agenda_fechada/app/module/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomerPager extends StatefulWidget {
  const HomerPager({Key? key}) : super(key: key);

  @override
  State<HomerPager> createState() => _HomerPagerState();
}

class _HomerPagerState extends State<HomerPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        child: TextButton(
          child: Text('logout'),
          onPressed: () {
            context.read<AuthProvider>().logout();
          },
        ),
      ),
    );
  }
}
