import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  // Primary color for your app
  primaryColor: Colors.blue,
  // Secondary (accent) color
  hintColor: Colors.green,
  // Background color for `Scaffold` widgets
  scaffoldBackgroundColor: Colors.white,
  // AppBar theme
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
    elevation: 0,
   
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  // Text theme
  textTheme: TextTheme(
    bodyText2: TextStyle(color: Colors.blue),
    headline5: TextStyle(
      color: Colors.blue,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    button: TextStyle(color: Colors.white),
  ),
  // Button theme
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  ),
  // Elevated button theme using new style
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.green,
      onPrimary: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  ),
  // Floating action button theme
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
  ),
  // Card theme
  cardTheme: CardTheme(
    color: Colors.white,
    shadowColor: Colors.blueGrey,
    elevation: 5,
    margin: EdgeInsets.all(10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
  // Input decoration theme (for TextFormFields)
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.blue.withOpacity(0.1),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.blue, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.green, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    prefixIconColor: Colors.blue,
    labelStyle: TextStyle(color: Colors.blue),
    hintStyle: TextStyle(color: Colors.blueGrey),
  ),
  // Bottom navigation bar theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.blueGrey,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
  ),
);
