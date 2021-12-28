import 'package:flutter/material.dart';

class Messages {
  final BuildContext context;

  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void ShowError(String menssage) => ShowMenssage(menssage, Colors.red);
  void ShowInfo(String menssage) => ShowMenssage(menssage, Colors.purple);

  void ShowMenssage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
