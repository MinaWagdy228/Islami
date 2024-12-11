import 'package:flutter/material.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';

import 'my_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
      },
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
