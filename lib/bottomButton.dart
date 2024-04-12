import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    required this.onTap,
    required this.buttonTitle,
  });

  final Function()? onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: kBottomTextStyle,
        ),
        margin: EdgeInsets.only(top: marginCard),
        color: Color(0xFFEB1555),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
