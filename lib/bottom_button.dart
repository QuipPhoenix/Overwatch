import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap, this.bottomTitle});
  final Function onTap;
  final String bottomTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kfooterColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
        width: double.infinity,
        height: kbottomContainerHeight,
        child: Text(
          bottomTitle,
          style: klargeButtonTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
