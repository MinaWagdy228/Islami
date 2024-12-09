import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/Images/quran_bg.png",
          height: MediaQuery.sizeOf(context).height,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primaryDark),
            //depends on what theme you're using currently,copywith so it only affect this scope
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: buildItemInNavigationBar(
                          index: 0, imageName: "quran"),
                      label: "Quran"),
                  BottomNavigationBarItem(
                      icon: buildItemInNavigationBar(
                          index: 1, imageName: "hadith"),
                      label: "Hadith"),
                  BottomNavigationBarItem(
                      icon: buildItemInNavigationBar(
                          index: 2, imageName: "sebha"),
                      label: "Sebha"),
                  BottomNavigationBarItem(
                      icon:
                          buildItemInNavigationBar(index: 3, imageName: "time"),
                      label: "Time"),
                ]),
          ),
        )
      ],
    );
  }

  Widget buildItemInNavigationBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.blackBgColor),
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            child: ImageIcon(AssetImage("assets/Images/icon_$imageName.png")))
        : ImageIcon(AssetImage("assets/Images/icon_$imageName.png"));
  }
}
