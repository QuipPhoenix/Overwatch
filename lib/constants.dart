import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.email,
    color: Colors.white,
  ),
  hintText: 'Enter Email',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kTextFieldPasswordDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.security,
    color: Colors.white,
  ),
  hintText: 'Enter Password',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kfooterColor = Color(0xFFEB1555);
const kbottomContainerHeight = 70.0;
const klargeButtonTextStyle =
    TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {@required this.color, this.cardChild, this.onPress, this.background});
  final Color color;
  final Widget cardChild;
  final Function onPress;
  final String background;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: AssetImage(background), fit: BoxFit.cover)),
      ),
    );
  }
}
