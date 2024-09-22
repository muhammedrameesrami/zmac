import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pallete{
  // Colors
  static const transparentColor = Colors.transparent;
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor = Color(0xff9B9B9B); // secondary color;
  static const whiteColor = Colors.white;
  static const primaryColor = Color.fromRGBO(255, 255, 255, 1);
  static const secondoryColor = Color(0xff2155BF);
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 1));

  static final theme = ThemeData.light().copyWith(
    popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
    scaffoldBackgroundColor: const Color(0xffFAFAFA),
    cardColor: whiteColor,
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: Pallete.blackColor,
      contentPadding: const EdgeInsets.all(12),
      focusedBorder: _border(Pallete.blackColor),
      enabledBorder: _border(Pallete.greyColor),
      prefixIconColor: blackColor,
      hintStyle: GoogleFonts.nunitoSans(color: blackColor),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    // drawerTheme: const DrawerThemeData(
    //   backgroundColor: secondoryColor,
    // ),
    primaryColor: whiteColor, // will be used as alternative background color
  );
}