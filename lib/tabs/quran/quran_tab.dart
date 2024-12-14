import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/quran/sura_list_widget.dart';

import '../../model/sura_model.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/Images/Logo.png"),
          TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: AppColors.primaryDark, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: AppColors.primaryDark, width: 2)),
                  prefixIcon: const ImageIcon(
                      color: AppColors.primaryDark,
                      AssetImage("assets/Images/icon_search.png")))),
          SizedBox(height: height * 0.02),
          const Text(
            "Most Recently",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: height * 0.015),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Al-Ambiya",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    Text("الأنبياء",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    Text("112 verses",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
                Image.asset("assets/Images/most_recent_image.png")
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text("Sura List",
              style: TextStyle(color: AppColors.whiteColor)),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          SuraDetailsScreen.routeName,
                          arguments: SuraModel.getSuraModel(index));
                    },
                    child: SuraListWidget(
                        suraModel: SuraModel.getSuraModel(index)),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                    indent: width * 0.12,
                    endIndent: width * 0.12,
                    thickness: 2),
                itemCount: SuraModel.getItemCount()),
          )
        ],
      ),
    );
  }
}