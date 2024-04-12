import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double margin;
  final int color;
  final double borderRad;
  final Widget? cardChild;
  final Function()? onPressed;

  CustomCard(
      {required this.margin,
      required this.color,
      required this.borderRad,
      this.cardChild,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          color: Color(color),
          borderRadius: BorderRadius.circular(borderRad),
        ),
        child: cardChild,
      ),
    );
  }
}
