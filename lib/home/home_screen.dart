import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/Images/quran_bg.png",
          height: MediaQuery.sizeOf(context).height,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(items: []),
        )
      ],
    );
  }
}
