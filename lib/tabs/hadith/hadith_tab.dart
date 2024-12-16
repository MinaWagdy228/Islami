import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_colors.dart';

import '../../model/hadeth_model.dart';
import 'hadeth_detatils_screen.dart';

class HadithTab extends StatefulWidget {
  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadethModel> hadethList = [];
  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {
      loadHadethFile();
    }
    return Container(
      child: Column(
        children: [
          Image.asset("assets/Images/Logo.png"),
          hadethList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : CarouselSlider.builder(
                  options: CarouselOptions(
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage: true,
                      height: MediaQuery.sizeOf(context).height * 0.70,
                      viewportFraction: 0.75),
                  itemCount: hadethList.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, HadethDetatilsScreen.routeName,
                          arguments: hadethList[itemIndex]);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primaryDark,
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  "assets/Images/hadeth_page_bg.png"))),
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            hadethList[itemIndex].title,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                              child: Text(
                                  hadethList[itemIndex].content.join(""),
                                  style: const TextStyle(
                                      color: AppColors.blackBgColor,
                                      fontSize: 18)))
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Future<void> loadHadethFile() async {
    for (var i = 1; i <= 50; i++) {
      String hadethContent =
          await rootBundle.loadString("assets/files/Hadeeth/h$i.txt");
      List<String> hadthLines = hadethContent.split("\n");
      String title = hadthLines[0];
      hadthLines.removeAt(0);
      HadethModel hadethModel = HadethModel(content: hadthLines, title: title);
      hadethList.add(hadethModel);
    }
    setState(() {});
  }
}
