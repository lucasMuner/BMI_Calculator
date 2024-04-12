import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final String text;
  final double sizeIcon;
  final double sizeText;
  final IconData iconData;
  final int colorText;

  IconContent(
      {required this.text,
      required this.sizeIcon,
      required this.sizeText,
      required this.iconData,
      required this.colorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: sizeIcon,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: sizeText,
            color: Color(colorText),
          ),
        ),
      ],
    );
  }
}
