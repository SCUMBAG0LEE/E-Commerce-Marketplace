import 'package:flutter/material.dart';

const Color yellow = Color(0xffFDC054);
const Color mediumYellow = Color(0xffFDB846);
const Color darkYellow = Color(0xffE99E22);
const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);
const Color darkGrey = Color(0xff202020);
const Color navyBlue = Color(0xff000080);
const Color black = Colors.black;
const Color darkBackground = Color(0xff121212);
const Color darkText = Colors.white;
const Color darkIcon = Colors.white;
const Color darkAccent = Color(0xff3498db);

const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(236, 54, 3, 1),
  Color.fromRGBO(234, 53, 3, 1),
  Color.fromRGBO(216, 89, 16, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}
