import 'package:agenda_fechada/app/ui/extension_theme.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/anotado.gif",
                  ),
                  fit: BoxFit.contain)),
          width: MediaQuery.of(context).size.width,
          height: 200,
        ),
        Text(
          'Todo List',
          style: context.textStyle,
        )
        //Theme.of(context).textTheme.headline3,),
      ],
    );
  }
}
