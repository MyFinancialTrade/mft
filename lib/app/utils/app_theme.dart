import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

/*
  Created by Mudasir Habib on 2/25/2022.
 */
ThemeData appTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.inter().toString(),
    textTheme: GoogleFonts.interTextTheme(),
    tabBarTheme: TabBarTheme(
      labelPadding: const EdgeInsets.symmetric(horizontal: 2),
      labelStyle: TextStyle(
        fontFamily: GoogleFonts.inter().toString(),
        fontSize: 12,
        color: AppColors.primary,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: GoogleFonts.inter().toString(),
        fontSize: 12,
        color: Colors.grey,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 5,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 2,
      backgroundColor: Colors.white,
      actionsPadding: EdgeInsets.all(10),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
      elevation: 10,
    ),
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primaryDark,
    primaryColorLight: AppColors.primaryLight,
    primaryIconTheme: const IconThemeData(color: AppColors.primaryDark),
    colorScheme: ThemeData().colorScheme.copyWith(secondary: AppColors.blue),
    hintColor: const Color(0xffcdd3e0),
    dividerColor: const Color(0xFFCFCFCF),
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryDark,
      selectionColor: AppColors.primaryDark,
      selectionHandleColor: AppColors.primaryDark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(),
      errorStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w300,
          color: Colors.red,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary.withOpacity(0.5)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.withOpacity(0.5)),
      ),
      labelStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Colors.grey,
        ),
      ),
      hintStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
      iconColor: AppColors.primaryDark,
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xffEBECED),
      thickness: 1,
      space: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size(120, 40)),
        textStyle: MaterialStateProperty.all<TextStyle>(
          GoogleFonts.interTextTheme().titleMedium!,
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((
          Set<MaterialState> states,
        ) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.primaryDark;
          } else if (states.contains(MaterialState.disabled)) {
            return AppColors.disableButtonColor;
          }
          return AppColors.primary;
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            //side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size(100, 50)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            //side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all<Color>(AppColors.colorWhite),
      fillColor: MaterialStateProperty.all<Color>(AppColors.primaryDark),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      visualDensity: VisualDensity.compact,
      side: const BorderSide(
        color: AppColors.colorGrey,
        width: 2,
        style: BorderStyle.solid,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        color: AppColors.primaryDark,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(color: AppColors.colorWhite),
      selectedItemColor: AppColors.primaryDark,
      selectedIconTheme: IconThemeData(color: AppColors.primaryDark),
      unselectedItemColor: AppColors.colorWhite,
    ),
  );
}
