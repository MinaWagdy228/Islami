import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';

class SuraContentItem extends StatelessWidget {
  String content;
  int index;
  SuraContentItem({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    if (SuraDetailsScreen.selectedIndex == index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.primaryDark, width: 2)),
        child: Text(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          "$content [$index]",
          style: const TextStyle(color: AppColors.blackBgColor, fontSize: 18),
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.primaryDark, width: 2)),
        child: Text(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          "$content [$index]",
          style: const TextStyle(color: AppColors.primaryDark, fontSize: 18),
        ),
      );
    }
  }
}
