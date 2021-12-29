import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TexFormPersonalizado extends StatelessWidget {
  final String label;

  final FocusNode? focusNode;
  final IconButton? suffixIcon;
  final bool obscure;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  ValueNotifier<bool> eye;

  TexFormPersonalizado({
    this.focusNode,
    this.validator,
    this.controller,
    this.suffixIcon,
    required this.label,
    this.obscure = false,
    Key? key,
  })  : eye = ValueNotifier(obscure),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder<bool>(
          valueListenable: eye,
          builder: (_, Value, child) {
            return TextFormField(
              validator: validator,
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                  labelText: label,
                  labelStyle: TextStyle(color: Color(0xffb49fcc), fontSize: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color(0xffDE8D7B),
                      )),
                  hoverColor: Color(0xffDE8D7B),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red)),
                  suffixIcon: this.suffixIcon ??
                      (obscure == true
                          ? IconButton(
                              onPressed: () {
                                eye.value = !Value;
                              },
                              icon: !Value
                                  ? Icon(Icons.remove_red_eye_outlined)
                                  : Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.black,
                                    ),
                            )
                          : null)),
              obscureText: Value,
            );
          },
        ));
  }
}
