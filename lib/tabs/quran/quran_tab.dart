import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/Images/Logo.png"),
          TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: AppColors.primaryDark, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: AppColors.primaryDark, width: 2)),
                  prefixIcon: ImageIcon(
                      color: AppColors.primaryDark,
                      AssetImage("assets/Images/icon_search.png")))),
          SizedBox(height: 20),
          Text(
            "Most Recently",
            style: TextStyle(color: Colors.white),
          ),
          Container(
            child: Row(
              children: [
                Column(
                  children: [],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
