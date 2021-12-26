import 'package:agenda_fechada/app/module/auth/registro/register_controller.dart';
import 'package:agenda_fechada/app/ui/logo.dart';
import 'package:agenda_fechada/app/ui/text_Form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class Registro extends StatefulWidget {
  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  var formkey = GlobalKey<FormState>();
  TextEditingController _editingControllerEmail = TextEditingController();
  TextEditingController _editingControllerSenha = TextEditingController();
  TextEditingController _editingControllerConfimarSenha =
      TextEditingController();

  @override
  void dispose() {
    _editingControllerEmail.dispose();
    _editingControllerSenha.dispose();
    _editingControllerConfimarSenha.dispose();
    context.read<RegisterController>().removeListener(() {});

    super.dispose();
  }

  @override
  void initState() {
    context.read<RegisterController>().addListener(() {
      final controller = context.read<RegisterController>();
      var success = controller.success;
      var error = controller.error;

      if (success) {
        Navigator.of(context).pop();
      } else if (error != null && error.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error),backgroundColor: Colors.red,
        ));
      }
    });
    super.initState();
  }

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
                  child: Form(
                    key: formkey,
                    child: IntrinsicHeight(
                        child: Column(children: [
                      Logo(),
                      TexFormPersonalizado(
                        label: 'email',
                        controller: _editingControllerEmail,
                        validator: Validatorless.multiple([
                          Validatorless.email('email  invalido'),
                          Validatorless.required('email é obrigatorio')
                        ]),
                      ),
                      TexFormPersonalizado(
                        label: 'senha',
                        obscure: true,
                        controller: _editingControllerSenha,
                        validator: Validatorless.multiple([
                          Validatorless.min(
                              8, 'senha deve conter no minimo 8 caracteres'),
                          Validatorless.required('senha é obrigatorio')
                        ]),
                      ),
                      TexFormPersonalizado(
                        obscure: true,
                        label: 'confimar senha',
                        controller: _editingControllerConfimarSenha,
                        validator: Validatorless.multiple([
                          Validatorless.required(
                              'conferi senha  é obrigatorio'),
                          Validatorless.compare(
                              _editingControllerSenha, 'senha não confere')
                        ]),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            final valido =
                                formkey.currentState?.validate() ?? false;
                            final email = _editingControllerEmail.text;
                            final password = _editingControllerSenha.text;

                            if (valido) {
                              context
                                  .read<RegisterController>()
                                  .registerUser(email, password);
                            } else {
                              print(formkey.currentState);
                            }
                          },
                          child: Text('cadastrar'))
                    ])),
                  )));
        })));
  }
}
