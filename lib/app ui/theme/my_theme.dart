import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/app%20ui/constant_ui/const_colors.dart';

class MyTheme {

   static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        shape: const  RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight:Radius.circular(30) ,
            bottomLeft:Radius.circular(30),
          )
        ),
        backgroundColor: ConstColors.primaryColor,
        titleTextStyle: GoogleFonts.exo(
          fontSize: 22,
          color: ConstColors.secondryColor
        )
      ),
      );
}