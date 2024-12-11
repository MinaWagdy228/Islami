import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.blackBgColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.primaryDark)),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        // type: BottomNavigationBarType.fixed,
        // backgroundColor: AppColors.primaryDark,
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
      )); // so I can access it without having to create an object of it, just by using its class name.
// final (semi-immutable) is used as it will be changing during out compiling i.e when writing the code, so const would give an error, but final is computed at runtime which is optimal here, also it you can declare a variable or object using it AND initialize it later in the code, which cosnt won't allow.
}
