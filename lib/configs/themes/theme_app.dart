import 'package:flutter/material.dart';

///Armazena a paleta de cores utilizada pelo aplicativo
class ThemeApp {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFBC704),
    splashColor: const Color(0xFFFBC704),
    scaffoldBackgroundColor: Colors.white,
    primaryColorLight: Colors.white,
    indicatorColor: const Color(0xFFFBC704),
    cardColor: Colors.white,
    fontFamily: 'Ubuntu',

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFBC704),
      elevation: 8,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

    colorScheme: ColorScheme.light(
      primary: Colors.grey,
      secondary: Colors.grey[600]!,
      onPrimary: Colors.grey[200]!,
      onSecondary: Colors.white,
      primaryContainer: Colors.grey[700]!,
      secondaryContainer: Colors.red,
      onPrimaryContainer: Colors.white,
      onSecondaryContainer: Colors.grey[600]!,
      tertiary: const Color(0xFFFBC704),
      onBackground: Colors.grey.shade100,
      brightness: Brightness.light,
      error: Colors.red,
      background: Colors.white,
    ),

    /// [TextSelectionThemeData] utilizada para alteração da color do cursor
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.grey,
    ),

    /// [IconThemeData] utilizada no [Icon]
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 24,
    ),

    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: Colors.grey[600],
        fontSize: 18,
      ),
      labelLarge: const TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.white,
        fontSize: 18,
      ),
    ),

    /// [InputDecorationTheme] utilizada no [TextFormField]
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
      hintStyle: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
      errorStyle: TextStyle(
        color: Colors.red,
        fontSize: 14,
      ),
      border: _textFieldBorder,
      enabledBorder: _textFieldBorder,
      focusedBorder: _textFieldBorder,
      focusedErrorBorder: _textFieldBorder,
      disabledBorder: _textFieldBorder,
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromRGBO(42, 54, 67, 1),
    primaryColorLight: const Color(0xff9e9e9e),
    primaryColorDark: Colors.black,
    canvasColor: const Color.fromRGBO(50, 56, 65, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(50, 56, 65, 1),
    cardColor: const Color(0xff616161),
    dividerColor: const Color(0x1fffffff),
    highlightColor: const Color(0x40cccccc),
    splashColor: const Color.fromRGBO(40, 54, 67, 1),
    unselectedWidgetColor: const Color(0xb3ffffff),
    disabledColor: const Color(0x62ffffff),
    secondaryHeaderColor: const Color(0xff616161),
    dialogBackgroundColor: const Color(0xff424242),
    indicatorColor: const Color.fromRGBO(33, 133, 213, 1),
    hintColor: const Color(0x80ffffff),
    fontFamily: 'Ubuntu',
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xff424242),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(42, 54, 67, 1),
      elevation: 8,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

    colorScheme: ColorScheme.dark(
      primary: Colors.grey,
      onPrimary: const Color.fromRGBO(50, 56, 65, 0.2),
      secondary: Colors.white,
      onSecondary: Colors.white,
      primaryContainer: Colors.white,
      secondaryContainer: Colors.red,
      onPrimaryContainer: const Color.fromRGBO(33, 133, 213, 1),
      tertiary: const Color.fromRGBO(33, 133, 213, 1),
      onSecondaryContainer: Colors.grey[600],
      onBackground: const Color.fromRGBO(42, 54, 67, 1),
      brightness: Brightness.dark,
      error: Colors.red,
      background: const Color(0xff616161),
    ),

    /// [TextSelectionThemeData] utilizada para alteração da color do cursor
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
    ),

    /// [IconThemeData] utilizada no [Icon]
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 24,
    ),

    textTheme: const TextTheme(
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.white,
        fontSize: 18,
      ),
    ),

    /// [InputDecorationTheme] utilizada no [TextFormField]
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      hintStyle: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      errorStyle: TextStyle(
        color: Colors.red,
        fontSize: 14,
      ),
      border: _textFieldBorder,
      enabledBorder: _textFieldBorder,
      focusedBorder: _textFieldBorder,
      focusedErrorBorder: _textFieldBorder,
      disabledBorder: _textFieldBorder,
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
  );

  static const _textFieldBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 0.5,
    ),
  );
}
