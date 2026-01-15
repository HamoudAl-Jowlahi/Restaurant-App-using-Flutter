import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'colors_palette.dart';

class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorsPalette.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    drawerTheme: DrawerThemeData(
        // backgroundColor: ColorsPalette.primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsPalette.primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
         fontFamily: "Din",
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      // selectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      showSelectedLabels: true,

      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 20,
      ),
      selectedItemColor: Color(0xffffffff),
       unselectedItemColor: Color(0xffffffff),
      // unselectedLabelStyle: TextStyle(
      //   color: Colors.white,
      //   fontWeight: FontWeight.w800,
      //   fontSize: 13,
      // ),
      //type: BottomNavigationBarType.shifting
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered
    ),
    // scaffoldBackgroundColor: Color(0xff1E1E1E),
    appBarTheme: const AppBarTheme(
        backgroundColor: ColorsPalette.primaryColor,
        // toolbarHeight: MediaQuery.of(context).size.height * .1,

        iconTheme: IconThemeData(size: 25, color: Colors.white),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: "Inter",
          color: Colors.white,
        ),
        // toolbarHeight: 80,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ))
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "Din",
          color: Colors.white),
      titleMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: "Din",
          color: Colors.white),
      bodyLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: "Din",
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: "Din",
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        fontFamily: "Din",
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontFamily: "Din",
        color: Colors.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: ColorsPalette.secondColor,
    scaffoldBackgroundColor: Colors.black,
    drawerTheme: DrawerThemeData(
      // backgroundColor: ColorsPalette.secondColor
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsPalette.secondColor,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
         fontFamily: "Din",
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      // selectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      showSelectedLabels: true,

      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 20,
      ),
      selectedItemColor: Color(0xffffffff),
       unselectedItemColor: Color(0xffffffff),
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered
    ),
    // scaffoldBackgroundColor: Color(0xff1E1E1E),
    appBarTheme: const AppBarTheme(
        backgroundColor: ColorsPalette.secondColor,
        // toolbarHeight: MediaQuery.of(context).size.height * .1,

        iconTheme: IconThemeData(size: 25, color: Colors.white),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: "Inter",
          color: Colors.white,
        ),
        // toolbarHeight: 80,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ))
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "Din",
          color: Colors.white),
      titleMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: "Din",
          color: Colors.white),
      bodyLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: "Din",
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: "Din",
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        fontFamily: "Din",
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontFamily: "Din",
        color: Colors.black,
      ),
    ),
  );
}
