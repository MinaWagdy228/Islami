import 'package:flutter/material.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors
          .transparent); // so I can access it without having to create an object of it, just by using its class name.
// final (semi-immutable) is used as it will be changing during out compiling i.e when writing the code, so const would give an error, but final is computed at runtime which is optimal here, also it you can declare a variable or object using it AND initialize it later in the code, which cosnt won't allow.
}
