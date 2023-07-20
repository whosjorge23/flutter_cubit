
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  brightness: Brightness.light, // Set the dark mode brightness
  primarySwatch: MaterialColor(0xFFD9A752, color),
  primaryColor: const Color(0xFF528B7C),
  hintColor: const Color(0xFFD9A752),
  // appBarTheme: AppBarTheme(
  //   backgroundColor: Colors.white,
  //   titleTextStyle: TextStyle(
  //       color: Color.fromRGBO(57, 182, 198, 1.0),
  //       fontWeight: FontWeight.bold,
  //       fontSize: 20),
  // ),
);

ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark, // Set the dark mode brightness
  primarySwatch: MaterialColor(0xFF528B7C, color),
  primaryColor: const Color(0xFFD9A752),
  hintColor: const Color(0xFF528B7C),
  textTheme: const TextTheme(
  ),
  // appBarTheme: AppBarTheme(
  //   backgroundColor: Colors.white,
  //   titleTextStyle: TextStyle(
  //       color: Color.fromRGBO(57, 182, 198, 1.0),
  //       fontWeight: FontWeight.bold,
  //       fontSize: 20),
  // ),
);

Map<int, Color> color =
{
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};