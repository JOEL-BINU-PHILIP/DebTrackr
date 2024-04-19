import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context){
    return ThemeData.dark().copyWith(
      iconTheme:isDarkTheme ?  const IconThemeData(color: Colors.white) : const IconThemeData(color: Colors.black),
      hintColor: isDarkTheme  ? Colors.grey : Colors.grey.shade500, 
        appBarTheme:isDarkTheme ? const AppBarTheme(backgroundColor: Color(0xFF535C91)) : const AppBarTheme(backgroundColor: Color(0xFF102C57)),
        scaffoldBackgroundColor: isDarkTheme ? const Color(0xFF070F2B) : const Color(0xFFFEFAF6),
        dividerColor: isDarkTheme ? const Color(0xFF1B1A55) : const Color(0x00000000),
        primaryTextTheme: Typography.blackCupertino,
        bottomNavigationBarTheme:isDarkTheme? const BottomNavigationBarThemeData(backgroundColor: Color(0xFF535C91) ,selectedItemColor: Colors.black) : const BottomNavigationBarThemeData(backgroundColor: Color(0xFF102C57) ,selectedItemColor: Colors.white)
    );
  }
}