import 'package:agenda_fechada/app/ui/logo.dart';
import 'package:agenda_fechada/app/ui/text_Form.dart';
import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Container(child: LayoutBuilder(builder: (Context, Constraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: Constraints.maxHeight,
                      minWidth: Constraints.minWidth),
                  child: IntrinsicHeight(
                      child: Column(children: [
                    Logo(),
                    TexFormPersonalizado(
                      label: 'nome',
                    ),
                    TexFormPersonalizado(
                      label: 'email',
                    ),
                    TexFormPersonalizado(
                      label: 'senha',
                      obscure: true,
                    ),
                  ]))));
        })));
  }
}
